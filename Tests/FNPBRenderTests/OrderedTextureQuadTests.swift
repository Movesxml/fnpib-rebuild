import XCTest
import simd
@testable import FNPBRender

final class OrderedTextureQuadTests: XCTestCase {
    private let positions: [SIMD2<Float>] = [
        SIMD2(0, 0), SIMD2(1, 0), SIMD2(1, 1), SIMD2(0, 1),
    ]
    private let uvs: [SIMD2<Float>] = [
        SIMD2(0, 0), SIMD2(1, 0), SIMD2(1, 1), SIMD2(0, 1),
    ]

    private func makeVertices(rgba: SIMD4<UInt8> = SIMD4(255, 255, 255, 255),
                              positions: [SIMD2<Float>]? = nil,
                              uvs: [SIMD2<Float>]? = nil,
                              screenVisibility: Bool = true) -> [OrderedTextureVertex]? {
        OrderedTextureQuad.makeVertices(
            positions: positions ?? self.positions,
            uvs: uvs ?? self.uvs,
            absoluteRGBA: rgba,
            screenVisibility: screenVisibility)
    }

    func testRGBAChannelsAreNormalizedWithoutPremultiplication() throws {
        let vertices = try XCTUnwrap(makeVertices(rgba: SIMD4(0, 1, 128, 255)))
        XCTAssertEqual(vertices.count, 4)
        for vertex in vertices {
            XCTAssertEqual(vertex.rgba.x, 0, accuracy: 1e-6)
            XCTAssertEqual(vertex.rgba.y, 1.0 / 255.0, accuracy: 1e-6)
            XCTAssertEqual(vertex.rgba.z, 128.0 / 255.0, accuracy: 1e-6)
            XCTAssertEqual(vertex.rgba.w, 1, accuracy: 1e-6)
        }

        let translucent = try XCTUnwrap(makeVertices(rgba: SIMD4(255, 128, 64, 128)))
        let alpha: Float = 128.0 / 255.0
        for vertex in translucent {
            XCTAssertEqual(vertex.rgba.x, 1, accuracy: 1e-6)
            XCTAssertEqual(vertex.rgba.y, alpha, accuracy: 1e-6)
            XCTAssertEqual(vertex.rgba.z, 64.0 / 255.0, accuracy: 1e-6)
            XCTAssertEqual(vertex.rgba.w, alpha, accuracy: 1e-6)
            XCTAssertNotEqual(vertex.rgba.x, alpha)
            XCTAssertNotEqual(vertex.rgba.z, 64.0 / 255.0 * alpha)
        }
    }

    func testInvisibleOrTransparentQuadsAreRejected() {
        XCTAssertNil(makeVertices(rgba: SIMD4(255, 255, 255, 0)))
        XCTAssertNil(makeVertices(screenVisibility: false))
    }

    func testNonFourVertexInputsAreRejected() {
        XCTAssertNil(makeVertices(positions: Array(positions.prefix(3))))
        XCTAssertNil(makeVertices(positions: positions + [SIMD2(2, 2)]))
        XCTAssertNil(makeVertices(uvs: Array(uvs.prefix(3))))
        XCTAssertNil(makeVertices(uvs: uvs + [SIMD2(2, 2)]))
    }

    func testNonFinitePositionsAndUVsAreRejected() {
        for invalid: Float in [.nan, .infinity, -.infinity] {
            var changedPositions = positions
            changedPositions[0].x = invalid
            XCTAssertNil(makeVertices(positions: changedPositions))
            changedPositions[0].x = 0
            changedPositions[0].y = invalid
            XCTAssertNil(makeVertices(positions: changedPositions))

            var changedUVs = uvs
            changedUVs[0].x = invalid
            XCTAssertNil(makeVertices(uvs: changedUVs))
            changedUVs[0].x = 0
            changedUVs[0].y = invalid
            XCTAssertNil(makeVertices(uvs: changedUVs))
        }
    }

    func testVertexOrderAndNegativeUVsArePreserved() throws {
        let customPositions: [SIMD2<Float>] = [
            SIMD2(-2, -1), SIMD2(3, -4), SIMD2(5, 6), SIMD2(-7, 8),
        ]
        let negativeUVs: [SIMD2<Float>] = [
            SIMD2(-0.5, -1), SIMD2(2, -0.25),
            SIMD2(-3.5, 4.5), SIMD2(0, -7),
        ]
        let vertices = try XCTUnwrap(makeVertices(
            positions: customPositions, uvs: negativeUVs))
        XCTAssertEqual(vertices.map(\.position), customPositions)
        XCTAssertEqual(vertices.map(\.uv), negativeUVs)
    }

    func testSwiftAndMetalVertexLayoutContract() {
        XCTAssertEqual(MemoryLayout<OrderedTextureVertex>.size, 32)
        XCTAssertEqual(MemoryLayout<OrderedTextureVertex>.stride, 32)
        XCTAssertEqual(MemoryLayout<OrderedTextureVertex>.alignment, 16)
        XCTAssertEqual(MemoryLayout<OrderedTextureVertex>.offset(of: \.position), 0)
        XCTAssertEqual(MemoryLayout<OrderedTextureVertex>.offset(of: \.uv), 8)
        XCTAssertEqual(MemoryLayout<OrderedTextureVertex>.offset(of: \.rgba), 16)
        XCTAssertEqual(OrderedQuadPass.vertexStride, 32)
    }
}
