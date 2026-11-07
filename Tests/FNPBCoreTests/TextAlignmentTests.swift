import XCTest
@testable import FNPBCore

/// TextAlignment：掩码归一化与水平落点（证据 §2.4 / t089:298-347）。
final class TextAlignmentTests: XCTestCase {

    // MARK: 1. 归一化：alignToFontMeshBounds == 0 ⇒ (flags & ~0x4c) | 0x40

    func testNormalisationForcesMeshBoundsFlag() {
        // 默认 0x0f → 0x43
        XCTAssertEqual(TextAlignment.normalizedFlags(0x0f, alignToFontMeshBounds: false), 0x43)
        // 已是 0x4c 位全置时被清掉再加 0x40
        XCTAssertEqual(TextAlignment.normalizedFlags(0x4f, alignToFontMeshBounds: false), 0x43)
        // 0x20 不受影响
        XCTAssertEqual(TextAlignment.normalizedFlags(0x2f, alignToFontMeshBounds: false), 0x63)
    }

    func testNormalisationIsIdentityWhenMeshBoundsAlignmentEnabled() {
        XCTAssertEqual(TextAlignment.normalizedFlags(0x0f, alignToFontMeshBounds: true), 0x0f)
    }

    // MARK: 2. flags & 3 的三个分支

    func testLeftAndUndefinedAreZero() {
        XCTAssertEqual(TextAlignment.horizontalOffset(flags: 0x40, widthLimit: 100, meshWidth: 40), 0)
        XCTAssertEqual(TextAlignment.horizontalOffset(flags: 0x41, widthLimit: 100, meshWidth: 40), 0)
    }

    func testRightAlignSubtractsMeshWidth() {
        // W - |m| = 100 - 40 = 60
        XCTAssertEqual(TextAlignment.horizontalOffset(flags: 0x42, widthLimit: 100, meshWidth: 40), 60)
        // 负的 mesh 差同样取绝对值
        XCTAssertEqual(TextAlignment.horizontalOffset(flags: 0x42, widthLimit: 100, meshWidth: -40), 60)
    }

    func testCenterAlignHalvesBothTerms() {
        // 100*0.5 - 40*0.5 = 30
        XCTAssertEqual(TextAlignment.horizontalOffset(flags: 0x43, widthLimit: 100, meshWidth: 40), 30)
        // 奇数时按浮点截断：11*0.5 - 5*0.5 = 3.0 ⇒ 3
        XCTAssertEqual(TextAlignment.horizontalOffset(flags: 0x43, widthLimit: 11, meshWidth: 5), 3)
    }

    // MARK: 3. 0x20 覆盖分支

    func testOverflowFlagZeroesWhenMeshFits() {
        // mesh(40) < W(100) ⇒ 0，即使 &3 == 2 算出了 60
        XCTAssertEqual(TextAlignment.horizontalOffset(flags: 0x62, widthLimit: 100, meshWidth: 40), 0)
    }

    func testOverflowFlagShiftsWhenMeshTooWide() {
        // mesh(120) >= W(100) ⇒ W - |m| = -20
        XCTAssertEqual(TextAlignment.horizontalOffset(flags: 0x62, widthLimit: 100, meshWidth: 120), -20)
    }
}
