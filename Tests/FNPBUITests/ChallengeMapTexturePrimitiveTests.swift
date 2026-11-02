//
//  ChallengeMapTexturePrimitiveTests.swift
//  FNPBUITests
//
//  只验证 ChallengeMapLayoutGeometry 与 ChallengeMapTextureResolver 的纯值行为。
//

import Foundation
import XCTest
@testable import FNPBUI

final class ChallengeMapTexturePrimitiveTests: XCTestCase {
    private func identityMatrix() -> ChallengeMapLayoutMatrix4 {
        ChallengeMapLayoutMatrix4(
            column0: SIMD4<Float>(1, 0, 0, 0),
            column1: SIMD4<Float>(0, 1, 0, 0),
            column2: SIMD4<Float>(0, 0, 1, 0),
            column3: SIMD4<Float>(0, 0, 0, 1))
    }

    private func makeComponent(
        worldMatrix: ChallengeMapLayoutMatrix4? = nil,
        width: Float = 100,
        height: Float = 50,
        effectiveOrigin: ChallengeMapLayoutPoint = ChallengeMapLayoutPoint(x: 0, y: 0, z: 0),
        texturePath: String? = nil,
        texCoordPos: SIMD2<Float> = SIMD2<Float>(0, 0),
        texCoordSize: SIMD2<Float> = SIMD2<Float>(1, 1),
        iconIndex: Int32? = nil
    ) -> ChallengeMapLayoutComponent {
        let point = ChallengeMapLayoutPoint(x: 0, y: 0, z: 0)
        return ChallengeMapLayoutComponent(
            name: "test", index: 0, parentIndex: nil,
            worldMatrix: worldMatrix ?? identityMatrix(),
            worldCorners: ChallengeMapLayoutCorners(
                minimumXMinimumY: point, maximumXMinimumY: point,
                maximumXMaximumY: point, minimumXMaximumY: point),
            width: width, height: height, effectiveOrigin: effectiveOrigin,
            localRGBA: ChallengeMapLayoutColor(red: 0, green: 0, blue: 0, alpha: 0),
            absoluteRGBA: ChallengeMapLayoutColor(red: 0, green: 0, blue: 0, alpha: 0),
            enabled: true, screenVisibility: true, texturePath: texturePath,
            texCoordPos: texCoordPos, texCoordSize: texCoordSize, iconIndex: iconIndex)
    }

    private func assertFailure(
        _ result: Result<ChallengeMapResolvedTexture, ChallengeMapTextureResolutionError>,
        _ expected: ChallengeMapTextureResolutionError,
        file: StaticString = #filePath, line: UInt = #line
    ) {
        switch result {
        case .success:
            XCTFail("预期失败，实际成功", file: file, line: line)
        case .failure(let error):
            XCTAssertEqual(error, expected, file: file, line: line)
        }
    }

    private func makeEmptyBundle() throws -> (Bundle, URL) {
        let directory = FileManager.default.temporaryDirectory
            .appendingPathComponent("FNPBUITests-\(UUID().uuidString)", isDirectory: true)
            .appendingPathExtension("bundle")
        try FileManager.default.createDirectory(
            at: directory, withIntermediateDirectories: true, attributes: nil)
        let info: [String: Any] = [
            "CFBundleIdentifier": "com.example.fnpib.uitests.empty",
            "CFBundleName": "EmptyFNPBUITestBundle",
            "CFBundlePackageType": "BNDL",
            "CFBundleVersion": "1",
            "CFBundleShortVersionString": "1.0",
        ]
        let data = try PropertyListSerialization.data(
            fromPropertyList: info, format: .xml, options: 0)
        try data.write(to: directory.appendingPathComponent("Info.plist"))
        guard let bundle = Bundle(url: directory) else {
            throw NSError(domain: "FNPBUITests", code: 1,
                          userInfo: [NSLocalizedDescriptionKey: "无法创建空测试 Bundle"])
        }
        return (bundle, directory)
    }

    func testLocalAffineTransformMapsColumnMajorComponentsExactly() {
        let matrix = ChallengeMapLayoutMatrix4(
            column0: SIMD4<Float>(2, 3, 0, 0),
            column1: SIMD4<Float>(5, 7, 0, 0),
            column2: SIMD4<Float>(9, 11, 1, 0),
            column3: SIMD4<Float>(13, 17, 0, 1))
        let transform = ChallengeMapLayoutGeometry.localAffineTransform(
            for: makeComponent(worldMatrix: matrix))
        XCTAssertEqual(transform.a, 2)
        XCTAssertEqual(transform.b, 3)
        XCTAssertEqual(transform.c, 5)
        XCTAssertEqual(transform.d, 7)
        XCTAssertEqual(transform.tx, 13)
        XCTAssertEqual(transform.ty, 17)
    }

    func testPositionsSubtractEffectiveOriginBeforeTransform() {
        let component = makeComponent(
            effectiveOrigin: ChallengeMapLayoutPoint(x: 10, y: 20, z: 0))
        let positions = ChallengeMapLayoutGeometry.positions(
            for: component, deviceWidth: 480, deviceHeight: 320)
        XCTAssertEqual(positions, [
            CGPoint(x: -10, y: -20), CGPoint(x: 90, y: -20),
            CGPoint(x: 90, y: 30), CGPoint(x: -10, y: 30),
        ])
    }

    func testPositionsUseWidthHeightCornerOrder() {
        let positions = ChallengeMapLayoutGeometry.positions(
            for: makeComponent(), deviceWidth: 480, deviceHeight: 320)
        XCTAssertEqual(positions, [
            CGPoint(x: 0, y: 0), CGPoint(x: 100, y: 0),
            CGPoint(x: 100, y: 50), CGPoint(x: 0, y: 50),
        ])
    }

