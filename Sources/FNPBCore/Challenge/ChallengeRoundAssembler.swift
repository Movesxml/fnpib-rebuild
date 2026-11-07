import Foundation

// T-044：纯 FNPBCore 挑战回合装配器。
//
// Mach-O 证据：
// - FUN_00061128(param_2 == 0)：新局先进行默认水果初选，再按挑战水果模式覆盖；
//   最终 ID 写入 controller+0x88 后才调用 FUN_0005ed54 激活条件。
// - 后续 setup 不重新执行默认初选；normal 保留原默认 ID，其他模式重新覆盖。
//
// 本类型只装配回合计划、挑战水果和 ChallengeModeRuntime，不接 App/UI/WaveDirector，
// 也不实现未核实的 tier progression、存档、波次或结算控制器。

public enum ChallengeRoundAssemblerError: Error, Equatable, Sendable {
    case tierIndexOutOfBounds(index: Int32, count: Int)
    case emptyPlan(tierIndex: Int32)
    case missingChallengeAtSlot(index: Int)
    case planExhausted(currentIndex: Int, count: Int)
    case missingFruitName(fruitID: Int32)
    case duplicateFruitTypeID(Int32)
    case firstRoundAlreadyStarted(currentIndex: Int)
    case runtimeNotAssembled
}

extension ChallengeRoundAssemblerError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case let .tierIndexOutOfBounds(index, count):
            return "tierIndex 越界：index=\(index), count=\(count)"
        case let .emptyPlan(tierIndex):
            return "tierIndex=\(tierIndex) 生成的回合计划为空"
        case let .missingChallengeAtSlot(index):
            return "回合计划槽位 \(index) 没有 challenge"
        case let .planExhausted(currentIndex, count):
            return "回合计划已结束：currentIndex=\(currentIndex), count=\(count)"
        case let .missingFruitName(fruitID):
            return "找不到 FruitInfo.typeID=\(fruitID) 对应的水果名称"
        case let .duplicateFruitTypeID(fruitID):
            return "FruitInfo.typeID 重复：\(fruitID)"
        case let .firstRoundAlreadyStarted(currentIndex):
            return "首回合已不可用：currentIndex=\(currentIndex)"
        case .runtimeNotAssembled:
            return "ChallengeModeRuntime 尚未装配"
        }
    }
}

public struct ChallengeRound: Sendable, Equatable {
    public let roundIndex: Int
    public let challenge: ChallengeDefinition
    public let fruitID: Int32
    public let fruitName: String
    public let runtime: ChallengeModeRuntime

    public init(roundIndex: Int,
                challenge: ChallengeDefinition,
                fruitID: Int32,
                fruitName: String,
                runtime: ChallengeModeRuntime) {
        self.roundIndex = roundIndex
        self.challenge = challenge
        self.fruitID = fruitID
        self.fruitName = fruitName
        self.runtime = runtime
    }
}

public struct ChallengeRoundAssembler {
    public let tier: ChallengeTierDefinition
    public let tierIndex: Int32
    public let difficulty: Int32
    public let predicateP: Int32
    public let fruits: [FruitInfo]
    public let conditionDefinitions: [ChallengeConditionDefinition]

    public private(set) var tierSelector: ChallengeTierSelector
    public private(set) var fruitSelector: ChallengeFruitSelector
    public private(set) var plan: ChallengeRoundPlan
    public private(set) var currentRoundIndex: Int
    public private(set) var currentFruitID: Int32
    public private(set) var defaultFruitID: Int32
    public private(set) var runtime: ChallengeModeRuntime?

    private let persistence: any ChallengeSelectionPersisting
    private let random: any RandomSource
    private let weights: [Int32: ChallengeFruitWeightEntry]
    private let namesByFruitID: [Int32: String]

    private var isInitialRoundAssembled: Bool

