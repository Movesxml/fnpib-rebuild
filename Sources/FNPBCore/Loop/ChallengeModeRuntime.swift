import Foundation

// 发售版 Challenge 控制器的状态子集。
// 来源：FUN_0005fd7c / FUN_00060108 / FUN_00060514 / FUN_0006059c /
// FUN_000606a4 / FUN_00060e54 / FUN_0006104c / FUN_00061128 /
// FUN_000613e4 / FUN_0005edc4 / FUN_0005ecf4。
// tier/challenge 必须显式注入；真实持久化选择器闭合前不伪造随机选取。

public enum ChallengeModePhase: Int32, Sendable, Equatable {
    case inactive = 0
    case bonusIntro = 1
    case running = 2
    case settling = 3
    case suspended = 5
}

public enum ChallengeSettlementSubstate: Int32, Sendable, Equatable {
    case bonus = 0
    case nextRound = 2
    case finished = 5
    case other = -1
}

public enum ChallengeModeEvent: Sendable, Equatable {
    case playAnimation(target: String, name: String)
    case setVisible(target: String, Bool)
    case playMusic(String)
    case playSound(String)
    case roundFinished(ChallengeOutcome)
    case nextRound
    case cleanedUp
}

public struct ChallengeFrame: Sendable, Equatable {
    public var evaluation: ChallengeEvaluationContext
    public var waveCount: Int32
    public var fruitEntityCount: Int32

    public init(evaluation: ChallengeEvaluationContext = ChallengeEvaluationContext(),
                waveCount: Int32 = 0,
                fruitEntityCount: Int32 = 0) {
        self.evaluation = evaluation
        self.waveCount = waveCount
        self.fruitEntityCount = fruitEntityCount
    }
}

/// 挑战控制器读取的是 WaveManager +0x208 的完成计数，不是当前波数组下标。
public protocol ChallengeWaveStateProviding: AnyObject {
    var completedWaveCountForChallenge: Int32 { get }
    var hasEndedWaveForChallenge: Bool { get }
}

extension WaveDirector: ChallengeWaveStateProviding {
    public var completedWaveCountForChallenge: Int32 { runtime.freezeOnTriggerCount }
    public var hasEndedWaveForChallenge: Bool { runtime.freezeOnTriggerCount > 0 }
}

public struct ChallengeModeRuntime: Sendable, Equatable {
    public private(set) var tier: ChallengeTierDefinition
    public private(set) var challenge: ChallengeDefinition
    public private(set) var conditions: ChallengeConditionsRuntime
    /// controller+0x88 的本回合选择；先保存它，再激活 challengeFruit 条件。
    public private(set) var selectedFruitName: String?
    public private(set) var phase: ChallengeModePhase = .running
    public private(set) var countdown: Float
    public private(set) var wavesEnded = false
    public private(set) var roundsPlayed: Int32 = 0
    public private(set) var roundsPassed: Int32 = 0
    public private(set) var roundResults: [ChallengeOutcome] = []
    private var events: [ChallengeModeEvent] = []

    public var isBonusRound: Bool { tier.isBonusRound }

    /// FUN_0006104c：TIME 条件优先，否则才使用 challenge.timeLimit。
    public var endsOnTimer: Bool {
        phase == .running && (conditions.timerDuration != 0 || challenge.timeLimit != 0)
    }

    public init(tier: ChallengeTierDefinition,
                challenge: ChallengeDefinition,
                conditionDefinitions: [ChallengeConditionDefinition],
                selectedFruitName: String? = nil) {
        self.tier = tier
        self.challenge = challenge
        self.selectedFruitName = selectedFruitName
        conditions = ChallengeConditionsRuntime(definitions: conditionDefinitions)
        conditions.select(conditionNames: challenge.conditionNames,
                          selectedFruitName: selectedFruitName)
        countdown = conditions.timerDuration != 0
            ? conditions.timerDuration : challenge.timeLimit
    }

    public mutating func drainEvents() -> [ChallengeModeEvent] {
        defer { events.removeAll(keepingCapacity: false) }
        return events
    }

    public mutating func evaluateImmediate(context: ChallengeEvaluationContext) {
        guard phase == .running else { return }
        conditions.evaluateImmediate(context: context)
    }

    public mutating func recordConsecutive(count: Int32, specificType: String?) {
        guard phase == .running else { return }
        conditions.recordConsecutive(count: count, specificType: specificType)
    }

    public mutating func checkComparisons(context: ChallengeEvaluationContext) {
        guard phase == .running else { return }
        conditions.checkComparisons(context: context)
    }

    /// FUN_00060e54：只锁存一次；FUN_0005edc4 在发售版为空函数。
    public mutating func markWavesEnded() {
        guard phase == .running, !wavesEnded else { return }
        wavesEnded = true
    }

