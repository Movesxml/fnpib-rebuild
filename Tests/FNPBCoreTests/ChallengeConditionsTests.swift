import XCTest
@testable import FNPBCore

/// 挑战条件整组回归：配置、五种条件、独立比较入口、倒计时与最终聚合。
final class ChallengeConditionsTests: XCTestCase {
    func testOfficialCatalogLoadsEveryConditionAndPreservesDefaults() throws {
        let definitions = try loadOfficial()
        XCTAssertEqual(definitions.count, 82)
        XCTAssertEqual(definitions.filter { $0.kind == .score }.count, 11)
        XCTAssertEqual(definitions.filter { $0.kind == .stats }.count, 56)
        XCTAssertEqual(definitions.filter { $0.kind == .consecutive }.count, 1)
        XCTAssertEqual(definitions.filter { $0.kind == .statsCompare }.count, 5)
        XCTAssertEqual(definitions.filter { $0.kind == .time }.count, 9)

        let score = try XCTUnwrap(definitions.first { $0.name == "score50" })
        XCTAssertEqual(score.total, 50)
        XCTAssertEqual(score.result, .pass)
        XCTAssertFalse(score.evaluateOnEnd)

        let consecutive = try XCTUnwrap(definitions.first { $0.name == "hitTopMultipleFruitOnly" })
        XCTAssertEqual(consecutive.kind, .consecutive)
        XCTAssertEqual(consecutive.total, 5)

        let compare = try XCTUnwrap(definitions.first { $0.name == "onlyPineapple" })
        XCTAssertEqual(compare.comparison, .notEqual)
        XCTAssertEqual(compare.specificType, "pineapple")
        XCTAssertEqual(compare.specificType2, "totalfruit")
        XCTAssertEqual(compare.result, .fail)

        let timed = try XCTUnwrap(definitions.first { $0.name == "timeLimit20" })
        XCTAssertEqual(timed.time, 20)
        XCTAssertEqual(timed.result, .fail)

        // 官方文档自身含重复名称，加载器不得去重后少报条目。
        XCTAssertEqual(definitions.filter { $0.name == "hit5FruitOnEnd" }.count, 2)
    }

    func testScoreAndStatsUseTargetLessThanOrEqualToCurrent() {
        var score = ChallengeCondition(ChallengeConditionDefinition(
            name: "score10", kind: .score, total: 10))
        XCTAssertFalse(score.check(context: .init(score: 9)))
        XCTAssertTrue(score.check(context: .init(score: 10)))
        XCTAssertTrue(score.check(context: .init(score: 11)))
        XCTAssertTrue(score.updateResult(context: .init(score: 10)))
        XCTAssertEqual(score.current, .pass)
        XCTAssertTrue(score.updateResult(context: .init(score: 9)))
        XCTAssertEqual(score.current, .pending)

        var stats = ChallengeCondition(ChallengeConditionDefinition(
            name: "hit8", kind: .stats, total: 8, specificType: "totalfruit"))
        XCTAssertFalse(stats.updateResult(context: .init(stats: ["totalfruit": 7])))
        XCTAssertEqual(stats.current, .pending)
        XCTAssertTrue(stats.updateResult(context: .init(stats: ["totalfruit": 8])))
        XCTAssertEqual(stats.current, .pass)
    }

    func testEndPassUsesFinalStatsNotImmediateScore() {
        var runtime = ChallengeConditionsRuntime(definitions: [
            ChallengeConditionDefinition(name: "score2", kind: .score, total: 2),
            ChallengeConditionDefinition(name: "hit2End", kind: .stats, total: 2,
                                         specificType: "totalfruit", evaluateOnEnd: true)
        ])
        runtime.select(conditionNames: ["score2", "hit2End"])
        runtime.evaluateImmediate(context: .init(score: 2, stats: ["totalfruit": 2]))
        XCTAssertEqual(runtime.result, .pending)
        XCTAssertEqual(runtime.condition(named: "score2")?.current, .pass)
        XCTAssertEqual(runtime.finish(context: .init(score: 2, stats: ["totalfruit": 2])), .pass)
        XCTAssertEqual(runtime.finish(context: .init(score: 0, stats: [:])), .pass,
                       "聚合结果一旦生成便冻结")
    }

