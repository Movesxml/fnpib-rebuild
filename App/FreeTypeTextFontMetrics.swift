import Foundation
import FNPBCore

/// 用 vendored FreeType 实现 TextFontMetrics（发售版同一条光栅化路径）。
///
/// 证据：findings/uiscreen_text_rendering_macho.md §3.1 —— 原版依次调用
/// FT_Open_Face(内存模式) → FT_Get_Char_Index → FT_Load_Glyph(flags = 4 = FT_LOAD_RENDER) → FT_Get_Kerning。
///
/// [待验证] 字号→像素尺寸的换算：原版设定字号在 FUN_0031ddf8，语料未导出其换算细节。
/// 这里按 fontSize × faceScale 四舍五入到整像素；真机对比后再订正。
final class FreeTypeTextFontMetrics: TextFontMetrics {

    private let font: OpaquePointer
    /// FT_New_Memory_Face 不拷贝数据，必须自己持有这块内存直到 face 销毁。
    private let bytes: UnsafeMutableRawPointer
    private let byteCount: Int
    private var currentPixelSize: UInt32 = 0

    /// 从 bundle 里的字体文件构造；失败返回 nil。
    init?(fontURL: URL) {
        guard let data = try? Data(contentsOf: fontURL), !data.isEmpty else { return nil }
        let count = data.count
        let buffer = UnsafeMutableRawPointer.allocate(byteCount: count, alignment: 1)
        data.copyBytes(to: buffer.assumingMemoryBound(to: UInt8.self), count: count)
        guard let handle = FNFontCreate(buffer, count) else {
            buffer.deallocate()
            return nil
        }
        self.font = handle
        self.bytes = buffer
        self.byteCount = count
    }

    deinit {
        FNFontDestroy(font)
        bytes.deallocate()
    }

    // MARK: - TextFontMetrics

    /// 原版 face+0x180/+0x184 的内容缩放；内存字体没有外部缩放，取 1。
    var faceScale: Float { 1 }

    func glyphAdvance(codePoint: Int32, fontSize: Float) -> Float? {
        guard apply(pixelSizeFor(fontSize)) else { return nil }
        return Float(FNFontAdvance(font, UInt32(bitPattern: codePoint)))
    }

    func kerning(first: Int32, second: Int32, fontSize: Float) -> Float {
        guard apply(pixelSizeFor(fontSize)) else { return 0 }
        return Float(FNFontKerning(font, UInt32(bitPattern: first), UInt32(bitPattern: second)))
    }

    func glyphBitmap(codePoint: Int32, fontSize: Float) -> TextGlyphBitmap? {
        guard apply(pixelSizeFor(fontSize)) else { return nil }
        var width: Int32 = 0
        var rows: Int32 = 0
        var pitch: Int32 = 0
        var buffer: UnsafePointer<UInt8>?
        let status = FNFontRenderGlyph(font, UInt32(bitPattern: codePoint),
                                       &width, &rows, &pitch, &buffer)
        guard status == 0, let buffer, width > 0, rows > 0, pitch > 0 else { return nil }
        let total = Int(rows) * Int(pitch)
        let pixels = Array(UnsafeBufferPointer(start: buffer, count: total))
        return TextGlyphBitmap(width: Int(width), height: Int(rows),
                               pitch: Int(pitch), pixels: pixels)
    }

    // MARK: - 内部

    private func pixelSizeFor(_ fontSize: Float) -> UInt32 {
        let scaled = (fontSize * faceScale).rounded()
        guard scaled.isFinite, scaled > 0 else { return 1 }
        return UInt32(min(scaled, 1024))
    }

    private func apply(_ pixelSize: UInt32) -> Bool {
        if pixelSize == currentPixelSize { return true }
        guard FNFontSetPixelSize(font, pixelSize) == 0 else { return false }
        currentPixelSize = pixelSize
        return true
    }
}
