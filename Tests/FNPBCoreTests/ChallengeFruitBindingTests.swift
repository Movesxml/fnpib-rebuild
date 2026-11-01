import XCTest
@testable import FNPBCore

/// challengeFruit 在条件激活时绑定本回合真实水果，原始 definition 保持不变。
final class ChallengeFruitBindingTests: XCTestCase {
    private func statsDefinition(name: String = "useChallengeFruit",
                                 total: Int32 = 1) -> ChallengeConditionDefinition {
        ChallengeConditionDefinition(name: name, kind: .stats, total: total,
                                     specificType: "challengeFruit")
    }

    private func challenge(name: String = "fruitRound",
                           timeLimit: Float = 0) -> ChallengeDefinition {
        ChallengeDefinition(name: name, timeLimit: timeLimit,
                            conditionNames: ["useChallengeFruit"])
    }

    func testStatsPlaceholderReadsSelectedFruitInsteadOfPlaceholderCounter() {
        var runtime = ChallengeModeRuntime(
            tier: ChallengeTierDefinition(), challenge: challenge(),
            conditionDefinitions: [statsDefinition(total: 3)], selectedFruitName: "Apple")

        runtime.evaluateImmediate(context: ChallengeEvaluationContext(
            stats: ["apple": 3, "challengefruit": 0]))

        XCTAssertEqual(runtime.selectedFruitName, "Apple")
        XCTAssertEqual(runtime.conditions.condition(named: "useChallengeFruit")?.current,
                       .pass)
    }

    func testStatsPlaceholderWithoutSelectionDoesNotReadPlaceholderCounter() {
        var runtime = ChallengeModeRuntime(
            tier: ChallengeTierDefinition(), challenge: challenge(),
            conditionDefinitions: [statsDefinition()])
        runtime.evaluateImmediate(context: ChallengeEvaluationContext(
            stats: ["challengefruit": 99]))
        XCTAssertNil(runtime.selectedFruitName)
        XCTAssertEqual(runtime.conditions.condition(named: "useChallengeFruit")?.current,
                       .pending)
    }

    func testStatsPlaceholderUsesRealStatsRecorderKeys() {
        let stats = StatsRecorder()
        stats.report("Apple", 3)
        var condition = ChallengeCondition(statsDefinition(total: 3))
        condition.activate(selectedFruitName: "Apple")
        XCTAssertTrue(condition.updateResult(
            context: ChallengeEvaluationContext(score: 0, stats: stats)))
        XCTAssertEqual(stats.challengeValues()["apple"], 3)
        XCTAssertNil(stats.challengeValues()["challengefruit"])
    }

    func testStatsCompareResolvesOnlyLeftPlaceholder() {
        let left = ChallengeConditionDefinition(
            name: "compareLeft", kind: .statsCompare,
            specificType: "challengeFruit", specificType2: "totalfruit",
            comparison: .greater)
        var condition = ChallengeCondition(left)
        condition.activate(selectedFruitName: "Apple")
        XCTAssertTrue(condition.updateResult(context: ChallengeEvaluationContext(
            stats: ["apple": 3, "totalfruit": 2])))
        XCTAssertEqual(condition.current, .pass)
        XCTAssertTrue(condition.updateResult(context: ChallengeEvaluationContext(
            stats: ["apple": 1, "totalfruit": 2])))
        XCTAssertEqual(condition.current, .pending)

        // specificType2 的替换没有直接 Mach-O 证据，必须保留原键。
        let right = ChallengeConditionDefinition(
            name: "compareRight", kind: .statsCompare,
            specificType: "totalfruit", specificType2: "challengeFruit",
            comparison: .greater)
        condition = ChallengeCondition(right)
        condition.activate(selectedFruitName: "Apple")
        XCTAssertTrue(condition.updateResult(context: ChallengeEvaluationContext(
            stats: ["totalfruit": 3, "apple": 2, "challengefruit": 2])))
        XCTAssertEqual(condition.current, .pass)
        XCTAssertTrue(condition.updateResult(context: ChallengeEvaluationContext(
            stats: ["totalfruit": 1, "apple": 2, "challengefruit": 2])))
        XCTAssertEqual(condition.current, .pending)
    }

    func testConsecutivePlaceholderMatchesOnlySelectedFruit() {
        var condition = ChallengeCondition(ChallengeConditionDefinition(
            name: "chain", kind: .consecutive, total: 3,
            specificType: "challengeFruit"))
        condition.activate(selectedFruitName: "Apple")
        XCTAssertFalse(condition.recordConsecutive(count: 3, specificType: "banana"))
        XCTAssertEqual(condition.current, .pending)
        XCTAssertTrue(condition.recordConsecutive(count: 3, specificType: "APPLE"))
        XCTAssertEqual(condition.current, .pass)
    }

    func testConsecutivePlaceholderWithoutSelectionIsWildcard() {
        var condition = ChallengeCondition(ChallengeConditionDefinition(
            name: "chain", kind: .consecutive, total: 3,
            specificType: "challengeFruit"))
        condition.activate(selectedFruitName: nil)
        XCTAssertTrue(condition.recordConsecutive(count: 3, specificType: "banana"))
        XCTAssertEqual(condition.current, .pass)
    }

