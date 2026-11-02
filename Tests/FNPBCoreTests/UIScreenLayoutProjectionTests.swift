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

    func testRootViewportScaleModesUseVerifiedRatiosAndUnknownFallsBackToScale() throws {
        let cases: [(UIScreenViewportScaleMode, UIScreenPoint3)] = [
            (.none, UIScreenPoint3(x: 1, y: 1, z: 1)),
            (.keepAspect, UIScreenPoint3(x: 1.5, y: 1.5, z: 1)),
            (.scaleX, UIScreenPoint3(x: 2, y: 2, z: 1)),
            (.scaleY, UIScreenPoint3(x: 1.5, y: 1.5, z: 1)),
            (.scale, UIScreenPoint3(x: 2, y: 1.5, z: 1)),
        ]

        for (mode, expected) in cases {
            let viewport = try UIScreenRootViewport(
                deviceWidth: 960, deviceHeight: 480, scaleToViewportMode: mode)
            assertPoint(viewport.rootScale, expected)
            XCTAssertEqual(viewport.xRatio, 2)
            XCTAssertEqual(viewport.yRatio, 1.5)
        }

        let unknown = UIScreenViewportScaleMode(rawValue: 99)
        let unknownViewport = try UIScreenRootViewport(
            deviceWidth: 960, deviceHeight: 480, scaleToViewportMode: unknown)
        assertPoint(unknownViewport.rootScale, UIScreenPoint3(x: 2, y: 1.5, z: 1))
        XCTAssertFalse(unknown.isVerified)
        XCTAssertEqual(UIScreenViewportScaleMode.verifiedModes.map(\.rawValue), [0, 1, 2, 3, 4])
    }

    func testRootViewportRejectsNonFiniteAndNonPositiveDimensions() throws {
        let invalidDeviceCases: [(String, Float, Float)] = [
            ("deviceWidth", .nan, 320),
            ("deviceWidth", .infinity, 320),
            ("deviceWidth", 0, 320),
            ("deviceWidth", -1, 320),
            ("deviceHeight", 480, .nan),
            ("deviceHeight", 480, .infinity),
            ("deviceHeight", 480, 0),
            ("deviceHeight", 480, -1),
        ]

        for (expectedName, width, height) in invalidDeviceCases {
            XCTAssertThrowsError(try UIScreenRootViewport(
                deviceWidth: width, deviceHeight: height)) { error in
                guard case let UIScreenRootViewportError.invalidDimension(name, _) = error else {
                    XCTFail("expected invalidDimension, got \(error)")
                    return
                }
                XCTAssertEqual(name, expectedName)
            }
        }

        let invalidDesignCases: [(String, Float, Float)] = [
            ("designWidth", .nan, 320),
            ("designWidth", 0, 320),
            ("designHeight", 480, .infinity),
            ("designHeight", 480, -320),
        ]

        for (expectedName, designWidth, designHeight) in invalidDesignCases {
            XCTAssertThrowsError(try UIScreenRootViewport(
                deviceWidth: 480, deviceHeight: 320,
                designWidth: designWidth, designHeight: designHeight)) { error in
                guard case let UIScreenRootViewportError.invalidDimension(name, _) = error else {
                    XCTFail("expected invalidDimension, got \(error)")
                    return
                }
                XCTAssertEqual(name, expectedName)
            }
        }
    }

    func testDeviceProjectionAppliesRootScaleOnceAndKeepsLocalMatricesLogical() throws {
        let viewport = try UIScreenRootViewport(deviceWidth: 960, deviceHeight: 480)
        XCTAssertEqual(viewport.scaleToViewportMode, .scale)
        assertPoint(viewport.rootScale, UIScreenPoint3(x: 2, y: 1.5, z: 1))

        let player = try UIScreenAnimationPlayer(content: makeContent([
            UIScreenAnimationContent.Component(
                name: "static", animations: [], parentIndex: -1,
                layout: UIScreenAnimationContent.Component.Layout(
                    position: [10, 20, 0], scale: [2, 3, 1], origin: [1, 2, 0],
                    rotation: [0, 0, 0], width: 4, height: 6, originFromCenter: false)),
            UIScreenAnimationContent.Component(
                name: "child", animations: [], parentIndex: 0,
                layout: UIScreenAnimationContent.Component.Layout(position: [5, 10, 0])),
        ]))

        let logical = try UIScreenLayoutProjection.project(player)
        let device = try UIScreenLayoutProjection.projectDevicePixels(player, viewport: viewport)
        XCTAssertEqual(device.components.count, logical.components.count)

        let staticLogical = logical.components[0]
        let staticDevice = device.components[0]
        XCTAssertEqual(staticDevice.position, staticLogical.position)
        XCTAssertEqual(staticDevice.localMatrix, staticLogical.localMatrix)
        XCTAssertEqual(staticDevice.worldMatrix, viewport.rootScaleMatrix * staticLogical.worldMatrix)
        assertPoint(staticDevice.worldOrigin, UIScreenPoint3(x: 16, y: 21, z: 0))
        assertPoint(staticDevice.worldCorners.minimumXMinimumY, UIScreenPoint3(x: 16, y: 21, z: 0))
        assertPoint(staticDevice.worldCorners.maximumXMinimumY, UIScreenPoint3(x: 32, y: 21, z: 0))
        assertPoint(staticDevice.worldCorners.maximumXMaximumY, UIScreenPoint3(x: 32, y: 48, z: 0))
        assertPoint(staticDevice.worldCorners.minimumXMaximumY, UIScreenPoint3(x: 16, y: 48, z: 0))

        let childLogical = logical.components[1]
        let childDevice = device.components[1]
        XCTAssertEqual(childDevice.position, childLogical.position)
        XCTAssertEqual(childDevice.localMatrix, childLogical.localMatrix)
        XCTAssertEqual(childDevice.worldMatrix, viewport.rootScaleMatrix * childLogical.worldMatrix)
        XCTAssertNotEqual(childDevice.worldMatrix,
            viewport.rootScaleMatrix * viewport.rootScaleMatrix * childLogical.worldMatrix)
    }

    func testProductionChallengeMapDeviceProjectionUsesDefaultScaleAndCoversAll95Components() throws {
        let player = try productionChallengeMapPlayer()
        XCTAssertEqual(player.content.components.count, 95)
        let viewport = try UIScreenRootViewport(deviceWidth: 960, deviceHeight: 480)
        let logical = try UIScreenLayoutProjection.project(player)
        let device = try UIScreenLayoutProjection.projectDevicePixels(player, viewport: viewport)
        XCTAssertEqual(device.components.count, 95)
        XCTAssertEqual(device.components.map(\.name), logical.components.map(\.name))

        for (logicalComponent, deviceComponent) in zip(logical.components, device.components) {
            XCTAssertEqual(deviceComponent.position, logicalComponent.position)
            XCTAssertEqual(deviceComponent.localMatrix, logicalComponent.localMatrix)
            XCTAssertEqual(deviceComponent.effectiveOrigin, logicalComponent.effectiveOrigin)
            XCTAssertEqual(deviceComponent.worldMatrix,
                           viewport.rootScaleMatrix * logicalComponent.worldMatrix)
            assertPoint(deviceComponent.worldOrigin,
                        scaled(logicalComponent.worldOrigin, by: viewport.rootScale),
                        accuracy: 0.0001)
            assertPoint(deviceComponent.worldCorners.minimumXMinimumY,
                        scaled(logicalComponent.worldCorners.minimumXMinimumY, by: viewport.rootScale),
                        accuracy: 0.0001)
            assertPoint(deviceComponent.worldCorners.maximumXMinimumY,
                        scaled(logicalComponent.worldCorners.maximumXMinimumY, by: viewport.rootScale),
                        accuracy: 0.0001)
            assertPoint(deviceComponent.worldCorners.maximumXMaximumY,
                        scaled(logicalComponent.worldCorners.maximumXMaximumY, by: viewport.rootScale),
                        accuracy: 0.0001)
            assertPoint(deviceComponent.worldCorners.minimumXMaximumY,
                        scaled(logicalComponent.worldCorners.minimumXMaximumY, by: viewport.rootScale),
                        accuracy: 0.0001)
        }

        let slot = try XCTUnwrap(device.components.first {
            $0.name == "challengeContainer.spinner.iconSlot1"
        })
        XCTAssertEqual(slot.position, UIScreenPoint3(x: 126, y: 42.5, z: 0))
        XCTAssertEqual(slot.origin, UIScreenPoint3(x: 83.5, y: 0, z: 0))
        XCTAssertEqual(slot.width, 83)
        XCTAssertEqual(slot.height, 83)
        XCTAssertFalse(slot.originFromCenter)
        XCTAssertEqual(slot.effectiveOrigin, UIScreenPoint3(x: 83.5, y: 0, z: 0))
    }

    // MARK: - Original drawing attributes

    func testCoreDrawingDefaultsUseWhiteOpaqueTexturelessIdentityUVAndEnabled() throws {
        let player = try UIScreenAnimationPlayer(content: makeContent([
            UIScreenAnimationContent.Component(name: "defaults", animations: [], parentIndex: -1),
        ]))
        let component = try UIScreenLayoutProjection.project(player).components[0]
        XCTAssertEqual(component.localRGBA, .white)
        XCTAssertEqual(component.absoluteRGBA, .white)
        XCTAssertTrue(component.enabled)
        XCTAssertNil(component.texturePath)
        XCTAssertEqual(component.texCoord.topLeft, [0, 0])
        XCTAssertEqual(component.texCoord.topRight, [1, 0])
        XCTAssertEqual(component.texCoord.bottomLeft, [0, 1])
        XCTAssertEqual(component.texCoord.bottomRight, [1, 1])
    }

    func testColourAnimationUsesOriginalFloatOrderBeforeByteTruncation() throws {
        let animation = UIScreenAnimationContent.Animation(
            name: "fade", endTimeMS: 100, tracks: [
                UIScreenAnimationContent.Track(name: "colour", keyframes: [
                    keyframe(0, [0, 0, 0, 255]), keyframe(100, [25, 25, 25, 255]),
                ]),
            ])
        var player = try UIScreenAnimationPlayer(content: makeContent([
            UIScreenAnimationContent.Component(
                name: "tinted", animations: [animation], parentIndex: -1),
        ]))
        _ = try player.play(component: "tinted", animation: "fade")
        let sampled = try player.sample(component: "tinted", animation: "fade",
                                       track: "colour", atTimeMS: 40)
        XCTAssertEqual(sampled[0].bitPattern, Float(9.999999046325684).bitPattern)
        _ = try player.advance(deltaSeconds: 0.04)
        let component = try UIScreenLayoutProjection.project(player).components[0]
        // The common previous + delta * amount expression would incorrectly yield 10.
        XCTAssertEqual(component.localRGBA,
                       UIScreenRGBA(red: 9, green: 9, blue: 9, alpha: 255))
        XCTAssertEqual(component.absoluteRGBA, component.localRGBA)
    }

    func testActiveColourTrackOverridesStaticAndTruncatesInterpolatedChannels() throws {
        let layout = UIScreenAnimationContent.Component.Layout(colour: [0, 0, 0, 255])
        let animation = UIScreenAnimationContent.Animation(
            name: "fade", endTimeMS: 100, tracks: [
                UIScreenAnimationContent.Track(name: "colour", keyframes: [
                    keyframe(0, [0, 0, 0, 0]), keyframe(100, [255, 255, 255, 255]),
                ]),
            ])
        var player = try UIScreenAnimationPlayer(content: makeContent([
            UIScreenAnimationContent.Component(
                name: "tinted", animations: [animation], parentIndex: -1, layout: layout),
        ]))
        _ = try player.play(component: "tinted", animation: "fade")
        _ = try player.advance(deltaSeconds: 0.05)
        let component = try UIScreenLayoutProjection.project(player).components[0]
        XCTAssertEqual(component.localRGBA,
                       UIScreenRGBA(red: 127, green: 127, blue: 127, alpha: 127))
        XCTAssertEqual(component.absoluteRGBA, component.localRGBA)
    }

    func testAbsoluteColourModulatesEveryAncestorLevelWithTruncation() throws {
        let layout = UIScreenAnimationContent.Component.Layout(
            colour: [200, 200, 200, 255])
        let player = try UIScreenAnimationPlayer(content: makeContent([
            UIScreenAnimationContent.Component(
                name: "grandparent", animations: [], parentIndex: -1, layout: layout),
            UIScreenAnimationContent.Component(
                name: "parent", animations: [], parentIndex: 0, layout: layout),
            UIScreenAnimationContent.Component(
                name: "child", animations: [], parentIndex: 1, layout: layout),
        ]))
        let projection = try UIScreenLayoutProjection.project(player)
        XCTAssertEqual(projection.components[0].absoluteRGBA,
                       UIScreenRGBA(red: 200, green: 200, blue: 200, alpha: 255))
        XCTAssertEqual(projection.components[1].absoluteRGBA,
                       UIScreenRGBA(red: 156, green: 156, blue: 156, alpha: 255))
        XCTAssertEqual(projection.components[2].absoluteRGBA,
                       UIScreenRGBA(red: 122, green: 122, blue: 122, alpha: 255))
    }

    func testEnabledDoesNotInheritAndDrawNinePatchIsNotTreatedAsEnabled() throws {
        let player = try UIScreenAnimationPlayer(content: makeContent([
            UIScreenAnimationContent.Component(
                name: "disabledParent", animations: [], parentIndex: -1,
                layout: UIScreenAnimationContent.Component.Layout(enabled: false)),
            UIScreenAnimationContent.Component(
                name: "child", animations: [], parentIndex: 0),
            UIScreenAnimationContent.Component(
                name: "ninePatch", animations: [], parentIndex: -1,
                layout: UIScreenAnimationContent.Component.Layout(
                    enabled: true, drawNinePatch: true)),
            UIScreenAnimationContent.Component(
                name: "disabledNinePatch", animations: [], parentIndex: -1,
                layout: UIScreenAnimationContent.Component.Layout(
                    enabled: false, drawNinePatch: true)),
        ]))
        let projection = try UIScreenLayoutProjection.project(player)
        XCTAssertFalse(projection.components[0].enabled)
        XCTAssertTrue(projection.components[1].enabled)
        XCTAssertTrue(projection.components[2].enabled)
        XCTAssertFalse(projection.components[3].enabled)
    }

    func testNegativeTextureCoordinateSizeIsNotNormalized() throws {
        let layout = UIScreenAnimationContent.Component.Layout(
            texture: "textures/icon.png", width: 10, height: 10,
            texCoordPos: [0.1, 0.2], texCoordSize: [-0.5, -0.25])
        let player = try UIScreenAnimationPlayer(content: makeContent([
            UIScreenAnimationContent.Component(
                name: "uv", animations: [], parentIndex: -1, layout: layout),
        ]))
        let component = try UIScreenLayoutProjection.project(player).components[0]
        XCTAssertEqual(component.texturePath, "textures/icon.png")
        XCTAssertEqual(component.texCoord.topLeft, [0.1, 0.2])
        XCTAssertEqual(component.texCoord.topRight, [-0.4, 0.2])
        // Preserve the original Float addition, rather than treating decimal -0.05 as exact.
        let expectedV = Float(0.2) + Float(-0.25)
        XCTAssertEqual(component.texCoord.bottomLeft, [0.1, expectedV])
        XCTAssertEqual(component.texCoord.bottomRight, [-0.4, expectedV])
    }

    func testScreenVisibilityUsesStrictAABBBoundaries() throws {
        func visible(position: [Float]) throws -> Bool {
            let layout = UIScreenAnimationContent.Component.Layout(
                position: position, width: 0, height: 0)
            let player = try UIScreenAnimationPlayer(content: makeContent([
                UIScreenAnimationContent.Component(
                    name: "v", animations: [], parentIndex: -1, layout: layout),
            ]))
            return try UIScreenLayoutProjection.project(player).components[0].screenVisibility
        }
        XCTAssertTrue(try visible(position: [10, 10, 0]))
        XCTAssertFalse(try visible(position: [0, 10, 0]))
        XCTAssertTrue(try visible(position: [0.5, 10, 0]))
        XCTAssertFalse(try visible(position: [480, 10, 0]))
        XCTAssertTrue(try visible(position: [479.5, 10, 0]))
        XCTAssertFalse(try visible(position: [10, 0, 0]))
        XCTAssertTrue(try visible(position: [10, 0.5, 0]))
        XCTAssertFalse(try visible(position: [10, 320, 0]))
        XCTAssertTrue(try visible(position: [10, 319.5, 0]))
    }

    func testDeviceProjectionRecomputesVisibilityAndPreservesDrawingAttributes() throws {
        let layout = UIScreenAnimationContent.Component.Layout(
            texture: "textures/probe.png", position: [10, 310, 0], width: 10, height: 10,
            colour: [12, 34, 56, 78], texCoordPos: [0.25, 0.5], texCoordSize: [0.5, 0.25])
        let player = try UIScreenAnimationPlayer(content: makeContent([
            UIScreenAnimationContent.Component(
                name: "tall", animations: [], parentIndex: -1, layout: layout),
        ]))
        let logical = try UIScreenLayoutProjection.project(player)
        XCTAssertTrue(logical.components[0].screenVisibility)
        let viewport = try UIScreenRootViewport(
            deviceWidth: 960, deviceHeight: 480, scaleToViewportMode: .scaleX)
        let device = try UIScreenLayoutProjection.projectDevicePixels(player, viewport: viewport)
        XCTAssertFalse(device.components[0].screenVisibility)
        let logicalComponent = logical.components[0]
        let deviceComponent = device.components[0]
        XCTAssertEqual(deviceComponent.localRGBA, logicalComponent.localRGBA)
        XCTAssertEqual(deviceComponent.absoluteRGBA, logicalComponent.absoluteRGBA)
        XCTAssertEqual(deviceComponent.enabled, logicalComponent.enabled)
        XCTAssertEqual(deviceComponent.texturePath, logicalComponent.texturePath)
        XCTAssertEqual(deviceComponent.texCoord, logicalComponent.texCoord)
        XCTAssertEqual(deviceComponent.worldMatrix,
                       viewport.rootScaleMatrix * logicalComponent.worldMatrix)
    }

    func testProductionChallengeMapCoreDrawingAttributesAreFiniteAndLegal() throws {
        let projection = try UIScreenLayoutProjection.project(productionChallengeMapPlayer())
        XCTAssertEqual(projection.components.count, 95)
        for component in projection.components {
            if let texturePath = component.texturePath {
                XCTAssertFalse(texturePath.isEmpty, "\(component.name) has an empty texture path")
            }
            XCTAssertEqual(component.texCoord.position.count, 2)
            XCTAssertEqual(component.texCoord.size.count, 2)
            for value in component.texCoord.position + component.texCoord.size {
                XCTAssertTrue(value.isFinite, "\(component.name) has non-finite texture coordinates")
            }
            XCTAssertEqual(component.localRGBA.bytes.count, 4)
            XCTAssertEqual(component.absoluteRGBA.bytes.count, 4)
        }
    }

    // MARK: - Layer projection

    func testLayerDefaultsToMinusOneAndStaticPositiveLayerIsPreserved() throws {
        let player = try UIScreenAnimationPlayer(content: makeContent([
            UIScreenAnimationContent.Component(
                name: "defaults", animations: [], parentIndex: -1),
            UIScreenAnimationContent.Component(
                name: "positive", animations: [], parentIndex: -1,
                layout: UIScreenAnimationContent.Component.Layout(layer: 7)),
        ]))
        let components = try UIScreenLayoutProjection.project(player).components
        XCTAssertEqual(components[0].localLayer, -1)
        XCTAssertEqual(components[0].effectiveLayer, -1)
        XCTAssertEqual(components[1].localLayer, 7)
        XCTAssertEqual(components[1].effectiveLayer, 7)
    }

    func testStaticUInt32MaxLayerRestoresToMinusOne() throws {
        let player = try UIScreenAnimationPlayer(content: makeContent([
            UIScreenAnimationContent.Component(
                name: "uint32Max", animations: [], parentIndex: -1,
                layout: UIScreenAnimationContent.Component.Layout(layer: 4_294_967_295)),
        ]))
        let component = try UIScreenLayoutProjection.project(player).components[0]
        XCTAssertEqual(component.localLayer, -1)
        XCTAssertEqual(component.effectiveLayer, -1)
    }

    func testLayerInheritsFromParentAndOwnNonNegativeLayerOverrides() throws {
        let player = try UIScreenAnimationPlayer(content: makeContent([
            UIScreenAnimationContent.Component(
                name: "parent", animations: [], parentIndex: -1,
                layout: UIScreenAnimationContent.Component.Layout(layer: 1)),
            UIScreenAnimationContent.Component(
                name: "inherits", animations: [], parentIndex: 0),
            UIScreenAnimationContent.Component(
                name: "overrides", animations: [], parentIndex: 0,
                layout: UIScreenAnimationContent.Component.Layout(layer: 5)),
        ]))
        let components = try UIScreenLayoutProjection.project(player).components
        XCTAssertEqual(components[0].localLayer, 1)
        XCTAssertEqual(components[0].effectiveLayer, 1)
        XCTAssertEqual(components[1].localLayer, -1)
        XCTAssertEqual(components[1].effectiveLayer, 1)
        XCTAssertEqual(components[2].localLayer, 5)
        XCTAssertEqual(components[2].effectiveLayer, 5)
    }

    func testLayerInheritancePropagatesThroughMultipleLevels() throws {
        // The strict content contract reserves component zero for the screen root.
        let player = try UIScreenAnimationPlayer(content: makeContent([
            UIScreenAnimationContent.Component(
                name: "root", animations: [], parentIndex: -1,
                layout: UIScreenAnimationContent.Component.Layout(layer: 3)),
            UIScreenAnimationContent.Component(
                name: "middle", animations: [], parentIndex: 0),
            UIScreenAnimationContent.Component(
                name: "leaf", animations: [], parentIndex: 1,
                layout: UIScreenAnimationContent.Component.Layout(layer: -2)),
            UIScreenAnimationContent.Component(
                name: "leafOwn", animations: [], parentIndex: 1,
                layout: UIScreenAnimationContent.Component.Layout(layer: 8)),
        ]))
        let components = try UIScreenLayoutProjection.project(player).components
        XCTAssertEqual(components[0].localLayer, 3)
        XCTAssertEqual(components[0].effectiveLayer, 3)
        XCTAssertEqual(components[1].localLayer, -1)
        XCTAssertEqual(components[1].effectiveLayer, 3)
        XCTAssertEqual(components[2].localLayer, -2)
        XCTAssertEqual(components[2].effectiveLayer, 3)
        XCTAssertEqual(components[3].localLayer, 8)
        XCTAssertEqual(components[3].effectiveLayer, 8)
    }

    func testActiveLayerTrackOverridesStaticAndMissingTrackFallsBack() throws {
        let track = UIScreenAnimationContent.Track(name: "layer", keyframes: [
            keyframe(0, [5]), keyframe(100, [9]),
        ])
        let animation = UIScreenAnimationContent.Animation(
            name: "raise", endTimeMS: 100, tracks: [track])
        var player = try UIScreenAnimationPlayer(content: makeContent([
            UIScreenAnimationContent.Component(
                name: "animated", animations: [animation], parentIndex: -1,
                layout: UIScreenAnimationContent.Component.Layout(layer: 2)),
            UIScreenAnimationContent.Component(
                name: "staticOnly", animations: [], parentIndex: -1,
                layout: UIScreenAnimationContent.Component.Layout(layer: 2)),
        ]))
        _ = try player.play(component: "animated", animation: "raise")
        _ = try player.advance(deltaSeconds: 0.05)
        let components = try UIScreenLayoutProjection.project(player).components
        XCTAssertEqual(components[0].localLayer, 7)
        XCTAssertEqual(components[0].effectiveLayer, 7)
        XCTAssertEqual(components[1].localLayer, 2)
        XCTAssertEqual(components[1].effectiveLayer, 2)
    }

    func testAnimatedUInt32MaxFloatRoundsBackToMinusOne() throws {
        let animation = UIScreenAnimationContent.Animation(
            name: "maxLayer", endTimeMS: 0, tracks: [
                UIScreenAnimationContent.Track(name: "layer", keyframes: [
                    keyframe(0, [4_294_967_296]),
                ]),
            ])
        var player = try UIScreenAnimationPlayer(content: makeContent([
            UIScreenAnimationContent.Component(
                name: "sampledMax", animations: [animation], parentIndex: -1,
                layout: UIScreenAnimationContent.Component.Layout(layer: 2)),
        ]))
        _ = try player.play(component: "sampledMax", animation: "maxLayer")
        let component = try UIScreenLayoutProjection.project(player).components[0]
        XCTAssertEqual(component.localLayer, -1)
        XCTAssertEqual(component.effectiveLayer, -1)
    }

    func testInvalidStaticAndAnimatedLayerValuesThrowInsteadOfTrappingOrClamping() throws {
        let staticPlayer = try UIScreenAnimationPlayer(content: makeContent([
            UIScreenAnimationContent.Component(
                name: "staticBad", animations: [], parentIndex: -1,
                layout: UIScreenAnimationContent.Component.Layout(layer: 4_294_967_296)),
        ]))
        XCTAssertThrowsError(try UIScreenLayoutProjection.project(staticPlayer)) { error in
            XCTAssertEqual(error as? UIScreenLayoutProjectionError,
                           .invalidLayerValue(component: "staticBad", value: "4294967296"))
        }

        for (name, value) in [("fractional", Float(1.5)), ("negative", Float(-2_147_483_904)),
                              ("overflow", Float(4_294_967_296) * 2)] {
            let animation = UIScreenAnimationContent.Animation(
                name: "badLayer", endTimeMS: 0, tracks: [
                    UIScreenAnimationContent.Track(name: "layer", keyframes: [
                        keyframe(0, [value]),
                    ]),
                ])
            var player = try UIScreenAnimationPlayer(content: makeContent([
                UIScreenAnimationContent.Component(
                    name: name, animations: [animation], parentIndex: -1),
            ]))
            _ = try player.play(component: name, animation: "badLayer")
            XCTAssertThrowsError(try UIScreenLayoutProjection.project(player), name) { error in
                guard case let UIScreenLayoutProjectionError.invalidLayerValue(component, _) = error else {
                    return XCTFail("expected invalidLayerValue, got \(error)")
                }
                XCTAssertEqual(component, name)
            }
        }
    }

    func testDevicePixelProjectionPreservesBothLayerFields() throws {
        let player = try UIScreenAnimationPlayer(content: makeContent([
            UIScreenAnimationContent.Component(
                name: "parent", animations: [], parentIndex: -1,
                layout: UIScreenAnimationContent.Component.Layout(layer: 1)),
            UIScreenAnimationContent.Component(
                name: "child", animations: [], parentIndex: 0),
        ]))
        let viewport = try UIScreenRootViewport(deviceWidth: 960, deviceHeight: 480)
        let logical = try UIScreenLayoutProjection.project(player)
        let device = try UIScreenLayoutProjection.projectDevicePixels(player, viewport: viewport)
        XCTAssertEqual(device.components.map(\.localLayer), logical.components.map(\.localLayer))
        XCTAssertEqual(device.components.map(\.effectiveLayer),
                       logical.components.map(\.effectiveLayer))
        XCTAssertEqual(device.components[0].localLayer, 1)
        XCTAssertEqual(device.components[1].effectiveLayer, 1)
    }

    func testProductionChallengeMapLayerProjectionMatchesVerifiedStructure() throws {
        let player = try productionChallengeMapPlayer()
        let projection = try UIScreenLayoutProjection.project(player)
        XCTAssertEqual(projection.components.count, 95)
        XCTAssertEqual(player.content.components.filter {
            $0.layout?.layer == 4_294_967_295
        }.count, 15)
        // 75 components omit layer and 15 store UInt32.max; all restore to -1.
        XCTAssertEqual(player.content.components.filter { $0.layout?.layer == nil }.count, 75)
        XCTAssertEqual(projection.components.filter { $0.localLayer == -1 }.count, 90)
        XCTAssertFalse(player.content.components.contains { component in
            component.animations.contains { animation in
                animation.tracks.contains { $0.name == "layer" }
            }
        })

        let byName = Dictionary(uniqueKeysWithValues: projection.components.map { ($0.name, $0) })
        for name in ["actContainer", "challengeContainer", "bossChallengeContainer"] {
            let component = try XCTUnwrap(byName[name])
            XCTAssertEqual(component.localLayer, 1, name)
            XCTAssertEqual(component.effectiveLayer, 1, name)
        }
        let progress = try XCTUnwrap(byName["progressUIContainer"])
        XCTAssertEqual(progress.localLayer, 2)
        XCTAssertEqual(progress.effectiveLayer, 2)
        let screenRoot = try XCTUnwrap(byName[""])
        XCTAssertEqual(screenRoot.localLayer, -1)
        XCTAssertEqual(screenRoot.effectiveLayer, -1)

        for component in projection.components where
            component.name.contains(".spinner.adventureNode") {
            XCTAssertEqual(component.localLayer, -1, component.name)
            XCTAssertEqual(component.effectiveLayer, 1, component.name)
        }
        XCTAssertEqual(projection.components.filter {
            $0.name.contains(".spinner.adventureNode")
        }.count, 15)
    }

    private func scaled(_ point: UIScreenPoint3, by scale: UIScreenPoint3) -> UIScreenPoint3 {
        UIScreenPoint3(x: point.x * scale.x, y: point.y * scale.y, z: point.z * scale.z)
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
