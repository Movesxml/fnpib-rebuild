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

    func testActiveSamplingTracksPlaybackCompletionReplacementAndReset() throws {
        var player = try productionPlayer()
        XCTAssertNil(try player.sampleActive(component: "misscounters.cross1", track: "scale"))

        _ = try player.play(component: "misscounters.cross1", animation: "in")
        XCTAssertEqual(try player.sampleActive(component: "misscounters.cross1", track: "scale"),
                       [0, 0, 0])
        _ = try player.advance(deltaSeconds: 0.1225)
        XCTAssertEqual(try XCTUnwrap(try player.sampleActive(
            component: "misscounters.cross1", track: "scale"))[0], 0.75, accuracy: 0.00001)
        _ = try player.advance(deltaSeconds: 1)
        XCTAssertFalse(player.isPlaying(component: "misscounters.cross1", animation: "in"))
        XCTAssertEqual(try player.sampleActive(component: "misscounters.cross1", track: "scale"),
                       [1, 1, 1], "完成后必须保留可采样的结束帧")

        _ = try player.play(component: "misscounters.cross1", animation: "out")
        XCTAssertEqual(try player.sampleActive(component: "misscounters.cross1", track: "scale"),
                       [1, 1, 1], "替换后必须读取当前动画，而不是旧动画结束帧")
        player.reset()
        XCTAssertNil(try player.sampleActive(component: "misscounters.cross1", track: "scale"))
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

    func testChallengeBackgroundPreservesOriginalPlayAnimationEvent() throws {
        let root = URL(fileURLWithPath: #filePath)
            .deletingLastPathComponent().deletingLastPathComponent().deletingLastPathComponent()
        var player = try UIScreenAnimationPlayer(data: Data(contentsOf:
            root.appendingPathComponent("Content/challengeBackgroundAnimations.json")))
        let output = try player.play(component: "backgroundControl", animation: "animate_in")
        XCTAssertTrue(output.contains(.event(
            component: "backgroundControl", animation: "animate_in",
            command: "PlayAnimation", arguments: ["Background", "inGame"])))

        var gameBackground = try UIScreenAnimationPlayer(data: Data(contentsOf:
            root.appendingPathComponent("Content/backgroundAnimations.json")))
        XCTAssertEqual(gameBackground.content.components.count, 5)
        XCTAssertEqual(gameBackground.content.components.flatMap(\.animations).count, 10)
        _ = try gameBackground.playRecursively(component: "", animation: "inGame")
        XCTAssertTrue(gameBackground.isPlaying(
            component: "shakeContainer.backgroundHolder", animation: "inGame"))
    }

    func testRecursivePlayStartsParentThenChildrenInResourceOrderAndSkipsMissingAnimations() throws {
        let intro1 = makeAnimation("intro", endTimeMS: 100, events: [(0, "intro1-0")])
        let intro2 = makeAnimation("intro", endTimeMS: 200, events: [(0, "intro2-0")])
        let nested = makeAnimation("intro", endTimeMS: 0, events: [(0, "nested-0")])
        var player = try UIScreenAnimationPlayer(content: makeContent([
            makeComponent("bonusIntro", animations: []),
            makeComponent("bonusIntro.intro1", animations: [intro1]),
            makeComponent("bonusIntro.intro2", animations: [intro2]),
            makeComponent("bonusIntro.intro2.nested", animations: [nested]),
            makeComponent("unrelated", animations: [makeAnimation("intro", endTimeMS: 50)])
        ]))

        XCTAssertEqual(try player.playRecursively(component: "bonusIntro", animation: "intro"), [
            .event(component: "bonusIntro.intro1", animation: "intro",
                   command: "PlaySound", arguments: ["intro1-0"]),
            .event(component: "bonusIntro.intro2", animation: "intro",
                   command: "PlaySound", arguments: ["intro2-0"]),
            .event(component: "bonusIntro.intro2.nested", animation: "intro",
                   command: "PlaySound", arguments: ["nested-0"]),
            .completed(component: "bonusIntro.intro2.nested", animation: "intro")
        ])
        XCTAssertTrue(try player.isPlayingRecursively(component: "bonusIntro", animation: "intro"))
        XCTAssertFalse(try player.isPlayingRecursively(component: "bonusIntro.intro2.nested",
                                                       animation: "intro"))
        XCTAssertEqual(try player.advance(deltaSeconds: 0.1), [
            .completed(component: "bonusIntro.intro1", animation: "intro")
        ])
        XCTAssertEqual(try player.advance(deltaSeconds: 0.1), [
            .completed(component: "bonusIntro.intro2", animation: "intro")
        ])
        XCTAssertFalse(try player.isPlayingRecursively(component: "bonusIntro", animation: "intro"))
        XCTAssertTrue(try player.advance(deltaSeconds: 0.1).isEmpty,
                      "完成事件不得在后续 advance 重复")
    }

    func testRecursivePlaySkipsMissingTargetButRejectsUnknownRootAndPreservesClassicLookup() throws {
        var player = try UIScreenAnimationPlayer(content: makeContent([
            makeComponent("bonusIntro", animations: []),
            makeComponent("bonusIntro.intro1",
                          animations: [makeAnimation("intro", endTimeMS: 100)])
        ]))
        XCTAssertEqual(try player.playRecursively(component: "bonusIntro", animation: "missing"), [])
        XCTAssertThrowsError(try player.playRecursively(component: "missing", animation: "intro")) { error in
            XCTAssertEqual(error as? UIScreenAnimationError, .unknownComponent("missing"))
        }
        XCTAssertThrowsError(try player.play(component: "bonusIntro", animation: "missing")) { error in
            XCTAssertEqual(error as? UIScreenAnimationError,
                           .unknownAnimation(component: "bonusIntro", animation: "missing"))
        }
    }

    private func makeComponent(_ name: String,
                               animations: [UIScreenAnimationContent.Animation])
        -> UIScreenAnimationContent.Component {
        UIScreenAnimationContent.Component(name: name, animations: animations)
    }

    private func makeAnimation(_ name: String,
                               endTimeMS: Int,
                               events: [(Int, String)] = []) -> UIScreenAnimationContent.Animation {
        var tracks: [UIScreenAnimationContent.Track] = []
        if !events.isEmpty {
            tracks.append(UIScreenAnimationContent.Track(
                name: "_Events_",
                keyframes: events.map { event in
                    UIScreenAnimationContent.Keyframe(
                        timeMS: event.0,
                        interpolation: 0,
                        values: [],
                        events: [UIScreenAnimationContent.Event(command: "PlaySound",
                                                               arguments: [event.1])])
                }))
        }
        return UIScreenAnimationContent.Animation(name: name, endTimeMS: endTimeMS, tracks: tracks)
    }

    private func makeContent(_ components: [UIScreenAnimationContent.Component])
        -> UIScreenAnimationContent {
        UIScreenAnimationContent(
            formatVersion: 1,
            source: UIScreenAnimationContent.Source(file: "test.uiscreen",
                                                    sha256: String(repeating: "0", count: 64)),
            components: components)
    }
}
