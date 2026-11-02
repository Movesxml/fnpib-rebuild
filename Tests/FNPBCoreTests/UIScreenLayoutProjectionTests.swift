import Foundation
import XCTest
@testable import FNPBCore

final class UIScreenLayoutProjectionTests: XCTestCase {
    func testDefaultsAndStaticLayoutWithoutAnimation() throws {
        let staticLayout = UIScreenAnimationContent.Component.Layout(
            position: [1, 2, 3], scale: [2, 3, 4], origin: [5, 6, 7],
            rotation: [0, 0, 0], width: 12, height: 34, originFromCenter: false)
        let player = try UIScreenAnimationPlayer(content: makeContent([
            UIScreenAnimationContent.Component(name: "defaults", animations: [], parentIndex: -1),
            UIScreenAnimationContent.Component(
                name: "static", animations: [], parentIndex: -1, layout: staticLayout),
        ]))

        let projection = try UIScreenLayoutProjection.project(player)
        XCTAssertEqual(projection.components.count, 2)
        let defaults = projection.components[0]
        XCTAssertEqual(defaults.position, UIScreenPoint3(x: 0, y: 0, z: 0))
        XCTAssertEqual(defaults.scale, UIScreenPoint3(x: 1, y: 1, z: 1))
        XCTAssertEqual(defaults.rotation, UIScreenPoint3(x: 0, y: 0, z: 0))
        XCTAssertEqual(defaults.width, 100)
        XCTAssertEqual(defaults.height, 100)
        XCTAssertEqual(defaults.origin, UIScreenPoint3(x: 0, y: 0, z: 0))
        XCTAssertFalse(defaults.originFromCenter)
        XCTAssertEqual(defaults.effectiveOrigin, UIScreenPoint3(x: 0, y: 0, z: 0))

        let staticComponent = projection.components[1]
        XCTAssertEqual(staticComponent.position, UIScreenPoint3(x: 1, y: 2, z: 3))
        XCTAssertEqual(staticComponent.scale, UIScreenPoint3(x: 2, y: 3, z: 4))
        XCTAssertEqual(staticComponent.rotation, UIScreenPoint3(x: 0, y: 0, z: 0))
        XCTAssertEqual(staticComponent.width, 12)
        XCTAssertEqual(staticComponent.height, 34)
        XCTAssertEqual(staticComponent.origin, UIScreenPoint3(x: 5, y: 6, z: 7))
        XCTAssertFalse(staticComponent.originFromCenter)
        XCTAssertEqual(staticComponent.effectiveOrigin, UIScreenPoint3(x: 5, y: 6, z: 7))
    }

    func testActiveAnimationWithoutTrackFallsBackToStaticAndUnknownTrackIsTheOnlySuppressedError() throws {
        let layout = UIScreenAnimationContent.Component.Layout(
            position: [1, 2, 3], scale: [2, 3, 4], origin: [0, 0, 0],
            rotation: [0, 0, 0], width: 10, height: 20)
        let positionTrack = UIScreenAnimationContent.Track(
            name: "position", keyframes: [
                keyframe(0, [10, 20, 30]), keyframe(100, [20, 30, 40]),
            ])
        let animation = UIScreenAnimationContent.Animation(
            name: "move", endTimeMS: 100, tracks: [positionTrack])
        var player = try UIScreenAnimationPlayer(content: makeContent([
            UIScreenAnimationContent.Component(
                name: "moving", animations: [animation], parentIndex: -1, layout: layout),
            UIScreenAnimationContent.Component(
                name: "inactive", animations: [], parentIndex: -1, layout: layout),
        ]))

        _ = try player.play(component: "moving", animation: "move")
        let projection = try UIScreenLayoutProjection.project(player)
        let moving = projection.components[0]
        XCTAssertEqual(moving.position, UIScreenPoint3(x: 10, y: 20, z: 30))
        XCTAssertEqual(moving.scale, UIScreenPoint3(x: 2, y: 3, z: 4))
        XCTAssertEqual(moving.rotation, UIScreenPoint3(x: 0, y: 0, z: 0))
        let inactive = projection.components[1]
        XCTAssertEqual(inactive.position, UIScreenPoint3(x: 1, y: 2, z: 3))
        XCTAssertEqual(inactive.scale, UIScreenPoint3(x: 2, y: 3, z: 4))
        XCTAssertEqual(inactive.rotation, UIScreenPoint3(x: 0, y: 0, z: 0))

        XCTAssertNil(try UIScreenLayoutProjection.sampledValues {
            throw UIScreenAnimationError.unknownTrack(
                component: "moving", animation: "move", track: "scale")
        })
        XCTAssertThrowsError(try UIScreenLayoutProjection.sampledValues {
            throw UIScreenAnimationError.invalidTimeline(
                component: "moving", animation: "move", reason: "boom")
        }) { error in
            XCTAssertEqual(error as? UIScreenAnimationError,
                .invalidTimeline(component: "moving", animation: "move", reason: "boom"))
        }
    }

