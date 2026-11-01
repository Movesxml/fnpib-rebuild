import XCTest
import simd
@testable import FNPBCore

// ============================================================================
// GameWorldTests — T-023/T-033 主循环十步实装回归
//
// 覆盖：
//   1) step2 碰撞半径归一化（d = 0 / 7.5 / 30 三值）
//   2) step3 slash 轨迹写槽与超时（0.05 边界严格大于 + 镜像字段同步）
//   3) step4 levelTier < 4 清特效参数并跳过实体遍历；== 4 进入遍历
//   4) step9 combo 窗口到期分发结算事件（真实 ComboTracker）
//   5) step10 波次子系统每帧被调用（StubWaveDirector 计数）
//   6) 水果输入隔离、炸弹先命中后近失、type=0 实体筛选与首发统计
//
// ⚠️ 复用 WaveTests.swift 中已定义的测试替身（同 target）：
//    `SeededRandomSource`（确定性 LCG）。**不重复定义**，否则编译冲突。
// ⚠️ 实体容器直接用真实实现 `GenerationOrderStore`（T-020 教训：Stub 必须满足
//    EntityStore 全协议，直接复用真实实现最稳）。
// ============================================================================

final class GameWorldTests: XCTestCase {

    // MARK: - Rig（一次性装配 + 可断言替身）

    private final class Rig {
        let world: GameWorld
        let slice = SpySliceTester()
        let score = ScoreSystem()
        let stats = SpyStats()
        let audio = SpyAudio()
        let effects = SpyEffects()
        let waves = SpyWaveDirector()
        let rng = SeededRandomSource(seed: 1)
        let services: GameServices

        init(onSliced: FruitOnSliced = FruitOnSliced()) {
            world = GameWorld(onSliced: onSliced)
            services = GameServices(
                slice: slice,
                combo: ComboTracker(stats: stats),
                score: score,
                stats: stats,
                waves: waves,
                audio: audio,
                effects: effects,
                rng: rng)
        }
    }

    // MARK: - 1) step2 碰撞半径归一化

    func test_step2_碰撞半径归一化三值() {
        let rig = Rig()
        var state = GameState()
        var world: any EntityStore = GenerationOrderStore()

        // d = 0 → ratio = 0 → w = 0.5 → w² = 0.25
        state.slashPosition = SIMD3<Float>(0, 0, 0)
        rig.world.tick(dt: 1.0 / 60.0, state: &state, world: &world, services: rig.services)
        XCTAssertEqual(state.sliceRadiusSquared, 0.25, accuracy: 1e-6)

        // d = 7.5 → ratio = 0.5 → w = 0.75 → w² = 0.5625
        state.slashPosition = SIMD3<Float>(7.5, 0, 0)
        rig.world.tick(dt: 1.0 / 60.0, state: &state, world: &world, services: rig.services)
        XCTAssertEqual(state.sliceRadiusSquared, 0.5625, accuracy: 1e-6)

        // d = 30 → ratio = 2 → clamp → w = 1.0 → w² = 1.0
        state.slashPosition = SIMD3<Float>(30, 0, 0)
        rig.world.tick(dt: 1.0 / 60.0, state: &state, world: &world, services: rig.services)
        XCTAssertEqual(state.sliceRadiusSquared, 1.0, accuracy: 1e-6)

        // 三维长度（非单轴）：|(3,4,0)| = 5 → ratio = 1/3 → w = 0.5/3 + 0.5 = 0.6666..
        state.slashPosition = SIMD3<Float>(3, 4, 0)
        rig.world.tick(dt: 1.0 / 60.0, state: &state, world: &world, services: rig.services)
        let expectedW: Float = 0.5 * (5.0 / 15.0) + 0.5
        XCTAssertEqual(state.sliceRadiusSquared, expectedW * expectedW, accuracy: 1e-6)
    }

    // MARK: - 2) step3 轨迹写槽与超时

