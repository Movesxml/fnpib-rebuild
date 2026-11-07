import XCTest
import simd
@testable import FNPBRender
@testable import FNPBCore

/// TextQuad 的顶点转换（颜色 0..255 → 0..1，与纹理无关的那一半）。
final class TextQuadTests: XCTestCase {

    private func makeVertices(count: Int = 6,
                              color: SIMD4<Float> = SIMD4<Float>(255, 128, 0, 64)) -> [TextVertex] {
        (0..<count).map { index in
            TextVertex(position: SIMD2<Float>(Float(index), Float(index) * 2),
                       color: color,
                       uv: SIMD2<Float>(Float(index) / 8, 0.5))
        }
    }

    func testColorIsNormalisedFromByteRange() throws {
        let converted = try XCTUnwrap(TextQuad.makeVertices(from: makeVertices()))
        XCTAssertEqual(converted.count, 6)
        for vertex in converted {
            XCTAssertEqual(vertex.rgba.x, 1, accuracy: 1e-6)
            XCTAssertEqual(vertex.rgba.y, 128.0 / 255.0, accuracy: 1e-6)
            XCTAssertEqual(vertex.rgba.z, 0, accuracy: 1e-6)
            XCTAssertEqual(vertex.rgba.w, 64.0 / 255.0, accuracy: 1e-6)
        }
    }

    func testPositionsAndUVsArePassedThrough() throws {
        let source = makeVertices()
        let converted = try XCTUnwrap(TextQuad.makeVertices(from: source))
        for (index, vertex) in converted.enumerated() {
            XCTAssertEqual(vertex.position, source[index].position)
            XCTAssertEqual(vertex.uv, source[index].uv)
        }
    }

    func testRejectsWrongVertexCount() {
        XCTAssertNil(TextQuad.makeVertices(from: makeVertices(count: 4)), "必须是 6 顶点")
        XCTAssertNil(TextQuad.makeVertices(from: []))
    }
}
