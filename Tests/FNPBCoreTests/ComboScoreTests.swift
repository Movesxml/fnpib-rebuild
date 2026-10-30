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
        guard case let .settled(count, fruitTypes) = events[0] else {
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
        guard case let .settled(count, fruitTypes) = events[0] else {
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

    // MARK: - 特殊果 +0x1ba 分支

    func testSpecialFruitBonusApplies() {
        let tracker = ComboTracker(specialFruitBonus: 5)
        let rng = FixedRandom(values: [0, 0])
        var state = GameState()
        state.specialFruitBonusEnabled = true

        let event = tracker.registerSlice(fruitType: 2, entity: EntityID(rawValue: 1),
                                          state: &state, rng: rng)
        XCTAssertEqual(event, ComboEvent.incremented(count: 1, visualTier: 0, textTier: 1))
        XCTAssertEqual(state.lastSliceScore, 5, "特殊果应把加成写入 +0x110")

        // -1*0.75（combo 递减）+ (-3.0*0.75)（特殊果修正）= -3.0
        XCTAssertEqual(state.rhythmFactor, -3.0, accuracy: 1e-5)
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