    func test_step3_轨迹0点05边界不写槽且镜像同步() {
        let rig = Rig()
        var state = GameState()
        var world: any EntityStore = GenerationOrderStore()

        state.slashPosition = SIMD3<Float>(1, 2, 3)
        state.slashTrail.begin()                 // 原 +0xa5 = 1

        rig.world.tick(dt: Constants.Slash.trailTimeout,
                       state: &state, world: &world, services: rig.services)

        // 严格大于才写槽：elapsed == 0.05 不写
        XCTAssertEqual(state.slashTrail.writeCount, 0)
        XCTAssertTrue(state.slashTrail.isActive)
        // 镜像字段同步（+0xa5 / +0x17c）
        XCTAssertTrue(state.slashTrailActive)
        XCTAssertEqual(state.slashTrailTimer, Constants.Slash.trailTimeout, accuracy: 1e-6)
    }

    func test_step3_超过0点05写槽并清活跃() {
        let rig = Rig()
        var state = GameState()
        var world: any EntityStore = GenerationOrderStore()

        state.slashPosition = SIMD3<Float>(1, 2, 3)
        state.slashTrail.begin()

        rig.world.tick(dt: Constants.Slash.trailTimeout,
                       state: &state, world: &world, services: rig.services)
        rig.world.tick(dt: 0.01,
                       state: &state, world: &world, services: rig.services)

        XCTAssertEqual(state.slashTrail.writeCount, 1)
        XCTAssertFalse(state.slashTrail.isActive)
        XCTAssertEqual(state.slashTrail.slot, 1)               // (0 + 1) % 8
        XCTAssertEqual(state.slashTrail.points[1], SIMD3<Float>(1, 2, 3))
        // 镜像字段被清零
        XCTAssertFalse(state.slashTrailActive)
        XCTAssertEqual(state.slashTrailTimer, 0, accuracy: 1e-6)
    }

    func test_step3_未开启时不写槽且计时归零() {
        let rig = Rig()
        var state = GameState()
        var world: any EntityStore = GenerationOrderStore()

        state.slashPosition = SIMD3<Float>(9, 9, 9)
        // 不调用 begin()：isActive == false
        rig.world.tick(dt: 1.0, state: &state, world: &world, services: rig.services)

        XCTAssertEqual(state.slashTrail.writeCount, 0)
        XCTAssertEqual(state.slashTrailTimer, 0, accuracy: 1e-6)
    }

    // MARK: - 3) step4 等级门控

    func test_step4_levelTier小于4时清特效参数且不遍历实体() {
        let rig = Rig()
        var state = GameState()
        state.levelTier = Constants.Simulation.lowLevelEffectCutoff - 1   // 3
        state.levelEffectParam = 9.0
        rig.slice.sliceResult = true

        var world: any EntityStore = GenerationOrderStore()
        let id = world.spawn(EntityPrototype(kind: .fruit))

        rig.world.tick(dt: 1.0 / 60.0, state: &state, world: &world, services: rig.services)

        XCTAssertEqual(state.levelEffectParam, 0, accuracy: 1e-6)
        XCTAssertEqual(rig.slice.sliceCalls, 0, "等级门控未通过时不得遍历实体")
        XCTAssertNotNil(world.entity(id), "门控未通过时实体不应被回收")
    }

    func test_step4_levelTier等于4时进入实体遍历() {
        let rig = Rig()
        var state = GameState()
        state.levelTier = Constants.Simulation.lowLevelEffectCutoff        // 4
        rig.slice.sliceResult = true

        var world: any EntityStore = GenerationOrderStore()
        let id = world.spawn(EntityPrototype(kind: .fruit))

        rig.world.tick(dt: 1.0 / 60.0, state: &state, world: &world, services: rig.services)

        XCTAssertEqual(rig.slice.sliceCalls, 1)
        XCTAssertNil(world.entity(id), "命中后应被 despawn")
    }

    // MARK: - 4) step9 combo 窗口到期分发

