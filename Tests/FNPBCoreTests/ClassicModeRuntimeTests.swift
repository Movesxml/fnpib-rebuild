import XCTest
@testable import FNPBCore

/// 经典失败链整组回归：回收筛选、三振、额外生命、爆炸阈值与动画完成输入。
final class ClassicModeRuntimeTests: XCTestCase {
    private final class Rig {
        let world = GameWorld(magicBeanScore: 25)
        let slice = ClassicSliceStub()
        let stats = StatsRecorder()
        let score = ScoreSystem()
        let audio = ClassicAudioSpy()
        let services: GameServices

        init() {
            let effects = ClassicEffectsStub()
            services = GameServices(
                slice: slice,
                combo: ComboTracker(stats: stats),
                score: score,
                stats: stats,
                waves: ClassicWaveStub(),
                audio: audio,
                effects: effects,
                rng: SeededRandomSource(seed: 7))
        }

        var runnableState: GameState {
            var state = GameState()
            state.levelTier = Constants.Simulation.lowLevelEffectCutoff
            return state
        }
    }

    func testNormalDropUsesFullFilterAndKeepsDroppedStatsOrder() {
        let rig = Rig()
        var runtime = ClassicModeRuntime()
        var state = GameState()

        runtime.retireFruit(makeFruit(), reason: .normalDrop, state: &state, services: rig.services)
        XCTAssertEqual(state.missedFruitCount, 1)
        XCTAssertEqual(rig.stats.value(forDynamicKey: "dropped"), 1)
        XCTAssertEqual(rig.stats.value(forDynamicKey: "apple_drops"), 1)

        var noScore = FruitInfo()
        noScore.name = "super_pomegranate"
        noScore.score = 0
        noScore.noScore = true
        runtime.retireFruit(makeFruit(noScore), reason: .normalDrop, state: &state, services: rig.services)
        XCTAssertEqual(state.missedFruitCount, 1, "noScore 不扣命，但正常 dropped 统计已先发生")
        XCTAssertEqual(rig.stats.value(forDynamicKey: "dropped"), 2)

        var powered = FruitInfo()
        powered.name = "bean"
        powered.powers = [FruitPower()]
        runtime.retireFruit(makeFruit(powered), reason: .normalDrop, state: &state, services: rig.services)
        XCTAssertEqual(state.missedFruitCount, 1, "+0x32c 非空时不进入经典漏切回调")
        XCTAssertEqual(rig.stats.value(forDynamicKey: "dropped"), 3)

        var highScore = FruitInfo()
        highScore.score = 5
        runtime.retireFruit(makeFruit(highScore), reason: .normalDrop, state: &state, services: rig.services)
        XCTAssertEqual(state.missedFruitCount, 1)
        XCTAssertEqual(rig.stats.value(forDynamicKey: "dropped"), 3, "score<5 也是 dropped 的外层门控")

        let excluded = [
            makeFruit(isBombMarked: true),
            makeFruit(hasBeenSliced: true),
            makeFruit(missExclusionMarker: true)
        ]
        for entity in excluded {
            runtime.retireFruit(entity, reason: .normalDrop, state: &state, services: rig.services)
        }
        XCTAssertEqual(state.missedFruitCount, 1)
        XCTAssertEqual(rig.stats.value(forDynamicKey: "dropped"), 3)
    }

    func testForcedCleanupNeitherCountsNorReportsDropped() {
        let rig = Rig()
        var runtime = ClassicModeRuntime()
        var state = GameState()
        runtime.retireFruit(makeFruit(), reason: .forcedCleanup, state: &state, services: rig.services)
        runtime.update(state: &state)

        XCTAssertEqual(state.missedFruitCount, 0)
        XCTAssertEqual(state.classicPhase, .running)
        XCTAssertEqual(rig.stats.value(forDynamicKey: "dropped"), 0)
        XCTAssertTrue(rig.audio.keys.isEmpty)
        XCTAssertTrue(runtime.drainEvents().isEmpty)
    }

    func testThirdMissStartsTwoAnimationPhasesBeforeResults() {
        let rig = Rig()
        var runtime = ClassicModeRuntime()
        var state = GameState()

        for expected in 1...3 {
            runtime.retireFruit(makeFruit(), reason: .normalDrop, state: &state, services: rig.services)
            runtime.update(state: &state)
            XCTAssertEqual(state.missedFruitCount, Int32(expected))
            XCTAssertEqual(state.classicPhase, expected < 3 ? .running : .gameOver)
        }
        XCTAssertEqual(runtime.drainEvents(), [.missCross(1), .missCross(2), .missCross(3), .gameOver])
        XCTAssertEqual(rig.audio.keys, ["gank", "gank", "gank"])

        runtime.update(state: &state)
        XCTAssertTrue(runtime.drainEvents().isEmpty, "结束入口不得逐帧重复触发")
        runtime.completeAnimation(state: &state)
        XCTAssertEqual(state.classicPhase, .gameOverReal)
        XCTAssertEqual(runtime.drainEvents(), [.gameOverReal])
        runtime.completeAnimation(state: &state)
        XCTAssertEqual(state.classicPhase, .results)
        XCTAssertEqual(runtime.drainEvents(), [.results])
        runtime.completeAnimation(state: &state)
        XCTAssertTrue(runtime.drainEvents().isEmpty)
    }

