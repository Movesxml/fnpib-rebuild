import Foundation

// ============================================================================
// TextFontMetrics.swift — 字体度量的提供者接口（排版层与光栅化层的接缝）
//
// 证据：shared_context/findings/uiscreen_text_rendering_macho.md §2.2 / §3
//   · 每字符推进 = fontSize*faceScale + glyph[2](+字距) + 1.0
//     （font_engine_real.txt:423-488；+1.0 由 TextLineBreaker 自己加）
//   · 字距只在上一个字形的 glyph[1] 与 face 相同时才取（:483-486、font_raster_layout.txt:660-675）
//   · 字形位图是 8bit 灰度，pitch = slot+0x54（§3.5）
//
// 这里只定义「排版需要字体给什么」，不规定字体怎么来（CoreText / 自研栅格器都只是实现）。
// ============================================================================

/// 一个字形的灰度位图与其在纹理中的 UV 矩形。
public struct TextGlyphBitmap: Sendable, Equatable {
    public var width: Int
    public var height: Int
    /// 原版 slot+0x54：每行字节数（可能大于 width）。
    public var pitch: Int
    /// width*height 个 8bit 灰度样本，按 pitch 组行时使用 `pitch` 而不是 `width`。
    public var pixels: [UInt8]
    /// 该字形在纹理图集中的 UV 矩形（左下、右上）。
    public var uvMinimum: SIMD2<Float>
    public var uvMaximum: SIMD2<Float>

    public init(width: Int, height: Int, pitch: Int, pixels: [UInt8],
                uvMinimum: SIMD2<Float>, uvMaximum: SIMD2<Float>) {
        self.width = width
        self.height = height
        self.pitch = pitch
        self.pixels = pixels
        self.uvMinimum = uvMinimum
        self.uvMaximum = uvMaximum
    }

    /// 第 row 行第 column 列的样本；越界返回 0。
    public func sample(row: Int, column: Int) -> UInt8 {
        guard row >= 0, row < height, column >= 0, column < width else { return 0 }
        let index = row * pitch + column
        guard index >= 0, index < pixels.count else { return 0 }
        return pixels[index]
    }
}

/// 排版需要的字体度量。
///
/// 实现方负责字形获取与位图缓存；调用方（排版/网格）只读这里的东西。
public protocol TextFontMetrics: AnyObject {
    /// 原版 font+0x184：面缩放，参与每字符的基础推进。
    var faceScale: Float { get }

    /// 原版 glyph[2]：字形自身推进量（不含 faceScale 与 +1.0）。
    /// 取不到字形时返回 nil，调用方按 0 处理并记录 [待验证]。
    func glyphAdvance(codePoint: Int32, fontSize: Float) -> Float?

    /// 原版 FUN_0031e9b0：两个字形的字距。
    /// 仅当两字形同属一个 face 且前一个字形 glyph[1] 与当前相同时才会被使用。
    func kerning(first: Int32, second: Int32, fontSize: Float) -> Float

    /// 字形位图与 UV；实现方负责把它放进纹理图集。
    func glyphBitmap(codePoint: Int32, fontSize: Float) -> TextGlyphBitmap?
}

public extension TextFontMetrics {
    /// 一个字形的总推进量（不含 TextLineBreaker 自己加的 +1.0）。
    /// 对应 font_engine_real.txt:483-488 的 `base + glyph[2] + kerning`。
    func advance(codePoint: Int32, previous: Int32?, fontSize: Float) -> Float {
        let base = fontSize * faceScale
        let glyph = glyphAdvance(codePoint: codePoint, fontSize: fontSize) ?? 0
        let kern = previous.map { kerning(first: $0, second: codePoint, fontSize: fontSize) } ?? 0
        return base + glyph + kern
    }
}

public extension TextLayoutEngine {
    /// 直接以字体度量为输入的便捷入口。
    static func layout(text: [Int32],
                       initialFontSize: Float,
                       constraints: TextLayoutConstraints,
                       metrics: any TextFontMetrics) -> TextLayoutResult {
        layout(codePoints: text,
               initialFontSize: initialFontSize,
               constraints: constraints,
               faceScale: metrics.faceScale,
               advance: { code, previous, size in
                   // 这里只返回「字形推进 + 字距」；faceScale 由 layout 内部乘字号后加。
                   let glyph = metrics.glyphAdvance(codePoint: code, fontSize: size) ?? 0
                   let kern = previous.map {
                       metrics.kerning(first: $0, second: code, fontSize: size)
                   } ?? 0
                   return glyph + kern
               })
    }
}
