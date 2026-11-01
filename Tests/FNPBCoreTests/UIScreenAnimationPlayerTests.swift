import Foundation
import XCTest
@testable import FNPBCore

final class UIScreenAnimationPlayerTests: XCTestCase {
    private func productionPlayer() throws -> UIScreenAnimationPlayer {
        let root = URL(fileURLWithPath: #filePath)
            .deletingLastPathComponent() // FNPBCoreTests
            .deletingLastPathComponent() // Tests
            .deletingLastPathComponent() // repository
        let data = try Data(contentsOf: root.appendingPathComponent("Content/classicAnimations.json"))
        return try UIScreenAnimationPlayer(data: data)
    }

    func testProductionResourceHasExactVerifiedDurationsAndZeroPaddingRemoved() throws {
        let player = try productionPlayer()
        XCTAssertEqual(player.content.components.count, 6)
        XCTAssertEqual(player.content.components.flatMap(\.animations).count, 10)
        XCTAssertEqual(player.content.components.first { $0.name == "popups.beanExtraLife" }?
            .animations.first?.endTimeMS, 1115)
        XCTAssertEqual(player.content.components.first { $0.name == "popups.beanPlus25" }?
            .animations.first?.endTimeMS, 930)
        XCTAssertEqual(player.content.source.file, "inGameClassic.uiscreen")
        XCTAssertEqual(player.content.source.sha256.count, 64)
        let gameOver = player.content.components
            .first { $0.name == "gameOverContainer" }?.animations
            .first { $0.name == "game_over" }
        XCTAssertEqual(gameOver?.endTimeMS, 2345)
        XCTAssertTrue(try XCTUnwrap(gameOver).tracks.allSatisfy { track in
            track.keyframes.allSatisfy { $0.values.count <= 3 }
        })
        for index in 1...3 {
            let component = "misscounters.cross\(index)"
            let animations = try XCTUnwrap(player.content.components.first { $0.name == component }).animations
            XCTAssertEqual(animations.first { $0.name == "in" }?.endTimeMS, 695)
            XCTAssertEqual(animations.first { $0.name == "out" }?.endTimeMS, 250)
        }
    }

    func testZeroMillisecondEventFiresOnPlayAndCrossedEventsNeverRepeat() throws {
        var player = try productionPlayer()
        let start = try player.play(component: "gameOverContainer", animation: "game_over")
        XCTAssertEqual(start, [.event(component: "gameOverContainer", animation: "game_over",
                                      command: "PlaySound", arguments: ["Pause"])])
        XCTAssertTrue(try player.advance(deltaSeconds: 0).isEmpty)

        let crossed = try player.advance(deltaSeconds: 0.4)
        XCTAssertEqual(crossed, [.event(component: "gameOverContainer", animation: "game_over",
                                        command: "PlaySound", arguments: ["Game-over"])])
        XCTAssertTrue(try player.advance(deltaSeconds: 0.1).isEmpty)
        XCTAssertTrue(player.isPlaying(component: "gameOverContainer", animation: "game_over"))
    }

    func testLargeStepEmitsOrderedEventsThenOneCompletion() throws {
        var player = try productionPlayer()
        _ = try player.play(component: "gameOverContainer", animation: "game_over_real")
        let output = try player.advance(deltaSeconds: 1)
        XCTAssertEqual(output, [
            .event(component: "gameOverContainer", animation: "game_over_real",
                   command: "PlaySound", arguments: ["Unpause"]),
            .completed(component: "gameOverContainer", animation: "game_over_real")
        ])
        XCTAssertFalse(player.isPlaying(component: "gameOverContainer", animation: "game_over_real"))
        XCTAssertTrue(try player.advance(deltaSeconds: 1).isEmpty)
    }

    func testCrossOutCompletesAtResourceTimeNotScaleLastKeyframe() throws {
        var player = try productionPlayer()
        XCTAssertTrue(try player.play(component: "misscounters.cross2", animation: "out").isEmpty)
        let beforeEnd = try player.advance(deltaSeconds: 0.245)
        XCTAssertTrue(beforeEnd.isEmpty)
        XCTAssertTrue(player.isPlaying(component: "misscounters.cross2", animation: "out"))
        let end = try player.advance(deltaSeconds: 0.005)
        XCTAssertEqual(end, [
            .event(component: "misscounters.cross2", animation: "out",
                   command: "PlaySound", arguments: ["life-lose"]),
            .completed(component: "misscounters.cross2", animation: "out")
        ])
    }

    func testNumericSamplingCrossesSeveralKeyframesAndUsesLinearSegments() throws {
        let player = try productionPlayer()
        let midpoint = try player.sample(component: "misscounters.cross1", animation: "in",
                                         track: "scale", atTimeMS: 122.5)
        XCTAssertEqual(midpoint[0], 0.75, accuracy: 0.00001)
        let betweenOvershoots = try player.sample(component: "misscounters.cross1", animation: "in",
                                                  track: "scale", atTimeMS: 320)
        XCTAssertEqual(betweenOvershoots[0], 1.0, accuracy: 0.00001)
        let end = try player.sample(component: "misscounters.cross1", animation: "in",
                                    track: "scale", atTimeMS: 10_000)
        XCTAssertEqual(end, [1, 1, 1])
    }

    func testReplayClearsOldEventsAndResetClearsPlayback() throws {
        var player = try productionPlayer()
        _ = try player.play(component: "gameOverContainer", animation: "game_over")
        _ = try player.advance(deltaSeconds: 0.4)
        let replay = try player.play(component: "gameOverContainer", animation: "game_over_real")
        XCTAssertTrue(replay.isEmpty)
        XCTAssertFalse(player.isPlaying(component: "gameOverContainer", animation: "game_over"))
        XCTAssertTrue(try player.advance(deltaSeconds: 0.2).contains(
            .event(component: "gameOverContainer", animation: "game_over_real",
                   command: "PlaySound", arguments: ["Unpause"])))

        player.reset()
        XCTAssertFalse(player.isPlaying(component: "gameOverContainer", animation: "game_over_real"))
        XCTAssertTrue(try player.advance(deltaSeconds: 1).isEmpty)
        _ = try player.play(component: "gameOverContainer", animation: "game_over")
        XCTAssertEqual(try player.advance(deltaSeconds: 0.35), [
            .event(component: "gameOverContainer", animation: "game_over",
                   command: "PlaySound", arguments: ["Game-over"])
        ], "reset 后 0.35 秒不应补发上一局 Pause 之外被清除的事件")
    }

    func testInvalidDeltaAndUnknownLookupsAreRejected() throws {
        var player = try productionPlayer()
        XCTAssertThrowsError(try player.advance(deltaSeconds: -.infinity))
        XCTAssertThrowsError(try player.play(component: "missing", animation: "out"))
        XCTAssertThrowsError(try player.sample(component: "misscounters.cross1", animation: "out",
                                               track: "missing", atTimeMS: 0))
    }
}
