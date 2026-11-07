import Foundation

// ============================================================================
// GlyphAtlas+Texture.swift — 图集送给渲染层的形式
//
// 现有着色器（Sources/FNPBRender/Shaders/orderedQuad.metal:33-39）是
//     fragment = texture0.sample(uv) * vertexColor
// 并配 sourceAlpha / oneMinusSourceAlpha 混合。
// 因此字形只需要「形状」进 alpha 通道：RGB 恒 255，A = 灰度样本。
// 文字颜色由顶点色给出（TextVertex.color），与图集无关。
// ============================================================================

public extension GlyphAtlas {
    /// 把灰度图集展开成 RGBA8（每像素 4 字节，行优先、无行填充）。
    ///
    /// 8bit 灰度原样进 alpha；RGB 恒 255 以便与顶点色相乘。
    func packedRGBA8() -> [UInt8] {
        var rgba = [UInt8](repeating: 0, count: width * height * 4)
        for index in 0..<(width * height) {
            let alpha = pixels[index]
            let base = index * 4
            rgba[base] = 255
            rgba[base + 1] = 255
            rgba[base + 2] = 255
            rgba[base + 3] = alpha
        }
        return rgba
    }

    /// 图集的像素尺寸（供纹理描述使用）。
    var pixelSize: (width: Int, height: Int) { (width, height) }
}
