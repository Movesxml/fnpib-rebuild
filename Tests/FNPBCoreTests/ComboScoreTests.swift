//
//  ComboScoreTests.swift
//  FNPBCoreTests
//
//  T-013 黄金值测试：combo 窗口推进 / 到期结算 / 0.095 封顶 / combo>9 收紧 /
//  双档 clamp 边界 / 溢出保护两模式 / 命中率手算用例
//

import XCTest
@testable import FNPBCore

// MARK: - 测试替身

/// 确定性随机源：按预置序列循环返回浮点值。
private final class FixedRandom: RandomSource {
    private let values: [Float]
    private var cursor: Int = 0

    init(values: [Float] = [0]) {
        self.values = values.isEmpty ? [0] : values
    }

    func nextFloat() -> Float {
        let value = values[cursor % values.count]
        cursor += 1
        return value
    }

    func nextInt(_ upperBound: Int32) -> Int32 { 0 }
    func snapshot() -> UInt64 { UInt64(cursor) }
    func restore(_ s: UInt64) { cursor = Int(s) }
}

// MARK: - 测试

final class ComboScoreTests: XCTestCase {

    private let frame: Float = 1.0 / 60.0

    // MARK: - Combo 窗口推进 / 结算

    func testComboWindowAdvancesAndSettlesAfterCrossingCap() {
        let tracker = ComboTracker()
        let rng = FixedRandom()
        var state = GameState()

        let first = tracker.registerSlice(fruitType: 1, entity: EntityID(rawValue: 1),
                                          state: &state, rng: rng)
        XCTAssertEqual(first, ComboEvent.incremented(count: 1, visualTier: 0, textTier: 1))
        XCTAssertEqual(state.comboWindowTimer, 0)
        // r=0 → term = 0.75 → rhythmFactor = -1 * 0.75
        XCTAssertEqual(state.rhythmFactor, -0.75, accuracy: 1e-6)

        // 5 帧后 timer ≈ 0.0833 < 0.095 → 不结算
        for _ in 0..<5 {
            XCTAssertTrue(tracker.tickWindow(dt: frame, state: &state).isEmpty)
        }

        // 第 6 帧 timer ≈ 0.1 >= 0.095 → 结算
        let events = tracker.tickWindow(dt: frame, state: &state)
        XCTAssertEqual(events.count, 1)
        guard case let .settled(count, fruitTypes, _) = events[0] else {
            return XCTFail("第 6 帧应派发 settled 事件（timer≈0.1 >= 0.095）")
        }
        XCTAssertEqual(count, 1)
        XCTAssertEqual(fruitTypes, [1] + [Int32](repeating: -1, count: 10))

        // 结算后统一清零 + timer 回到 windowBase
        XCTAssertEqual(state.comboCount, 0)
        XCTAssertEqual(state.comboTypeFlag, 0)
        XCTAssertNil(state.lastComboEntity)
        XCTAssertEqual(state.comboFruitTypes, GameState.emptyComboSlots)
        XCTAssertEqual(state.comboWindowTimer, Constants.Combo.windowBase)
    }

    func testComboWindowTightensWhenComboExceedsNine() {
        let tracker = ComboTracker()
        let rng = FixedRandom()
        var state = GameState()

        for index in 0..<9 {
            _ = tracker.registerSlice(fruitType: 1,
                                      entity: EntityID(rawValue: UInt32(index + 1)),
                                      state: &state, rng: rng)
        }
        XCTAssertEqual(state.comboCount, 9)
        // 9 未超过门限 → timer 保持切中时重置的 0
        XCTAssertEqual(state.comboWindowTimer, 0)

        _ = tracker.registerSlice(fruitType: 1, entity: EntityID(rawValue: 10),
                                  state: &state, rng: rng)
        XCTAssertEqual(state.comboCount, 10)
        // combo>9 → 窗口直接置 0.095
        XCTAssertEqual(state.comboWindowTimer, Constants.Combo.windowCap)

        // timer 已 == cap，下一帧（dt=0 也足够）立即结算
        let events = tracker.tickWindow(dt: 0, state: &state)
        XCTAssertEqual(events.count, 1)
        guard case let .settled(count, fruitTypes, _) = events[0] else {
            return XCTFail("combo>9 应立即结算")
        }
        XCTAssertEqual(count, 10)
        XCTAssertEqual(fruitTypes, [Int32](repeating: 1, count: 10) + [-1])
    }

