import Foundation
import XCTest
@testable import FNPBCore

final class UIScreenAnimationInterpolationTests: XCTestCase {
    func testModeTwoUsesExactReleaseConstantsAndOutgoingKeyframe() throws {
        let expected = 1 / (1 + powf(Float(bitPattern: 0x402d_f854), 6 * (-2 * Float(0.25) + 1)))
        XCTAssertEqual(try XCTUnwrap(UIScreenInterpolation.curve(mode: 2, x: 0.25)),
                       expected, accuracy: 0.0000001)
        XCTAssertEqual(try XCTUnwrap(UIScreenInterpolation.curve(mode: 2, x: 0.5)),
                       0.5, accuracy: 0.0000001)

        let player = try makePlayer(interpolations: [2, 0, 3])
        XCTAssertEqual(try player.sample(component: "node", animation: "move",
                                         track: "position", atTimeMS: 250)[0],
                       expected * 10, accuracy: 0.0000001)
        // The second segment uses key 1's linear mode; key 2's constant mode
        // applies only to the following segment. Linear 10...20 at 1500 ms is 15.
        XCTAssertEqual(try player.sample(component: "node", animation: "move",
                                         track: "position", atTimeMS: 1500)[0], 15)
    }

    func testEqualTimeKeysUseLastValueAndRetainEveryEvent() throws {
        func key(_ time: Int, _ value: Float) -> UIScreenAnimationContent.Keyframe {
            UIScreenAnimationContent.Keyframe(timeMS: time, interpolation: 0,
                                               values: [value, value, value], events: [])
        }
        func event(_ name: String) -> UIScreenAnimationContent.Keyframe {
            UIScreenAnimationContent.Keyframe(
                timeMS: 0, interpolation: 0, values: [],
                events: [UIScreenAnimationContent.Event(command: "PlaySound", arguments: [name])])
        }
        var player = try UIScreenAnimationPlayer(content: content([
            component("node", animations: [UIScreenAnimationContent.Animation(
                name: "move", endTimeMS: 2000, tracks: [
                    UIScreenAnimationContent.Track(name: "position", keyframes: [
                        key(0, 1), key(0, 7), key(1000, 11), key(1000, 21), key(2000, 31),
                    ]),
                    UIScreenAnimationContent.Track(name: "_Events_", keyframes: [
                        event("first"), event("second"),
                    ]),
                ])]),
        ]))
        XCTAssertEqual(try player.play(component: "node", animation: "move").map {
            guard case .event(_, _, _, let arguments) = $0 else { return "unexpected" }
            return arguments[0]
        }, ["first", "second"])
        for (time, expected) in [(0.0, Float(7)), (500, 9), (1000, 21), (1500, 26), (2000, 31)] {
            XCTAssertEqual(try player.sample(component: "node", animation: "move",
                                             track: "position", atTimeMS: time)[0],
                           expected, accuracy: 0.0000001, "at \(time) ms")
        }
    }

    func testModeOneUsesReleaseCosineEaseAndByteTables() throws {
        XCTAssertEqual(UIScreenInterpolation.curve(mode: 0, x: 0.37), 0.37)
        XCTAssertEqual(UIScreenInterpolation.curve(mode: 3, x: 0.75), 0)
        XCTAssertEqual(try XCTUnwrap(UIScreenInterpolation.curve(mode: 1, x: 0)),
                       0, accuracy: 0.0000001)
        XCTAssertEqual(try XCTUnwrap(UIScreenInterpolation.curve(mode: 1, x: 0.5)),
                       0.5, accuracy: 0.0000001)
        XCTAssertEqual(try XCTUnwrap(UIScreenInterpolation.curve(mode: 1, x: 1)),
                       1, accuracy: 0.0000001)

        XCTAssertEqual(try XCTUnwrap(UIScreenInterpolation.curve(mode: 5, x: 0)), 0)
        XCTAssertEqual(try XCTUnwrap(UIScreenInterpolation.curve(mode: 5, x: 1)), 1)
        XCTAssertEqual(try XCTUnwrap(UIScreenInterpolation.curve(mode: 5, x: 17.5 / 99)),
                       0.5 / 255, accuracy: 0.0000001)
        XCTAssertEqual(try XCTUnwrap(UIScreenInterpolation.curve(mode: 5, x: 98.5 / 99)),
                       239 / 255, accuracy: 0.0000001)
        XCTAssertEqual(try XCTUnwrap(UIScreenInterpolation.curve(mode: 7, x: 0)), 0)
        XCTAssertEqual(try XCTUnwrap(UIScreenInterpolation.curve(mode: 7, x: 1)), 1)
        XCTAssertEqual(try XCTUnwrap(UIScreenInterpolation.curve(mode: 7, x: 0.5 / 99)),
                       (0x22 / 2) / 255, accuracy: 0.0000001)
        XCTAssertNil(UIScreenInterpolation.curve(mode: 5, x: -0.01))
        XCTAssertNil(UIScreenInterpolation.curve(mode: 7, x: 1.01))
    }

