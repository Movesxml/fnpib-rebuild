import Foundation

// ============================================================================
// TextAlignment.swift — 对齐掩码的归一化与水平落点（纯逻辑）
//
// 证据：shared_context/findings/uiscreen_text_rendering_macho.md §2.4
//   · 掩码字段是 this+0x73c（不是旧记的 +0x7bc），构造默认 0xf；
//     alignToFontMeshBounds(+0x878) == 0 时归一化为 (flags & ~0x4c) | 0x40，
//     默认 0x0f → 0x43（component_text_font_path.txt:105-107）。
//   · 水平落点写 0x40 记录的 +0xc，由 flags & 3 决定（build_logs/t089_line_layout_full.txt:298-347）：
//       0/1 → 0
//       2   → (int)(W - |m2-m0|)
//       3   → (int)(W*0.5 - |m2-m0|*0.5)
//     随后若 flags & 0x20 命中则覆盖：mesh 宽 < W → 0，否则 W - |mesh 宽|。
//
// 竖直对齐（写 +0x10）依赖主层 mesh 包围盒 +0x00..+0x0c 的写入者，该写入者尚未导出，
// 因此本文件只做水平部分，竖直部分等证据齐了再补。
// ============================================================================

public enum TextAlignment {

    /// 归一化对齐掩码。
    ///
    /// - Parameter alignToFontMeshBounds: 组件 +0x878。为 false 时强制 0x40 位并清掉 0x4c。
    public static func normalizedFlags(_ raw: UInt32, alignToFontMeshBounds: Bool) -> UInt32 {
        guard !alignToFontMeshBounds else { return raw }
        return (raw & ~UInt32(0x4c)) | UInt32(0x40)
    }

    /// 水平偏移：写入每条行记录的 +0xc。
    ///
    /// - Parameters:
    ///   - flags: 归一化后的掩码。
    ///   - widthLimit: this+0x24（W，整数字号/宽度上限）。
    ///   - meshWidth: 主层 mesh 的宽度，即 `[2] - [0]` 的**有符号**差值（调用方不要预先取绝对值）。
    public static func horizontalOffset(flags: UInt32, widthLimit: Int32, meshWidth: Int32) -> Int32 {
        let width = Float(widthLimit)
        let mesh = Float(meshWidth)
        var offset: Float = 0

        switch flags & 3 {
        case 2:
            offset = width - abs(mesh)
        case 3:
            offset = width * 0.5 - abs(mesh) * 0.5
        default:
            offset = 0
        }

        // 0x20 分支覆盖上面的结果；注意比较用的是有符号 mesh 宽。
        if flags & 0x20 != 0 {
            if meshWidth < widthLimit {
                offset = 0
            } else {
                offset = width - abs(mesh)
            }
        }
        return Int32(offset)
    }
}