    func testIconSlot1OriginalLayoutUsesNonCenterOrigin() throws {
        let projection = try UIScreenLayoutProjection.project(productionChallengeMapPlayer())
        let slot = try XCTUnwrap(projection.components.first {
            $0.name == "challengeContainer.spinner.iconSlot1"
        })
        XCTAssertEqual(slot.position, UIScreenPoint3(x: 126, y: 42.5, z: 0))
        XCTAssertEqual(slot.origin, UIScreenPoint3(x: 83.5, y: 0, z: 0))
        XCTAssertEqual(slot.scale, UIScreenPoint3(x: 1, y: 1, z: 1))
        XCTAssertEqual(slot.width, 83)
        XCTAssertEqual(slot.height, 83)
        XCTAssertFalse(slot.originFromCenter)
        XCTAssertEqual(slot.effectiveOrigin, UIScreenPoint3(x: 83.5, y: 0, z: 0))
    }

    func testOriginFromCenterAddsHalfWidthAndHeight() throws {
        let layout = UIScreenAnimationContent.Component.Layout(
            position: [100, 200, 0], origin: [10, 20, 5], width: 40, height: 60,
            originFromCenter: true)
        let player = try UIScreenAnimationPlayer(content: makeContent([
            UIScreenAnimationContent.Component(
                name: "centered", animations: [], parentIndex: -1, layout: layout),
        ]))
        let component = try UIScreenLayoutProjection.project(player).components[0]
        XCTAssertEqual(component.effectiveOrigin, UIScreenPoint3(x: 30, y: 50, z: 5))
        assertPoint(component.worldOrigin, UIScreenPoint3(x: 70, y: 150, z: -5))
        assertPoint(component.worldCorners.minimumXMinimumY, UIScreenPoint3(x: 70, y: 150, z: -5))
        assertPoint(component.worldCorners.maximumXMinimumY, UIScreenPoint3(x: 110, y: 150, z: -5))
        assertPoint(component.worldCorners.maximumXMaximumY, UIScreenPoint3(x: 110, y: 210, z: -5))
        assertPoint(component.worldCorners.minimumXMaximumY, UIScreenPoint3(x: 70, y: 210, z: -5))
    }