    func testSameEntityDoesNotDoubleCount() {
        let tracker = ComboTracker()
        let rng = FixedRandom()
        var state = GameState()
        let entity = EntityID(rawValue: 7)

        _ = tracker.registerSlice(fruitType: 1, entity: entity, state: &state, rng: rng)
        let second = tracker.registerSlice(fruitType: 1, entity: entity, state: &state, rng: rng)

        XCTAssertNil(second, "同一实体重复命中应返回 nil")
        XCTAssertEqual(state.comboCount, 1)
        XCTAssertEqual(state.rhythmFactor, -0.75, accuracy: 1e-6, "同实体不应再扣节奏因子")
        XCTAssertEqual(state.comboFruitTypes[0], 1)
        XCTAssertEqual(state.comboFruitTypes[1], -1)
    }

    func testRegisterAfterSettleStartsFreshWindow() {
        let tracker = ComboTracker()
        let rng = FixedRandom()
        var state = GameState()

        _ = tracker.registerSlice(fruitType: 1, entity: EntityID(rawValue: 1), state: &state, rng: rng)
        _ = tracker.tickWindow(dt: 0.2, state: &state)      // 强制结算
        XCTAssertEqual(state.comboCount, 0)

        let next = tracker.registerSlice(fruitType: 3, entity: EntityID(rawValue: 42),
                                         state: &state, rng: rng)
        XCTAssertEqual(next, ComboEvent.incremented(count: 1, visualTier: 0, textTier: 1))
        XCTAssertEqual(state.lastComboEntity?.rawValue, 42)
        XCTAssertEqual(state.comboFruitTypes[0], 3)
    }

    func testStateSlotControlsComboGateAndTypeFlag() {
        let tracker = ComboTracker()
        let rng = FixedRandom()
        var state = GameState()

        let skipped = tracker.registerSlice(
            fruitType: 7,
            entity: EntityID(rawValue: 1),
            stateSlot0: 2,
            state: &state,
            rng: rng
        )
        XCTAssertNil(skipped)
        XCTAssertEqual(state.comboCount, 0)
        XCTAssertEqual(state.rhythmFactor, 0)

        _ = tracker.registerSlice(
            fruitType: 7,
            entity: EntityID(rawValue: 2),
            stateSlot0: 1,
            state: &state,
            rng: rng
        )
        XCTAssertEqual(state.comboCount, 1)
        XCTAssertEqual(state.comboTypeFlag, 1, "+0x90 来自 entity[0x21]，不是水果 typeID")
    }

    func testSlashStatsFollowOriginalFirstWindowAndLaterWindowBranches() {
        let stats = StatsRecorder()
        let tracker = ComboTracker(stats: stats)
        let rng = FixedRandom()
        var state = GameState()

        _ = tracker.registerSlice(fruitType: 1, entity: EntityID(rawValue: 1),
                                  state: &state, rng: rng)
        XCTAssertEqual(stats.value(for: .slashesScoring), 1)
        XCTAssertEqual(stats.value(for: .slashes), 0, "首次 +0x51==0 分支只发 slashesScoring")

        _ = tracker.tickWindow(dt: 0.2, state: &state)
        _ = tracker.registerSlice(fruitType: 1, entity: EntityID(rawValue: 2),
                                  state: &state, rng: rng)
        XCTAssertEqual(stats.value(for: .slashesScoring), 2)
        XCTAssertEqual(stats.value(for: .slashes), 1, "后续新窗口才同时发 slashes")
    }

    // MARK: - 档位 clamp 边界

