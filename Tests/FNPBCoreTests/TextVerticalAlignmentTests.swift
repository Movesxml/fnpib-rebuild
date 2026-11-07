import XCTest
@testable import FNPBCore

/// TextVerticalAlignment：竖直落点五条支路（证据 §2.6 / t089 尾部）。
final class TextVerticalAlignmentTests: XCTestCase {

    private func make(flags: UInt32,
                      pitch: Int32 = 12,
                      fontSize: Int32 = 10,
                      top: [Int32] = [0],
                      bottom: [Int32] = [0],
                      height: Int32 = 40,
                      pinned: Bool = false,
                      mirrored: Bool = false) -> TextVerticalAlignmentInput {
        TextVerticalAlignmentInput(flags: flags, pitch: pitch, fontSize: fontSize,
                                   meshTop: top, meshBottom: bottom,
                                   heightLimit: height,
                                   firstLinePinned: pinned, mirrored: mirrored)
    }

    // MARK: 1. 0x40 置位：y_k = -s - k*pitch

    func testMeshBoundsFlagStacksByPitch() {
        let offsets = TextVerticalAlignment.lineOffsets(
            make(flags: 0x40, top: [0, 0], bottom: [0, 0]))
        XCTAssertEqual(offsets, [-10, -22])
    }

    // MARK: 2. 居中单行

    func testCenteredSingleLine() {
        // m3/2 - m1 - (H-h)/2 = 10 - 4 - 12 = -6
        let offsets = TextVerticalAlignment.lineOffsets(
            make(flags: 0x4c, top: [4], bottom: [20]))
        XCTAssertEqual(offsets, [-6])
    }

    func testCenteredSingleLineMirrored() {
        // -(H/2) - (s+4)/2 = -20 - 7 = -27
        let offsets = TextVerticalAlignment.lineOffsets(
            make(flags: 0x4c, top: [4], bottom: [20], mirrored: true))
        XCTAssertEqual(offsets, [-27])
    }

    // MARK: 3. 居中多行（含 -min|m3| 与整数截断）

    func testCenteredMultiLine() {
        // maxH=16, minAbs=20: y0 = -8 + 12 - 20 - 6 - 20 = -42, y1 = -54
        let offsets = TextVerticalAlignment.lineOffsets(
            make(flags: 0x4c, top: [4, 4], bottom: [20, 20]))
        XCTAssertEqual(offsets, [-42, -54])
    }

    // MARK: 4. 0x8 清：首行钉住走 -m1

    func testFirstLinePinnedUsesMeshTop() {
        let offsets = TextVerticalAlignment.lineOffsets(
            make(flags: 0x0, top: [8], bottom: [20], pinned: true))
        XCTAssertEqual(offsets, [-8])
    }

    func testWithoutPinUsesHalfPitchAndMeshBottom() {
        // acc=-6；y = -6 - 20 - 6 = -32
        let offsets = TextVerticalAlignment.lineOffsets(
            make(flags: 0x0, top: [8], bottom: [20], pinned: false))
        XCTAssertEqual(offsets, [-32])
    }

    func testWithoutPinMultiLineAccumulatesPitch() {
        // y0=-32, acc=-18 ⇒ y1 = -18 - 20 - 6 = -44
        let offsets = TextVerticalAlignment.lineOffsets(
            make(flags: 0x0, top: [8, 8], bottom: [20, 20], pinned: false))
        XCTAssertEqual(offsets, [-32, -44])
    }

    // MARK: 5. 0x8 置、非 0xc：从 -H - m3 起逐行加 pitch

    func testBottomAlignedStartsFromHeightAndMeshBottom() {
        let offsets = TextVerticalAlignment.lineOffsets(
            make(flags: 0x8, top: [0, 0], bottom: [20, 20], pinned: false))
        XCTAssertEqual(offsets, [-60, -48])
    }
}
