import XCTest
@testable import FNPBCore

final class CriticalOnSlicedTests: XCTestCase {
    func testLowScoreRejectsInjectedCriticalWithoutDrawingRandom() {
        let rig = Rig(initialChance: 4)
        var entity = rig.entity
        var state = GameState()
        rig.onSliced.apply(entity: &entity, state: &state, services: rig.services)

        XCTAssertFalse(entity.isCriticalHit)
        XCTAssertEqual(rig.score.total, 1)
        XCTAssertTrue(rig.rng.bounds.isEmpty)
    }

    func testModeNoCriticalBeanAndExplosionGatesClearCritical() {
        let cases: [(name: String, classic: Bool, noCritical: Bool, explosion: Float)] = [
            ("orange", false, false, 0),
            ("orange", true, true, 0),
            ("bean", true, false, 0),
            ("orange", true, false, 0.01),
        ]
        for test in cases {
            let rig = Rig(initialChance: 1, classic: test.classic)
            rig.score.dispatch(score: 2, comboType: 0, isScoring: true, mode: 0)
            var fruit = FruitInfo()
            fruit.name = test.name
            fruit.noCritical = test.noCritical
            fruit.score = 3
            var entity = Entity(id: EntityID(rawValue: 1), kind: .fruit)
            entity.fruit = fruit
            entity.isCriticalHit = true
            var state = GameState()

            rig.onSliced.apply(entity: &entity, state: &state, services: rig.services,
                               explosionTimeRemaining: test.explosion)
            XCTAssertFalse(entity.isCriticalHit, "资格门控失败：\(test)")
            XCTAssertEqual(rig.score.total, 5)
            XCTAssertEqual(rig.stats.value(forDynamicKey: "crit"), 0)
        }
    }

    func testNoScoreSkipsCriticalScoreAndFruitStats() {
        let rig = Rig(initialChance: 1)
        rig.score.dispatch(score: 2, comboType: 0, isScoring: true, mode: 0)
        var entity = rig.entity
        entity.fruit?.noScore = true
        entity.fruit?.score = 0
        entity.isCriticalHit = true
        var state = GameState()

        rig.onSliced.apply(entity: &entity, state: &state, services: rig.services)
        XCTAssertFalse(entity.isCriticalHit)
        XCTAssertEqual(rig.score.total, 2)
        XCTAssertEqual(rig.stats.value(for: .totalfruit), 0)
        XCTAssertTrue(rig.rng.bounds.isEmpty)
    }

    func testDenominatorDecrementsFirstClampsAndResetsOnlyAfterCritical() {
        let rng = ScriptedCriticalRandom(intValues: [1, 0, 1])
        let waves = CriticalWaveStub(chance: 1)
        let score = ScoreSystem()
        score.dispatch(score: 2, comboType: 0, isScoring: true, mode: 0)
        let stats = StatsRecorder()
        let services = Self.services(score: score, stats: stats, waves: waves, rng: rng)
        let onSliced = Self.onSliced(initialChance: 4, chance: 50, chanceInc: 30)
        var state = GameState()
        var results: [Bool] = []

        for rawID in Int32(1)...3 {
            var entity = Self.entity(id: rawID)
            onSliced.apply(entity: &entity, state: &state, services: services)
            results.append(entity.isCriticalHit)
        }

        XCTAssertEqual(results, [false, true, false])
        XCTAssertEqual(rng.bounds, [3, 2, 79], "第二次命中重置为 50+30，第三次先递减到 79")
    }

    func testZeroWaveChanceDoesNotConsumeCriticalRandom() {
        let rng = ScriptedCriticalRandom(intValues: [1])
        let waves = CriticalWaveStub(chance: 0)
        let score = ScoreSystem()
        score.dispatch(score: 2, comboType: 0, isScoring: true, mode: 0)
        let stats = StatsRecorder()
        let services = Self.services(score: score, stats: stats, waves: waves, rng: rng)
        let onSliced = Self.onSliced(initialChance: 4)
        var state = GameState()

        var first = Self.entity(id: 1)
        onSliced.apply(entity: &first, state: &state, services: services)
        XCTAssertFalse(first.isCriticalHit)
        XCTAssertTrue(rng.bounds.isEmpty)

        waves.chance = 1
        var second = Self.entity(id: 2)
        onSliced.apply(entity: &second, state: &state, services: services)
        XCTAssertEqual(rng.bounds, [3], "零概率那次仍递减分母，但不抽随机")
    }

