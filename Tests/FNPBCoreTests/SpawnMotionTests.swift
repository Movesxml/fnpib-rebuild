import XCTest
import simd
@testable import FNPBCore

/// T-025：生成 → 抛物线运动 → 出界回收；漏切计数与原 +0x3c 分离。
final class SpawnMotionTests: XCTestCase {
    func testSpawnFruitCreatesEntityWithLaunchSpeedInRange() throws {
        let store = GenerationOrderStore()
        let tuning = FruitMotionTuning()
        let bridge = WaveSpawnBridge(store: store,
                                     rng: DeterministicTestRandom(seed: 0x5EED_1234),
                                     tuning: tuning)
        bridge.spawnFruit(kind: Constants.EntityKindValue.fruit,
                          from: Spawner(), wave: WaveInfo())

        XCTAssertEqual(store.aliveCount, 1)
        let id = try XCTUnwrap(firstID(in: store))
        let entity = try XCTUnwrap(store.entity(id))
        XCTAssertEqual(entity.kind, .fruit)
        XCTAssertEqual(entity.fruit?.typeID, Constants.EntityKindValue.fruit)
        XCTAssertEqual(entity.transform.position.y, tuning.offscreenBottomMargin, accuracy: 1e-5)
        XCTAssertEqual(entity.transform.velocity.z, 0, accuracy: 1e-6)
        let speed = simd_length(SIMD2<Float>(entity.transform.velocity.x,
                                             entity.transform.velocity.y))
        XCTAssertGreaterThanOrEqual(speed, tuning.minLaunchSpeed - 1e-4)
        XCTAssertLessThanOrEqual(speed, tuning.maxLaunchSpeed + 1e-4)
    }

    func testTriggerExplosionSpawnsBombPlaceholder() throws {
        let store = GenerationOrderStore()
        let bridge = WaveSpawnBridge(store: store,
                                     rng: DeterministicTestRandom(seed: 0xB0B1),
                                     tuning: FruitMotionTuning())
        bridge.triggerExplosion(from: Spawner(), wave: WaveInfo())
        XCTAssertEqual(store.aliveCount, 1)
        let id = try XCTUnwrap(firstID(in: store))
        XCTAssertEqual(store.entity(id)?.kind, .bomb)
    }

    func testIntegrateFollowsParabolicMotion() throws {
        let store = GenerationOrderStore()
        let tuning = FruitMotionTuning()
        let bridge = WaveSpawnBridge(store: store,
                                     rng: DeterministicTestRandom(seed: 0x5EED_5678),
                                     tuning: tuning)
        bridge.spawnFruit(kind: Constants.EntityKindValue.fruit,
                          from: Spawner(), wave: WaveInfo())
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
        let bridge = WaveSpawnBridge(store: store,
                                     rng: DeterministicTestRandom(seed: 0x0FF1),
                                     tuning: tuning)
        bridge.spawnFruit(kind: Constants.EntityKindValue.fruit,
                          from: Spawner(), wave: WaveInfo())
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

    func testMissedFruitUsesIndependentCountAndPreservesOriginalOffsetCounter() {
        let store = GenerationOrderStore()
        let tuning = FruitMotionTuning()
        let bridge = WaveSpawnBridge(store: store,
                                     rng: DeterministicTestRandom(seed: 0x0FF2),
                                     tuning: tuning)
        for _ in 0..<3 {
            bridge.spawnFruit(kind: Constants.EntityKindValue.fruit,
                              from: Spawner(), wave: WaveInfo())
        }
        pushOutOfBounds(store, tuning: tuning)
        var world: any EntityStore = store
        var state = runnableState()
        state.missPenaltyCount = 2 // 模拟原切中分支已有写入，不能被漏切逻辑复用。
        GameWorld(motionTuning: tuning).tick(dt: 1.0 / 60.0,
                                             state: &state,
                                             world: &world,
                                             services: makeServices())
        XCTAssertEqual(state.missedFruitCount, 3)
        XCTAssertEqual(state.missPenaltyCount, 2)
        XCTAssertEqual(store.aliveCount, 0)
    }

    func testBombOutOfBoundsDoesNotIncrementMissCount() {
        let store = GenerationOrderStore()
        let tuning = FruitMotionTuning()
        let bridge = WaveSpawnBridge(store: store,
                                     rng: DeterministicTestRandom(seed: 0x0FF3),
                                     tuning: tuning)
        bridge.triggerExplosion(from: Spawner(), wave: WaveInfo())
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
        state.hitPoint = SIMD3<Float>(1, 1, 0)
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
    func registerSlice(fruitType: Int32, entity: EntityID,
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
}
private final class StubWaves: WaveDirecting {
    func tick(dt: Float, state: inout GameState, world: any EntityStore) {}
}
private final class StubAudio: AudioPlaying { func play(_ key: String) {} }
private final class StubEffects: EffectEmitting {
    func emit(_ kind: Int32, at position: SIMD3<Float>) {}
}
