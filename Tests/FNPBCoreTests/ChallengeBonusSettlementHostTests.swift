import Foundation
import XCTest
@testable import FNPBCore

final class ChallengeBonusSettlementHostTests: XCTestCase {
    func testSettlementDrivesBonusIntoBackgroundExitAndForwardsEveryOutput() throws {
        let players = try loadPlayers()
        var background = players.background
        _ = try background.playRecursively(component: "", animation: "animate_in")
        var host = ChallengeBonusSettlementHost(
            scorePlayer: players.score,
            backgroundPlayer: background)

        XCTAssertFalse(host.hasBegun)
        XCTAssertFalse(host.resultVisible)
        XCTAssertFalse(host.isBonusFinished)
        XCTAssertFalse(host.isFinished)
        for index in 1...3 {
            XCTAssertFalse(host.isLifeScoreVisible(index: Int32(index)))
            XCTAssertFalse(host.isCrossVisible(index: Int32(index)))
        }

        _ = try host.begin(totalScore: 1_575, finaleScore: 375, lives: 2)

        XCTAssertTrue(host.hasBegun)
        XCTAssertTrue(host.resultVisible)
        XCTAssertFalse(host.isBonusFinished)
        XCTAssertFalse(host.isFinished)
        XCTAssertEqual(host.scoreCounterValue, 1_000)
        XCTAssertTrue(host.isLifeScoreVisible(index: 1))
        XCTAssertTrue(host.isLifeScoreVisible(index: 2))
        XCTAssertFalse(host.isLifeScoreVisible(index: 3))
        XCTAssertTrue(host.isCrossVisible(index: 1))
        XCTAssertTrue(host.isCrossVisible(index: 2))
        XCTAssertFalse(host.isCrossVisible(index: 3))

        var scoreCounterSequence: [Int32] = [host.scoreCounterValue]
        var commands: [ChallengeBonusRoundCommand] = []
        var achievements: [ChallengeBonusAchievementUpdate] = []
        var didFinishCount = 0
        var didFinishBeforeBonusFinished = false
        var didFinishOnBonusFinishFrame = false
        var sawBonusFinished = false
        var sawBackgroundIntroCompletion = false

        for _ in 0..<5_000 {
            if host.isFinished { break }

            let output = try host.update(deltaSeconds: 1.0 / 60)
            if output.animations.contains(.completed(
                component: "backgroundControl", animation: "animate_in")) {
                sawBackgroundIntroCompletion = true
            }
            if scoreCounterSequence.last != host.scoreCounterValue {
                scoreCounterSequence.append(host.scoreCounterValue)
            }
            if let command = output.roundCommand {
                commands.append(command)
            }
            achievements.append(contentsOf: output.achievements)

            if host.isBonusFinished && !sawBonusFinished {
                sawBonusFinished = true
                if output.didFinish {
                    didFinishOnBonusFinishFrame = true
                }
            }
            if output.didFinish {
                didFinishCount += 1
                if !host.isBonusFinished {
                    didFinishBeforeBonusFinished = true
                }
            }
        }

        XCTAssertTrue(sawBackgroundIntroCompletion, "begin must not reset the external background intro")
        XCTAssertEqual(scoreCounterSequence, [1_000, 1_375, 1_575])
        XCTAssertEqual(commands, [.beginLifeTally, .finishRound])
        XCTAssertEqual(achievements, [
            ChallengeBonusAchievementUpdate(achievement: .bandito2000OrUnder, value: 1),
            ChallengeBonusAchievementUpdate(achievement: .banditoCompleteLives, value: 2),
        ])
        XCTAssertTrue(sawBonusFinished)
        XCTAssertFalse(didFinishBeforeBonusFinished)
        XCTAssertFalse(didFinishOnBonusFinishFrame)
        XCTAssertTrue(host.isBonusFinished)
        XCTAssertTrue(host.isFinished)
        XCTAssertFalse(host.resultVisible)
        XCTAssertEqual(didFinishCount, 1)

        for _ in 0..<5 {
            let output = try host.update(deltaSeconds: 1.0 / 60)
            XCTAssertFalse(output.didFinish)
            XCTAssertTrue(output.animations.isEmpty)
            XCTAssertTrue(output.achievements.isEmpty)
            XCTAssertNil(output.roundCommand)
        }
    }

    func testBeginIsRejectedAfterFirstCall() throws {
        let players = try loadPlayers()
        var host = ChallengeBonusSettlementHost(
            scorePlayer: players.score,
            backgroundPlayer: players.background)

        _ = try host.begin(totalScore: 1_575, finaleScore: 375, lives: 2)
        XCTAssertEqual(host.totalScore, 1_575)
        XCTAssertEqual(host.finaleScore, 375)
        XCTAssertEqual(host.lives, 2)
        XCTAssertThrowsError(try host.begin(totalScore: 0, finaleScore: 0, lives: 0)) { error in
            XCTAssertEqual(error as? ChallengeBonusSettlementHostError,
                           ChallengeBonusSettlementHostError.alreadyBegun)
        }
    }

    private func loadPlayers() throws -> (score: UIScreenAnimationPlayer,
                                          background: UIScreenAnimationPlayer) {
        let root = URL(fileURLWithPath: #filePath)
            .deletingLastPathComponent().deletingLastPathComponent().deletingLastPathComponent()
        let score = try UIScreenAnimationPlayer(data: Data(contentsOf: root.appendingPathComponent(
            "Content/challengeScoreCompleteAnimations.json")))
        let background = try UIScreenAnimationPlayer(data: Data(contentsOf: root.appendingPathComponent(
            "Content/challengeBackgroundAnimations.json")))
        return (score, background)
    }
}
