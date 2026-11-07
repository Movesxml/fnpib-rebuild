import XCTest
@testable import FNPBCore

/// TextMeshBuilder：四角公式与六顶点绕序（证据 glyph_vertex_order_macho.md §0）。
final class TextMeshTests: XCTestCase {

    private func makeGlyph(
        pen: SIMD2<Float> = SIMD2<Float>(10, 20),
        width: Float = 8,
        height: Float = 12,
        offsetX: Float = 1,
        offsetY: Float = 2,
        rotation: Float = 0,
        characterCode: Int32 = 65
    ) -> TextGlyphRecord {
        TextGlyphRecord(characterCode: characterCode,
                        uvMinimum: SIMD2<Float>(0, 0),
                        uvMaximum: SIMD2<Float>(1, 1),
                        offsetX: offsetX,
                        offsetY: offsetY,
                        pen: pen,
                        width: width,
                        height: height,
                        rotation: rotation,
                        color: SIMD4<Float>(255, 128, 0, 255))
    }

    private func assertPoint(_ actual: SIMD2<Float>, _ expected: SIMD2<Float>,
                             _ message: String = "",
                             file: StaticString = #filePath, line: UInt = #line) {
        XCTAssertEqual(actual.x, expected.x, accuracy: 1e-5, message, file: file, line: line)
        XCTAssertEqual(actual.y, expected.y, accuracy: 1e-5, message, file: file, line: line)
    }

    // MARK: 1. 无旋转的四角

    func testCornersWithoutRotation() {
        // pen=(10,20) w=8 h=12 a=1 b=2  ⇒  right=7 bottom=10
        // c0=pen+(7,-2) c1=pen+(-1,10) c2=pen+(-1,-2) c3=pen+(7,10)
        let c = TextMeshBuilder.corners(for: makeGlyph())
        assertPoint(c[0], SIMD2<Float>(17, 18), "c0 topRight")
        assertPoint(c[1], SIMD2<Float>(9, 30), "c1 bottomLeft")
        assertPoint(c[2], SIMD2<Float>(9, 18), "c2 topLeft")
        assertPoint(c[3], SIMD2<Float>(17, 30), "c3 bottomRight")
    }

    // MARK: 2. 旋转 90 度：R(p,q) = (-q, p)

    func testCornersWithQuarterTurn() {
        let c = TextMeshBuilder.corners(for: makeGlyph(rotation: Float.pi / 2))
        // c0 = pen + R(7,-2) = pen + (2,7) = (12,27)
        assertPoint(c[0], SIMD2<Float>(12, 27), "c0")
        // c1 = pen + R(-1,10) = pen + (-10,-1) = (0,19)
        assertPoint(c[1], SIMD2<Float>(0, 19), "c1")
        // c2 = pen + R(-1,-2) = pen + (2,-1) = (12,19)
        assertPoint(c[2], SIMD2<Float>(12, 19), "c2")
        // c3 = pen + R(7,10) = pen + (-10,7) = (0,27)
        assertPoint(c[3], SIMD2<Float>(0, 27), "c3")
    }

    // MARK: 3. 两支绕序只交换顶点 1/2 与 4/5

    func testWindingBranchesSwapMiddleAndLastPair() {
        let glyph = makeGlyph()
        let a = TextMeshBuilder.vertices(for: glyph, alternateWinding: true)
        let b = TextMeshBuilder.vertices(for: glyph, alternateWinding: false)
        XCTAssertEqual(a.count, 6)
        XCTAssertEqual(b.count, 6)
        // 顶点 0 与 3 在两条支路里完全相同
        XCTAssertEqual(a[0], b[0])
        XCTAssertEqual(a[3], b[3])
        // 1/2 互换、4/5 互换
        XCTAssertEqual(a[1], b[2])
        XCTAssertEqual(a[2], b[1])
        XCTAssertEqual(a[4], b[5])
        XCTAssertEqual(a[5], b[4])
    }

    // MARK: 4. UV 跟角走

    func testUVFollowsCorner() {
        let glyph = makeGlyph()
        let v = TextMeshBuilder.vertices(for: glyph, alternateWinding: true)
        // 顺序 c0,c1,c2,c3,c1,c0
        // 角#0=(u1,v1)=(1,1) 角#1=(u0,v0)=(0,0) 角#2=(u0,v1)=(0,1) 角#3=(u1,v0)=(1,0)
        XCTAssertEqual(v[0].uv, SIMD2<Float>(1, 1))
        XCTAssertEqual(v[1].uv, SIMD2<Float>(0, 0))
        XCTAssertEqual(v[2].uv, SIMD2<Float>(0, 1))
        XCTAssertEqual(v[3].uv, SIMD2<Float>(1, 0))
        XCTAssertEqual(v[4].uv, SIMD2<Float>(0, 0))
        XCTAssertEqual(v[5].uv, SIMD2<Float>(1, 1))
        // 位置也必须与 UV 同步（v[0] 是 c0）
        assertPoint(v[0].position, SIMD2<Float>(17, 18))
        assertPoint(v[3].position, SIMD2<Float>(17, 30))
    }

    // MARK: 5. 不产生顶点的两种情形

    func testNewlineProducesNoVertices() {
        XCTAssertTrue(TextMeshBuilder.vertices(for: makeGlyph(characterCode: 0x0a)).isEmpty)
    }

    func testNegativeExtentProducesNoVertices() {
        XCTAssertTrue(TextMeshBuilder.vertices(for: makeGlyph(width: -1)).isEmpty)
        XCTAssertTrue(TextMeshBuilder.vertices(for: makeGlyph(height: -1)).isEmpty)
    }

    // MARK: 6. 0x30 字节打包顺序

    func testPackedFloatsFollowReleaseLayout() {
        let glyph = makeGlyph()
        let v = TextMeshBuilder.vertices(for: glyph, alternateWinding: true)[0]
        let packed = v.packedFloats
        XCTAssertEqual(packed.count, 12, "0x30 字节 = 12 个 float")
        XCTAssertEqual(packed[0], 17)
        XCTAssertEqual(packed[1], 18)
        XCTAssertEqual(packed[2], 0)
        XCTAssertEqual(packed[3], 0)
        XCTAssertEqual(packed[4], 0)
        XCTAssertEqual(packed[5], 1.0, "+0x14 固定 1.0")
        // 颜色 0..255 直接转 float，不除 255
        XCTAssertEqual(packed[6], 255)
        XCTAssertEqual(packed[7], 128)
        XCTAssertEqual(packed[8], 0)
        XCTAssertEqual(packed[9], 255)
        XCTAssertEqual(packed[10], 1, "UV u")
        XCTAssertEqual(packed[11], 1, "UV v")
    }
}