    func testTierClampBoundaries() {
        // visual = clamp(combo-3, 0, 2)
        XCTAssertEqual(ComboTier.visual(for: 0), 0)
        XCTAssertEqual(ComboTier.visual(for: 3), 0)
        XCTAssertEqual(ComboTier.visual(for: 4), 1)
        XCTAssertEqual(ComboTier.visual(for: 5), 2)
        XCTAssertEqual(ComboTier.visual(for: 100), 2)

        // text = clamp(combo-2, 1, 5)
        XCTAssertEqual(ComboTier.text(for: 0), 1)
        XCTAssertEqual(ComboTier.text(for: 2), 1)
        XCTAssertEqual(ComboTier.text(for: 3), 1)
        XCTAssertEqual(ComboTier.text(for: 4), 2)
        XCTAssertEqual(ComboTier.text(for: 7), 5)
        XCTAssertEqual(ComboTier.text(for: 100), 5)

        // 特效门限 combo > 2
        XCTAssertFalse(ComboTier.isEffectActive(for: 2))
        XCTAssertTrue(ComboTier.isEffectActive(for: 3))
    }

    // MARK: - 暴击 +0x1ba 后处理

    func testCriticalHitUsesFruitTypeCountAndAddsRhythmPenalty() {
        let stats = StatsRecorder()
        let tracker = ComboTracker(stats: stats)
        let rng = FixedRandom(values: [0, 0])
        var state = GameState()
        state.recordSliceHit(entityPosition: .zero, slashPosition: .zero, fruitType: 2)
        var entity = Entity(id: EntityID(rawValue: 1), kind: .fruit)
        entity.isCriticalHit = true
        entity.fruit = FruitInfo()
        entity.fruit?.typeID = 2
        entity.fruit?.score = 7
        entity.fruit?.name = "orange"
        entity.fruit?.noCritical = false

        let score = ScoreSystem()
        score.dispatch(score: 2, comboType: 0, isScoring: true, mode: 0)
        let services = GameServices(
            slice: UnusedSlice(), combo: tracker, score: score, stats: stats,
            waves: UnusedWaves(), audio: UnusedAudio(), effects: UnusedEffects(), rng: rng)
        var critical = criticalConfig(score: 10)
        critical.chance = 1
        let onSliced = FruitOnSliced(critical: critical, fruitTypeCount: 24)
        onSliced.reset(isClassicMode: true, initialChance: 1)
        onSliced.apply(entity: &entity, state: &state, services: services)

        XCTAssertEqual(score.total, 19)
        XCTAssertEqual(state.lastSliceScore, 26, "+0x110 是 typeID 加水果类型总数")
        XCTAssertEqual(state.rhythmFactor, -2.25, accuracy: 1e-5)
        XCTAssertEqual(stats.value(forDynamicKey: "crit"), 1)
        XCTAssertEqual(stats.value(forDynamicKey: "crits_total"), 1)
        XCTAssertEqual(stats.value(forDynamicKey: "orangecrit"), 1)
    }

    private func criticalConfig(score: Int32) -> CriticalConfig {
        var config = CriticalConfig()
        config.score = score
        return config
    }

    // MARK: - 计分溢出保护

    func testOverflowProtectionZeroesTotalInDefaultMode() {
        let score = ScoreSystem()
        score.dispatch(score: Int32.max, comboType: 0, isScoring: true, mode: 0)
        XCTAssertEqual(score.total, Int32.max)

        score.dispatch(score: 1, comboType: 0, isScoring: true, mode: 0)
        XCTAssertEqual(score.total, 0, "mode!=4/5 且超 0x7fffffff → 归零")
    }

    func testOverflowProtectionSkippedInModeFour() {
        let score = ScoreSystem()
        score.dispatch(score: Int32.max, comboType: 0, isScoring: true, mode: 4)
        score.dispatch(score: 1, comboType: 0, isScoring: true, mode: 4)
        // mode==4 不归零 → 2^31 按 32 位回绕截断为 Int32.min
        XCTAssertEqual(score.total, Int32.min)
    }

    func testOverflowProtectionKeepsValueInModeFive() {
        let score = ScoreSystem()
        score.dispatch(score: Int32.max, comboType: 0, isScoring: true, mode: 5)
        score.dispatch(score: 1, comboType: 0, isScoring: true, mode: 5)
        // mode==5 超阈值不归零 → 同样回绕
        XCTAssertEqual(score.total, Int32.min)
    }

    // MARK: - 延迟回调

    func testImmediateCallbackFiresRegardlessOfMode() {
        let score = ScoreSystem()
        var fired: [Int32] = []
        score.schedule(delay: 0) { value, _ in fired.append(value) }

        score.dispatch(score: 42, comboType: 0, isScoring: true, mode: 0)
        XCTAssertEqual(fired, [42])

        score.dispatch(score: 43, comboType: 0, isScoring: true, mode: 0)
        XCTAssertEqual(fired, [42], "delay==0 回调出队后不应重复触发")
    }