    func test_step9_combo窗口到期分发结算事件() {
        let rig = Rig()
        var state = GameState()
        state.comboCount = 3
        state.comboFruitTypes[0] = 1
        state.comboFruitTypes[1] = 2
        state.comboFruitTypes[2] = 3
        state.comboWindowTimer = 0
        state.lastComboEntity = EntityID(rawValue: 99)

        var world: any EntityStore = GenerationOrderStore()

        // dt = 0.1 → timer 0 → 0.1 ≥ windowCap(0.095) → 结算
        rig.world.tick(dt: Constants.Combo.windowBase,
                       state: &state, world: &world, services: rig.services)

        // clearComboTracking 语义
        XCTAssertEqual(state.comboCount, 0)
        XCTAssertEqual(state.comboTypeFlag, 0)
        XCTAssertNil(state.lastComboEntity)
        XCTAssertEqual(state.comboFruitTypes, GameState.emptyComboSlots)

        // 结算事件分发到音频（tier = clamp(3-3,0,2) = 0）
        XCTAssertTrue(rig.audio.keys.contains("combo_settle_0"))
        XCTAssertEqual(rig.score.total, 3, "3 连结算分发 combo 数和 comboType")
        XCTAssertEqual(rig.stats.adds[.combos], 1)
        XCTAssertEqual(rig.stats.reports["CLASSIC_combos"], 1)
        XCTAssertEqual(rig.stats.reports["best_combo"], 3)
    }

    func test_step9_无活动combo时到期只清零不派发事件() {
        let rig = Rig()
        var state = GameState()
        state.comboCount = 0
        state.comboWindowTimer = 0

        var world: any EntityStore = GenerationOrderStore()
        rig.world.tick(dt: Constants.Combo.windowBase,
                       state: &state, world: &world, services: rig.services)

        XCTAssertEqual(state.comboCount, 0)
        XCTAssertTrue(rig.audio.keys.isEmpty, "无 combo 时不应派发结算音效")
        XCTAssertNil(rig.stats.adds[.combos])
    }

    // MARK: - 5) step10 波次子系统

    func test_step10_波次子系统每帧被调用() {
        let rig = Rig()
        var state = GameState()
        var world: any EntityStore = GenerationOrderStore()

        // levelTier 默认 0（实体遍历被跳过）→ step10 仍必须执行（T-023 控制流修正）
        rig.world.tick(dt: 1.0 / 60.0, state: &state, world: &world, services: rig.services)
        XCTAssertEqual(rig.waves.tickCalls, 1)

        rig.world.tick(dt: 1.0 / 60.0, state: &state, world: &world, services: rig.services)
        XCTAssertEqual(rig.waves.tickCalls, 2)
    }

    func test_step10_等级门控关闭时波次仍推进() {
        let rig = Rig()
        var state = GameState()
        state.levelTier = 0     // 明确的门控关闭
        var world: any EntityStore = GenerationOrderStore()

        rig.world.tick(dt: 1.0 / 60.0, state: &state, world: &world, services: rig.services)
        XCTAssertEqual(rig.waves.tickCalls, 1, "实体遍历门控不得阻断子系统更新")
    }

    // MARK: - 附加：step6 / step7

    func test_step6_命中水果后计数计分并回收实体() {
        let rig = Rig()
        var state = GameState()
        state.levelTier = Constants.Simulation.lowLevelEffectCutoff
        rig.slice.sliceResult = true

        var world: any EntityStore = GenerationOrderStore()
        var fruit = FruitInfo()
        fruit.typeID = 1
        fruit.score = 10
        let id = world.spawn(EntityPrototype(kind: .fruit, fruit: fruit))

        rig.world.tick(dt: 1.0 / 60.0, state: &state, world: &world, services: rig.services)

        XCTAssertNil(world.entity(id))
        XCTAssertEqual(state.comboCount, 1)
        XCTAssertEqual(state.lastSliceScore, 1)                 // +0x110 = 水果类型
        XCTAssertEqual(rig.score.total, 10)                     // 基础分来自 FruitInfo.score
        XCTAssertTrue(rig.audio.keys.contains("splash"))
        XCTAssertEqual(rig.effects.emitted.count, 1)
        XCTAssertEqual(rig.effects.emitted.first?.kind, 0)
    }

    func test_step6_stateSlot0为2仍执行单果计分但不增加combo() {
        let rig = Rig()
        var state = runnableState()
        rig.slice.sliceResult = true
        var world: any EntityStore = GenerationOrderStore()
        var fruit = FruitInfo()
        fruit.typeID = 4
        fruit.score = 12
        world.spawn(EntityPrototype(kind: .fruit, fruit: fruit, stateSlot0: 2))

        rig.world.tick(dt: 1.0 / 60.0, state: &state, world: &world, services: rig.services)
        XCTAssertEqual(rig.score.total, 12)
        XCTAssertEqual(state.comboCount, 0)
        XCTAssertEqual(rig.stats.adds[.totalfruit], 1)
    }

