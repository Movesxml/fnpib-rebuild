import XCTest
@testable import FNPBCore

/// TextLineBreaker：断点掩码与单行判定（证据 font_engine_real.txt:440-533）。
final class TextLineBreakerTests: XCTestCase {

    /// 每字符步长固定的推进器：advance 返回 9，配合 baseAdvance=0 与 +1.0 得每字符 10。
    private func uniformAdvance(_ code: Int32, _ previous: Int32?) -> Float { 9 }

    // MARK: 1. 可断点掩码（0x800011 覆盖 9(TAB)、13(CR)、32(空格)）

    func testBreakOpportunityMask() {
        XCTAssertTrue(TextLineBreaker.isBreakOpportunity(9), "TAB")
        XCTAssertTrue(TextLineBreaker.isBreakOpportunity(13), "CR")
        XCTAssertTrue(TextLineBreaker.isBreakOpportunity(32), "空格")
        XCTAssertTrue(TextLineBreaker.isBreakOpportunity(0x200b), "零宽空格")
        XCTAssertTrue(TextLineBreaker.isBreakOpportunity(0x3000), "表意空格")
        XCTAssertFalse(TextLineBreaker.isBreakOpportunity(10), "换行走单独分支，不在掩码里")
        XCTAssertFalse(TextLineBreaker.isBreakOpportunity(97), "普通字母")
        XCTAssertFalse(TextLineBreaker.isBreakOpportunity(0x3001))
        XCTAssertFalse(TextLineBreaker.isBreakOpportunity(8), "退格不在掩码")
    }

    // MARK: 2. 在空白前断行，空白归下一行

    func testBreaksBeforeSpaceAndLeavesSpaceForNextLine() throws {
        // "abc def"，每字符 10；maxWidth=35：a10 b20 c30 (空格记录断点) 40>35
        let codes: [Int32] = [97, 98, 99, 32, 100, 101, 102]
        let line = try XCTUnwrap(TextLineBreaker.firstLine(
            of: codes, baseAdvance: 0, maxWidth: 35, advance: uniformAdvance))
        XCTAssertEqual(line.codePoints, [97, 98, 99])
        XCTAssertEqual(line.width, 30, accuracy: 1e-5, "本行不含空格的 10")
        XCTAssertFalse(line.isTruncated)
        XCTAssertEqual(line.nextIndex, 3, "下一行从空格开始，由调用方决定是否跳过")
    }

    // MARK: 3. 无可断点则整行溢出并置截断

    func testHardOverflowSetsTruncated() throws {
        let codes: [Int32] = [97, 98, 99, 100, 101, 102]
        let line = try XCTUnwrap(TextLineBreaker.firstLine(
            of: codes, baseAdvance: 0, maxWidth: 35, advance: uniformAdvance))
        XCTAssertEqual(line.codePoints, [97, 98, 99, 100])
        XCTAssertEqual(line.width, 40, accuracy: 1e-5)
        XCTAssertTrue(line.isTruncated)
        XCTAssertEqual(line.nextIndex, 4)
    }

    // MARK: 4. 显式换行

    func testExplicitNewlineEndsLineWithoutBeingConsumed() throws {
        let codes: [Int32] = [97, 98, 10, 99]
        let line = try XCTUnwrap(TextLineBreaker.firstLine(
            of: codes, baseAdvance: 0, maxWidth: -1, advance: uniformAdvance))
        XCTAssertEqual(line.codePoints, [97, 98])
        XCTAssertEqual(line.width, 20, accuracy: 1e-5)
        XCTAssertFalse(line.isTruncated)
        XCTAssertEqual(line.nextIndex, 3, "跳过换行符本身")
    }

    // MARK: 5. 不限宽

    func testUnlimitedWidthKeepsEverything() throws {
        let codes: [Int32] = [97, 32, 98]
        let line = try XCTUnwrap(TextLineBreaker.firstLine(
            of: codes, baseAdvance: 0, maxWidth: -1, advance: uniformAdvance))
        XCTAssertEqual(line.codePoints, codes)
        XCTAssertEqual(line.width, 30, accuracy: 1e-5)
        XCTAssertEqual(line.nextIndex, 3)
    }

    // MARK: 6. 起始处不可用断点

    func testLeadingSpaceIsNotUsedAsBreak() throws {
        // 首字符就是空格：断点位置 == startIndex，不能把行切成空行。
        let codes: [Int32] = [32, 97, 98]
        let line = try XCTUnwrap(TextLineBreaker.firstLine(
            of: codes, baseAdvance: 0, maxWidth: 15, advance: uniformAdvance))
        XCTAssertEqual(line.codePoints, [32, 97], "溢出时没有可用断点，整段保留")
        XCTAssertTrue(line.isTruncated)
    }

    // MARK: 7. baseAdvance 参与累加

    func testBaseAdvanceAddsPerCharacter() throws {
        // base=5 + advance 9 + 1.0 = 15/字符：3 个字符 = 45 > 40
        let codes: [Int32] = [97, 98, 99]
        let line = try XCTUnwrap(TextLineBreaker.firstLine(
            of: codes, baseAdvance: 5, maxWidth: 40, advance: uniformAdvance))
        XCTAssertEqual(line.width, 45, accuracy: 1e-5)
        XCTAssertTrue(line.isTruncated)
    }
}