    func testMagicBeanSliceRestoresOneCrossThroughGameWorld() {
        let rig = Rig()
        var state = rig.runnableState
        state.missedFruitCount = 1
        rig.slice.sliceResult = true
        var store: any EntityStore = GenerationOrderStore()

        var bean = FruitInfo()
        bean.name = "bean"
        bean.powers = [FruitPower()]
        store.spawn(EntityPrototype(kind: .fruit, fruit: bean))

        rig.world.tick(dt: 1.0 / 60.0, state: &state, world: &store, services: rig.services)
        XCTAssertEqual(state.missedFruitCount, 0)
        XCTAssertEqual(state.classicPhase, .running)
        XCTAssertEqual(rig.score.total, 1, "恢复生命分支仍保留水果的普通 1 分")
        XCTAssertEqual(rig.stats.value(forDynamicKey: "bean"), 1)
        XCTAssertEqual(rig.stats.value(forDynamicKey: "bean_game_consecutive_total"), 1)
        XCTAssertEqual(rig.stats.value(forDynamicKey: "magic_bean_points"), 0)
        XCTAssertEqual(rig.audio.keys, ["bean-collect", "extra-life", "splash"])
        XCTAssertEqual(rig.audio.stoppedKeys, ["bean-lp"])
        XCTAssertEqual(rig.world.drainClassicEvents(), [
            .restoreCross(1), .magicBeanPopup(.extraLife, at: .zero)
        ])

        rig.world.completeClassicAnimation(state: &state)
        XCTAssertEqual(state.classicPhase, .running, "running 状态没有待完成结束动画")
    }

    func testMagicBeanAtZeroMissesAddsConfiguredBonusAfterBaseScore() {
        let rig = Rig()
        var state = rig.runnableState
        rig.slice.sliceResult = true
        var store: any EntityStore = GenerationOrderStore()
        var bean = FruitInfo()
        bean.name = "bean"
        store.spawn(EntityPrototype(kind: .fruit, fruit: bean))

        rig.world.tick(dt: 1.0 / 60.0, state: &state, world: &store, services: rig.services)

        XCTAssertEqual(state.missedFruitCount, 0)
        XCTAssertEqual(rig.score.total, 26, "bean 缺省普通分 1 与 XML 奖励 25 是两次独立计分")
        XCTAssertEqual(rig.stats.value(forDynamicKey: "magic_bean_points"), 25)
        XCTAssertEqual(rig.stats.value(forDynamicKey: "bean_game_consecutive_total"), 1)
        XCTAssertEqual(rig.audio.keys, ["bean-collect", "splash"])
        XCTAssertEqual(rig.audio.stoppedKeys, ["bean-lp"])
        XCTAssertEqual(rig.world.drainClassicEvents(), [.magicBeanPopup(.bonus, at: .zero)])
    }

    func testBeanConsecutiveBonusOnlyIncrementsOnFirstBean() {
        let rig = Rig()
        var state = rig.runnableState
        rig.slice.sliceResult = true
        var store: any EntityStore = GenerationOrderStore()
        var bean = FruitInfo()
        bean.name = "bean"

        for _ in 0..<2 {
            store.spawn(EntityPrototype(kind: .fruit, fruit: bean))
            rig.world.tick(dt: 1.0 / 60.0, state: &state, world: &store, services: rig.services)
            _ = rig.world.drainClassicEvents()
        }

        XCTAssertEqual(rig.stats.value(forDynamicKey: "bean"), 2)
        XCTAssertEqual(rig.stats.value(forDynamicKey: "bean_game_consecutive_total"), 1)
        XCTAssertEqual(rig.stats.value(forDynamicKey: "magic_bean_points"), 50)
        XCTAssertEqual(rig.score.total, 52)
    }

