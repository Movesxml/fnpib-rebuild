import Foundation

// ============================================================================
// TextLineMetrics.swift — 行距（原版没有独立行高字段）
//
// 证据：shared_context/findings/uiscreen_text_rendering_macho.md §2.6
//   pitch = (int)( s + V + 0.5*(s - S) )        （t089:146-155，0xbf000000 = -0.5f）
//     s = this+0xd8 本次实际字号
//     S = this+0x50 请求字号（+0x7e8）
//     V = this+0x4c verticalSpacing（+0x7f8，int，缺省 1）
//   未缩字时 s == S ⇒ pitch = 字号 + V，即行高 ≈ 字号 + 1px；
//   缩字时 0.5*(s-S) 是半差补偿。
//   ascent/descent/lineGap 全链不参与。
//
// ⚠️ [待验证] 半差项的方向：反编译里 FloatVectorSub 的实参方向定不死，
//   另一读法是 V + (S+s)/2。定案需要 Disassemble 0x00320ed8..0x00320f60。
//   本实现按文档主读法 s + V + 0.5*(s-S) 书写，定案后再改这一处即可。
// ============================================================================

public enum TextLineMetrics {

    /// 行与行之间的垂直间距（原版对 float 结果取整到 int 再使用）。
    ///
    /// - Parameters:
    ///   - currentFontSize: 本次实际字号（this+0xd8）。
    ///   - requestedFontSize: 请求字号（this+0x50）；未缩字时与 current 相同。
    ///   - verticalSpacing: this+0x4c，缺省 1。
    public static func verticalPitch(currentFontSize: Float,
                                     requestedFontSize: Float,
                                     verticalSpacing: Float) -> Float {
        let raw = currentFontSize + verticalSpacing
            + 0.5 * (currentFontSize - requestedFontSize)
        // 原版 (int) 截断（向零取整）。
        return Float(Int(raw))
    }

    /// 多行总高，用于高度受限判定：行数*字号 + (行数-1)*V（t089:510-518）。
    public static func totalHeight(lineCount: Int, fontSize: Float, verticalSpacing: Float) -> Float {
        guard lineCount > 0 else { return 0 }
        return Float(lineCount) * fontSize + Float(lineCount - 1) * verticalSpacing
    }
}