    func testFinalPassFailureFallsBackToFailWhenFailDefinitionExists() {
        let definitions = [
            ChallengeConditionDefinition(name: "hit8End", kind: .stats, total: 8,
                                         specificType: "totalfruit", evaluateOnEnd: true),
            ChallengeConditionDefinition(name: "useChallengeFruit", kind: .stats,
                                         result: .fail, total: 9999,
                                         specificType: "challengeFruit")
        ]
        var runtime = ChallengeConditionsRuntime(definitions: definitions)
        runtime.select(conditionNames: ["hit8End", "useChallengeFruit"])
        XCTAssertEqual(runtime.finish(context: .init(stats: ["totalfruit": 7])), .fail)

        runtime.select(conditionNames: ["hit8End", "useChallengeFruit"])
        XCTAssertEqual(runtime.finish(context: .init(stats: ["totalfruit": 8])), .pass)
    }

    func testEndFailHasPriorityOverPass() {
        var runtime = ChallengeConditionsRuntime(definitions: [
            ChallengeConditionDefinition(name: "goal", kind: .stats, total: 1,
                                         specificType: "totalfruit", evaluateOnEnd: true),
            ChallengeConditionDefinition(name: "deadline", kind: .time, result: .fail,
                                         evaluateOnEnd: true, time: 1)
        ])
        runtime.select(conditionNames: ["goal", "deadline"])
        runtime.update(dt: 1, context: .init(stats: ["totalfruit": 1]))
        XCTAssertEqual(runtime.finish(context: .init(stats: ["totalfruit": 1])), .fail)
    }

    func testTimeDefaultResetAndExternalGate() {
        var condition = ChallengeCondition(ChallengeConditionDefinition(
            name: "defaultTime", kind: .time, result: .fail))
        XCTAssertEqual(condition.timeRemaining, 10)
        condition.update(dt: 3, context: .init())
        XCTAssertEqual(condition.timeRemaining, 7)
        XCTAssertEqual(condition.current, .pending)
        condition.update(dt: 7, context: .init(timerCompletionAllowed: false))
        XCTAssertEqual(condition.timeRemaining, 0)
        XCTAssertEqual(condition.current, .pending)
        condition.update(dt: 0, context: .init(timerCompletionAllowed: true))
        XCTAssertEqual(condition.current, .fail)
        condition.reset()
        XCTAssertEqual(condition.timeRemaining, 10)
        XCTAssertEqual(condition.current, .pending)
    }

    func testSelectionReadsTimeAndSkipsUnknownNames() {
        var runtime = ChallengeConditionsRuntime(definitions: [
            ChallengeConditionDefinition(name: "timer", kind: .time, result: .fail, time: 7)
        ])
        runtime.select(conditionNames: ["missing", "TIMER"])
        XCTAssertEqual(runtime.timerDuration, 7)
        XCTAssertEqual(runtime.activeConditions.count, 1)
        runtime.update(dt: 7, context: .init())
        runtime.select(conditionNames: [])
        XCTAssertEqual(runtime.timerDuration, 0)
        XCTAssertEqual(runtime.result, .pending)
        XCTAssertEqual(runtime.condition(named: "timer")?.timeRemaining, 0,
                       "FUN_0005ed54 只复位本次重新选中的条件，不复位已移出激活列表的条件")
    }

    func testConsecutiveUsesCurrentSlashCountAndOptionalType() {
        var condition = ChallengeCondition(ChallengeConditionDefinition(
            name: "five", kind: .consecutive, total: 5, specificType: "apple"))
        XCTAssertFalse(condition.recordConsecutive(count: 5, specificType: "pear"))
        XCTAssertEqual(condition.current, .pending)
        XCTAssertFalse(condition.recordConsecutive(count: 4, specificType: "APPLE"))
        XCTAssertTrue(condition.recordConsecutive(count: 5, specificType: "APPLE"))
        XCTAssertEqual(condition.current, .pass)
        XCTAssertTrue(condition.recordConsecutive(count: 3, specificType: "apple"))
        XCTAssertEqual(condition.current, .pending)
    }