    public init(catalog: ChallengeCatalog,
                fruits: [FruitInfo],
                conditionDefinitions: [ChallengeConditionDefinition],
                persistence: any ChallengeSelectionPersisting,
                random: any RandomSource,
                tierIndex: Int32,
                difficulty: Int32 = 0,
                predicateP: Int32 = 0,
                roundCount: Int32? = nil,
                deferInitialRoundAssembly: Bool = false,
                seed: UInt64 = 0) throws {
        guard tierIndex >= 0, Int(tierIndex) < catalog.tiers.count else {
            throw ChallengeRoundAssemblerError.tierIndexOutOfBounds(
                index: tierIndex, count: catalog.tiers.count)
        }

        let tier = catalog.tiers[Int(tierIndex)]
        self.tier = tier
        self.tierIndex = tierIndex
        self.difficulty = difficulty
        self.predicateP = predicateP
        self.fruits = fruits
        self.conditionDefinitions = conditionDefinitions
        self.persistence = persistence
        self.random = random
        // 原版每个权重容器构造时都拷贝同一个 app+0x1b4 种子，之后各自独立推进；
        // 由调用方把与全局流相同的零扩展 32 位种子传进来。
        self.tierSelector = ChallengeTierSelector(
            tier: tier,
            persistence: persistence,
            specialChallenges: catalog.specialChallenges,
            initialCurrent: catalog.defaults.chanceSelect,
            seed: seed)
        self.fruitSelector = ChallengeFruitSelector()
        self.plan = ChallengeRoundPlan()
        self.currentRoundIndex = 0
        self.currentFruitID = 0
        self.defaultFruitID = 0
        self.runtime = nil
        self.isInitialRoundAssembled = false

        var names: [Int32: String] = [:]
        for fruit in fruits {
            guard names[fruit.typeID] == nil else {
                throw ChallengeRoundAssemblerError.duplicateFruitTypeID(fruit.typeID)
            }
            names[fruit.typeID] = fruit.name
        }
        self.namesByFruitID = names
        self.weights = ChallengeFruitWeightMap.make(from: fruits)

        try assemblePlan(roundCount: roundCount)
        if !deferInitialRoundAssembly {
            try assembleDeferredFirstRound()
        }
    }

    /// FUN_0005fc1c 只重建回合计划；晋升地图期间不能提前执行水果选择。
    private mutating func assemblePlan(roundCount requestedRoundCount: Int32?) throws {
        // App 需要先按该数量钳制难度，因此可传入同一个已抽取值，禁止重复抽随机数。
        let roundCount = requestedRoundCount
            ?? ChallengeTierSelector.rollRoundCount(tier: tier, rng: random)
        plan = tierSelector.planRound(
            persistence: persistence,
            rng: random,
            difficulty: difficulty,
            tierIndex: tierIndex,
            roundCount: roundCount)

        guard plan.count > 0 else {
            throw ChallengeRoundAssemblerError.emptyPlan(tierIndex: tierIndex)
        }
        guard plan.challenge(at: 0) != nil else {
            throw ChallengeRoundAssemblerError.missingChallengeAtSlot(index: 0)
        }
    }

    /// 真正开始首回合时才执行“默认初选 → 非 normal 覆盖 → 条件激活”。
    private mutating func assembleDeferredFirstRound() throws {
        guard !isInitialRoundAssembled, let firstChallenge = plan.challenge(at: 0) else {
            throw ChallengeRoundAssemblerError.runtimeNotAssembled
        }
        let selection = try fruitSelector.selectNewGameChallengeFruit(
            size: firstChallenge.challengeFruitSize,
            catalog: fruits,
            weights: weights,
            predicateP: predicateP,
            random: random)
        let name = try fruitName(for: selection.finalSelection)
        let firstRuntime = ChallengeModeRuntime(
            tier: tier,
            challenge: firstChallenge,
            conditionDefinitions: conditionDefinitions,
            selectedFruitName: name)

        defaultFruitID = selection.defaultSelection
        currentFruitID = selection.finalSelection
        runtime = firstRuntime
        currentRoundIndex = 0
        isInitialRoundAssembled = true
    }

    /// 初始化已同步完成首回合装配；读取结果不会再次消耗 RNG。
    public func startFirstRound() throws -> ChallengeRound {
        guard currentRoundIndex == 0 else {
            throw ChallengeRoundAssemblerError.firstRoundAlreadyStarted(
                currentIndex: currentRoundIndex)
        }
        guard let challenge = plan.challenge(at: 0) else {
            throw ChallengeRoundAssemblerError.missingChallengeAtSlot(index: 0)
        }
        guard let runtime else {
            throw ChallengeRoundAssemblerError.runtimeNotAssembled
        }
        return ChallengeRound(
            roundIndex: 0,
            challenge: challenge,
            fruitID: currentFruitID,
            fruitName: try fruitName(for: currentFruitID),
            runtime: runtime)
    }

    /// 后续 normal 保留默认水果；其他模式只执行覆盖选择，随后才创建并激活新条件组。
    public mutating func advanceToNextRound() throws -> ChallengeRound {
        let nextIndex = currentRoundIndex + 1
        guard nextIndex < plan.count else {
            throw ChallengeRoundAssemblerError.planExhausted(
                currentIndex: currentRoundIndex, count: plan.count)
        }
        return try selectRound(at: nextIndex)
    }