    func testEveryAnimatedTrackDimensionIsValidated() throws {
        let dimensions = [
            "position": 3, "scale": 3, "rotation": 3,
            "colour": 4, "insideColour": 4, "outsideColour": 4,
            "texCoordPos": 2, "enabled": 1, "movescale": 1, "layer": 1,
            "_Events_": 0, "comment": 0,
        ]
        for (track, count) in dimensions {
            XCTAssertNoThrow(try makePlayer(track: track, valueCount: count))
            XCTAssertThrowsError(try makePlayer(track: track, valueCount: count + 1)) { error in
                guard case .invalidTimeline(_, _, let reason)? = error as? UIScreenAnimationError else {
                    return XCTFail("unexpected error: \(error)")
                }
                XCTAssertTrue(reason.contains("invalid value count"))
            }
        }
    }

    func testUnknownTrackAndFirstKeyframeInterpolationAreRejected() throws {
        XCTAssertThrowsError(try makePlayer(track: "notARealTrack", valueCount: 3)) { error in
            guard case .invalidTimeline(_, _, let reason)? = error as? UIScreenAnimationError else {
                return XCTFail("unexpected error: \(error)")
            }
            XCTAssertTrue(reason.contains("unknown track"))
        }
        XCTAssertThrowsError(try makePlayer(interpolations: [99, 0])) { error in
            XCTAssertEqual(error as? UIScreenAnimationError,
                           .unsupportedInterpolation(component: "node", animation: "move",
                                                     track: "position", timeMS: 0))
        }
    }

    func testEnabledSkipsCurveButEventsStillRejectInvalidPayloads() throws {
        XCTAssertNoThrow(try makePlayer(track: "enabled", valueCount: 1,
                                        interpolations: [99, 0]))
        let events = [UIScreenAnimationContent.Event(command: "PlaySound", arguments: ["valid"])]
        XCTAssertNoThrow(try makePlayer(track: "_Events_", valueCount: 0, events: events))
        XCTAssertThrowsError(try makePlayer(track: "_Events_", valueCount: 0,
                                            events: [UIScreenAnimationContent.Event(
                                                command: "NotSound", arguments: ["bad"])]))
        XCTAssertThrowsError(try makePlayer(track: "position", valueCount: 3,
                                            events: [UIScreenAnimationContent.Event(
                                                command: "PlaySound", arguments: [])]))
    }

    func testCommentRequiresExactlyOneStringPayloadAndNoNumericValues() throws {
        XCTAssertNoThrow(try makePlayer(track: "comment", valueCount: 0,
                                        interpolations: [99, 0]))
        XCTAssertThrowsError(try makePlayer(track: "comment", valueCount: 0,
                                            comment: nil)) { error in
            guard case .invalidTimeline(_, _, let reason)? = error as? UIScreenAnimationError else {
                return XCTFail("unexpected error: \(error)")
            }
            XCTAssertTrue(reason.contains("invalid comment payload"))
        }
        XCTAssertThrowsError(try makePlayer(track: "position", valueCount: 3,
                                            comment: "stray", forceComment: true)) { error in
            guard case .invalidTimeline(_, _, let reason)? = error as? UIScreenAnimationError else {
                return XCTFail("unexpected error: \(error)")
            }
            XCTAssertTrue(reason.contains("invalid comment payload"))
        }
    }

    func testEmptyScreenRootTraversesChildrenAndUnknownRootThrows() throws {
        let intro = UIScreenAnimationContent.Animation(
            name: "intro", endTimeMS: 100,
            tracks: [UIScreenAnimationContent.Track(name: "_Events_", keyframes: [
                UIScreenAnimationContent.Keyframe(timeMS: 0, interpolation: 0, values: [], events: [
                    UIScreenAnimationContent.Event(command: "PlaySound", arguments: ["root"]),
                ]),
            ])])
        let child = UIScreenAnimationContent.Animation(
            name: "intro", endTimeMS: 0,
            tracks: [UIScreenAnimationContent.Track(name: "_Events_", keyframes: [
                UIScreenAnimationContent.Keyframe(timeMS: 0, interpolation: 0, values: [], events: [
                    UIScreenAnimationContent.Event(command: "PlaySound", arguments: ["child"]),
                ]),
            ])])
        var player = try UIScreenAnimationPlayer(content: content([
            component("", animations: [intro]),
            component("challengeMods", animations: []),
            component("bonusIntro.intro1", animations: [child]),
        ]))
        // A detached branch is intentionally not visited from the screen root.
        let output = try player.playRecursively(component: "", animation: "intro")
        XCTAssertEqual(output.map { output in
            switch output {
            case .event(_, _, _, let arguments): return arguments[0]
            case .completed: return "completed"
            }
        }, ["root"])
        XCTAssertThrowsError(try player.playRecursively(component: "missing", animation: "intro")) {
            XCTAssertEqual($0 as? UIScreenAnimationError, .unknownComponent("missing"))
        }
    }

