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

    public init(catalog: ChallengeCatalog,
                fruits: [FruitInfo],
                conditionDefinitions: [ChallengeConditionDefinition],
                persistence: any ChallengeSelectionPersisting,
                random: any RandomSource,
                tierIndex: Int32,
                difficulty: Int32 = 0,
                predicateP: Int32 = 0,
                roundCount: Int32? = nil) throws {
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
        self.tierSelector = ChallengeTierSelector(
            tier: tier,
            persistence: persistence,
            specialChallenges: catalog.specialChallenges)
        self.fruitSelector = ChallengeFruitSelector()
        self.plan = ChallengeRoundPlan()
        self.currentRoundIndex = 0
        self.currentFruitID = 0
        self.defaultFruitID = 0
        self.runtime = nil

        var names: [Int32: String] = [:]
        for fruit in fruits {
            guard names[fruit.typeID] == nil else {
                throw ChallengeRoundAssemblerError.duplicateFruitTypeID(fruit.typeID)
            }
            names[fruit.typeID] = fruit.name
        }
        self.namesByFruitID = names
        self.weights = ChallengeFruitWeightMap.make(from: fruits)

        try assembleInitialRound(roundCount: roundCount)
    }

    /// 生成计划后，严格按“默认初选 → 非 normal 覆盖 → 条件激活”装配首回合。
    private mutating func assembleInitialRound(roundCount requestedRoundCount: Int32?) throws {
        // FUN_0005fc1c 先确定本局槽位数，FUN_0006ee88 再构建并洗牌。
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
        guard let firstChallenge = plan.challenge(at: 0) else {
            throw ChallengeRoundAssemblerError.missingChallengeAtSlot(index: 0)
        }

        let selection = try fruitSelector.selectNewGameChallengeFruit(
            size: firstChallenge.challengeFruitSize,
            catalog: fruits,
            weights: weights,
            predicateP: predicateP,
            random: random)
        defaultFruitID = selection.defaultSelection
        currentFruitID = selection.finalSelection

        let name = try fruitName(for: currentFruitID)
        runtime = ChallengeModeRuntime(
            tier: tier,
            challenge: firstChallenge,
            conditionDefinitions: conditionDefinitions,
            selectedFruitName: name)
        currentRoundIndex = 0
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
        guard let nextChallenge = plan.challenge(at: nextIndex) else {
            throw ChallengeRoundAssemblerError.missingChallengeAtSlot(index: nextIndex)
        }

        let nextFruitID: Int32
        if nextChallenge.challengeFruitSize == .normal {
            nextFruitID = defaultFruitID
        } else if let candidates = ChallengeFruitCandidates.candidates(
            for: nextChallenge.challengeFruitSize, from: fruits) {
            nextFruitID = try fruitSelector.select(
                candidates: candidates,
                weights: weights,
                param1: 0,
                predicateP: predicateP,
                random: random)
        } else {
            // ChallengeFruitSize 当前只有 normal 会返回 nil；保留显式失败而非猜测候选。
            throw ChallengeFruitSelectionError.emptyCandidates
        }

        let name = try fruitName(for: nextFruitID)
        let nextRuntime = ChallengeModeRuntime(
            tier: tier,
            challenge: nextChallenge,
            conditionDefinitions: conditionDefinitions,
            selectedFruitName: name)

        currentFruitID = nextFruitID
        runtime = nextRuntime
        currentRoundIndex = nextIndex
        return ChallengeRound(
            roundIndex: nextIndex,
            challenge: nextChallenge,
            fruitID: nextFruitID,
            fruitName: name,
            runtime: nextRuntime)
    }

    /// FUN_00060108：结果写回当前槽位，并只给当前挑战累计一次 plays。
    public mutating func recordCurrentRoundOutcome(_ outcome: ChallengeOutcome) {
        guard outcome != .pending, plan.outcome(at: currentRoundIndex) == .pending else { return }
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
