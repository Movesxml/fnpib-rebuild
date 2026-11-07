import Foundation

// ============================================================================
// TextVerticalAlignment.swift — 竖直落点（写行记录 +0x10）
//
// 证据：shared_context/findings/uiscreen_text_rendering_macho.md §2.6 的 y 分支表，
// 实码为 build_logs/t089_line_layout_full.txt 的 FUN_00320ed8 尾部：
//   · 0x40 置位           :286-297  y_k = -s - k*pitch
//   · 0x40 清、居中(0xc 或 0x20)、单行  :194-229
//         非镜像: y = m3/2 - m1 - (H-h)/2
//         镜像  : y = -(H/2) - (s+4)/2
//   · 同条件、多行        :230-241  y_0 = -(maxH/2) + (n*pitch)/2 - H/2 - pitch/2 - min|m3|
//   · 0x40 清、0x8 清     :243-268  acc_0 = -(pitch/2)；y_k = acc_k - m3_k - h_k/2；acc -= pitch；
//                                   且首行在本对象 +0xe0 != 0 时改为 y = -m1
//   · 0x40 清、0x8 置     :269-284  acc_0 = -H - m3_0；y_k = acc_k；acc += pitch
// 全部为整数运算（除法向零截断），除 §2.6 标注的两处浮点乘法（单行居中）。
//
// 输入里的 meshTop / meshBottom 是主层 mesh 包围盒的 +0x04 / +0x0c（[推断]，写入者尚未导出）。
// ============================================================================

public struct TextVerticalAlignmentInput: Sendable, Equatable {
    /// 归一化后的对齐掩码（this+0x34）。
    public var flags: UInt32
    /// 行距（已按 TextLineMetrics 截断为整数）。
    public var pitch: Int32
    /// this+0xd8：本次实际字号，仅 0x40 支路使用。
    public var fontSize: Int32
    /// 每行主层 mesh 的 +0x04。
    public var meshTop: [Int32]
    /// 每行主层 mesh 的 +0x0c。
    public var meshBottom: [Int32]
    /// this+0x28：高度上限。
    public var heightLimit: Int32
    /// this+0xe0 != 0：首行走 -m1 特例。
    public var firstLinePinned: Bool
    /// FUN_0031fa44() + 0x21 != 0：单行居中改走镜像公式。
    public var mirrored: Bool

    public init(flags: UInt32,
                pitch: Int32,
                fontSize: Int32,
                meshTop: [Int32],
                meshBottom: [Int32],
                heightLimit: Int32,
                firstLinePinned: Bool = true,
                mirrored: Bool = false) {
        self.flags = flags
        self.pitch = pitch
        self.fontSize = fontSize
        self.meshTop = meshTop
        self.meshBottom = meshBottom
        self.heightLimit = heightLimit
        self.firstLinePinned = firstLinePinned
        self.mirrored = mirrored
    }

    public var lineCount: Int { min(meshTop.count, meshBottom.count) }
}

public enum TextVerticalAlignment {

    /// 每行的 +0x10 值。
    ///
    /// 调用方需保证 meshTop / meshBottom 等长，且 lineCount >= 1。
    public static func lineOffsets(_ input: TextVerticalAlignmentInput) -> [Int32] {
        let n = input.lineCount
        guard n > 0 else { return [] }
        let pitch = Int(input.pitch)
        var result = [Int32](repeating: 0, count: n)

        // 0x40 支路：y_k = -s - k*pitch
        if input.flags & 0x40 != 0 {
            var value = -Int(input.fontSize)
            for k in 0..<n {
                result[k] = Int32(value)
                value -= pitch
            }
            return result
        }

        // 居中支路（0xc == 0xc 或 0x20 置位）
        if (input.flags & 0xc) == 0xc || (input.flags & 0x20) != 0 {
            if n == 1 {
                let m1 = input.meshTop[0]
                let m3 = input.meshBottom[0]
                let height = abs(Int(m3) - Int(m1))
                let limit = Int(input.heightLimit)
                let y: Float
                if input.mirrored {
                    // -(H/2) - (s + 4)/2，两步都在 float 里做
                    let half = -(Float(limit) * 0.5)
                    y = half - (Float(input.fontSize) + 4.0) * 0.5
                } else {
                    y = Float(m3) * 0.5 - Float(m1) - Float(limit - height) * 0.5
                }
                result[0] = Int32(y)
                return result
            }

            var maxHeight = 0
            var minAbsBottom = Int(Int32.max)
            for k in 0..<n {
                let m1 = Int(input.meshTop[k])
                let m3 = Int(input.meshBottom[k])
                maxHeight = max(maxHeight, abs(m3 - m1))
                minAbsBottom = min(minAbsBottom, abs(m3))
            }
            let limit = Int(input.heightLimit)
            // 全部整数运算：-(maxH/2) + (n*pitch)/2 - H/2 - pitch/2 - minAbs
            var value = -(maxHeight / 2) + (n * pitch) / 2 - limit / 2 - pitch / 2 - minAbsBottom
            for k in 0..<n {
                result[k] = Int32(value)
                value -= pitch
            }
            return result
        }

        // 0x8 清：逐行按 mesh 底边与高度定位
        if input.flags & 0x8 == 0 {
            var accumulator = -(pitch / 2)
            for k in 0..<n {
                let m1 = Int(input.meshTop[k])
                let m3 = Int(input.meshBottom[k])
                let height = abs(m3 - m1)
                let y: Int
                if k == 0, input.firstLinePinned {
                    y = -m1
                } else {
                    y = accumulator - m3 - height / 2
                }
                result[k] = Int32(y)
                accumulator -= pitch
            }
            return result
        }

        // 0x8 置、非 0xc：acc_0 = -H - m3_0，随后逐行 +pitch
        var accumulator = -Int(input.heightLimit)
        for k in 0..<n {
            if k == 0 {
                accumulator -= Int(input.meshBottom[0])
            }
            result[k] = Int32(accumulator)
            accumulator += pitch
        }
        return result
    }
}
