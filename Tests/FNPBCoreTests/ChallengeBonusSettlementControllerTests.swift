import Foundation
import XCTest
@testable import FNPBCore

final class ChallengeBonusSettlementControllerTests: XCTestCase {
    func testReleaseTallyUsesRealTimelinesAndExactAchievementValues() throws {
        var player = try loadPlayer()
        var controller = ChallengeBonusSettlementController(
            totalScore: 1_575, finaleScore: 375, lives: 2)
        XCTAssertEqual(controller.scoreCounterValue, 1_000)
        XCTAssertTrue(controller.isLifeScoreVisible(index: 1))
        XCTAssertTrue(controller.isLifeScoreVisible(index: 2))
        XCTAssertFalse(controller.isLifeScoreVisible(index: 3))
        XCTAssertTrue(controller.isCrossVisible(index: 2))
        XCTAssertFalse(controller.isCrossVisible(index: 3))

        _ = try controller.begin(player: &player)
        var commands: [ChallengeBonusRoundCommand] = []
        var achievements: [ChallengeBonusAchievementUpdate] = []
        var observedLifeTally = false
        var observedTotal = false
        for _ in 0..<1_000 {
            if controller.isFinished { break }
            let output = try controller.update(deltaSeconds: 1.0 / 60, player: &player)
            if let command = output.roundCommand { commands.append(command) }
            achievements.append(contentsOf: output.achievements)
            if controller.substate == 1 {
                XCTAssertEqual(controller.scoreCounterValue, 1_375)
                observedLifeTally = true
            }
            if controller.substate == 2 {
                XCTAssertEqual(controller.scoreCounterValue, 1_575)
                observedTotal = true
            }
        }
        XCTAssertTrue(controller.isFinished)
        XCTAssertFalse(controller.resultVisible)
        XCTAssertTrue(observedLifeTally)
        XCTAssertTrue(observedTotal)
        XCTAssertEqual(commands, [.beginLifeTally, .finishRound])
        XCTAssertEqual(achievements, [
            ChallengeBonusAchievementUpdate(achievement: .bandito2000OrUnder, value: 1),
            ChallengeBonusAchievementUpdate(achievement: .banditoCompleteLives, value: 2),
        ])
    }

    func testZeroLivesSkipsMissingHeartWaitButStillPlaysLifeTally() throws {
        var player = try loadPlayer()
        var controller = ChallengeBonusSettlementController(
            totalScore: 2_500, finaleScore: 400, lives: 0)
        _ = try controller.begin(player: &player)
        var sawLifeTrigger = false
        var achievements: [ChallengeBonusAchievementUpdate] = []
        for _ in 0..<1_000 {
            if controller.isFinished { break }
            let output = try controller.update(deltaSeconds: 1.0 / 60, player: &player)
            sawLifeTrigger = sawLifeTrigger || output.animations.contains {
                if case let .completed(component, animation) = $0 {
                    return component == "scoreContainer" && animation == "life_trigger"
                }
                return false
            }
            achievements.append(contentsOf: output.achievements)
            if controller.substate == 1 {
                XCTAssertEqual(controller.scoreCounterValue, 2_500)
            }
        }
        XCTAssertTrue(controller.isFinished)
        XCTAssertTrue(sawLifeTrigger)
        XCTAssertEqual(achievements, [
            ChallengeBonusAchievementUpdate(achievement: .banditoCompleteLives, value: 0),
        ])
        for index in 1...3 {
            XCTAssertFalse(controller.isLifeScoreVisible(index: Int32(index)))
            XCTAssertFalse(controller.isCrossVisible(index: Int32(index)))
        }
    }

    func testUnsignedThresholdRejectsNegativeScoreLikeReleaseBhi() throws {
        var player = try loadPlayer()
        var controller = ChallengeBonusSettlementController(
            totalScore: -1, finaleScore: 0, lives: 3)
        _ = try controller.begin(player: &player)
        var achievements: [ChallengeBonusAchievementUpdate] = []
        for _ in 0..<1_000 {
            if controller.isFinished { break }
            let output = try controller.update(deltaSeconds: 1.0 / 60, player: &player)
            achievements.append(contentsOf: output.achievements)
        }
        XCTAssertTrue(controller.isFinished)
        XCTAssertFalse(achievements.contains { $0.achievement == .bandito2000OrUnder })
        XCTAssertEqual(achievements.last?.value, 3)
    }

    private func loadPlayer() throws -> UIScreenAnimationPlayer {
        let root = URL(fileURLWithPath: #filePath)
            .deletingLastPathComponent().deletingLastPathComponent().deletingLastPathComponent()
        return try UIScreenAnimationPlayer(data: Data(contentsOf: root.appendingPathComponent(
            "Content/challengeScoreCompleteAnimations.json")))
    }
}
