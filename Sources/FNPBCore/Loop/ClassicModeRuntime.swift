import Foundation

/// 发售版经典控制器的失败、额外生命与结束动画子链。
///
/// 来源：FUN_0000f2f8 / FUN_000713f4 / FUN_00070bc8 / FUN_00070e68 /
/// FUN_00070050 / FUN_000707cc / FUN_000708c4。这里不保存第二份漏切计数，
/// `GameState.missedFruitCount` 与 `classicPhase` 分别对应控制器 +0x14 / +0x44。
struct ClassicModeRuntime: Sendable {
    enum RetirementReason: Sendable {
        /// FUN_0000f2f8(param_2 == 1)：正常出界，先上报 dropped，再尝试漏切分发。
        case normalDrop
        /// FUN_0000f2f8(param_2 == 0)：强制清理，不上报 dropped，也不扣命。
        case forcedCleanup
    }

    private var isClassicMode = true
    private var events: [ClassicEvent] = []
    private let magicBeanScore: Int32?

    init(magicBeanScore: Int32? = nil) {
        self.magicBeanScore = magicBeanScore
    }

    mutating func reset(isClassicMode: Bool) {
        self.isClassicMode = isClassicMode
        events.removeAll(keepingCapacity: false)
    }

    mutating func drainEvents() -> [ClassicEvent] {
        defer { events.removeAll(keepingCapacity: false) }
        return events
    }

    /// 完整保留回收筛选顺序。前三个实体标记与 score<5 同时控制 dropped 统计；
    /// 特殊能力、noScore 与经典控制器只控制后续漏切回调，不能提前合并成一个条件。
    mutating func retireFruit(_ entity: Entity,
                              reason: RetirementReason,
                              state: inout GameState,
                              services: GameServices) {
        guard !entity.isBombMarked,
              !entity.hasBeenSliced,
              !entity.missExclusionMarker,
              let fruit = entity.fruit,
              fruit.score < 5 else { return }

        if reason == .normalDrop {
            services.stats.report("dropped", 1)
            services.stats.report("\(fruit.name)_drops", 1)
        }

        // FUN_0001cd2c() 在本发售版恒为 1；FUN_0004eb70()==0 是正常发行路径。
        // 重建的经典控制器只在经典模式存在，非经典模式不进入此计数。
        guard isClassicMode,
              reason == .normalDrop,
              fruit.powers.isEmpty,
              !fruit.noScore else { return }

        state.missedFruitCount &+= Constants.MissPenalty.perMissedFruit
        if state.classicPhase == .running {
            services.audio.play("gank")
            events.append(.missCross(state.missedFruitCount))
        }
    }

    /// FUN_00070bc8 / FUN_00070e68：每次切中先停循环声并播放收集声。
    /// 有漏切时恢复最近一格；零漏切时追加 originalModeInfo.xml 的真实奖励分。
    mutating func onFruitSliced(_ entity: Entity,
                                state: inout GameState,
                                services: GameServices) {
        guard isClassicMode, entity.fruit?.name == "bean" else { return }

        services.audio.stop("bean-lp")
        services.audio.play("bean-collect")
        if services.stats.value(forDynamicKey: "bean") == 1 {
            services.stats.report("bean_game_consecutive_total", 1)
        }

        if state.missedFruitCount > 0 {
            let restoredCross = state.missedFruitCount
            state.missedFruitCount -= 1
            services.audio.play("extra-life")
            events.append(.restoreCross(restoredCross))
            events.append(.magicBeanPopup(.extraLife, at: entity.transform.position))
        } else if let magicBeanScore {
            services.stats.report("magic_bean_points", magicBeanScore)
            services.score.dispatch(score: magicBeanScore, comboType: 0, isScoring: true, mode: 0)
            events.append(.magicBeanPopup(.bonus, at: entity.transform.position))
        }
    }

    /// FUN_00070050 状态 1：第三次（>2）才进入结束，不是 >=3 时直接显示结算。
    mutating func update(state: inout GameState) {
        guard isClassicMode,
              state.classicPhase == .running,
              state.missedFruitCount >= Constants.MissPenalty.threshold else { return }
        beginGameOver(state: &state)
    }

    /// FUN_0001f018：只有爆炸计时从 >1.5 跨到 <=1.5 才调用经典结束入口。
    /// 该入口不读取 game+0xa4；不能用 isFaulted 另造一个原机器码没有的门控。
    mutating func onExplosionThreshold(state: inout GameState) {
        guard isClassicMode, state.classicPhase == .running else { return }
        beginGameOver(state: &state)
    }

    private mutating func beginGameOver(state: inout GameState) {
        state.classicPhase = .gameOver
        events.append(.gameOver)
    }

    /// 由真实动画系统回报完成；禁止用未经证实的固定等待秒数自动推进。
    mutating func completeAnimation(state: inout GameState) {
        guard isClassicMode else { return }
        switch state.classicPhase {
        case .gameOver:
            state.classicPhase = .gameOverReal
            events.append(.gameOverReal)
        case .gameOverReal:
            state.classicPhase = .results
            events.append(.results)
        case .running, .results:
            break
        }
    }
}
