import XCTest
@testable import FNPBCore

/// TextLayoutEngine：行数上限与两级缩字号（证据 uiscreen_text_rendering_macho.md §2.3）。
final class TextLayoutEngineTests: XCTestCase {

    /// 合成推进量：每字符宽度 = size*0.5 + 1.0。
    private func advance(_ code: Int32, _ previous: Int32?, _ size: Float) -> Float {
        size * 0.5
    }

    private func text(_ count: Int) -> [Int32] {
        Array(repeating: Int32(97), count: count)
    }

    // MARK: 1. 行数上限归一化

    func testMaxLinesNormalisation() {
        XCTAssertEqual(TextLayoutEngine.resolvedMaxLines(0), 999_999)
        XCTAssertEqual(TextLayoutEngine.resolvedMaxLines(-3), 999_999)
        XCTAssertEqual(TextLayoutEngine.resolvedMaxLines(2), 2)
    }

    // MARK: 2. 高度公式

    func testTotalHeightFormula() {
        let result = TextLayoutResult(fontSize: 10,
                                      lines: [TextLineSlice(codePoints: [97], width: 0,
                                                           isTruncated: false, nextIndex: 1),
                                              TextLineSlice(codePoints: [98], width: 0,
                                                           isTruncated: false, nextIndex: 2)],
                                      isTruncated: false)
        // 2*10 + (2-1)*3 = 23
        XCTAssertEqual(result.totalHeight(verticalSpacing: 3), 23, accuracy: 1e-5)
        XCTAssertEqual(TextLayoutResult(fontSize: 10, lines: [], isTruncated: false)
            .totalHeight(verticalSpacing: 3), 0)
    }

    // MARK: 3. 行数上限触发缩字号

    func testShrinksUntilLineLimitFits() {
        let constraints = TextLayoutConstraints(maxWidth: 22, maxLines: 4)
        let result = TextLayoutEngine.layout(codePoints: text(20), initialFontSize: 10,
                                             constraints: constraints, faceScale: 0,
                                             advance: advance)
        // 纯字母文本没有可断点，每行都会置 truncated；原版判据是
        // 「行数 <= 上限 且 未截断」，所以两种情形都会触发缩字号。
        XCTAssertLessThan(result.fontSize, 10, "行数超限或截断都必须缩字号")
        XCTAssertLessThanOrEqual(result.lines.count, 4)
        XCTAssertGreaterThanOrEqual(result.fontSize, 5.0, "下限 5.0")
    }

    // MARK: 4. 缩到下限仍放不下

    func testStopsAtMinimumFontSize() {
        let constraints = TextLayoutConstraints(maxWidth: 5, maxLines: 1, minimumFontSize: 5.0)
        let result = TextLayoutEngine.layout(codePoints: text(200), initialFontSize: 12,
                                             constraints: constraints, faceScale: 0,
                                             advance: advance)
        XCTAssertEqual(result.fontSize, 5.0, accuracy: 1e-5, "到了下限就不再缩")
        XCTAssertGreaterThan(result.lines.count, 1)
    }

    // MARK: 5. noWrap 关闭换行

    func testNoWrapProducesSingleLine() {
        let constraints = TextLayoutConstraints(maxWidth: 4, maxLines: 1, noWrap: true)
        let result = TextLayoutEngine.layout(codePoints: text(30), initialFontSize: 10,
                                             constraints: constraints, faceScale: 0,
                                             advance: advance)
        XCTAssertEqual(result.lines.count, 1, "关闭换行后宽度实参为 -1")
        XCTAssertEqual(result.fontSize, 10, accuracy: 1e-5, "单行时不需要缩")
    }

    // MARK: 6. 高度受限缩字号，下限 6.0

    func testHeightLimitShrinksToHeightMinimum() {
        // noWrap 让第一段（行数/截断）必然通过，从而单独验证高度那一级：
        // 单行高度 = 字号 > 5，于是逐级缩到 6.0 的下限停下。
        let constraints = TextLayoutConstraints(maxWidth: 22, maxLines: 999,
                                                maxHeight: 5, verticalSpacing: 0,
                                                heightMinimumFontSize: 6.0, noWrap: true)
        let result = TextLayoutEngine.layout(codePoints: text(30), initialFontSize: 10,
                                             constraints: constraints, faceScale: 0,
                                             advance: advance)
        XCTAssertEqual(result.fontSize, 6.0, accuracy: 1e-5, "高度受限的下限是 6.0")
    }

    // MARK: 7. 放得下时不缩

    func testKeepsInitialSizeWhenItFits() {
        let constraints = TextLayoutConstraints(maxWidth: 1000, maxLines: 2)
        let result = TextLayoutEngine.layout(codePoints: text(5), initialFontSize: 10,
                                             constraints: constraints, faceScale: 0,
                                             advance: advance)
        XCTAssertEqual(result.fontSize, 10, accuracy: 1e-5)
        XCTAssertEqual(result.lines.count, 1)
    }
}