    func testParentTranslationRotationAndScalePropagateWithNonCommutativeWorldAndTRSOrder() throws {
        let components = [
            UIScreenAnimationContent.Component(
                name: "translationScaleParent", animations: [], parentIndex: -1,
                layout: UIScreenAnimationContent.Component.Layout(
                    position: [10, 0, 0], scale: [2, 1, 1])),
            UIScreenAnimationContent.Component(
                name: "translationScaleChild", animations: [], parentIndex: 0,
                layout: UIScreenAnimationContent.Component.Layout(position: [5, 0, 0])),
            UIScreenAnimationContent.Component(
                name: "rotationParent", animations: [], parentIndex: -1,
                layout: UIScreenAnimationContent.Component.Layout(rotation: [0, 0, -90])),
            UIScreenAnimationContent.Component(
                name: "rotationChild", animations: [], parentIndex: 2,
                layout: UIScreenAnimationContent.Component.Layout(position: [0, 10, 0])),
            UIScreenAnimationContent.Component(
                name: "scaleParent", animations: [], parentIndex: -1,
                layout: UIScreenAnimationContent.Component.Layout(scale: [2, 3, 1])),
            UIScreenAnimationContent.Component(
                name: "scaleChild", animations: [], parentIndex: 4,
                layout: UIScreenAnimationContent.Component.Layout(position: [1, 2, 0])),
            UIScreenAnimationContent.Component(
                name: "localOrder", animations: [], parentIndex: -1,
                layout: UIScreenAnimationContent.Component.Layout(
                    position: [10, 20, 0], scale: [2, 3, 1], rotation: [0, 0, -90])),
        ]
        let projection = try UIScreenLayoutProjection.project(
            UIScreenAnimationPlayer(content: makeContent(components)))

        let translationParent = projection.components[0]
        let translationChild = projection.components[1]
        assertPoint(translationChild.worldOrigin, UIScreenPoint3(x: 20, y: 0, z: 0))
        XCTAssertEqual(translationChild.worldMatrix,
            translationParent.localMatrix * translationChild.localMatrix)
        XCTAssertNotEqual(translationParent.localMatrix * translationChild.localMatrix,
            translationChild.localMatrix * translationParent.localMatrix)
        assertPoint(projection.components[3].worldOrigin,
            UIScreenPoint3(x: -10, y: 0, z: 0), accuracy: 0.001)
        assertPoint(projection.components[5].worldOrigin, UIScreenPoint3(x: 2, y: 6, z: 0))

        let localOrder = projection.components[6]
        assertPoint(localOrder.localMatrix.transformed(UIScreenPoint3(x: 1, y: 0, z: 0)),
            UIScreenPoint3(x: 10, y: 22, z: 0), accuracy: 0.001)
        let translation = UIScreenMatrix4.translation(UIScreenPoint3(x: 10, y: 20, z: 0))
        let rotation = UIScreenMatrix4.rotationZ(
            radians: 90 * Float(bitPattern: 0x3c8e_fa35))
        let scale = UIScreenMatrix4.scale(UIScreenPoint3(x: 2, y: 3, z: 1))
        XCTAssertEqual(localOrder.localMatrix, translation * rotation * scale)
        XCTAssertNotEqual(localOrder.localMatrix, translation * scale * rotation)
    }

    func testAnimationOverridesPositionScaleRotationAndCompletedEndFrameRemainsProjectable() throws {
        let layout = UIScreenAnimationContent.Component.Layout(
            position: [1, 2, 3], scale: [2, 2, 2], rotation: [0, 0, 0],
            width: 10, height: 20)
        let animation = UIScreenAnimationContent.Animation(
            name: "anim", endTimeMS: 100, tracks: [
                UIScreenAnimationContent.Track(name: "position", keyframes: [
                    keyframe(0, [10, 20, 30]), keyframe(100, [40, 50, 60])]),
                UIScreenAnimationContent.Track(name: "scale", keyframes: [
                    keyframe(0, [3, 4, 5]), keyframe(100, [6, 7, 8])]),
                UIScreenAnimationContent.Track(name: "rotation", keyframes: [
                    keyframe(0, [0, 0, 0]), keyframe(100, [0, 0, -90])]),
            ])
        var player = try UIScreenAnimationPlayer(content: makeContent([
            UIScreenAnimationContent.Component(
                name: "animated", animations: [animation], parentIndex: -1, layout: layout),
        ]))

        _ = try player.play(component: "animated", animation: "anim")
        let start = try UIScreenLayoutProjection.project(player).components[0]
        XCTAssertEqual(start.position, UIScreenPoint3(x: 10, y: 20, z: 30))
        XCTAssertEqual(start.scale, UIScreenPoint3(x: 3, y: 4, z: 5))
        XCTAssertEqual(start.rotation, UIScreenPoint3(x: 0, y: 0, z: 0))
        _ = try player.advance(deltaSeconds: 1)
        XCTAssertFalse(player.isPlaying(component: "animated", animation: "anim"))
        let end = try UIScreenLayoutProjection.project(player).components[0]
        XCTAssertEqual(end.position, UIScreenPoint3(x: 40, y: 50, z: 60))
        XCTAssertEqual(end.scale, UIScreenPoint3(x: 6, y: 7, z: 8))
        XCTAssertEqual(end.rotation, UIScreenPoint3(x: 0, y: 0, z: -90))
    }

