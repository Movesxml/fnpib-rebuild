import XCTest
@testable import FNPBCore

/// 挑战配置与回合控制器整组回归；真实随机选择器不在此伪造。
final class ChallengeModeRuntimeTests: XCTestCase {
    func testOfficialCatalogPreservesTiersGroupsChallengesAndDefaults() throws {
        let catalog = try loadOfficialCatalog()
        XCTAssertEqual(catalog.defaults, ChallengeSelectionWeight(
            chanceSelect: 20, chanceRegrowth: 0.2))
        XCTAssertEqual(catalog.tiers.map(\.name), [
            "tier1", "tier2", "tier3", "finalTier"
        ])
        XCTAssertEqual(catalog.tiers.flatMap(\.groups).count, 34)
        XCTAssertEqual(catalog.allChallenges.count, 70)
        XCTAssertEqual(catalog.tiers.map { $0.groups.flatMap(\.challenges).count }, [
            25, 23, 21, 1
        ])
        XCTAssertEqual(catalog.allChallenges.flatMap(\.conditionNames).count, 136)
        XCTAssertEqual(catalog.allChallenges.flatMap(\.modNames).count, 191)
        XCTAssertEqual(catalog.allChallenges.filter {
            $0.rawAttributes["bonusFruit"] != nil
        }.count, 0, "bonusMods 是子节点，不是 challenge 属性")
        XCTAssertEqual(catalog.allChallenges.filter {
            $0.bonusMods != ChallengeBonusModifiers()
        }.count, 44)
        XCTAssertEqual(catalog.allChallenges.filter {
            $0.challengeFruitSize == .medium
        }.count, 35)
        XCTAssertEqual(catalog.allChallenges.filter {
            $0.challengeFruitSize == .small
        }.count, 4)
        XCTAssertTrue(catalog.allChallenges.allSatisfy { $0.points == nil })
    }

    func testOfficialCatalogParsesFloatSuffixAndRepresentativeFields() throws {
        let catalog = try loadOfficialCatalog()
        let firstTier = try XCTUnwrap(catalog.tiers.first)
        XCTAssertEqual(firstTier.numRounds, 4)
        XCTAssertEqual(firstTier.dtStart, 1)
        XCTAssertEqual(firstTier.dtRoundIncrement, 0.03)
        XCTAssertEqual(firstTier.background, "background1")

        let first = try XCTUnwrap(catalog.allChallenges.first {
            $0.name == "fruitAcross1"
        })
        XCTAssertEqual(first.numWaves, 9)
        XCTAssertEqual(first.timeLimit, 8)
        XCTAssertEqual(first.customWave, "fruitAcross1")
        XCTAssertEqual(first.type, "speed")
        XCTAssertFalse(first.forceWave)
        XCTAssertEqual(first.conditionNames, ["hit8FruitOnEnd", "useChallengeFruit"])
        XCTAssertEqual(first.bonusMods, ChallengeBonusModifiers(
            fruit: 1, accuracy: 1.5, finesse: 1))
        XCTAssertNil(first.evaluateOnEndAttribute)

        let flagged = try XCTUnwrap(catalog.allChallenges.first {
            $0.name == "bombField1"
        })
        XCTAssertEqual(flagged.evaluateOnEndAttribute, true)
        XCTAssertEqual(catalog.allChallenges.filter {
            $0.evaluateOnEndAttribute == true
        }.count, 16)

        let finalTier = try XCTUnwrap(catalog.tiers.last)
        XCTAssertEqual(finalTier.name, "finalTier")
        XCTAssertEqual(finalTier.numRounds, 1)
        XCTAssertEqual(finalTier.dtStart, 1.25)
        XCTAssertEqual(finalTier.bossID, "BOSS_1")
        XCTAssertTrue(finalTier.isBonusRound)
        XCTAssertEqual(finalTier.groups.flatMap(\.challenges).map(\.name), ["finalePinata"])
        XCTAssertEqual(finalTier.groups[0].challenges[0].bonusMods, ChallengeBonusModifiers(
            fruit: 0.1, accuracy: 0, finesse: 0))
    }