    func testLocalTransformIsConcatenatedBeforeNonUniformDeviceScale() {
        let matrix = ChallengeMapLayoutMatrix4(
            column0: SIMD4<Float>(1, 0, 0, 0),
            column1: SIMD4<Float>(0, 1, 0, 0),
            column2: SIMD4<Float>(0, 0, 1, 0),
            column3: SIMD4<Float>(10, 20, 0, 1))
        let transform = ChallengeMapLayoutGeometry.deviceSpaceAffineTransform(
            for: makeComponent(worldMatrix: matrix), deviceWidth: 960, deviceHeight: 960)
        XCTAssertEqual(CGPoint(x: 0, y: 0).applying(transform), CGPoint(x: 20, y: 60))
        XCTAssertEqual(CGPoint(x: 1, y: 1).applying(transform), CGPoint(x: 22, y: 63))
    }

    func testStaticTexCoordsCornerOrder() {
        let component = makeComponent(
            texCoordPos: SIMD2<Float>(0.25, 0.5),
            texCoordSize: SIMD2<Float>(0.125, 0.25))
        XCTAssertEqual(ChallengeMapLayoutGeometry.texCoords(for: component, resolvedUV: nil), [
            CGPoint(x: 0.25, y: 0.5), CGPoint(x: 0.375, y: 0.5),
            CGPoint(x: 0.375, y: 0.75), CGPoint(x: 0.25, y: 0.75),
        ])
    }

    func testRuntimeTexCoordsReplaceStaticCornerOrder() {
        let component = makeComponent(
            texCoordPos: SIMD2<Float>(9, 9), texCoordSize: SIMD2<Float>(9, 9))
        let resolvedUV = ChallengeMapResolvedUV(
            u: 0.5, v: 0.25, width: 0.125, height: 0.0625)
        XCTAssertEqual(ChallengeMapLayoutGeometry.texCoords(
            for: component, resolvedUV: resolvedUV), [
                CGPoint(x: 0.5, y: 0.25), CGPoint(x: 0.625, y: 0.25),
                CGPoint(x: 0.625, y: 0.3125), CGPoint(x: 0.5, y: 0.3125),
            ])
    }

    func testNegativeTexCoordSizeIsNotAbsolutized() {
        let component = makeComponent(
            texCoordPos: SIMD2<Float>(0.75, 0.75),
            texCoordSize: SIMD2<Float>(-0.5, -0.25))
        XCTAssertEqual(ChallengeMapLayoutGeometry.texCoords(for: component, resolvedUV: nil), [
            CGPoint(x: 0.75, y: 0.75), CGPoint(x: 0.25, y: 0.75),
            CGPoint(x: 0.25, y: 0.5), CGPoint(x: 0.75, y: 0.5),
        ])
    }

    func testTexturePathToKeyExactMappings() {
        let mappings: [(String, ChallengeMapTextureKey)] = [
            ("textures/adventureprogress/flipper.tex", .challengeFlipper),
            ("textures/menus/basicPoster.tex", .challengeBasicPoster),
            ("textures/menus/posterDeco01.tex", .challengePosterDeco01),
            ("textures/adventureprogress/iconSlot.tex", .challengeIconSlot),
            ("textures/adventureProgress/iconSlot.tex", .challengeIconSlot),
            ("textures/adventureprogress/challengeAtlas.tex", .challengeAtlas),
            ("textures/adventureprogress/tick.tex", .challengeTick),
            ("textures/adventureprogress/cross.tex", .challengeCross),
            ("textures/menus/posterDeco02.tex", .challengePosterDeco02),
            ("textures/adventureProgress/locations.tex", .challengeLocations),
        ]
        XCTAssertEqual(ChallengeMapTextureResolver.texturePathToKey.count, mappings.count)
        for (path, expectedKey) in mappings {
            XCTAssertEqual(ChallengeMapTextureResolver.texturePathToKey[path], expectedKey, path)
        }
    }

    func testMissingTexturePathFails() {
        assertFailure(ChallengeMapTextureResolver.resolve(texturePath: nil, iconIndex: nil),
                      .missingTexturePath)
    }

    func testUnknownTexturePathFailsWithoutCaseFolding() {
        let path = "textures/menus/UnknownPoster.tex"
        assertFailure(ChallengeMapTextureResolver.resolve(texturePath: path, iconIndex: nil),
                      .unsupportedTexturePath(path))
    }

    func testIconIndexOnNonAtlasPathFails() {
        let path = "textures/adventureprogress/flipper.tex"
        assertFailure(ChallengeMapTextureResolver.resolve(texturePath: path, iconIndex: 0),
                      .iconIndexRequiresChallengeAtlas(texturePath: path))
    }

    func testAtlasIconIndexOutOfRangeFails() {
        let path = "textures/adventureprogress/challengeAtlas.tex"
        assertFailure(ChallengeMapTextureResolver.resolve(texturePath: path, iconIndex: -1),
                      .iconIndexOutOfRange(-1))
        assertFailure(ChallengeMapTextureResolver.resolve(texturePath: path, iconIndex: 64),
                      .iconIndexOutOfRange(64))
    }

    func testAtlasValidIconIndicesReachImageLookupWithEmptyBundle() throws {
        let (bundle, directory) = try makeEmptyBundle()
        defer { try? FileManager.default.removeItem(at: directory) }
        let path = "textures/adventureprogress/challengeAtlas.tex"
        for index in [Int32(0), 7, 8, 63] {
            assertFailure(ChallengeMapTextureResolver.resolve(
                texturePath: path, iconIndex: index, bundle: bundle),
                .imageUnavailable(.challengeAtlas))
        }
    }
}