    /// 地图允许选择任意尚未完成的槽位，不能把它折叠成“总是下一回合”。
    /// 只有地图 state 9 真正开局时才调用，避免点击退场阶段重复消耗水果随机数。
    public mutating func selectRound(at index: Int) throws -> ChallengeRound {
        guard plan.slots.indices.contains(index) else {
            throw ChallengeRoundAssemblerError.planExhausted(
                currentIndex: index, count: plan.count)
        }
        guard plan.outcome(at: index) == nil else {
            throw ChallengeRoundAssemblerError.missingChallengeAtSlot(index: index)
        }
        if !isInitialRoundAssembled {
            guard index == 0 else {
                throw ChallengeRoundAssemblerError.firstRoundAlreadyStarted(currentIndex: index)
            }
            try assembleDeferredFirstRound()
        }
        guard let nextChallenge = plan.challenge(at: index) else {
            throw ChallengeRoundAssemblerError.missingChallengeAtSlot(index: index)
        }

        let nextFruitID: Int32
        if index == 0, currentRoundIndex == 0, let runtime {
            // 首回合已由默认初选路径装配，读取它不能再抽一次覆盖水果。
            return ChallengeRound(
                roundIndex: 0,
                challenge: nextChallenge,
                fruitID: currentFruitID,
                fruitName: try fruitName(for: currentFruitID),
                runtime: runtime)
        } else {
            // [macho] FUN_00061128(param_2==0) 每回合都先做一次默认初选（FUN_0000af50），
            // 再按 challengeFruitSize 覆盖（1/2/3 → FUN_0000afc4/b06c/b1a4）。
            // 旧实现让 normal 回合沿用上一回合的 defaultFruitID，且非 normal 回合少抽一次，
            // 结果是每回合少调用一次默认初选、后续抽取序列整体偏移。
            // 证据：findings/challenge_fruit_selection_and_binding_macho.md:60（0x00061170 先调 FUN_0000af50、
            // 0x00061174 写 +0x88，模式 1/2/3 再到 0x0006119e 覆盖）、challenge_round_setup_macho.md:29-51。
            let selection = try fruitSelector.selectNewGameChallengeFruit(
                size: nextChallenge.challengeFruitSize,
                catalog: fruits,
                weights: weights,
                predicateP: predicateP,
                random: random)
            defaultFruitID = selection.defaultSelection
            nextFruitID = selection.finalSelection
        }

        let name = try fruitName(for: nextFruitID)
        let nextRuntime = ChallengeModeRuntime(
            tier: tier,
            challenge: nextChallenge,
            conditionDefinitions: conditionDefinitions,
            selectedFruitName: name)

        currentFruitID = nextFruitID
        runtime = nextRuntime
        currentRoundIndex = index
        return ChallengeRound(
            roundIndex: index,
            challenge: nextChallenge,
            fruitID: nextFruitID,
            fruitName: name,
            runtime: nextRuntime)
    }

    public func makeMapInput(isBonus: Bool? = nil,
                             actChange: Bool? = nil,
                             challengeTypes: [ChallengeTypeDefinition] = [],
                             isInitialPresentation: Bool = true,
                             playActChangeSound: Bool = false) -> ChallengeMapInput {
        let rounds = plan.slots.indices.map { index in
            let challenge = plan.challenge(at: index)
            return ChallengeMapRoundState(
                challengeName: challenge?.name ?? "",
                challengeTypeName: challenge?.type,
                outcome: plan.outcome(at: index))
        }
        let allRoundsHaveResults = !plan.slots.isEmpty && plan.slots.indices.allSatisfy {
            plan.outcome(at: $0) != nil
        }
        return ChallengeMapInput(tierIndex: tierIndex,
                                 isBonus: isBonus ?? tier.isBonusRound,
                                 currentRoundIndex: currentRoundIndex,
                                 rounds: rounds,
                                 actChange: actChange ?? allRoundsHaveResults,
                                 challengeTypes: challengeTypes,
                                 isInitialPresentation: isInitialPresentation,
                                 playActChangeSound: playActChangeSound)
    }

    /// FUN_00060108：结果写回当前槽位，并只给当前挑战累计一次 plays。
    public mutating func recordCurrentRoundOutcome(_ outcome: ChallengeOutcome) {
        // outcomes 的 nil 才表示尚未记录；Optional(.pending) 不是空槽位。
        guard outcome != .pending, plan.outcome(at: currentRoundIndex) == nil else { return }
        plan.record(outcome, at: currentRoundIndex)
        if let challenge = plan.challenge(at: currentRoundIndex) {
            persistence.incrementPlayCount(
                forKey: ChallengeGroupSelector.challengeKey(challenge))
        }
    }

    public func fruitName(for fruitID: Int32) throws -> String {
        guard let name = namesByFruitID[fruitID] else {
            throw ChallengeRoundAssemblerError.missingFruitName(fruitID: fruitID)
        }
        return name
    }
}
