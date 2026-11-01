import XCTest
import simd
@testable import FNPBCore

/// T-035：默认水果生成严格按 FUN_00057000；缺省 gravity 只验证已命名的兼容策略。
final class SpawnMotionTests: XCTestCase {
    private static let appleTypeID: Int32 = 0
    private static let watermelonTypeID: Int32 = 3

    func testArmUnsignedSaturateMatchesTruncationAndSaturation() {
        XCTAssertEqual(FruitMotion.armUnsignedSaturate(-150), 0)
        XCTAssertEqual(FruitMotion.armUnsignedSaturate(-0.01), 0)
        XCTAssertEqual(FruitMotion.armUnsignedSaturate(.nan), 0)
        XCTAssertEqual(FruitMotion.armUnsignedSaturate(12.99), 12)
        XCTAssertEqual(FruitMotion.armUnsignedSaturate(Float(UInt32.max) * 2), UInt32.max)
    }

    func testHorizontalRandomZeroHalfAndOneSaturateLikeARM() {
        for (random, expectedX) in [(Float(0), Float(0)), (0.5, Float(0)), (1, Float(150))] {
            let rng = SequenceTestRandom([random, 0.5, 0.5])
            var spawner = Spawner()
            spawner.horizMin = -1
            spawner.horizMax = 1
            spawner.velocityScaleX = 1
            spawner.velocityScaleY = 1
            let state = FruitMotion.spawnState(rng: rng, spawner: spawner)
            XCTAssertEqual(state.position.x, expectedX, accuracy: 1e-6)
            XCTAssertEqual(state.position.y, -215, accuracy: 1e-6)
            XCTAssertEqual(rng.calls, 3)
        }
    }

    func testDefaultSpawnConsumesHorizontalSpeedDirectionInOrder() {
        let rng = SequenceTestRandom([0.25, 0.75, 0.25])
        var spawner = Spawner()
        spawner.horizMin = -1
        spawner.horizMax = 1
        spawner.velocityScaleX = 1
        spawner.velocityScaleY = 1

        let state = FruitMotion.spawnState(rng: rng, spawner: spawner)
        let speed: Float = 9.5 + 1.5 * 0.75
        // 横向 -75 经 ARM 饱和为 0；direction=-0.25 → curve=.375 → angle=-7.5° → -7°。
        XCTAssertEqual(state.position, SIMD3<Float>(0, -215, 0))
        XCTAssertEqual(state.velocity.x,
                       speed * OriginalSpawnTrigonometry.sin(degrees: -7), accuracy: 1e-5)
        XCTAssertEqual(state.velocity.y,
                       speed * OriginalSpawnTrigonometry.cos(degrees: -7) * 1.075, accuracy: 1e-5)
        XCTAssertEqual(state.velocity.z, 0, accuracy: 1e-6)
        XCTAssertEqual(rng.calls, 3)
    }

    func testRealDefaultVelocityScalesAreUnitAndGravityIsNamedCompatibility() {
        let rng = SequenceTestRandom([1, 1, 1])
        let state = FruitMotion.spawnState(rng: rng, spawner: Spawner())

        let speed: Float = 9.5 + 1.5
        // x=150 → -20*x/150=-20；direction=.5 → curve=.5，最终 -10°。
        XCTAssertEqual(state.position, SIMD3<Float>(150, -215, 0))
        XCTAssertEqual(state.velocity.x,
                       speed * OriginalSpawnTrigonometry.sin(degrees: -10), accuracy: 1e-5)
        XCTAssertEqual(state.velocity.y,
                       speed * OriginalSpawnTrigonometry.cos(degrees: -10) * 1.075, accuracy: 1e-5)
        XCTAssertEqual(state.velocity.z, 0, accuracy: 1e-6)
        XCTAssertEqual(Constants.Physics.missingGravityCompatibility, SIMD3<Float>(0, -1, 0))
        XCTAssertEqual(state.acceleration, SIMD3<Float>(0, -12, 0))
        XCTAssertEqual(rng.calls, 3)
    }