    func testClassicResourceRemainsValidAfterGeneralizedValidation() throws {
        let root = URL(fileURLWithPath: #filePath)
            .deletingLastPathComponent().deletingLastPathComponent().deletingLastPathComponent()
        let data = try Data(contentsOf: root.appendingPathComponent("Content/classicAnimations.json"))
        let player = try UIScreenAnimationPlayer(data: data)
        XCTAssertEqual(player.content.components.count, 6)
        XCTAssertEqual(try player.sample(component: "misscounters.cross1", animation: "in",
                                         track: "scale", atTimeMS: 122.5)[0],
                       0.75, accuracy: 0.00001)
    }

    func testGeneratedChallengeResourceRoundTripsThroughProductionValidator() throws {
        let root = URL(fileURLWithPath: #filePath)
            .deletingLastPathComponent().deletingLastPathComponent().deletingLastPathComponent()
        let data = try Data(contentsOf: root.appendingPathComponent("Content/challengeAnimations.json"))
        let player = try UIScreenAnimationPlayer(data: data)
        XCTAssertEqual(player.content.components.count, 142)
        XCTAssertEqual(player.content.components.flatMap(\.animations).count, 135)
        XCTAssertEqual(player.content.components.first?.name, "")
        XCTAssertNotNil(player.content.components.first { $0.name == "challengeMods" })
        XCTAssertNotNil(player.content.components.first { $0.name == "bonusIntro.intro1" })
        XCTAssertFalse(player.content.components.contains {
            $0.name.hasPrefix("inGameChallengeHud.")
        })
        let census = player.content.components.flatMap(\.animations).flatMap(\.tracks)
            .flatMap(\.keyframes).reduce(into: [Int: Int]()) { result, key in
                result[key.interpolation, default: 0] += 1
            }
        XCTAssertEqual(census, [0: 665, 2: 16, 3: 112, 5: 1, 7: 1])
    }

    func testEveryGeneratedChallengeScreenPassesProductionValidation() throws {
        let root = URL(fileURLWithPath: #filePath)
            .deletingLastPathComponent().deletingLastPathComponent().deletingLastPathComponent()
        let expected: [(String, Int, Int, Int)] = [
            ("challengeAnimations.json", 142, 135, 0),
            ("challengeBackgroundAnimations.json", 13, 17, 0),
            ("challengeScoreAnimations.json", 48, 34, 4),
            ("challengeScoreCompleteAnimations.json", 29, 27, 4),
            ("challengeScoreCompleteFailureAnimations.json", 18, 4, 0),
            ("challengeInstructionsAnimations.json", 21, 10, 0),
            ("challengeMapAnimations.json", 95, 86, 0),
        ]
        for (file, componentCount, animationCount, commentCount) in expected {
            let data = try Data(contentsOf: root.appendingPathComponent("Content/\(file)"))
            let player = try UIScreenAnimationPlayer(data: data)
            XCTAssertEqual(player.content.components.count, componentCount, file)
            XCTAssertEqual(player.content.components.flatMap(\.animations).count,
                           animationCount, file)
            XCTAssertEqual(player.content.components.first?.name, "", file)
            let comments = player.content.components.flatMap(\.animations).flatMap(\.tracks)
                .filter { $0.name == "comment" }.flatMap(\.keyframes)
            XCTAssertEqual(comments.count, commentCount, file)
            XCTAssertTrue(comments.allSatisfy { $0.values.isEmpty && $0.comment != nil }, file)
        }
    }

    private func makePlayer(track: String = "position", valueCount: Int = 3,
                            interpolations: [Int] = [0, 0],
                            events: [UIScreenAnimationContent.Event] = [],
                            comment: String? = "note",
                            forceComment: Bool = false) throws
        -> UIScreenAnimationPlayer {
        let keys = interpolations.enumerated().map { index, interpolation in
            UIScreenAnimationContent.Keyframe(
                timeMS: index * 1000, interpolation: interpolation,
                values: (0..<valueCount).map { Float($0 + index * 10) },
                events: index == 0 ? events : [],
                comment: track == "comment" || forceComment ? comment : nil)
        }
        return try UIScreenAnimationPlayer(content: content([
            component("node", animations: [UIScreenAnimationContent.Animation(
                name: "move", endTimeMS: max(0, (interpolations.count - 1) * 1000),
                tracks: [UIScreenAnimationContent.Track(name: track, keyframes: keys)])]),
        ]))
    }

    private func component(_ name: String,
                           animations: [UIScreenAnimationContent.Animation])
        -> UIScreenAnimationContent.Component {
        UIScreenAnimationContent.Component(name: name, animations: animations)
    }

    private func content(_ components: [UIScreenAnimationContent.Component])
        -> UIScreenAnimationContent {
        UIScreenAnimationContent(formatVersion: 1,
                                 source: UIScreenAnimationContent.Source(
                                    file: "test.uiscreen", sha256: String(repeating: "0", count: 64)),
                                 components: components)
    }
}