    func testDelayedCallbackFiresWhenSequenceExceedsDelayInModeOne() {
        let score = ScoreSystem()
        var fired: [Int32] = []
        score.schedule(delay: 2) { value, _ in fired.append(value) }

        score.dispatch(score: 10, comboType: 0, isScoring: true, mode: 1)  // seq=1
        XCTAssertEqual(fired, [])
        score.dispatch(score: 11, comboType: 0, isScoring: true, mode: 1)  // seq=2
        XCTAssertEqual(fired, [])
        score.dispatch(score: 12, comboType: 0, isScoring: true, mode: 1)  // seq=3 → 2<3
        XCTAssertEqual(fired, [12])
    }

    func testDelayedCallbackDoesNotFireOutsideModeOne() {
        let score = ScoreSystem()
        var fired = false
        score.schedule(delay: 1) { _, _ in fired = true }

        score.dispatch(score: 1, comboType: 0, isScoring: true, mode: 0)
        score.dispatch(score: 1, comboType: 0, isScoring: true, mode: 0)
        XCTAssertFalse(fired, "非 mode==1 时延迟回调不出队")
    }

    // MARK: - 命中率（§3.3 手算）

    func testAccuracyHandComputedCases() {
        // misses = 10 - 8 = 2
        // f = (8 + 0 + (-0.2)*2*8)/8 = (8 - 3.2)/8 = 0.6 → 0.6*100 = 60
        XCTAssertEqual(AccuracyFormula.rate(totalFruit: 8, slashes: 10, slashesScoring: 8), 60)

        // 全中：f = 10/10 = 1.0 → 100
        XCTAssertEqual(AccuracyFormula.rate(totalFruit: 10, slashes: 10, slashesScoring: 10), 100)

        // 负值归零：f = (1 - 0.2*9*1)/1 = -0.8 → 0
        XCTAssertEqual(AccuracyFormula.rate(totalFruit: 1, slashes: 10, slashesScoring: 1), 0)

        // 除零防御
        XCTAssertEqual(AccuracyFormula.rate(totalFruit: 0, slashes: 5, slashesScoring: 0), 0)

        // 外部修正项 X 计入分子：f = (2 + 1 + 0)/2 = 1.5 → 150
        XCTAssertEqual(AccuracyFormula.rate(totalFruit: 2, slashes: 2, slashesScoring: 2,
                                            externalCorrection: 1), 150)
    }

    func testComboPatternRanksMatchOriginalBranches() {
        let names: [Int32: String] = [1: "apple", 2: "orange", 3: "banana"]
        XCTAssertEqual(ComboPatternRank.rank([1, 1, 1], fruitNames: names), 6)
        XCTAssertEqual(ComboPatternRank.rank([1, 2, 1, 2, 1], fruitNames: names), 24)
        XCTAssertEqual(ComboPatternRank.rank([1, 1, 2, 2, 3], fruitNames: names), 21,
                       "三类五个且前两类之一出现两次，优先返回 21")
        XCTAssertEqual(ComboPatternRank.rank([1, 1, 2, 2, 3, 3], fruitNames: names), 3,
                       "六个 2/2/2 没有三连，走小 combo 默认表")
        XCTAssertEqual(ComboPatternRank.rank([1, 2, 3, 4, 5], fruitNames: names), 4)
        XCTAssertEqual(ComboPatternRank.rank([1, 2, 3, 1, 2], fruitNames: names), 21)
        XCTAssertEqual(ComboPatternRank.rank([1, 2, 1], fruitNames: names), 24,
                       "原 bVar3 已被打断，短交替序列同样返回 24")
        XCTAssertEqual(ComboPatternRank.rank([1, 2, 1, 2, 1, 2], fruitNames: names), 24)
        XCTAssertEqual(ComboPatternRank.rank([1, 1, 2, 2], fruitNames: names), 1,
                       "不进入交替分支后，长度为 4 的默认排名为 1")
        XCTAssertEqual(ComboPatternRank.rank([1, 1, 2, 1, 2], fruitNames: names), 20)
        XCTAssertEqual(ComboPatternRank.rank([1, 1, 1, 2], fruitNames: names), 22)
        XCTAssertEqual(ComboPatternRank.rank([1, 1, 1, 1, 2], fruitNames: names), 23)
        XCTAssertEqual(ComboPatternRank.rank([1, 2, 3, 1, 2, 3, 1], fruitNames: names), 22)
    }

