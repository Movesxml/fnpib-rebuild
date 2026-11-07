import XCTest
@testable import FNPBCore

/// TextFontMetrics：推进量合成与位图采样（证据 font_engine_real.txt:483-488）。
final class TextFontMetricsTests: XCTestCase {

    private final class StubMetrics: TextFontMetrics {
        var faceScale: Float = 2
        var glyph: Float? = 3
        var kern: Float = 1
        func glyphAdvance(codePoint: Int32, fontSize: Float) -> Float? { glyph }
        func kerning(first: Int32, second: Int32, fontSize: Float) -> Float { kern }
        func glyphBitmap(codePoint: Int32, fontSize: Float) -> TextGlyphBitmap? { nil }
    }

    // MARK: 1. 推进量 = fontSize*faceScale + glyph + kerning

    func testAdvanceComposition() {
        let metrics = StubMetrics()
        // 10*2 + 3 + 0 = 23（没有上一个字形时不加字距）
        XCTAssertEqual(metrics.advance(codePoint: 65, previous: nil, fontSize: 10),
                       23, accuracy: 1e-5)
        // 10*2 + 3 + 1 = 24
        XCTAssertEqual(metrics.advance(codePoint: 65, previous: 66, fontSize: 10),
                       24, accuracy: 1e-5)
    }

    func testMissingGlyphAdvanceTreatedAsZero() {
        let metrics = StubMetrics()
        metrics.glyph = nil
        XCTAssertEqual(metrics.advance(codePoint: 97, previous: nil, fontSize: 10),
                       20, accuracy: 1e-5)
    }

    // MARK: 2. 与排版引擎串联

    func testLayoutUsesMetricsAdvance() {
        let metrics = StubMetrics()
        // 每字符 = fontSize*faceScale(20) + glyph(3) + kerning(1) + TextLineBreaker 的 +1.0 = 25；
        // 首字符没有上一个字形 ⇒ 24。四个字符合计 24 + 25*3 = 99。
        let constraints = TextLayoutConstraints(maxWidth: -1, maxLines: 1)
        let result = TextLayoutEngine.layout(text: [65, 66, 67, 68],
                                             initialFontSize: 10,
                                             constraints: constraints,
                                             metrics: metrics)
        XCTAssertEqual(result.lines.count, 1)
        XCTAssertEqual(result.fontSize, 10, accuracy: 1e-5)
        XCTAssertEqual(result.lines[0].width, 99, accuracy: 0.5,
                       "首字符 23+1=24，其后每字符 24+1=25，共 24+25*3=99")
    }

    // MARK: 3. 位图采样与越界

    func testGlyphBitmapSamplingHonoursPitch() {
        // 2x2 位图，pitch=3（每行多 1 字节填充）
        let bitmap = TextGlyphBitmap(width: 2, height: 2, pitch: 3,
                                     pixels: [10, 11, 0, 20, 21, 0],
                                     uvMinimum: SIMD2<Float>(0, 0),
                                     uvMaximum: SIMD2<Float>(0.5, 0.5))
        XCTAssertEqual(bitmap.sample(row: 0, column: 0), 10)
        XCTAssertEqual(bitmap.sample(row: 0, column: 1), 11)
        XCTAssertEqual(bitmap.sample(row: 1, column: 0), 20, "第二行按 pitch=3 偏移")
        XCTAssertEqual(bitmap.sample(row: 1, column: 1), 21)
        XCTAssertEqual(bitmap.sample(row: 2, column: 0), 0, "越界返回 0")
        XCTAssertEqual(bitmap.sample(row: 0, column: 2), 0)
    }
}