    func testStatsCompareStandardUpdateSlotComparesAndUpdatesCurrent() {
        var condition = ChallengeCondition(ChallengeConditionDefinition(
            name: "onlyPineapple", kind: .statsCompare, result: .fail,
            specificType: "pineapple", specificType2: "totalfruit",
            comparison: .notEqual))
        XCTAssertTrue(condition.updateResult(context: .init(stats: [
            "pineapple": 1, "totalfruit": 2
        ])))
        XCTAssertEqual(condition.current, .fail)
        XCTAssertTrue(condition.updateResult(context: .init(stats: [
            "pineapple": 2, "totalfruit": 2
        ])))
        XCTAssertEqual(condition.current, .pending)
    }

    func testStatsCompareEvaluateOnEndSelectsEndOrImmediateEntry() {
        let definition = ChallengeConditionDefinition(
            name: "onlyPineapple", kind: .statsCompare, result: .fail,
            specificType: "pineapple", specificType2: "totalfruit",
            evaluateOnEnd: true, comparison: .notEqual)
        let violating = ChallengeEvaluationContext(stats: [
            "pineapple": 1, "totalfruit": 2
        ])
        var condition = ChallengeCondition(definition)
        XCTAssertFalse(condition.evaluateImmediate(context: violating))
        XCTAssertEqual(condition.current, .pending)
        XCTAssertTrue(condition.evaluateEnd(context: violating))
        XCTAssertEqual(condition.current, .fail)

        condition.definition.evaluateOnEnd = false
        condition.reset()
        XCTAssertFalse(condition.evaluateEnd(context: violating))
        XCTAssertEqual(condition.current, .pending)
        XCTAssertTrue(condition.evaluateImmediate(context: violating))
        XCTAssertEqual(condition.current, .fail)
    }

    func testComparisonDispatcherOnlyProcessesPassStatsCompareDefinitions() {
        let fail = ChallengeConditionDefinition(
            name: "failCompare", kind: .statsCompare, result: .fail,
            specificType: "pineapple", specificType2: "totalfruit",
            comparison: .notEqual)
        var pass = fail
        pass.name = "passCompare"
        pass.result = .pass
        var runtime = ChallengeConditionsRuntime(definitions: [fail, pass])
        runtime.select(conditionNames: ["failCompare", "passCompare"])
        runtime.checkComparisons(context: .init(stats: [
            "pineapple": 1, "totalfruit": 2
        ]))
        XCTAssertEqual(runtime.condition(named: "failCompare")?.current, .pending)
        XCTAssertEqual(runtime.condition(named: "passCompare")?.current, .pass)
    }

    func testComparisonDirectionsAndUnknownBehavior() {
        XCTAssertTrue(ChallengeComparison.equal.evaluate(2, 2))
        XCTAssertTrue(ChallengeComparison.notEqual.evaluate(2, 3))
        XCTAssertTrue(ChallengeComparison.greater.evaluate(3, 2))
        XCTAssertFalse(ChallengeComparison.greater.evaluate(2, 3))
        XCTAssertFalse(ChallengeComparison.unsupported.evaluate(3, 2))
    }

    func testOfficialFruitAcrossRoundMatchesBothOutcomes() throws {
        var runtime = ChallengeConditionsRuntime(definitions: try loadOfficial())
        runtime.select(conditionNames: ["hit8FruitOnEnd", "useChallengeFruit"])
        XCTAssertEqual(runtime.finish(context: .init(stats: [
            "totalfruit": 7, "challengeFruit": 7
        ])), .fail)

        runtime.select(conditionNames: ["hit8FruitOnEnd", "useChallengeFruit"])
        XCTAssertEqual(runtime.finish(context: .init(stats: [
            "totalfruit": 8, "challengeFruit": 8
        ])), .pass)
    }

    private func loadOfficial() throws -> [ChallengeConditionDefinition] {
        let root = URL(fileURLWithPath: #filePath)
            .deletingLastPathComponent()
            .deletingLastPathComponent()
            .deletingLastPathComponent()
        return try ChallengeConditionLoader.load(from: Data(
            contentsOf: root.appendingPathComponent("Content/challengeConditions.json")))
    }
}