    func testBestComboUsesCountThenPatternRankAndIncrementalStat() {
        let stats = StatsRecorder(fruitNames: [1: "apple", 2: "orange", 3: "banana"],
                                  comboBonuses: [3, 4, 5, 7, 9, 12, 14, 17])
        stats.recordCombo(count: 3, fruitTypes: [1, 1, 1], modePrefix: "CLASSIC")
        XCTAssertEqual(stats.bestComboRank, 6)
        XCTAssertEqual(stats.value(forDynamicKey: "best_combo"), 3)
        XCTAssertEqual(stats.value(forDynamicKey: "CLASSIC_combos"), 1)

        stats.recordCombo(count: 3, fruitTypes: [1, 2, 1], modePrefix: "CLASSIC")
        XCTAssertEqual(stats.bestComboFruitTypes, [1, 2, 1] + [Int32](repeating: -1, count: 8),
                       "同数且原排名更高时替换旧序列")
        XCTAssertEqual(stats.bestComboRank, 24)
        stats.recordCombo(count: 3, fruitTypes: [2, 2, 2], modePrefix: "CLASSIC")
        XCTAssertEqual(stats.bestComboFruitTypes, [1, 2, 1] + [Int32](repeating: -1, count: 8),
                       "同数且排名更低时保留旧序列")
        XCTAssertEqual(stats.bestComboRank, 24)
        XCTAssertEqual(stats.value(forDynamicKey: "best_combo"), 3, "同数不重复增加最佳值")

        stats.recordCombo(count: 2, fruitTypes: [1, 2], modePrefix: nil)
        XCTAssertEqual(stats.value(for: .combos), 3, "2 连只更新最高连击，不上报 combos")
        XCTAssertEqual(stats.value(forDynamicKey: "combo_bonus"), 9)
    }

    func testComboBonusUsesEveryOriginalTierAndClampsAtTen() {
        let stats = StatsRecorder(comboBonuses: [3, 4, 5, 7, 9, 12, 14, 17])
        let expected: [Int32] = [3, 4, 5, 7, 9, 12, 14, 17, 17, 17]
        var accumulated: Int32 = 0
        for (offset, bonus) in expected.enumerated() {
            let count = Int32(offset + 3)
            stats.recordCombo(count: count,
                              fruitTypes: [Int32](repeating: 1, count: Int(count)),
                              modePrefix: nil)
            accumulated += bonus
            XCTAssertEqual(stats.value(forDynamicKey: "combo_bonus"), accumulated,
                           "combo=\(count) 的奖励档位错误")
            XCTAssertEqual(stats.value(forDynamicKey: "best_combo"), count,
                           "combo_bonus 不能替代 best_combo")
        }
        XCTAssertEqual(stats.value(for: .combos), Int32(expected.count))
    }

    func testStatsRecorderAccuracyFromKeys() {
        let stats = StatsRecorder()
        stats.add(.slashes, 10)
        stats.add(.slashesScoring, 8)
        stats.add(.totalfruit, 8)
        XCTAssertEqual(stats.accuracy(), 60)

        stats.report("strawberry_combo_total", 3)
        stats.report("strawberry_combo_total", 2)
        XCTAssertEqual(stats.value(forDynamicKey: "strawberry_combo_total"), 5)
    }
}

private final class UnusedSlice: SliceTesting {
    func isSliced(game: GameState, entity: Entity) -> Bool { false }
    func isNearMiss(game: GameState, entity: Entity) -> Bool { false }
}
private final class UnusedWaves: WaveDirecting {
    func tick(dt: Float, state: inout GameState, world: any EntityStore) {}
}
private final class UnusedAudio: AudioPlaying { func play(_ key: String) {} }
private final class UnusedEffects: EffectEmitting {
    func emit(_ kind: Int32, at position: SIMD3<Float>) {}
}