    func testExplicitVelocityOverrideConsumesOnlyTwoRandomValues() {
        let rng = SequenceTestRandom([0.25, 0.75, 0.99])
        var spawner = Spawner()
        spawner.horizMin = -1
        spawner.horizMax = 1
        spawner.velocityX = 3
        spawner.velocityY = -4
        spawner.velocityScaleX = 2
        spawner.velocityScaleY = 0.5
        spawner.gravity = SIMD3<Float>(2, 0, -3)

        let state = FruitMotion.spawnState(rng: rng, spawner: spawner)
        XCTAssertEqual(state.position, SIMD3<Float>(0, -215, 0))
        XCTAssertEqual(state.velocity, SIMD3<Float>(6, -2, 0))
        XCTAssertEqual(state.acceleration, SIMD3<Float>(24, 0, -36))
        XCTAssertEqual(rng.calls, 2, "显式速度覆盖分支跳过方向随机")
    }

    func testSpawnFruitUsesMachOStateAndDoesNotConsumeRandomSpin() throws {
        let store = GenerationOrderStore()
        let rng = SequenceTestRandom([1, 1, 1])
        let bridge = try makeBridge(store: store, rng: rng)
        bridge.spawnFruit(kind: Self.appleTypeID, from: Spawner(), wave: WaveInfo())

        let id = try XCTUnwrap(firstID(in: store))
        let entity = try XCTUnwrap(store.entity(id))
        XCTAssertEqual(entity.kind, .fruit)
        XCTAssertEqual(entity.fruit?.typeID, Self.appleTypeID)
        XCTAssertEqual(entity.transform.position, SIMD3<Float>(150, -215, 0))
        let speed: Float = 11
        XCTAssertEqual(entity.transform.velocity.x,
                       speed * OriginalSpawnTrigonometry.sin(degrees: -10), accuracy: 1e-5)
        XCTAssertEqual(entity.transform.velocity.y,
                       speed * OriginalSpawnTrigonometry.cos(degrees: -10) * 1.075, accuracy: 1e-5)
        XCTAssertEqual(entity.transform.velocity.z, 0, accuracy: 1e-6)
        XCTAssertEqual(entity.transform.acceleration, SIMD3<Float>(0, -12, 0))
        XCTAssertEqual(entity.transform.angularVelocity, .zero)
        XCTAssertEqual(rng.calls, 3, "不得再消耗旧实现的第四次随机自旋")
    }

    func testSpawnFruitUsesRealAppleMetadata() throws {
        let store = GenerationOrderStore()
        let bridge = try makeBridge(store: store, seed: 0xA991E)
        bridge.spawnFruit(kind: Self.appleTypeID, from: Spawner(), wave: WaveInfo())

        let id = try XCTUnwrap(firstID(in: store))
        let entity = try XCTUnwrap(store.entity(id))
        let fruit = try XCTUnwrap(entity.fruit)
        XCTAssertEqual(fruit.name, "apple")
        XCTAssertEqual(fruit.typeID, 0)
        XCTAssertEqual(fruit.score, 1, "真实 apple 未写 score，必须保留构造器缺省 1")
        XCTAssertFalse(fruit.noScore)
        XCTAssertEqual(fruit.chance, 100)
        XCTAssertEqual(fruit.scale, 60, accuracy: 1e-6)
        XCTAssertEqual(fruit.collision, 5, accuracy: 1e-6)
        XCTAssertEqual(fruit.hitInfluence, 0.75, accuracy: 1e-6)
        XCTAssertTrue(fruit.onlySprinkle)
        XCTAssertEqual(entity.transform.scale, 60, accuracy: 1e-6)
        XCTAssertEqual(entity.transform.radius, 5, accuracy: 1e-6)
    }

    func testSpawnFruitMatchesExactTypeID() throws {
        let store = GenerationOrderStore()
        let bridge = try makeBridge(store: store, seed: 0xA77E)
        bridge.spawnFruit(kind: Self.watermelonTypeID, from: Spawner(), wave: WaveInfo())

        let id = try XCTUnwrap(firstID(in: store))
        let entity = try XCTUnwrap(store.entity(id))
        XCTAssertEqual(entity.fruit?.name, "watermelon")
        XCTAssertEqual(entity.fruit?.typeID, 3)
        XCTAssertEqual(entity.fruit?.score, 1, "真实 watermelon 未写 score，缺省也是 1")
        XCTAssertEqual(entity.fruit?.noScore, false)
        XCTAssertEqual(entity.transform.scale, 75, accuracy: 1e-6)
        XCTAssertEqual(entity.transform.radius, 5, accuracy: 1e-6)
    }