    func test_step6_noScore水果不进入标准计分和水果统计() {
        let rig = Rig()
        var state = runnableState()
        rig.slice.sliceResult = true
        var world: any EntityStore = GenerationOrderStore()
        var fruit = FruitInfo()
        fruit.typeID = 2
        fruit.score = 0
        fruit.noScore = true
        world.spawn(EntityPrototype(kind: .fruit, fruit: fruit, isCriticalHit: true))

        rig.world.tick(dt: 1.0 / 60.0, state: &state, world: &world, services: rig.services)
        XCTAssertEqual(rig.score.total, 0)
        XCTAssertNil(rig.stats.adds[.totalfruit])
        XCTAssertNil(rig.stats.reports["crit"])
        XCTAssertEqual(state.lastSliceScore, 2)
    }

    func test_step6_杨桃跳过普通分但仍上报totalfruit() {
        let rig = Rig(onSliced: FruitOnSliced(fruitTypeCount: 24, starfruitTypeID: 5))
        var state = runnableState()
        rig.slice.sliceResult = true
        var world: any EntityStore = GenerationOrderStore()
        var fruit = FruitInfo()
        fruit.typeID = 5
        fruit.name = "starfruit"
        fruit.score = 50
        world.spawn(EntityPrototype(kind: .fruit, fruit: fruit))

        rig.world.tick(dt: 1.0 / 60.0, state: &state, world: &world, services: rig.services)
        XCTAssertEqual(rig.score.total, 0)
        XCTAssertEqual(rig.stats.adds[.totalfruit], 1)
    }

    func test_step6_暴击加内容配置分并执行实体后处理() {
        var critical = CriticalConfig()
        critical.score = 10
        critical.chance = 1
        let rig = Rig(onSliced: FruitOnSliced(critical: critical,
                                              fruitTypeCount: 24,
                                              starfruitTypeID: 99))
        rig.world.resetForNewGame(isClassicMode: true, initialCriticalChance: 1)
        rig.score.dispatch(score: 2, comboType: 0, isScoring: true, mode: 0)
        var state = runnableState()
        rig.slice.sliceResult = true
        var world: any EntityStore = GenerationOrderStore()
        var fruit = FruitInfo()
        fruit.typeID = 5
        fruit.name = "orange"
        fruit.score = 8
        fruit.noCritical = false
        world.spawn(EntityPrototype(kind: .fruit, fruit: fruit, isCriticalHit: true))

        rig.world.tick(dt: 1.0 / 60.0, state: &state, world: &world, services: rig.services)
        XCTAssertEqual(rig.score.total, 20, "门槛预置 2 分后，再加基础 8 与暴击 10")
        XCTAssertEqual(state.lastSliceScore, 29)
        XCTAssertEqual(rig.stats.reports["crit"], 1)
        XCTAssertEqual(rig.stats.reports["crits_total"], 1)
        XCTAssertEqual(rig.stats.reports["orangecrit"], 1)
        XCTAssertLessThan(state.rhythmFactor, -0.75, "combo 与暴击各消耗一次随机修正")
    }

    func test_step6_普通路径跳过标记保留OnSliced但不进combo和命中特效() {
        let rig = Rig()
        var state = runnableState()
        rig.slice.sliceResult = true
        var world: any EntityStore = GenerationOrderStore()
        var fruit = FruitInfo()
        fruit.typeID = 1
        fruit.score = 9
        world.spawn(EntityPrototype(kind: .fruit, fruit: fruit, skipsNormalFruitPath: true))

        rig.world.tick(dt: 1.0 / 60.0, state: &state, world: &world, services: rig.services)
        XCTAssertEqual(rig.score.total, 9)
        XCTAssertEqual(state.comboCount, 0)
        XCTAssertEqual(rig.stats.adds[.totalfruit], 1)
        XCTAssertTrue(rig.effects.emitted.isEmpty)
        XCTAssertFalse(rig.audio.keys.contains("splash"))
    }