    func testMustSelectOnlyOverridesGroupWeightsAndMarksContainedChallengesHard() throws {
        let catalog = try loadOfficialCatalog()
        let groups = catalog.tiers.flatMap(\.groups)
        let required = groups.filter { $0.mustSelect > 0 }
        XCTAssertFalse(required.isEmpty)
        for group in required {
            XCTAssertEqual(group.selection, ChallengeSelectionWeight(
                chanceSelect: 0, chanceRegrowth: 0))
            XCTAssertTrue(group.challenges.allSatisfy(\.hard))
            XCTAssertFalse(group.challenges.allSatisfy {
                $0.selection.chanceSelect == 0 && $0.selection.chanceRegrowth == 0
            }, "原版没有清零 challenge 自身的选择字段")
        }
    }

    func testChallengeLevelEvaluateOnEndAttributeDoesNotDriveRoundEnding() {
        var runtime = makeRuntime(challenge: ChallengeDefinition(
            name: "attributeOnly", evaluateOnEndAttribute: true))
        runtime.update(dt: 0, frame: ChallengeFrame(waveCount: 0))
        XCTAssertEqual(runtime.phase, .running)
        runtime.markWavesEnded()
        runtime.update(dt: 0, frame: ChallengeFrame(waveCount: 0))
        XCTAssertEqual(runtime.phase, .running)
        runtime.update(dt: 0, frame: ChallengeFrame(waveCount: 1))
        XCTAssertEqual(runtime.phase, .settling)
        XCTAssertEqual(runtime.roundResults, [.pass])
    }

    func testTimeConditionOverridesChallengeLimitAndCountdownCanBecomeNegative() {
        let timer = ChallengeConditionDefinition(
            name: "deadline", kind: .time, result: .fail,
            evaluateOnEnd: true, time: 0.25)
        var runtime = makeRuntime(
            challenge: ChallengeDefinition(
                name: "timed", timeLimit: 99, conditionNames: ["deadline"]),
            conditions: [timer])
        XCTAssertEqual(runtime.countdown, 0.25)
        XCTAssertTrue(runtime.endsOnTimer)
        runtime.update(dt: 0.5, frame: ChallengeFrame())
        XCTAssertEqual(runtime.countdown, -0.25)
        XCTAssertEqual(runtime.phase, .settling)
        XCTAssertEqual(runtime.roundResults, [.fail])
    }

    func testNoTimeConditionAndZeroLimitNeverTimesOut() {
        var runtime = makeRuntime(challenge: ChallengeDefinition(name: "untimed"))
        XCTAssertFalse(runtime.endsOnTimer)
        runtime.markWavesEnded()
        runtime.update(dt: 1_000, frame: ChallengeFrame(waveCount: 0))
        XCTAssertEqual(runtime.countdown, -1_000)
        XCTAssertEqual(runtime.phase, .running)
        XCTAssertTrue(runtime.roundResults.isEmpty)
    }

    func testCompletedWavesWaitForFruitEntitiesBeforeFinishing() {
        var runtime = makeRuntime(challenge: ChallengeDefinition(name: "oneWave"))
        runtime.markWavesEnded()
        runtime.markWavesEnded()
        runtime.update(dt: 0, frame: ChallengeFrame(waveCount: 1, fruitEntityCount: 1))
        XCTAssertEqual(runtime.phase, .running)
        runtime.update(dt: 0, frame: ChallengeFrame(waveCount: 1, fruitEntityCount: 0))
        XCTAssertEqual(runtime.phase, .settling)
        XCTAssertEqual(runtime.roundsPlayed, 1)
        XCTAssertEqual(runtime.roundResults, [.pass])
    }

