import XCTest
@testable import FNPBCore

/// TextLineMetrics：行距公式（证据 uiscreen_text_rendering_macho.md §2.6 / t089:146-155）。
final class TextLineMetricsTests: XCTestCase {

    // MARK: 1. 未缩字时行距 = 字号 + verticalSpacing

    func testPitchWithoutShrinking() {
        // 10 + 1 + 0.5*(10-10) = 11
        XCTAssertEqual(TextLineMetrics.verticalPitch(currentFontSize: 10,
                                                     requestedFontSize: 10,
                                                     verticalSpacing: 1),
                       11, accuracy: 1e-5)
        // 缺省 V=1 之外的取值同样线性
        XCTAssertEqual(TextLineMetrics.verticalPitch(currentFontSize: 20,
                                                     requestedFontSize: 20,
                                                     verticalSpacing: 3),
                       23, accuracy: 1e-5)
    }

    // MARK: 2. 缩字时带半差补偿

    func testPitchWithShrinking() {
        // 8 + 1 + 0.5*(8-10) = 8
        XCTAssertEqual(TextLineMetrics.verticalPitch(currentFontSize: 8,
                                                     requestedFontSize: 10,
                                                     verticalSpacing: 1),
                       8, accuracy: 1e-5)
        // 6 + 2 + 0.5*(6-12) = 5
        XCTAssertEqual(TextLineMetrics.verticalPitch(currentFontSize: 6,
                                                     requestedFontSize: 12,
                                                     verticalSpacing: 2),
                       5, accuracy: 1e-5)
    }

    // MARK: 3. 结果按 int 截断

    func testPitchTruncatesToInteger() {
        // 10.4 + 1 + 0 = 11.4 ⇒ 11
        XCTAssertEqual(TextLineMetrics.verticalPitch(currentFontSize: 10.4,
                                                     requestedFontSize: 10.4,
                                                     verticalSpacing: 1),
                       11, accuracy: 1e-5)
        // 10 + 0.7 + 0 = 10.7 ⇒ 10
        XCTAssertEqual(TextLineMetrics.verticalPitch(currentFontSize: 10,
                                                     requestedFontSize: 10,
                                                     verticalSpacing: 0.7),
                       10, accuracy: 1e-5)
    }

    // MARK: 4. 多行总高（高度判定用的另一条公式）

    func testTotalHeight() {
        // 3*10 + 2*1 = 32
        XCTAssertEqual(TextLineMetrics.totalHeight(lineCount: 3, fontSize: 10,
                                                    verticalSpacing: 1),
                       32, accuracy: 1e-5)
        XCTAssertEqual(TextLineMetrics.totalHeight(lineCount: 0, fontSize: 10,
                                                    verticalSpacing: 1),
                       0, accuracy: 1e-5)
    }
}