    func testNonPlaceholderConditionsIgnoreSelectedFruit() {
        var stats = ChallengeCondition(ChallengeConditionDefinition(
            name: "bananas", kind: .stats, total: 2, specificType: "banana"))
        stats.activate(selectedFruitName: "Apple")
        XCTAssertTrue(stats.updateResult(context: ChallengeEvaluationContext(
            stats: ["banana": 2, "apple": 0])))
        XCTAssertEqual(stats.current, .pass)

        var consecutive = ChallengeCondition(ChallengeConditionDefinition(
            name: "bananaChain", kind: .consecutive, total: 3, specificType: "banana"))
        consecutive.activate(selectedFruitName: "Apple")
        XCTAssertFalse(consecutive.recordConsecutive(count: 3, specificType: "apple"))
        XCTAssertTrue(consecutive.recordConsecutive(count: 3, specificType: "banana"))
    }

    func testRoundTransitionRebindsToNewFruit() {
        let definition = statsDefinition()
        let round = challenge(timeLimit: 1)
        var runtime = ChallengeModeRuntime(
            tier: ChallengeTierDefinition(), challenge: round,
            conditionDefinitions: [definition], selectedFruitName: "apple")
        let apple = ChallengeEvaluationContext(stats: ["apple": 1])
        let banana = ChallengeEvaluationContext(stats: ["banana": 1])

        runtime.evaluateImmediate(context: apple)
        XCTAssertEqual(runtime.conditions.condition(named: "useChallengeFruit")?.current,
                       .pass)
        runtime.update(dt: 1, frame: ChallengeFrame(evaluation: apple))
        XCTAssertEqual(runtime.phase, .settling)
        runtime.updateSettlement(controllerState: 7, substate: 2,
                                 nextChallenge: round, nextSelectedFruitName: "banana")

        XCTAssertEqual(runtime.phase, .running)
        XCTAssertEqual(runtime.selectedFruitName, "banana")
        runtime.evaluateImmediate(context: apple)
        XCTAssertEqual(runtime.conditions.condition(named: "useChallengeFruit")?.current,
                       .pending)
        runtime.evaluateImmediate(context: banana)
        XCTAssertEqual(runtime.conditions.condition(named: "useChallengeFruit")?.current,
                       .pass)
    }

    func testRepeatedActivationDoesNotMutateOriginalDefinition() {
        let definition = statsDefinition()
        var runtime = ChallengeConditionsRuntime(definitions: [definition])
        runtime.select(conditionNames: ["useChallengeFruit"], selectedFruitName: "apple")
        XCTAssertEqual(runtime.condition(named: "useChallengeFruit")?.definition.specificType,
                       "challengeFruit")
        runtime.select(conditionNames: ["useChallengeFruit"], selectedFruitName: "banana")
        XCTAssertEqual(runtime.condition(named: "useChallengeFruit")?.definition.specificType,
                       "challengeFruit")
        var condition = try! XCTUnwrap(runtime.condition(named: "useChallengeFruit"))
        XCTAssertTrue(condition.updateResult(
            context: ChallengeEvaluationContext(stats: ["banana": 1])))
    }

    func testGameWorldPublishesSelectedFruitStatsAndConsecutiveEvents() {
        let score = ScoreSystem()
        let stats = StatsRecorder()
        let rng = OriginalLCGRandom(seed: 1)
        let services = GameServices(
            slice: BindingAlwaysSlice(), combo: ComboTracker(stats: stats), score: score,
            stats: stats, waves: WaveDirector(rng: rng), audio: BindingAudio(),
            effects: BindingEffects(), rng: rng)
        let definition = statsDefinition()
        let consecutive = ChallengeConditionDefinition(
            name: "chain", kind: .consecutive, total: 1,
            specificType: "challengeFruit")
        let round = ChallengeDefinition(name: "world", timeLimit: 10,
                                        conditionNames: ["useChallengeFruit", "chain"])
        let game = GameWorld()
        game.configureChallenge(ChallengeModeRuntime(
            tier: ChallengeTierDefinition(), challenge: round,
            conditionDefinitions: [definition, consecutive], selectedFruitName: "apple"))
        var state = GameState()
        state.levelTier = Constants.Simulation.lowLevelEffectCutoff
        var entities: any EntityStore = GenerationOrderStore()

        var apple = FruitInfo()
        apple.name = "apple"
        apple.typeID = 1
        var prototype = EntityPrototype(kind: .fruit)
        prototype.fruit = apple
        prototype.transform.acceleration = .zero
        _ = entities.spawn(prototype)
        game.tick(dt: 1.0 / 60.0, state: &state, world: &entities, services: services)

        XCTAssertEqual(stats.value(forDynamicKey: "apple"), 1)
        XCTAssertEqual(game.challenge?.conditions.condition(named: "useChallengeFruit")?.current,
                       .pass)
        XCTAssertEqual(game.challenge?.conditions.condition(named: "chain")?.current,
                       .pass)

        var banana = FruitInfo()
        banana.name = "banana"
        banana.typeID = 2
        prototype.fruit = banana
        _ = entities.spawn(prototype)
        game.tick(dt: 1.0 / 60.0, state: &state, world: &entities, services: services)
        XCTAssertEqual(game.challenge?.conditions.condition(named: "chain")?.current,
                       .pass, "已达成的即时条件不会被其他水果撤销")
    }
}

private final class BindingAlwaysSlice: SliceTesting {
    func isSliced(game: GameState, entity: Entity) -> Bool { true }
    func isNearMiss(game: GameState, entity: Entity) -> Bool { false }
}

private final class BindingAudio: AudioPlaying {
    func play(_ key: String) {}
}

private final class BindingEffects: EffectEmitting {
    func emit(_ kind: Int32, at position: SIMD3<Float>) {}
}