    func testFinalFailConditionHasPriorityOverCompletedGoal() {
        let definitions = [
            ChallengeConditionDefinition(
                name: "goal", kind: .stats, total: 1,
                specificType: "totalfruit", evaluateOnEnd: true),
            ChallengeConditionDefinition(
                name: "deadline", kind: .time, result: .fail,
                evaluateOnEnd: true, time: 1)
        ]
        var runtime = makeRuntime(
            challenge: ChallengeDefinition(
                name: "priority", conditionNames: ["goal", "deadline"]),
            conditions: definitions)
        runtime.update(dt: 1, frame: ChallengeFrame(evaluation: ChallengeEvaluationContext(
            stats: ["totalfruit": 1])))
        XCTAssertEqual(runtime.phase, .settling)
        XCTAssertEqual(runtime.roundResults, [.fail])
        XCTAssertEqual(runtime.roundsPassed, 0)
        XCTAssertTrue(runtime.drainEvents().contains(.playSound("gank")))
    }

    func testRoundFinishesOnlyOnceAndEmitsVerifiedCleanupEvents() {
        var runtime = makeRuntime(challenge: ChallengeDefinition(name: "once", timeLimit: 1))
        runtime.update(dt: 1, frame: ChallengeFrame())
        let events = runtime.drainEvents()
        XCTAssertEqual(events.filter {
            if case .roundFinished = $0 { return true }
            return false
        }, [.roundFinished(.pass)])
        XCTAssertEqual(events.first, .playAnimation(
            target: "inGameChallengeHud", name: "animate_out"))
        XCTAssertTrue(events.contains(.playAnimation(
            target: "instructionsText", name: "instructions_out")))
        XCTAssertTrue(events.contains(.setVisible(target: "Timer", false)))
        XCTAssertTrue(events.contains(.setVisible(target: "challengeMods", false)))

        runtime.update(dt: 100, frame: ChallengeFrame())
        runtime.markWavesEnded()
        XCTAssertTrue(runtime.drainEvents().isEmpty)
        XCTAssertEqual(runtime.roundsPlayed, 1)
        XCTAssertEqual(runtime.roundResults, [.pass])
    }

    func testBonusIntroRequiresCompletionCallbackThenRunsAndCleansUp() {
        let tier = ChallengeTierDefinition(name: "finalTier", bossID: "BOSS_1")
        var runtime = makeRuntime(
            tier: tier,
            challenge: ChallengeDefinition(name: "bonus", timeLimit: 1))
        runtime.update(dt: 1, frame: ChallengeFrame())
        XCTAssertEqual(runtime.phase, .settling)
        XCTAssertTrue(runtime.drainEvents().contains(.playMusic("Music-bonus-end")))

        runtime.updateSettlement(controllerState: 7, substate: 0)
        XCTAssertEqual(runtime.phase, .settling,
                       "缺少外部选择结果时不得带着上一轮结果进入奖励介绍")
        runtime.updateSettlement(
            controllerState: 7, substate: 0,
            nextChallenge: ChallengeDefinition(name: "bonusAfterIntro", timeLimit: 2))
        XCTAssertEqual(runtime.phase, .bonusIntro)
        XCTAssertEqual(runtime.challenge.name, "bonusAfterIntro")
        XCTAssertEqual(runtime.conditions.result, .pending)
        runtime.update(dt: 100, frame: ChallengeFrame())
        XCTAssertEqual(runtime.phase, .bonusIntro)
        runtime.completeBonusIntro()
        XCTAssertEqual(runtime.phase, .running)
        XCTAssertEqual(runtime.countdown, 2)
        runtime.completeBonusIntro()
        XCTAssertTrue(runtime.drainEvents().contains(.playAnimation(
            target: "Timer", name: "animate_in")))

        runtime.update(dt: 1, frame: ChallengeFrame())
        XCTAssertEqual(runtime.phase, .running)
        XCTAssertEqual(runtime.roundsPlayed, 1,
                       "上一回合不得在介绍完成后重复结算")
        runtime.update(dt: 1, frame: ChallengeFrame())
        XCTAssertEqual(runtime.phase, .settling)
        XCTAssertEqual(runtime.roundsPlayed, 2)
        runtime.updateSettlement(controllerState: 7, substate: 5)
        XCTAssertEqual(runtime.phase, .inactive)
        XCTAssertTrue(runtime.drainEvents().contains(.cleanedUp))
    }

