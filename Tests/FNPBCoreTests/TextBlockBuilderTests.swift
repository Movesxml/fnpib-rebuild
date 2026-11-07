import XCTest
@testable import FNPBCore

/// TextBlockBuilder：字符串 → 顶点的整条组装。
final class TextBlockBuilderTests: XCTestCase {

    /// 固定 2x2 位图、零 bearing、推进量恒为 fontSize 的替身。
    private final class StubMetrics: TextFontMetrics {
        var faceScale: Float = 1
        func glyphAdvance(codePoint: Int32, fontSize: Float) -> Float? { 0 }
        func kerning(first: Int32, second: Int32, fontSize: Float) -> Float { 0 }
        func glyphBitmap(codePoint: Int32, fontSize: Float) -> TextGlyphBitmap? {
            TextGlyphBitmap(width: 2, height: 2, pitch: 2,
                            pixels: [9, 9, 9, 9], bearingX: 0, bearingY: 0)
        }
    }

    private func constraints() -> TextLayoutConstraints {
        TextLayoutConstraints(maxWidth: -1, maxLines: 1)
    }

    func testTwoGlyphsProduceTwelveVertices() {
        let result = TextBlockBuilder.build(codePoints: [65, 66],
                                            initialFontSize: 10,
                                            constraints: constraints(),
                                            metrics: StubMetrics(),
                                            color: SIMD4<Float>(255, 255, 255, 255))
        XCTAssertEqual(result.vertices.count, 12, "每字形 6 顶点")
        XCTAssertEqual(result.lines.count, 1)
        XCTAssertEqual(result.fontSize, 10, accuracy: 1e-5)
    }

    func testPenAdvancesByMetricsPlusOne() {
        let result = TextBlockBuilder.build(codePoints: [65, 66],
                                            initialFontSize: 10,
                                            constraints: constraints(),
                                            metrics: StubMetrics(),
                                            color: SIMD4<Float>(255, 255, 255, 255))
        // 推进 = fontSize*faceScale(10) + glyph(0) + kern(0) + 1.0 = 11
        // 首字形左上角 c2 = (0,0)，第二个在 x=11
        XCTAssertEqual(result.vertices[2].position, SIMD2<Float>(0, 0))
        XCTAssertEqual(result.vertices[8].position, SIMD2<Float>(11, 0))
    }

    func testAtlasSlotsArePackedAndUVsDiffer() {
        let result = TextBlockBuilder.build(codePoints: [65, 66],
                                            initialFontSize: 10,
                                            constraints: constraints(),
                                            metrics: StubMetrics(),
                                            color: SIMD4<Float>(0, 0, 0, 255))
        // 顶点顺序 c0,c1,c2,c3,c1,c0；c2 的 UV 是 (u0, v1)，正是槽位原点，
        // 所以用下标 2 与 8 断言「第一个槽在 x=0、第二个在 x=3（2 + padding 1）」。
        let firstOriginU = result.vertices[2].uv.x
        let secondOriginU = result.vertices[8].uv.x
        XCTAssertEqual(firstOriginU, 0, accuracy: 1e-6)
        XCTAssertEqual(secondOriginU, 3.0 / 256.0, accuracy: 1e-6)
        XCTAssertNotEqual(result.vertices[0].uv, result.vertices[6].uv,
                          "两个字形的 UV 必须不同")
    }

    func testMissingGlyphAdvancesWithoutVertex() {
        final class EmptyMetrics: TextFontMetrics {
            var faceScale: Float = 1
            func glyphAdvance(codePoint: Int32, fontSize: Float) -> Float? { 0 }
            func kerning(first: Int32, second: Int32, fontSize: Float) -> Float { 0 }
            func glyphBitmap(codePoint: Int32, fontSize: Float) -> TextGlyphBitmap? { nil }
        }
        let result = TextBlockBuilder.build(codePoints: [65, 66],
                                            initialFontSize: 10,
                                            constraints: constraints(),
                                            metrics: EmptyMetrics(),
                                            color: SIMD4<Float>(0, 0, 0, 255))
        XCTAssertTrue(result.vertices.isEmpty, "没有位图就不产顶点，但仍按推进量前进")
        XCTAssertEqual(result.lines.count, 1)
    }

    func testAlignmentFlagsShiftWholeLine() {
        let plain = TextBlockBuilder.build(codePoints: [65],
                                           initialFontSize: 10,
                                           constraints: constraints(),
                                           metrics: StubMetrics(),
                                           color: SIMD4<Float>(0, 0, 0, 255))
        // 0x40 置位：y = -字号 = -10，整行下移
        let aligned = TextBlockBuilder.build(codePoints: [65],
                                             initialFontSize: 10,
                                             constraints: constraints(),
                                             metrics: StubMetrics(),
                                             color: SIMD4<Float>(0, 0, 0, 255),
                                             alignmentFlags: 0x40)
        let dy = aligned.vertices[0].position.y - plain.vertices[0].position.y
        XCTAssertEqual(dy, -10, accuracy: 1e-5)
    }
}