    func testSpawnUnknownTypeIDDoesNotCreateEntity() throws {
        let store = GenerationOrderStore()
        let bridge = try makeBridge(store: store, seed: 0xBAD)
        bridge.spawnFruit(kind: 99, from: Spawner(), wave: WaveInfo())
        bridge.spawnFruit(kind: -1, from: Spawner(), wave: WaveInfo())
        XCTAssertEqual(store.aliveCount, 0)
    }

    func testSpawnBombUsesLoadedInfoAndMachODefaultState() throws {
        let store = GenerationOrderStore()
        let rng = SequenceTestRandom([1, 1, 1])
        let bridge = try makeBridge(store: store, rng: rng)
        bridge.spawnBomb(from: Spawner(), wave: WaveInfo())

        XCTAssertEqual(store.aliveCount, 1)
        let id = try XCTUnwrap(firstID(in: store))
        let entity = try XCTUnwrap(store.entity(id))
        XCTAssertEqual(entity.kind, .bomb)
        XCTAssertEqual(entity.transform.position, SIMD3<Float>(150, -260, 32))
        // 测试整数随机源返回 20：trunc(10*150/-300)-10+20 = 15°。
        XCTAssertEqual(entity.transform.velocity.x,
                       11 * OriginalSpawnTrigonometry.sin(degrees: 15), accuracy: 1e-5)
        XCTAssertEqual(entity.transform.velocity.y,
                       11 * OriginalSpawnTrigonometry.cos(degrees: 15) * 1.075, accuracy: 1e-5)
        XCTAssertEqual(entity.transform.velocity.z, 0, accuracy: 1e-6)
        XCTAssertEqual(entity.transform.acceleration, SIMD3<Float>(0, -12, 0))
        XCTAssertEqual(entity.transform.angularVelocity, .zero)
        XCTAssertEqual(entity.transform.scale, 55, accuracy: 1e-6)
        XCTAssertEqual(entity.transform.radius, 35, accuracy: 1e-6)
        let bomb = try XCTUnwrap(entity.fruit?.bomb)
        XCTAssertEqual(bomb.size, 55, accuracy: 1e-6)
        XCTAssertEqual(bomb.collision, 35, accuracy: 1e-6)
        XCTAssertEqual(rng.calls, 3, "不得再消费旧实现的第四次随机自旋")
    }

    func testBombDirectionUsesPositionAdjustmentAndIntegerRandomRange() {
        let rng = SequenceTestRandom([1, 0.5, 0.5])
        var spawner = Spawner()
        spawner.velocityScaleX = 1
        spawner.velocityScaleY = 1

        let state = BombMotion.spawnState(rng: rng, spawner: spawner)
        // x=150 → trunc(10*x/-300)=-5；整数随机为 10，合计 -5-10+10=-5°。
        XCTAssertEqual(state.position, SIMD3<Float>(150, -260, 32))
        XCTAssertEqual(state.velocity.x,
                       10.25 * OriginalSpawnTrigonometry.sin(degrees: -5), accuracy: 1e-5)
        XCTAssertEqual(state.velocity.y,
                       10.25 * OriginalSpawnTrigonometry.cos(degrees: -5) * 1.075, accuracy: 1e-5)
        XCTAssertEqual(state.acceleration, SIMD3<Float>(0, -12, 0))
        XCTAssertEqual(rng.calls, 3)
    }

    func testBombExplicitVelocityConsumesOnlyTwoRandomValues() {
        let rng = SequenceTestRandom([1, 1, 1])
        var spawner = Spawner()
        spawner.velocityX = 3
        spawner.velocityY = -4
        spawner.velocityScaleX = 2
        spawner.velocityScaleY = 0.5
        spawner.gravity = SIMD3<Float>(2, 0, -3)

        let state = BombMotion.spawnState(rng: rng, spawner: spawner)
        XCTAssertEqual(state.position, SIMD3<Float>(150, -260, 32))
        XCTAssertEqual(state.velocity, SIMD3<Float>(6, -2, 0))
        XCTAssertEqual(state.acceleration, SIMD3<Float>(24, 0, -36))
        XCTAssertEqual(rng.calls, 2)
    }

    func testSpawnBeyondTwentyFourIsNotTruncated() throws {
        let store = GenerationOrderStore()
        let bridge = try makeBridge(store: store, seed: 0x24_24)
        for _ in 0..<30 {
            bridge.spawnFruit(kind: Self.appleTypeID, from: Spawner(), wave: WaveInfo())
        }
        XCTAssertEqual(store.aliveCount, 30)
    }