    func testMultiNodeParentCycleIsRejected() throws {
        let player = try UIScreenAnimationPlayer(content: makeContent([
            UIScreenAnimationContent.Component(name: "root", animations: [], parentIndex: -1),
            UIScreenAnimationContent.Component(name: "a", animations: [], parentIndex: 2),
            UIScreenAnimationContent.Component(name: "b", animations: [], parentIndex: 1),
        ]))
        XCTAssertThrowsError(try UIScreenLayoutProjection.project(player)) { error in
            XCTAssertEqual(error as? UIScreenLayoutProjectionError,
                .parentCycle(path: ["a", "b", "a"]))
        }
    }

    func testProductionChallengeMapAnimationsProjectCompletely() throws {
        let player = try productionChallengeMapPlayer()
        XCTAssertEqual(player.content.components.count, 95)
        let projection = try UIScreenLayoutProjection.project(player)
        XCTAssertEqual(projection.components.count, 95)
        XCTAssertEqual(projection.components.map(\.name), player.content.components.map(\.name))
        for (index, component) in projection.components.enumerated() {
            XCTAssertEqual(component.index, index)
            XCTAssertTrue(component.localMatrix.elements.allSatisfy { $0.isFinite })
            XCTAssertTrue(component.worldMatrix.elements.allSatisfy { $0.isFinite })
        }
    }

    private func productionChallengeMapPlayer() throws -> UIScreenAnimationPlayer {
        let data = try Data(contentsOf: repositoryRoot()
            .appendingPathComponent("Content/challengeMapAnimations.json"))
        return try UIScreenAnimationPlayer(data: data)
    }

    private func repositoryRoot() -> URL {
        URL(fileURLWithPath: #filePath)
            .deletingLastPathComponent().deletingLastPathComponent().deletingLastPathComponent()
    }

    private func keyframe(_ timeMS: Int, _ values: [Float]) -> UIScreenAnimationContent.Keyframe {
        UIScreenAnimationContent.Keyframe(
            timeMS: timeMS, interpolation: 0, values: values, events: [])
    }

    private func makeContent(_ components: [UIScreenAnimationContent.Component])
        -> UIScreenAnimationContent {
        UIScreenAnimationContent(
            formatVersion: 1,
            source: UIScreenAnimationContent.Source(
                file: "test.uiscreen", sha256: String(repeating: "0", count: 64)),
            components: components)
    }

    private func assertPoint(_ actual: UIScreenPoint3,
                             _ expected: UIScreenPoint3,
                             accuracy: Float = 0.00001,
                             file: StaticString = #filePath,
                             line: UInt = #line) {
        XCTAssertEqual(actual.x, expected.x, accuracy: accuracy, file: file, line: line)
        XCTAssertEqual(actual.y, expected.y, accuracy: accuracy, file: file, line: line)
        XCTAssertEqual(actual.z, expected.z, accuracy: accuracy, file: file, line: line)
    }
}
