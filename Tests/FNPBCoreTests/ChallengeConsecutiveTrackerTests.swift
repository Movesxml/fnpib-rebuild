import XCTest
@testable import FNPBCore

final class ChallengeConsecutiveTrackerTests: XCTestCase {
    func testSamePlayerIncrementsAndPlayerSwitchRestartsSingleSlot() {
        var tracker = ChallengeConsecutiveTracker()
        XCTAssertEqual(tracker.recordSlice(playerIndex: 0), 1)
        XCTAssertEqual(tracker.recordSlice(playerIndex: 0), 2)
        XCTAssertEqual(tracker.recordSlice(playerIndex: 1), 1)
        XCTAssertEqual(tracker.lastPlayerIndex, 1)
        XCTAssertEqual(tracker.recordSlice(playerIndex: 1), 2)
        XCTAssertEqual(tracker.recordSlice(playerIndex: 0), 1,
                       "原版只有一个槽位，切回先前玩家也从 1 开始")
    }

    func testResetRestoresOriginalZeroState() {
        var tracker = ChallengeConsecutiveTracker()
        tracker.recordSlice(playerIndex: 7)
        tracker.recordSlice(playerIndex: 7)
        tracker.reset()
        XCTAssertEqual(tracker.lastPlayerIndex, 0)
        XCTAssertEqual(tracker.count, 0)
        XCTAssertEqual(tracker.recordSlice(), 1)
    }

    func testOnSlicedReportsAfterScoreAndBeforeFruitStatistics() {
        let score = ScoreSystem()
        let stats = StatsRecorder()
        let rng = OriginalLCGRandom(seed: 1)
        let services = GameServices(
            slice: SliceTester(), combo: ComboTracker(stats: stats), score: score,
            stats: stats, waves: WaveDirector(rng: rng), audio: ConsecutiveAudio(),
            effects: ConsecutiveEffects(), rng: rng)
        var entity = Entity(id: EntityID(rawValue: 1), kind: .fruit)
        var fruit = FruitInfo()
        fruit.name = "apple"
        fruit.score = 7
        entity.fruit = fruit
        var state = GameState()
        var tracker = ChallengeConsecutiveTracker()
        var observed: (count: Int32, score: Int32, fruitStat: Int32)?

        FruitOnSliced().apply(
            entity: &entity, state: &state, services: services,
            consecutive: &tracker) { count, type in
                XCTAssertEqual(type, "apple")
                observed = (count, score.total, stats.value(forDynamicKey: "apple"))
            }

        XCTAssertEqual(observed?.count, 1)
        XCTAssertEqual(observed?.score, 7)
        XCTAssertEqual(observed?.fruitStat, 0)
        XCTAssertEqual(stats.value(forDynamicKey: "apple"), 1)
    }

    func testNoScoreLeavesExistingCountAndChallengeUntouched() {
        let score = ScoreSystem()
        let stats = StatsRecorder()
        let rng = OriginalLCGRandom(seed: 1)
        let services = GameServices(
            slice: SliceTester(), combo: ComboTracker(stats: stats), score: score,
            stats: stats, waves: WaveDirector(rng: rng), audio: ConsecutiveAudio(),
            effects: ConsecutiveEffects(), rng: rng)
        var entity = Entity(id: EntityID(rawValue: 1), kind: .fruit)
        var fruit = FruitInfo()
        fruit.noScore = true
        entity.fruit = fruit
        var state = GameState()
        var tracker = ChallengeConsecutiveTracker()
        tracker.recordSlice()
        var events = 0

        FruitOnSliced().apply(
            entity: &entity, state: &state, services: services,
            consecutive: &tracker) { _, _ in events += 1 }

        XCTAssertEqual(tracker.count, 1)
        XCTAssertEqual(events, 0)
        XCTAssertEqual(score.total, 0)
        XCTAssertEqual(stats.value(for: .totalfruit), 0)
    }
}

private final class ConsecutiveAudio: AudioPlaying {
    func play(_ key: String) {}
}

private final class ConsecutiveEffects: EffectEmitting {
    func emit(_ kind: Int32, at position: SIMD3<Float>) {}
}