    private func runnableState() -> GameState {
        var state = GameState()
        state.levelTier = Constants.Simulation.lowLevelEffectCutoff
        return state
    }

    func test_step6_未命中时不回收不计数() {
        let rig = Rig()
        var state = GameState()
        state.levelTier = Constants.Simulation.lowLevelEffectCutoff
        rig.slice.sliceResult = false

        var world: any EntityStore = GenerationOrderStore()
        let id = world.spawn(EntityPrototype(kind: .fruit))

        rig.world.tick(dt: 1.0 / 60.0, state: &state, world: &world, services: rig.services)

        XCTAssertNotNil(world.entity(id))
        XCTAssertEqual(state.comboCount, 0)
        XCTAssertEqual(rig.slice.sliceCalls, 1)
        XCTAssertTrue(rig.audio.keys.isEmpty)
    }

    func test_step6_命中不会污染后续实体的触摸输入() {
        let rig = Rig()
        var state = GameState()
        state.levelTier = Constants.Simulation.lowLevelEffectCutoff
        state.slashPosition = SIMD3<Float>(9, 8, 0)
        state.previousTouchPosition = SIMD3<Float>(1, 2, 0)
        rig.slice.sliceResult = true

        var world: any EntityStore = GenerationOrderStore()
        world.spawn(EntityPrototype(
            kind: .fruit,
            transform: EntityTransform(position: SIMD3<Float>(10, 20, 0))
        ))
        world.spawn(EntityPrototype(
            kind: .fruit,
            transform: EntityTransform(position: SIMD3<Float>(12, 20, 0))
        ))

        rig.world.tick(dt: 1.0 / 60.0, state: &state, world: &world, services: rig.services)

        XCTAssertEqual(rig.slice.sliceCalls, 2, "两个水果都必须存活到切割判定")
        XCTAssertEqual(world.aliveCount, 0, "两个水果都必须命中并回收")
        XCTAssertEqual(rig.slice.slashInputs, Array(repeating: state.slashPosition, count: 2))
        XCTAssertEqual(rig.slice.segmentStarts, Array(repeating: state.previousTouchPosition, count: 2))
        XCTAssertEqual(state.previousSlashPosition, state.slashPosition)
        XCTAssertNotEqual(state.hitPoint, state.slashPosition, "+0x104 只能是最后命中实体位置")
    }

    func test_step7_炸弹近失只统计不结束() {
        let rig = Rig()
        var state = GameState()
        state.levelTier = Constants.Simulation.lowLevelEffectCutoff
        rig.slice.nearMissResult = true

        var world: any EntityStore = GenerationOrderStore()
        let id = world.spawn(EntityPrototype(kind: .bomb))

        rig.world.tick(dt: 1.0 / 60.0, state: &state, world: &world, services: rig.services)
        XCTAssertFalse(state.isFaulted)
        XCTAssertEqual(rig.stats.adds[.nearMiss], 1)
        XCTAssertNotNil(world.entity(id))

        // 原主循环每次未命中且近失都上报，没有 isFaulted 去重门。
        rig.world.tick(dt: 1.0 / 60.0, state: &state, world: &world, services: rig.services)
        XCTAssertEqual(rig.stats.adds[.nearMiss], 2)
        XCTAssertFalse(state.isFaulted)
    }

    func test_step7_命中炸弹才按条件结束且不走近失() {
        let rig = Rig()
        var state = GameState()
        state.levelTier = Constants.Simulation.lowLevelEffectCutoff
        rig.slice.sliceResult = true
        rig.slice.nearMissResult = true

        var world: any EntityStore = GenerationOrderStore()
        let id = world.spawn(EntityPrototype(kind: .bomb))

        rig.world.tick(dt: 1.0 / 60.0, state: &state, world: &world, services: rig.services)

        XCTAssertNil(world.entity(id))
        XCTAssertTrue(state.isFaulted)
        XCTAssertEqual(rig.slice.nearMissCalls, 0)
        XCTAssertNil(rig.stats.adds[.nearMiss])
        XCTAssertEqual(rig.stats.adds[.bomb], 1)
        XCTAssertEqual(rig.world.explosionTimeRemaining,
                       Constants.Bomb.explosionTimerSeconds - 1.0 / 60.0,
                       accuracy: 1e-6,
                       "原版在实体主循环之后递减，命中帧也消耗一个 dt")
        XCTAssertTrue(rig.audio.keys.contains(Constants.Bomb.explodeAudioKey))
    }