    func testNextRoundWaitsForExplicitSelectionAndThenResetsRuntime() {
        var runtime = makeRuntime(challenge: ChallengeDefinition(name: "first", timeLimit: 1))
        runtime.update(dt: 1, frame: ChallengeFrame())
        runtime.markWavesEnded()
        runtime.updateSettlement(controllerState: 7, substate: 2)
        XCTAssertEqual(runtime.phase, .settling)
        XCTAssertEqual(runtime.challenge.name, "first")
        XCTAssertFalse(runtime.drainEvents().contains(.nextRound))

        let next = ChallengeDefinition(name: "second", timeLimit: 2)
        runtime.updateSettlement(controllerState: 7, substate: 2, nextChallenge: next)
        XCTAssertEqual(runtime.phase, .running)
        XCTAssertEqual(runtime.challenge, next)
        XCTAssertEqual(runtime.countdown, 2)
        XCTAssertFalse(runtime.wavesEnded)
        XCTAssertEqual(runtime.roundResults, [.pass])
        XCTAssertTrue(runtime.drainEvents().contains(.nextRound))
    }

    func testProductionEvaluationReadsOneRealStatsStoreForAllConditionKinds() {
        let stats = StatsRecorder()
        stats.add(.totalfruit, 1)
        stats.report("Apple", 2)
        stats.report("Pineapple", 3)
        stats.report("challengeFruit", 4)
        let snapshot = stats.challengeValues()
        XCTAssertEqual(snapshot["totalfruit"], 1)
        XCTAssertEqual(snapshot["apple"], 2)
        XCTAssertEqual(snapshot["pineapple"], 3)
        XCTAssertEqual(snapshot["challengefruit"], 4)

        let definitions = [
            ChallengeConditionDefinition(
                name: "score", kind: .score, total: 7, evaluateOnEnd: true),
            ChallengeConditionDefinition(
                name: "apples", kind: .stats, total: 2,
                specificType: "apple", evaluateOnEnd: true),
            ChallengeConditionDefinition(
                name: "morePineapples", kind: .statsCompare,
                specificType: "pineapple", specificType2: "apple",
                evaluateOnEnd: true, comparison: .greater)
        ]
        var runtime = makeRuntime(
            challenge: ChallengeDefinition(
                name: "sharedStats",
                conditionNames: definitions.map(\.name)),
            conditions: definitions)
        let context = ChallengeEvaluationContext(score: 7, stats: stats)
        runtime.evaluateImmediate(context: context)
        runtime.checkComparisons(context: context)
        XCTAssertEqual(runtime.conditions.condition(named: "score")?.current, .pass)
        XCTAssertEqual(runtime.conditions.condition(named: "apples")?.current, .pass)
        XCTAssertEqual(runtime.conditions.condition(named: "morePineapples")?.current, .pass)
        XCTAssertEqual(runtime.conditions.finish(context: context), .pass)
    }

    private func makeRuntime(
        tier: ChallengeTierDefinition = ChallengeTierDefinition(),
        challenge: ChallengeDefinition,
        conditions: [ChallengeConditionDefinition] = []
    ) -> ChallengeModeRuntime {
        ChallengeModeRuntime(
            tier: tier, challenge: challenge, conditionDefinitions: conditions)
    }

    private func loadOfficialCatalog() throws -> ChallengeCatalog {
        let root = URL(fileURLWithPath: #filePath)
            .deletingLastPathComponent()
            .deletingLastPathComponent()
            .deletingLastPathComponent()
        return try ChallengeCatalogLoader.load(from: Data(
            contentsOf: root.appendingPathComponent("Content/ch1challengeList.json")))
    }
}
