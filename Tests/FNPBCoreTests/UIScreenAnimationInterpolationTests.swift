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

        var player = try makePlayer(interpolations: [2, 0, 3])
        XCTAssertEqual(try player.sample(component: "node", animation: "move",
                                         track: "position", atTimeMS: 250)[0],
                       expected, accuracy: 0.0000001)
        // The destination key's mode must not affect the preceding segment.
        XCTAssertEqual(try player.sample(component: "node", animation: "move",
                                         track: "position", atTimeMS: 750)[0], 1)
    }

    func testIdentityHoldAndBothVerifiedByteTables() throws {
        XCTAssertEqual(UIScreenInterpolation.curve(mode: 0, x: 0.37), 0.37)
        XCTAssertEqual(UIScreenInterpolation.curve(mode: 3, x: 0.75), 0)
        XCTAssertNil(UIScreenInterpolation.curve(mode: 1, x: 0.5))

        XCTAssertEqual(try XCTUnwrap(UIScreenInterpolation.curve(mode: 5, x: 0)), 0)
        XCTAssertEqual(try XCTUnwrap(UIScreenInterpolation.curve(mode: 5, x: 1)), 1)
        XCTAssertEqual(try XCTUnwrap(UIScreenInterpolation.curve(mode: 5, x: 18.5 / 99)),
                       0.5 / 255, accuracy: 0.0000001)
        XCTAssertEqual(try XCTUnwrap(UIScreenInterpolation.curve(mode: 5, x: 98.5 / 99)),
                       233 / 255, accuracy: 0.0000001)
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
            "_Events_": 0,
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

    private func makePlayer(track: String = "position", valueCount: Int = 3,
                            interpolations: [Int] = [0, 0],
                            events: [UIScreenAnimationContent.Event] = []) throws
        -> UIScreenAnimationPlayer {
        let keys = interpolations.enumerated().map { index, interpolation in
            UIScreenAnimationContent.Keyframe(
                timeMS: index * 1000, interpolation: interpolation,
                values: track == "_Events_" ? [] :
                    (0..<valueCount).map { Float($0 + index * 10) },
                events: index == 0 ? events : [])
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