    func testFractionalRandomBoundTruncatesTowardZero() {
        let rng = ScriptedCriticalRandom(intValues: [1])
        let waves = CriticalWaveStub(chance: 3)
        let score = ScoreSystem()
        score.dispatch(score: 2, comboType: 0, isScoring: true, mode: 0)
        let stats = StatsRecorder()
        let services = Self.services(score: score, stats: stats, waves: waves, rng: rng)
        let onSliced = Self.onSliced(initialChance: 50, chance: 10)
        var entity = Self.entity(id: 1)
        var state = GameState()

        onSliced.apply(entity: &entity, state: &state, services: services)
        XCTAssertEqual(rng.bounds, [3], "trunc(min(49,10)/3) == 3")
        XCTAssertFalse(entity.isCriticalHit)
    }

    func testResetRestoresSavedInitialDenominator() {
        let rng = ScriptedCriticalRandom(intValues: [1, 1])
        let waves = CriticalWaveStub(chance: 1)
        let score = ScoreSystem()
        score.dispatch(score: 2, comboType: 0, isScoring: true, mode: 0)
        let stats = StatsRecorder()
        let services = Self.services(score: score, stats: stats, waves: waves, rng: rng)
        let onSliced = Self.onSliced(initialChance: 3)
        var state = GameState()

        var first = Self.entity(id: 1)
        onSliced.apply(entity: &first, state: &state, services: services)
        onSliced.reset(isClassicMode: true, initialChance: 10)
        var second = Self.entity(id: 2)
        onSliced.apply(entity: &second, state: &state, services: services)
        XCTAssertEqual(rng.bounds, [2, 9])
    }

    func testWaveDirectorPublishesSelectedWaveCriticalChance() {
        let director = WaveDirector(rng: SeededRandomSource(seed: 1))
        XCTAssertEqual(director.criticalChanceForSlice, 1)
        var wave = WaveInfo()
        wave.criticalChance = 2.5
        director.beginGame(waves: [wave])
        XCTAssertEqual(director.criticalChanceForSlice, 2.5)
    }
}

private final class CriticalWaveStub: WaveDirecting, CriticalChanceProviding {
    var chance: Float
    init(chance: Float) { self.chance = chance }
    var criticalChanceForSlice: Float { chance }
    func tick(dt: Float, state: inout GameState, world: any EntityStore) {}
}

private final class ScriptedCriticalRandom: RandomSource {
    private var values: [Int32]
    private var cursor = 0
    private(set) var bounds: [Int32] = []

    init(intValues: [Int32]) { values = intValues }
    func nextFloat() -> Float { 0 }
    func nextInt(_ upperBound: Int32) -> Int32 {
        bounds.append(upperBound)
        defer { cursor += 1 }
        return values[cursor % values.count]
    }
    func snapshot() -> UInt64 { UInt64(cursor) }
    func restore(_ s: UInt64) { cursor = Int(s) }
}

private final class CriticalSliceStub: SliceTesting {
    func isSliced(game: GameState, entity: Entity) -> Bool { false }
    func isNearMiss(game: GameState, entity: Entity) -> Bool { false }
}
private final class CriticalAudioStub: AudioPlaying { func play(_ key: String) {} }
private final class CriticalEffectStub: EffectEmitting {
    func emit(_ kind: Int32, at position: SIMD3<Float>) {}
}

private struct Rig {
    let score = ScoreSystem()
    let stats = StatsRecorder()
    let rng = ScriptedCriticalRandom(intValues: [0])
    let waves = CriticalWaveStub(chance: 1)
    let onSliced: FruitOnSliced
    let services: GameServices
    let entity = CriticalOnSlicedTests.entity(id: 1)

    init(initialChance: Int32, classic: Bool = true) {
        onSliced = CriticalOnSlicedTests.onSliced(initialChance: initialChance,
                                                 classic: classic)
        services = CriticalOnSlicedTests.services(score: score, stats: stats,
                                                  waves: waves, rng: rng)
    }
}

private extension CriticalOnSlicedTests {
    static func entity(id: Int32) -> Entity {
        var fruit = FruitInfo()
        fruit.name = "orange"
        fruit.noCritical = false
        fruit.score = 1
        var entity = Entity(id: EntityID(rawValue: UInt32(id)), kind: .fruit)
        entity.fruit = fruit
        return entity
    }

    static func onSliced(initialChance: Int32, chance: Int32 = 50,
                         chanceInc: Int32 = 30, classic: Bool = true) -> FruitOnSliced {
        var critical = CriticalConfig()
        critical.score = 10
        critical.chance = chance
        critical.chanceInc = chanceInc
        let result = FruitOnSliced(critical: critical, fruitTypeCount: 24)
        result.reset(isClassicMode: classic, initialChance: initialChance)
        return result
    }

    static func services(score: ScoreSystem, stats: StatsRecorder,
                         waves: CriticalWaveStub, rng: ScriptedCriticalRandom) -> GameServices {
        GameServices(slice: CriticalSliceStub(), combo: ComboTracker(stats: stats),
                     score: score, stats: stats, waves: waves,
                     audio: CriticalAudioStub(), effects: CriticalEffectStub(), rng: rng)
    }
}