    func test_step5_爆炸计时阻断遍历并在归零后恢复() {
        let rig = Rig()
        var state = GameState()
        state.levelTier = Constants.Simulation.lowLevelEffectCutoff
        rig.slice.sliceResult = true

        var world: any EntityStore = GenerationOrderStore()
        world.spawn(EntityPrototype(kind: .bomb))
        rig.world.tick(dt: 1.0 / 60.0, state: &state, world: &world, services: rig.services)
        XCTAssertGreaterThan(rig.world.explosionTimeRemaining, 0)
        let callsAfterExplosion = rig.slice.sliceCalls

        let fruitID = world.spawn(EntityPrototype(kind: .fruit))
        rig.world.tick(dt: 1.0, state: &state, world: &world, services: rig.services)
        XCTAssertEqual(rig.slice.sliceCalls, callsAfterExplosion,
                       "爆炸期间不得移动、切割或回收实体")
        XCTAssertNotNil(world.entity(fruitID))

        rig.world.tick(dt: Constants.Bomb.explosionTimerSeconds,
                       state: &state, world: &world, services: rig.services)
        XCTAssertEqual(rig.world.explosionTimeRemaining, 0, accuracy: 1e-6,
                       "计时跨过零点必须钳为 0")
        XCTAssertEqual(rig.slice.sliceCalls, callsAfterExplosion,
                       "计时归零的那一帧仍使用帧初门控结果")

        rig.world.tick(dt: 1.0 / 60.0, state: &state, world: &world, services: rig.services)
        XCTAssertEqual(rig.slice.sliceCalls, callsAfterExplosion + 1)
        XCTAssertNil(world.entity(fruitID))
    }

    func test_step7_非致命炸弹命中不结束() {
        let rig = Rig()
        var state = GameState()
        state.levelTier = Constants.Simulation.lowLevelEffectCutoff
        rig.slice.sliceResult = true

        var world: any EntityStore = GenerationOrderStore()
        let id = world.spawn(EntityPrototype(kind: .bomb, isFaultingBomb: false))
        rig.world.tick(dt: 1.0 / 60.0, state: &state, world: &world, services: rig.services)

        XCTAssertNil(world.entity(id))
        XCTAssertFalse(state.isFaulted)
    }

    func test_step7_状态槽非零炸弹命中不写结束标志() {
        let rig = Rig()
        var state = GameState()
        state.levelTier = Constants.Simulation.lowLevelEffectCutoff
        rig.slice.sliceResult = true

        var world: any EntityStore = GenerationOrderStore()
        world.spawn(EntityPrototype(kind: .bomb, stateSlot1: 1))
        rig.world.tick(dt: 1.0 / 60.0, state: &state, world: &world, services: rig.services)
        XCTAssertFalse(state.isFaulted)
    }

    func test_step8_type0特殊实体被切并首发统计() {
        let rig = Rig()
        var state = GameState()
        state.levelTier = Constants.Simulation.lowLevelEffectCutoff
        rig.slice.sliceResult = true

        var world: any EntityStore = GenerationOrderStore()
        let id = world.spawn(EntityPrototype(kind: .other))
        rig.world.tick(dt: 1.0 / 60.0, state: &state, world: &world, services: rig.services)

        XCTAssertNil(world.entity(id))
        XCTAssertEqual(rig.stats.adds[.slashesScoring], 1)
        XCTAssertTrue(state.slashesScoringEmitted)
        XCTAssertEqual(state.comboCount, 0, "循环 C 不进入水果 combo 计数")
    }

    func test_step8_flags屏蔽特殊实体() {
        let rig = Rig()
        var state = GameState()
        state.levelTier = Constants.Simulation.lowLevelEffectCutoff
        rig.slice.sliceResult = true

        var world: any EntityStore = GenerationOrderStore()
        let id = world.spawn(EntityPrototype(kind: .other, flags: 0x10))
        rig.world.tick(dt: 1.0 / 60.0, state: &state, world: &world, services: rig.services)

        XCTAssertNotNil(world.entity(id))
        XCTAssertEqual(rig.slice.sliceCalls, 0)
        XCTAssertFalse(state.slashesScoringEmitted)
    }

