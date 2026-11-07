import XCTest
@testable import FNPBCore

/// GlyphAtlas：货架式打包的拷贝与 UV（视觉等价，排布不宣称复刻原版）。
final class GlyphAtlasTests: XCTestCase {

    private func bitmap(width: Int, height: Int, pitch: Int, value: UInt8) -> TextGlyphBitmap {
        var pixels = [UInt8](repeating: 0, count: height * pitch)
        for row in 0..<height {
            for column in 0..<width { pixels[row * pitch + column] = value }
        }
        return TextGlyphBitmap(width: width, height: height, pitch: pitch, pixels: pixels,
                               uvMinimum: SIMD2<Float>(0, 0), uvMaximum: SIMD2<Float>(0, 0))
    }

    // MARK: 1. 位置与 UV

    func testFirstInsertLandsAtOrigin() throws {
        var atlas = GlyphAtlas(width: 16, height: 16, padding: 1)
        let slot = try atlas.insert(bitmap(width: 2, height: 2, pitch: 3, value: 200))
        XCTAssertEqual(slot.x, 0)
        XCTAssertEqual(slot.y, 0)
        XCTAssertEqual(slot.uvMinimum, SIMD2<Float>(0, 0))
        XCTAssertEqual(slot.uvMaximum, SIMD2<Float>(2.0 / 16.0, 2.0 / 16.0))
    }

    func testSecondInsertAdvancesByWidthPlusPadding() throws {
        var atlas = GlyphAtlas(width: 16, height: 16, padding: 1)
        _ = try atlas.insert(bitmap(width: 2, height: 2, pitch: 2, value: 10))
        let second = try atlas.insert(bitmap(width: 3, height: 2, pitch: 3, value: 20))
        XCTAssertEqual(second.x, 3, "2 + padding 1")
        XCTAssertEqual(second.y, 0)
    }

    // MARK: 2. 像素按 pitch 拷贝

    func testPixelsAreCopiedHonouringPitch() throws {
        var atlas = GlyphAtlas(width: 8, height: 8, padding: 0)
        var source = [UInt8](repeating: 0, count: 2 * 3)
        source[0] = 1; source[1] = 2; source[3] = 3; source[4] = 4
        let bitmap = TextGlyphBitmap(width: 2, height: 2, pitch: 3, pixels: source,
                                     uvMinimum: SIMD2<Float>(0, 0), uvMaximum: SIMD2<Float>(0, 0))
        _ = try atlas.insert(bitmap)
        XCTAssertEqual(atlas.sample(x: 0, y: 0), 1)
        XCTAssertEqual(atlas.sample(x: 1, y: 0), 2)
        XCTAssertEqual(atlas.sample(x: 0, y: 1), 3, "第二行按 pitch=3 取源")
        XCTAssertEqual(atlas.sample(x: 1, y: 1), 4)
        XCTAssertEqual(atlas.sample(x: 2, y: 0), 0)
    }

    // MARK: 3. 换行与溢出

    func testWrapsToNextShelf() throws {
        var atlas = GlyphAtlas(width: 8, height: 16, padding: 1)
        _ = try atlas.insert(bitmap(width: 5, height: 3, pitch: 5, value: 1))
        let second = try atlas.insert(bitmap(width: 5, height: 2, pitch: 5, value: 2))
        XCTAssertEqual(second.x, 0, "放不下换新行")
        XCTAssertEqual(second.y, 4, "上一行高 3 + padding 1")
    }

    func testRejectsBitmapLargerThanAtlas() {
        var atlas = GlyphAtlas(width: 8, height: 8)
        XCTAssertThrowsError(try atlas.insert(bitmap(width: 9, height: 1, pitch: 9, value: 0))) { error in
            XCTAssertEqual(error as? GlyphAtlasError,
                           .bitmapTooLarge(width: 9, height: 1, atlasWidth: 8, atlasHeight: 8))
        }
    }

    func testReportsOutOfSpace() throws {
        var atlas = GlyphAtlas(width: 8, height: 8, padding: 1)
        _ = try atlas.insert(bitmap(width: 8, height: 8, pitch: 8, value: 0))
        XCTAssertThrowsError(try atlas.insert(bitmap(width: 8, height: 8, pitch: 8, value: 0)))
    }

    func testRejectsInconsistentPixelCount() {
        var atlas = GlyphAtlas(width: 8, height: 8)
        let short = TextGlyphBitmap(width: 2, height: 2, pitch: 4, pixels: [1, 2],
                                    uvMinimum: SIMD2<Float>(0, 0), uvMaximum: SIMD2<Float>(0, 0))
        XCTAssertThrowsError(try atlas.insert(short)) { error in
            XCTAssertEqual(error as? GlyphAtlasError,
                           .pixelCountMismatch(expected: 8, actual: 2))
        }
    }
}
