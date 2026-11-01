import XCTest
import simd
@testable import FNPBCore

/// 生成桥必须使用真实 Content；运动与出界参数仍按 T-025 标注为 [待验证]。
final class SpawnMotionTests: XCTestCase {
    private static let appleTypeID: Int32 = 0
    private static let watermelonTypeID: Int32 = 3

    func testSpawnFruitCreatesEntityWithLaunchSpeedInRange() throws {
        let store = GenerationOrderStore()
        let tuning = FruitMotionTuning()
        let bridge = try makeBridge(store: store, seed: 0x5EED_1234, tuning: tuning)
        bridge.spawnFruit(kind: Self.appleTypeID, from: Spawner(), wave: WaveInfo())

        XCTAssertEqual(store.aliveCount, 1)
        let id = try XCTUnwrap(firstID(in: store))
        let entity = try XCTUnwrap(store.entity(id))
        XCTAssertEqual(entity.kind, .fruit)
        XCTAssertEqual(entity.fruit?.typeID, Self.appleTypeID)
        XCTAssertEqual(entity.transform.position.y, tuning.offscreenBottomMargin, accuracy: 1e-5)
        XCTAssertEqual(entity.transform.velocity.z, 0, accuracy: 1e-6)
        let speed = simd_length(SIMD2<Float>(entity.transform.velocity.x,
                                             entity.transform.velocity.y))
        XCTAssertGreaterThanOrEqual(speed, tuning.minLaunchSpeed - 1e-4)
        XCTAssertLessThanOrEqual(speed, tuning.maxLaunchSpeed + 1e-4)
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
        XCTAssertEqual(fruit.score, 0)
        XCTAssertTrue(fruit.noScore)
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
        XCTAssertEqual(entity.fruit?.score, 0)
        XCTAssertEqual(entity.transform.scale, 75, accuracy: 1e-6)
        XCTAssertEqual(entity.transform.radius, 5, accuracy: 1e-6)
    }

    func testSpawnUnknownTypeIDDoesNotCreateEntity() throws {
        let store = GenerationOrderStore()
        let bridge = try makeBridge(store: store, seed: 0xBAD)
        bridge.spawnFruit(kind: 99, from: Spawner(), wave: WaveInfo())
        bridge.spawnFruit(kind: -1, from: Spawner(), wave: WaveInfo())
        // EntityKindValue.bomb == 2 是实体类别，不是非法水果 ID；真实 typeID 2 必须可生成。
        XCTAssertEqual(store.aliveCount, 0)
    }

    func testSpawnBombUsesLoadedBombInfo() throws {
        let store = GenerationOrderStore()
        let bridge = try makeBridge(store: store, seed: 0xB0B1)
        bridge.spawnBomb(from: Spawner(), wave: WaveInfo())

        XCTAssertEqual(store.aliveCount, 1)
        let id = try XCTUnwrap(firstID(in: store))
        let entity = try XCTUnwrap(store.entity(id))
        XCTAssertEqual(entity.kind, .bomb)
        XCTAssertEqual(entity.transform.scale, 55, accuracy: 1e-6)
        XCTAssertEqual(entity.transform.radius, 35, accuracy: 1e-6)
        let bomb = try XCTUnwrap(entity.fruit?.bomb)
        XCTAssertEqual(bomb.size, 55, accuracy: 1e-6)
        XCTAssertEqual(bomb.collision, 35, accuracy: 1e-6)
    }

    func testSpawnBeyondTwentyFourIsNotTruncated() throws {
        let store = GenerationOrderStore()
        let bridge = try makeBridge(store: store, seed: 0x24_24)
        for _ in 0..<30 {
            bridge.spawnFruit(kind: Self.appleTypeID, from: Spawner(), wave: WaveInfo())
        }
        XCTAssertEqual(store.aliveCount, 30)
    }

    func testIntegrateFollowsParabolicMotion() throws {
        let store = GenerationOrderStore()
        let tuning = FruitMotionTuning()
        let bridge = try makeBridge(store: store, seed: 0x5EED_5678, tuning: tuning)
        bridge.spawnFruit(kind: Self.appleTypeID, from: Spawner(), wave: WaveInfo())
        let id = try XCTUnwrap(firstID(in: store))
        var entity = try XCTUnwrap(store.entity(id))
        let p0 = entity.transform.position
        let v0 = entity.transform.velocity
        let dt: Float = 1.0 / 60.0

        XCTAssertTrue(FruitMotion.integrate(&entity, dt: dt, tuning: tuning))
        let v1 = entity.transform.velocity
        XCTAssertEqual(v1.y, v0.y + tuning.gravity * dt, accuracy: 1e-4)
        XCTAssertEqual(entity.transform.position.y, p0.y + v1.y * dt, accuracy: 1e-4)
        XCTAssertEqual(entity.transform.position.x, p0.x + v1.x * dt, accuracy: 1e-4)
        let p1 = entity.transform.position
        XCTAssertTrue(FruitMotion.integrate(&entity, dt: dt, tuning: tuning))
        XCTAssertGreaterThan(entity.transform.position.y, p1.y)
    }

    func testOutOfBoundsFruitIsDespawnedByTick() throws {
        let store = GenerationOrderStore()
        let tuning = FruitMotionTuning()
        let bridge = try makeBridge(store: store, seed: 0x0FF1, tuning: tuning)
        bridge.spawnFruit(kind: Self.appleTypeID, from: Spawner(), wave: WaveInfo())
        let id = try XCTUnwrap(firstID(in: store))
        pushOutOfBounds(store, tuning: tuning)

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
        pushOutOfBounds(store, tuning: tuning)
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
        pushOutOfBounds(store, tuning: tuning)
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
        let content = try loadRealContent()
        return WaveSpawnBridge(store: store,
                               rng: DeterministicTestRandom(seed: seed),
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
            wavesData: Data(contentsOf: root.appendingPathComponent("Content/originalWaveList.json")))
    }

    private func firstID(in store: GenerationOrderStore) -> EntityID? {
        var found: EntityID?
        store.forEach { entity in
            found = entity.id
            return false
        }
        return found
    }

    private func pushOutOfBounds(_ store: GenerationOrderStore, tuning: FruitMotionTuning) {
        store.forEach { entity in
            entity.transform.position = SIMD3<Float>(0, tuning.offscreenBottomMargin - 1, 0)
            entity.transform.velocity = SIMD3<Float>(0, -10, 0)
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
    func recordCombo(count: Int32, fruitTypes: [Int32], modePrefix: String?) {}
}
private final class StubWaves: WaveDirecting {
    func tick(dt: Float, state: inout GameState, world: any EntityStore) {}
}
private final class StubAudio: AudioPlaying { func play(_ key: String) {} }
private final class StubEffects: EffectEmitting {
    func emit(_ kind: Int32, at position: SIMD3<Float>) {}
}