    func test_step7_近失只对炸弹调用() {
        let rig = Rig()
        var state = GameState()
        state.levelTier = Constants.Simulation.lowLevelEffectCutoff
        rig.slice.nearMissResult = true
        rig.slice.sliceResult = false

        var world: any EntityStore = GenerationOrderStore()
        world.spawn(EntityPrototype(kind: .fruit))

        rig.world.tick(dt: 1.0 / 60.0, state: &state, world: &world, services: rig.services)

        XCTAssertEqual(rig.slice.nearMissCalls, 0, "L4：近失判定只允许在炸弹循环调用")
        XCTAssertFalse(state.isFaulted)
    }

    // MARK: - 首帧门（R7，回归保护）

    func test_未prime首帧不推进() {
        let rig = Rig()
        var state = GameState()
        state.slashPosition = SIMD3<Float>(30, 0, 0)
        var world: any EntityStore = GenerationOrderStore()

        rig.world.tick(dt: 0, state: &state, world: &world, services: rig.services)

        XCTAssertEqual(state.sliceRadiusSquared, 0, "未 prime 时 dt==0 且缓存为 0 → 整帧跳过")
        XCTAssertEqual(rig.waves.tickCalls, 0)
    }

    func test_prime后dt为零仍推进() {
        let rig = Rig()
        rig.world.prime()
        var state = GameState()
        state.slashPosition = SIMD3<Float>(30, 0, 0)
        var world: any EntityStore = GenerationOrderStore()

        rig.world.tick(dt: 0, state: &state, world: &world, services: rig.services)

        XCTAssertEqual(state.sliceRadiusSquared, 1.0, accuracy: 1e-6)
        XCTAssertEqual(rig.waves.tickCalls, 1)
    }
}

// ============================================================================
// 测试替身（本文件私有；SeededRandomSource 复用 WaveTests.swift）
// ============================================================================

private final class SpySliceTester: SliceTesting {
    var sliceResult = false
    var nearMissResult = false
    private(set) var sliceCalls = 0
    private(set) var nearMissCalls = 0
    private(set) var slashInputs: [SIMD3<Float>] = []
    private(set) var segmentStarts: [SIMD3<Float>] = []

    func isSliced(game: GameState, entity: Entity) -> Bool {
        sliceCalls += 1
        slashInputs.append(game.slashPosition)
        segmentStarts.append(game.previousTouchPosition)
        return sliceResult
    }

    func isNearMiss(game: GameState, entity: Entity) -> Bool {
        nearMissCalls += 1
        return nearMissResult
    }
}

private final class SpyWaveDirector: WaveDirecting {
    private(set) var tickCalls = 0

    func tick(dt: Float, state: inout GameState, world: any EntityStore) {
        tickCalls += 1
    }
}

private final class SpyAudio: AudioPlaying {
    private(set) var keys: [String] = []

    func play(_ key: String) { keys.append(key) }
}

private final class SpyEffects: EffectEmitting {
    private(set) var emitted: [(kind: Int32, position: SIMD3<Float>)] = []

    func emit(_ kind: Int32, at position: SIMD3<Float>) {
        emitted.append((kind, position))
    }
}

private final class SpyStats: StatsRecording {
    private(set) var adds: [StatsKey: Int32] = [:]
    private(set) var reports: [String: Int32] = [:]

    func add(_ key: StatsKey, _ value: Int32) {
        adds[key, default: 0] += value
    }

    func report(_ dynamicKey: String, _ value: Int32) {
        reports[dynamicKey, default: 0] += value
    }

    func recordCombo(count: Int32, fruitTypes: [Int32], modePrefix: String?) {
        guard count >= 3 else { return }
        add(.combos, 1)
        if let modePrefix { report("\(modePrefix)_combos", 1) }
        let previous = reports["best_combo", default: 0]
        report("best_combo", max(0, count - previous))
    }
}