    /// FUN_0005fd7c 状态 2：倒计时直接减 dt，不 clamp。
    /// 波次耗尽的直接结束只发生于非 bonus、实际波次数已达 numWaves、且无水果实体时；
    /// 其余路径仍按“计时到期或条件结果非 pending”的优先级判定。
    public mutating func update(dt: Float, frame: ChallengeFrame) {
        guard phase == .running else { return }
        countdown -= dt
        conditions.update(dt: dt, context: frame.evaluation)
        // FUN_0005fd7c 在 TIME 更新后同帧调用 FUN_0005ecf4。
        conditions.checkComparisons(context: frame.evaluation)

        let timedOrConditionEnd = (endsOnTimer && countdown <= 0)
            || conditions.result != .pending
        let shouldFinish: Bool
        if !wavesEnded {
            shouldFinish = timedOrConditionEnd
        } else if isBonusRound
                    || frame.waveCount < challenge.numWaves
                    || frame.fruitEntityCount != 0 {
            shouldFinish = timedOrConditionEnd
        } else {
            shouldFinish = true
        }
        if shouldFinish {
            finishRound(context: frame.evaluation)
            wavesEnded = false
        }
    }

    /// FUN_0005fd7c 状态 3：只响应结算控制器 state==7 的真实子状态。
    /// 新回合配置与水果由外部选择器显式提供；缺失时不推进、不虚构选择。
    /// bonusIntro 之前同样先完成外部回合 setup，避免沿用上一轮已冻结的聚合结果。
    public mutating func updateSettlement(controllerState: Int32,
                                          substate: Int32,
                                          nextChallenge: ChallengeDefinition? = nil,
                                          nextSelectedFruitName: String? = nil) {
        guard phase == .settling, controllerState == 7 else { return }
        switch ChallengeSettlementSubstate(rawValue: substate) ?? .other {
        case .bonus:
            guard let nextChallenge else { return }
            prepareRound(challenge: nextChallenge,
                         selectedFruitName: nextSelectedFruitName)
            startBonusIntro()
        case .nextRound:
            guard let nextChallenge else { return }
            beginRound(challenge: nextChallenge,
                       selectedFruitName: nextSelectedFruitName)
            events.append(.nextRound)
        case .finished:
            cleanup()
        case .other:
            phase = .suspended
        }
    }

    /// The normal branch of FUN_00061128 makes Timer and challengeMods visible
    /// and starts their real animate_in timelines after the first-round setup.
    public mutating func startInitialRound() {
        guard phase == .running, roundsPlayed == 0 else { return }
        emitRunningHUDEvents()
    }

    /// FUN_0005ffa8：状态 1 只由 bonusIntro 的真实播放完成回调推进；
    /// 条件与倒计时已在此前的外部回合 setup 中复位，这里不再次结算或选择。
    public mutating func completeBonusIntro() {
        guard phase == .bonusIntro else { return }
        phase = .running
        emitRunningHUDEvents()
    }

    private mutating func prepareRound(challenge nextChallenge: ChallengeDefinition,
                                       selectedFruitName: String?) {
        challenge = nextChallenge
        self.selectedFruitName = selectedFruitName
        countdown = 0
        wavesEnded = false
        conditions.select(conditionNames: challenge.conditionNames,
                          selectedFruitName: selectedFruitName)
        countdown = conditions.timerDuration != 0
            ? conditions.timerDuration : challenge.timeLimit
    }

    private mutating func beginRound(challenge nextChallenge: ChallengeDefinition,
                                     selectedFruitName: String?) {
        prepareRound(challenge: nextChallenge, selectedFruitName: selectedFruitName)
        phase = .running
        emitRunningHUDEvents()
    }

    /// FUN_0005ffa8 restores both controls hidden by FUN_000606a4. Playing
    /// animate_in alone does not undo the original explicit visibility write.
    private mutating func emitRunningHUDEvents() {
        events.append(.setVisible(target: "Timer", true))
        events.append(.playAnimation(target: "Timer", name: "animate_in"))
        events.append(.setVisible(target: "challengeMods", true))
        events.append(.playAnimation(target: "challengeMods", name: "animate_in"))
    }

    private mutating func startBonusIntro() {
        phase = .bonusIntro
        events.append(.playAnimation(target: "bonusIntro", name: "play"))
        events.append(.playMusic("Music-bonus"))
    }

    private mutating func cleanup() {
        phase = .inactive
        events.append(.setVisible(target: "inGameChallengeHud", false))
        events.append(.cleanedUp)
    }

    private mutating func finishRound(context: ChallengeEvaluationContext) {
        events.append(.playAnimation(target: "inGameChallengeHud", name: "animate_out"))
        let outcome = conditions.finish(context: context)
        guard outcome != .pending else { return }

        roundsPlayed += 1
        if outcome == .pass { roundsPassed += 1 }
        roundResults.append(outcome)
        events.append(.roundFinished(outcome))
        if outcome == .fail {
            events.append(.playSound("gank"))
        }
        if isBonusRound {
            events.append(.playMusic("Music-bonus-end"))
        }
        phase = .settling
        events.append(.playAnimation(target: "instructionsText", name: "instructions_out"))
        events.append(.setVisible(target: "Timer", false))
        events.append(.setVisible(target: "challengeMods", false))
    }
}
