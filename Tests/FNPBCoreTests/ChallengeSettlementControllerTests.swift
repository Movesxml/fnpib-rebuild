import Foundation
import XCTest
@testable import FNPBCore

final class ChallengeSettlementControllerTests: XCTestCase {
    func testSuccessfulResultFollowsInsSequenceThenUsesRealBackgroundExit() throws {
        var result = try loadPlayer("challengeScoreAnimations.json")
        var background = try loadPlayer("challengeBackgroundAnimations.json")
        var controller = ChallengeSettlementController()
        _ = try controller.beginNormalResults(outcome: .pass,
                                              resultPlayer: &result,
                                              backgroundPlayer: &background)
        XCTAssertEqual(controller.state, 1)
        // FUN_0006c95c state 1 finishes through FUN_0006cc28 when `ins` is no
        // longer playing. There is no click gate or replacement delay here.
        try advanceUntil("successful result sequence and outro") {
            controller.normalResultState == .finished
        } body: {
            _ = try controller.update(deltaSeconds: 1.0 / 60,
                                      resultPlayer: &result,
                                      backgroundPlayer: &background,
                                      canAnimateResultExit: true)
        }
        _ = try controller.requestNextRound(backgroundPlayer: &background)
        XCTAssertEqual(controller.state, 6)
        XCTAssertEqual(controller.substate, 2)
        XCTAssertTrue(try background.isPlayingRecursively(component: "", animation: "animate_out"))
        try advanceUntil("background exit") { controller.state == 7 } body: {
            _ = try controller.update(deltaSeconds: 1.0 / 60,
                                      resultPlayer: &result,
                                      backgroundPlayer: &background,
                                      canAnimateResultExit: true)
        }
        XCTAssertEqual(controller.substate, 2)
        XCTAssertFalse(controller.normalResultVisible)
    }

    func testFailureFollowsRealResultAnimationsWithoutSuccessInteraction() throws {
        var result = try loadPlayer("challengeScoreAnimations.json")
        var background = try loadPlayer("challengeBackgroundAnimations.json")
        var controller = ChallengeSettlementController()
        _ = try controller.beginNormalResults(outcome: .fail,
                                              resultPlayer: &result,
                                              backgroundPlayer: &background)
        try advanceUntil("failure result sequence") {
            controller.normalResultState == .finished
        } body: {
            _ = try controller.update(deltaSeconds: 1.0 / 60,
                                      resultPlayer: &result,
                                      backgroundPlayer: &background,
                                      canAnimateResultExit: true)
        }
        _ = try controller.requestCleanup(backgroundPlayer: &background)
        XCTAssertEqual(controller.state, 6)
        XCTAssertEqual(controller.substate, 5)
        try advanceUntil("cleanup background exit") { controller.state == 7 } body: {
            _ = try controller.update(deltaSeconds: 1.0 / 60,
                                      resultPlayer: &result,
                                      backgroundPlayer: &background,
                                      canAnimateResultExit: true)
        }
    }

    func testOriginalNoOutroPredicateFinishesImmediatelyAndPendingIsRejected() throws {
        var result = try loadPlayer("challengeScoreAnimations.json")
        var background = try loadPlayer("challengeBackgroundAnimations.json")
        var controller = ChallengeSettlementController()
        XCTAssertThrowsError(try controller.beginNormalResults(outcome: .pending,
                                                               resultPlayer: &result,
                                                               backgroundPlayer: &background))
        _ = try controller.beginNormalResults(outcome: .pass,
                                              resultPlayer: &result,
                                              backgroundPlayer: &background)
        try advanceUntil("successful result intro without outro") {
            controller.normalResultState == .finished
        } body: {
            _ = try controller.update(deltaSeconds: 1.0 / 60,
                                      resultPlayer: &result,
                                      backgroundPlayer: &background,
                                      canAnimateResultExit: false)
        }
        XCTAssertEqual(controller.normalResultState, .finished)
        XCTAssertFalse(try result.isPlayingRecursively(component: "", animation: "animate_out"))
    }

    private func loadPlayer(_ file: String) throws -> UIScreenAnimationPlayer {
        let root = URL(fileURLWithPath: #filePath)
            .deletingLastPathComponent().deletingLastPathComponent().deletingLastPathComponent()
        return try UIScreenAnimationPlayer(
            data: Data(contentsOf: root.appendingPathComponent("Content/\(file)")))
    }

    private func advanceUntil(_ label: String,
                              limit: Int = 1_000,
                              condition: () -> Bool,
                              body: () throws -> Void) throws {
        for _ in 0..<limit {
            if condition() { return }
            try body()
        }
        XCTAssertTrue(condition(), "timed out waiting for \(label)")
    }
}