    func testOutOfBoundsFruitIsDespawnedByTick() throws {
        let store = GenerationOrderStore()
        let tuning = FruitMotionTuning()
        let bridge = try makeBridge(store: store, seed: 0x0FF1, tuning: tuning)
        bridge.spawnFruit(kind: Self.appleTypeID, from: Spawner(), wave: WaveInfo())
        let id = try XCTUnwrap(firstID(in: store))
        pushOutOfBounds(store)

        var world: any EntityStore = store
        var state = runnableState()
        GameWorld(motionTuning: tuning).tick(dt: 1.0 / 60.0,
                                             state: &state,
                                             world: &world,
                                             services: makeServices())
        XCTAssertNil(store.entity(id))
        XCTAssertEqual(store.aliveCount, 0)
    }

    func testMissedFruitUsesIndependentCountAndPreservesOriginalOffsetCounter() throws {
        let store = GenerationOrderStore()
        let tuning = FruitMotionTuning()
        let bridge = try makeBridge(store: store, seed: 0x0FF2, tuning: tuning)
        for _ in 0..<3 {
            bridge.spawnFruit(kind: Self.appleTypeID, from: Spawner(), wave: WaveInfo())
        }
        pushOutOfBounds(store)
        var world: any EntityStore = store
        var state = runnableState()
        state.missPenaltyCount = 2
        GameWorld(motionTuning: tuning).tick(dt: 1.0 / 60.0,
                                             state: &state,
                                             world: &world,
                                             services: makeServices())
        XCTAssertEqual(state.missedFruitCount, 3)
        XCTAssertEqual(state.missPenaltyCount, 2)
        XCTAssertEqual(store.aliveCount, 0)
    }

    func testBombOutOfBoundsDoesNotIncrementMissCount() throws {
        let store = GenerationOrderStore()
        let tuning = FruitMotionTuning()
        let bridge = try makeBridge(store: store, seed: 0x0FF3, tuning: tuning)
        bridge.spawnBomb(from: Spawner(), wave: WaveInfo())
        pushOutOfBounds(store)
        var world: any EntityStore = store
        var state = runnableState()
        GameWorld(motionTuning: tuning).tick(dt: 1.0 / 60.0,
                                             state: &state,
                                             world: &world,
                                             services: makeServices())
        XCTAssertEqual(state.missedFruitCount, 0)
        XCTAssertEqual(state.missPenaltyCount, 0)
        XCTAssertEqual(store.aliveCount, 0)
    }

    private func makeBridge(store: GenerationOrderStore,
                            seed: UInt64,
                            tuning: FruitMotionTuning = FruitMotionTuning()) throws -> WaveSpawnBridge {
        try makeBridge(store: store, rng: DeterministicTestRandom(seed: seed), tuning: tuning)
    }

    private func makeBridge(store: GenerationOrderStore,
                            rng: any RandomSource,
                            tuning: FruitMotionTuning = FruitMotionTuning()) throws -> WaveSpawnBridge {
        let content = try loadRealContent()
        return WaveSpawnBridge(store: store,
                               rng: rng,
                               fruits: content.fruits.fruits,
                               bomb: content.fruits.bomb,
                               tuning: tuning)
    }

