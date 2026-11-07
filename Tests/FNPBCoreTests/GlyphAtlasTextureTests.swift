import XCTest
@testable import FNPBCore

/// GlyphAtlas 的 RGBA 展开（供 orderedQuad 着色器使用）。
final class GlyphAtlasTextureTests: XCTestCase {

    func testPackedRGBAHasWhiteRGBAndGrayAlpha() throws {
        var atlas = GlyphAtlas(width: 4, height: 2, padding: 0)
        let bitmap = TextGlyphBitmap(width: 2, height: 1, pitch: 2, pixels: [0, 128])
        _ = try atlas.insert(bitmap)
        let rgba = atlas.packedRGBA8()
        XCTAssertEqual(rgba.count, 4 * 2 * 4)

        // 第 0 像素：灰度 0 ⇒ alpha 0，RGB 全白
        XCTAssertEqual(rgba[0], 255)
        XCTAssertEqual(rgba[1], 255)
        XCTAssertEqual(rgba[2], 255)
        XCTAssertEqual(rgba[3], 0)

        // 第 1 像素：灰度 128
        XCTAssertEqual(rgba[7], 128)

        // 未写入的像素：alpha 0
        XCTAssertEqual(rgba[11], 0)
    }

    func testPixelSizeMatchesAtlas() {
        let atlas = GlyphAtlas(width: 16, height: 8)
        XCTAssertEqual(atlas.pixelSize.width, 16)
        XCTAssertEqual(atlas.pixelSize.height, 8)
    }
}
