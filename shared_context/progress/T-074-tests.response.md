```swift
import XCTest
import simd
@testable import FNPBRender

final class OrderedTextureQuadTests: XCTestCase {
    private let positions: [SIMD2<Float>] = [
        SIMD2<Float>(0, 0),
        SIMD2<Float>(1, 0),
        SIMD2<Float>(1, 1),
        SIMD2<Float>(0, 1)
    ]

    private let uvs: [SIMD2<Float>] = [
        SIMD2<Float>(0, 0),
        SIMD2<Float>(1, 0),
        SIMD2<Float>(1, 1),
        SIMD2<Float>(0, 1)
    ]

    func testRGBAChannelsAreNormalized() {
        let rgba = SIMD4<UInt8>(0, 1, 128, 255)
        let vertices = OrderedTextureQuad.makeVertices(
            positions: positions,
            uvs: uvs,
            absoluteRGBA: rgba,
            screenVisibility: true
        )

        XCTAssertNotNil(vertices)
        guard let vertices = vertices else { return }
        XCTAssertEqual(vertices.count, 4)

        for vertex in vertices {
            XCTAssertEqual(vertex.rgba.x, Float(0) / 255.0, accuracy: 1e-6)
            XCTAssertEqual(vertex.rgba.y, Float(1) / 255.0, accuracy: 1e-6)
            XCTAssertEqual(vertex.rgba.z, Float(128) / 255.0, accuracy: 1e-6)
            XCTAssertEqual(vertex.rgba.w, Float(255) / 255.0, accuracy: 1e-6)
        }
    }

    func testRGBIsNotPremultipliedByAlpha() {
        let rgba = SIMD4<UInt8>(255, 128, 64, 128)
        let vertices = OrderedTextureQuad.makeVertices(
            positions: positions,
            uvs: uvs,
            absoluteRGBA: rgba,
            screenVisibility: true
        )

        XCTAssertNotNil(vertices)
        guard let vertices = vertices else { return }
        XCTAssertEqual(vertices.count, 4)

        let alpha = Float(128) / 255.0
        for vertex in vertices {
            XCTAssertEqual(vertex.rgba.x, Float(255) / 255.0, accuracy: 1e-6)
            XCTAssertEqual(vertex.rgba.y, Float(128) / 255.0, accuracy: 1e-6)
            XCTAssertEqual(vertex.rgba.z, Float(64) / 255.0, accuracy: 1e-6)
            XCTAssertEqual(vertex.rgba.w, alpha, accuracy: 1e-6)

            XCTAssertNotEqual(vertex.rgba.x, Float(255) / 255.0 * alpha)
            XCTAssertNotEqual(vertex.rgba.y, Float(128) / 255.0 * alpha)
            XCTAssertNotEqual(vertex.rgba.z, Float(64) / 255.0 * alpha)
        }
    }

    func testAlphaZeroReturnsNil() {
        let vertices = OrderedTextureQuad.makeVertices(
            positions: positions,
            uvs: uvs,
            absoluteRGBA: SIMD4<UInt8>(255, 255, 255, 0),
            screenVisibility: true
        )

        XCTAssertNil(vertices)
    }

    func testScreenVisibilityFalseReturnsNil() {
        let vertices = OrderedTextureQuad.makeVertices(
            positions: positions,
            uvs: uvs,
            absoluteRGBA: SIMD4<UInt8>(255, 255, 255, 255),
            screenVisibility: false
        )

        XCTAssertNil(vertices)
    }

    func testInvalidPositionCountReturnsNil() {
        let threePositions = Array(positions.prefix(3))
        let fivePositions = positions + [SIMD2<Float>(2, 2)]

        XCTAssertNil(
            OrderedTextureQuad.makeVertices(
                positions: threePositions,
                uvs: uvs,
                absoluteRGBA: SIMD4<UInt8>(255, 255, 255, 255),
                screenVisibility: true
            )
        )

        XCTAssertNil(
            OrderedTextureQuad.makeVertices(
                positions: fivePositions,
                uvs: uvs,
                absoluteRGBA: SIMD4<UInt8>(255, 255, 255, 255),
                screenVisibility: true
            )
        )
    }

    func testInvalidUVCountReturnsNil() {
        let threeUVs = Array(uvs.prefix(3))
        let fiveUVs = uvs + [SIMD2<Float>(2, 2)]

        XCTAssertNil(
            OrderedTextureQuad.makeVertices(
                positions: positions,
                uvs: threeUVs,
                absoluteRGBA: SIMD4<UInt8>(255, 255, 255, 255),
                screenVisibility: true
            )
        )

        XCTAssertNil(
            OrderedTextureQuad.makeVertices(
                positions: positions,
                uvs: fiveUVs,
                absoluteRGBA: SIMD4<UInt8>(255, 255, 255, 255),
                screenVisibility: true
            )
        )
    }

    func testNonFinitePositionReturnsNil() {
        let invalidValues: [Float] = [.nan, .infinity, -Float.infinity]

        for invalidValue in invalidValues {
            var positionsX = positions
            positionsX[0].x = invalidValue
            XCTAssertNil(
                OrderedTextureQuad.makeVertices(
                    positions: positionsX,
                    uvs: uvs,
                    absoluteRGBA: SIMD4<UInt8>(255, 255, 255, 255),
                    screenVisibility: true
                ),
                "position.x = \(invalidValue) should return nil"
            )

            var positionsY = positions
            positionsY[0].y = invalidValue
            XCTAssertNil(
                OrderedTextureQuad.makeVertices(
                    positions: positionsY,
                    uvs: uvs,
                    absoluteRGBA: SIMD4<UInt8>(255, 255, 255, 255),
                    screenVisibility: true
                ),
                "position.y = \(invalidValue) should return nil"
            )
        }
    }

    func testNonFiniteUVReturnsNil() {
        let invalidValues: [Float] = [.nan, .infinity, -Float.infinity]

        for invalidValue in invalidValues {
            var uvsX = uvs
            uvsX[0].x = invalidValue
            XCTAssertNil(
                OrderedTextureQuad.makeVertices(
                    positions: positions,
                    uvs: uvsX,
                    absoluteRGBA: SIMD4<UInt8>(255, 255, 255, 255),
                    screenVisibility: true
                ),
                "uv.x = \(invalidValue) should return nil"
            )

            var uvsY = uvs
            uvsY[0].y = invalidValue
            XCTAssertNil(
                OrderedTextureQuad.makeVertices(
                    positions: positions,
                    uvs: uvsY,
                    absoluteRGBA: SIMD4<UInt8>(255, 255, 255, 255),
                    screenVisibility: true
                ),
                "uv.y = \(invalidValue) should return nil"
            )
        }
    }

    func testVertexPositionOrderIsPreserved() {
        let customPositions: [SIMD2<Float>] = [
            SIMD2<Float>(-2, -1),
            SIMD2<Float>(3, -4),
            SIMD2<Float>(5, 6),
            SIMD2<Float>(-7, 8)
        ]

        let vertices = OrderedTextureQuad.makeVertices(
            positions: customPositions,
            uvs: uvs,
            absoluteRGBA: SIMD4<UInt8>(255, 255, 255, 255),
            screenVisibility: true
        )

        XCTAssertNotNil(vertices)
        guard let vertices = vertices else { return }
        XCTAssertEqual(vertices.count, 4)

        for index in 0..<4 {
            XCTAssertEqual(vertices[index].position, customPositions[index])
        }
    }

    func testNegativeUVsArePreserved() {
        let negativeUVs: [SIMD2<Float>] = [
            SIMD2<Float>(-0.5, -1.0),
            SIMD2<Float>(2.0, -0.25),
            SIMD2<Float>(-3.5, 4.5),
            SIMD2<Float>(0.0, -7.0)
        ]

        let vertices = OrderedTextureQuad.makeVertices(
            positions: positions,
            uvs: negativeUVs,
            absoluteRGBA: SIMD4<UInt8>(255, 255, 255, 255),
            screenVisibility: true
        )

        XCTAssertNotNil(vertices)
        guard let vertices = vertices else { return }
        XCTAssertEqual(vertices.count, 4)

        for index in 0..<4 {
            XCTAssertEqual(vertices[index].uv, negativeUVs[index])
        }
    }
}
```