    private func loadRealContent() throws -> OriginalContent {
        let root = URL(fileURLWithPath: #filePath)
            .deletingLastPathComponent()
            .deletingLastPathComponent()
            .deletingLastPathComponent()
        return try OriginalContentLoader.load(
            fruitsData: Data(contentsOf: root.appendingPathComponent("Content/fruitList.json")),
            wavesData: Data(contentsOf: root.appendingPathComponent("Content/originalWaveList.json")),
            challengeWavesData: Data(contentsOf: root.appendingPathComponent("Content/ch1challengeWaveList.json")),
            bonusAwardsData: Data(contentsOf: root.appendingPathComponent("Content/bonusAwards.json")),
            originalModeData: Data(contentsOf: root.appendingPathComponent("Content/originalModeInfo.json")),
            challengeCatalogData: Data(contentsOf: root.appendingPathComponent("Content/ch1challengeList.json")),
            challengeConditionsData: Data(contentsOf: root.appendingPathComponent("Content/challengeConditions.json")))
    }

    private func firstID(in store: GenerationOrderStore) -> EntityID? {
        var found: EntityID?
        store.forEach { entity in
            found = entity.id
            return false
        }
        return found
    }

    private func pushOutOfBounds(_ store: GenerationOrderStore) {
        store.forEach { entity in
            let margin = entity.transform.scale * 0.01 * 50
            entity.transform.position = SIMD3<Float>(0, -160 - margin - 1, 0)
            entity.transform.velocity = SIMD3<Float>(0, -10, 0)
            entity.transform.acceleration = SIMD3<Float>(0, -12, 0)
            return true
        }
    }

    private func runnableState() -> GameState {
        var state = GameState()
        state.levelTier = Constants.Simulation.lowLevelEffectCutoff
        state.sliceRadiusSquared = 225.0
        state.slashPosition = SIMD3<Float>(1, 1, 0)
        return state
    }

    private func makeServices() -> GameServices {
        GameServices(slice: StubSlice(), combo: StubCombo(), score: StubScore(),
                     stats: StubStats(), waves: StubWaves(), audio: StubAudio(),
                     effects: StubEffects(), rng: DeterministicTestRandom(seed: 0xC0FFEE))
    }
}

private final class SequenceTestRandom: RandomSource {
    private let values: [Float]
    private var index = 0
    private(set) var calls = 0

    init(_ values: [Float]) { self.values = values }

    func nextFloat() -> Float {
        precondition(index < values.count, "测试随机序列被过度消费")
        defer { index += 1; calls += 1 }
        return values[index]
    }

    func nextInt(_ upperBound: Int32) -> Int32 {
        guard upperBound > 0 else { return 0 }
        return Int32(nextFloat() * Float(upperBound))
    }

    func snapshot() -> UInt64 { UInt64(index) }
    func restore(_ s: UInt64) { index = Int(s) }
}

private final class DeterministicTestRandom: RandomSource {
    private var state: UInt64
    init(seed: UInt64) { self.state = seed == 0 ? 0x9E37_79B9_7F4A_7C15 : seed }
    func nextFloat() -> Float { Float(next() >> 40) * (1.0 / 16_777_216.0) }
    func nextInt(_ upperBound: Int32) -> Int32 {
        guard upperBound > 0 else { return 0 }
        return Int32((next() >> 33) % UInt64(upperBound))
    }
    func snapshot() -> UInt64 { state }
    func restore(_ s: UInt64) { state = s == 0 ? 0x9E37_79B9_7F4A_7C15 : s }
    private func next() -> UInt64 {
        state &+= 0x9E37_79B9_7F4A_7C15
        var z = state
        z = (z ^ (z >> 30)) &* 0xBF58_476D_1CE4_E5B9
        z = (z ^ (z >> 27)) &* 0x94D0_49BB_1331_11EB
        return z ^ (z >> 31)
    }
}

private final class StubSlice: SliceTesting {
    func isSliced(game: GameState, entity: Entity) -> Bool { false }
    func isNearMiss(game: GameState, entity: Entity) -> Bool { false }
}
private final class StubCombo: ComboTracking {
    func registerSlice(fruitType: Int32, entity: EntityID, stateSlot0: Int32,
                       state: inout GameState, rng: any RandomSource) -> ComboEvent? { nil }
    func tickWindow(dt: Float, state: inout GameState) -> [ComboEvent] { [] }
    func reset(state: inout GameState) {}
}
private final class StubScore: ScoreDispatching {
    private(set) var total: Int32 = 0
    @discardableResult
    func dispatch(score: Int32, comboType: Int32, isScoring: Bool, mode: Int32) -> Int32 {
        total &+= score
        return total
    }
    func reset() { total = 0 }
}
private final class StubStats: StatsRecording {
    func add(_ key: StatsKey, _ value: Int32) {}
    func report(_ dynamicKey: String, _ value: Int32) {}
    func value(forDynamicKey key: String) -> Int32 { 0 }
    func recordCombo(count: Int32, fruitTypes: [Int32], modePrefix: String?) {}
}
private final class StubWaves: WaveDirecting {
    func tick(dt: Float, state: inout GameState, world: any EntityStore) {}
}
private final class StubAudio: AudioPlaying { func play(_ key: String) {} }
private final class StubEffects: EffectEmitting {
    func emit(_ kind: Int32, at position: SIMD3<Float>) {}
}