    func testNonClassicBeanKeepsBaseScoreWithoutClassicReward() {
        let rig = Rig()
        rig.world.resetForNewGame(isClassicMode: false)
        var state = rig.runnableState
        rig.slice.sliceResult = true
        var store: any EntityStore = GenerationOrderStore()
        var bean = FruitInfo()
        bean.name = "bean"
        store.spawn(EntityPrototype(kind: .fruit, fruit: bean))

        rig.world.tick(dt: 1.0 / 60.0, state: &state, world: &store, services: rig.services)

        XCTAssertEqual(rig.score.total, 1)
        XCTAssertEqual(rig.stats.value(forDynamicKey: "magic_bean_points"), 0)
        XCTAssertEqual(rig.stats.value(forDynamicKey: "bean_game_consecutive_total"), 0)
        XCTAssertEqual(rig.audio.keys, ["splash"])
        XCTAssertTrue(rig.audio.stoppedKeys.isEmpty)
        XCTAssertTrue(rig.world.drainClassicEvents().isEmpty)
    }

    func testExplosionCrossesOnePointFiveExactlyOnce() {
        let rig = Rig()
        var state = rig.runnableState
        rig.slice.sliceResult = true
        var store: any EntityStore = GenerationOrderStore()
        store.spawn(EntityPrototype(kind: .bomb))

        rig.world.tick(dt: 1.0 / 60.0, state: &state, world: &store, services: rig.services)
        XCTAssertEqual(state.classicPhase, .running, "命中与 isFaulted 置位都不能立即进入 game_over")
        rig.world.tick(dt: 1.0, state: &state, world: &store, services: rig.services)
        XCTAssertEqual(state.classicPhase, .running)
        rig.world.tick(dt: 0.7, state: &state, world: &store, services: rig.services)
        XCTAssertEqual(state.classicPhase, .gameOver)
        XCTAssertEqual(rig.world.drainClassicEvents(), [.gameOver])

        rig.world.tick(dt: 1.0, state: &state, world: &store, services: rig.services)
        XCTAssertTrue(rig.world.drainClassicEvents().isEmpty)
        rig.world.completeClassicAnimation(state: &state)
        rig.world.completeClassicAnimation(state: &state)
        XCTAssertEqual(state.classicPhase, .results)
    }

    func testNonClassicExplosionDoesNotInvokeClassicController() {
        let rig = Rig()
        rig.world.resetForNewGame(isClassicMode: false)
        var state = rig.runnableState
        rig.slice.sliceResult = true
        var store: any EntityStore = GenerationOrderStore()
        store.spawn(EntityPrototype(kind: .bomb))

        rig.world.tick(dt: 1.0 / 60.0, state: &state, world: &store, services: rig.services)
        rig.world.tick(dt: 1.7, state: &state, world: &store, services: rig.services)
        XCTAssertEqual(state.classicPhase, .running)
        XCTAssertTrue(rig.world.drainClassicEvents().isEmpty)
    }

    func testResetClearsExplosionAndPendingClassicEvents() {
        let rig = Rig()
        var state = rig.runnableState
        rig.slice.sliceResult = true
        var store: any EntityStore = GenerationOrderStore()
        store.spawn(EntityPrototype(kind: .bomb))
        rig.world.tick(dt: 1.0 / 60.0, state: &state, world: &store, services: rig.services)
        XCTAssertGreaterThan(rig.world.explosionTimeRemaining, 0)

        rig.world.resetForNewGame(isClassicMode: true)
        XCTAssertEqual(rig.world.explosionTimeRemaining, 0)
        XCTAssertTrue(rig.world.drainClassicEvents().isEmpty)
    }

    private func makeFruit(_ info: FruitInfo = FruitInfo(),
                           isBombMarked: Bool = false,
                           hasBeenSliced: Bool = false,
                           missExclusionMarker: Bool = false) -> Entity {
        var entity = Entity(id: .init(rawValue: 1), kind: .fruit)
        var resolved = info
        if resolved.name.isEmpty { resolved.name = "apple" }
        entity.fruit = resolved
        entity.isBombMarked = isBombMarked
        entity.hasBeenSliced = hasBeenSliced
        entity.missExclusionMarker = missExclusionMarker
        return entity
    }
}

private final class ClassicSliceStub: SliceTesting {
    var sliceResult = false
    func isSliced(game: GameState, entity: Entity) -> Bool { sliceResult }
    func isNearMiss(game: GameState, entity: Entity) -> Bool { false }
}

private final class ClassicWaveStub: WaveDirecting {
    func tick(dt: Float, state: inout GameState, world: any EntityStore) {}
}

private final class ClassicAudioSpy: AudioPlaying {
    private(set) var keys: [String] = []
    private(set) var stoppedKeys: [String] = []
    func play(_ key: String) { keys.append(key) }
    func stop(_ key: String) { stoppedKeys.append(key) }
}

private final class ClassicEffectsStub: EffectEmitting {
    func emit(_ kind: Int32, at position: SIMD3<Float>) {}
}
