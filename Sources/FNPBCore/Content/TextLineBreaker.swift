import Foundation

// ============================================================================
// TextLineBreaker.swift — ComponentText 的单行断行（纯逻辑）
//
// 证据：shared_context/findings/uiscreen_text_rendering_macho.md §2.2，
// 原始反编译 build_logs/font_engine_real.txt:440-533（FUN_0031b8fc）。
//
// 只实现「一行」的判定，与原版函数粒度一致：原版 FUN_0031b8fc 每次只产出一行，
// 剩余文本写回出参由外壳 FUN_00321920 反复调用（font_mesh_construction.txt:33-96）。
// 多行循环与其首部空白处理不在本文件内。
// ============================================================================

/// 一行的判定结果。
public struct TextLineSlice: Sendable, Equatable {
    /// 进入本行的码点（不含换行符，也不含作为断点的空白）。
    public var codePoints: [Int32]
    /// 本行累计宽度，含每字符 +1.0 的固定增量。
    public var width: Float
    /// 行内没有可断点却仍超宽：原版 outTruncated。
    public var isTruncated: Bool
    /// 下一行应从源串的哪个下标继续。
    public var nextIndex: Int

    public init(codePoints: [Int32], width: Float, isTruncated: Bool, nextIndex: Int) {
        self.codePoints = codePoints
        self.width = width
        self.isTruncated = isTruncated
        self.nextIndex = nextIndex
    }
}

public enum TextLineBreaker {

    /// 原版掩码（font_engine_real.txt:454）：码点 9..32 中的 9(TAB)、13(CR)、32(空格)。
    public static let breakableMask: UInt32 = 0x800011

    /// 可断点判定，按反编译分支直译：
    ///   code >> 12 < 3 时看 (code-9) < 0x18 且掩码，另外 0x200b 也算；
    ///   否则只有 0x3000 算。
    public static func isBreakOpportunity(_ code: Int32) -> Bool {
        if UInt32(bitPattern: code) >> 12 < 3 {
            if code >= 9, code < 9 + 0x18 {
                let shift = UInt32(truncatingIfNeeded: code - 9) & 0xff
                if (UInt32(1) << shift) & breakableMask != 0 { return true }
            }
            return code == 0x200b
        }
        return code == 0x3000
    }

    /// 取第一行。
    ///
    /// 与原版一致的三个要点：
    /// 1. 每字符宽度 = baseAdvance + advance(code, previous) + 1.0（:486-488）；
    /// 2. 遇到可断点字符时记录「该字符的位置」与「尚未计入它的宽度」（:465-469 的
    ///    uVar15 = 累计宽度、local_a0 = 当前索引），因此**断点字符归下一行**，本行宽度不含它；
    /// 3. 超宽且没有可断点时整行保留并置 isTruncated（:492-500）。
    ///
    /// - Parameters:
    ///   - startIndex: 从源串的哪个下标开始（便于外壳逐行调用）。
    ///   - maxWidth: -1 表示不限宽（与原版同一约定，:491）。
    public static func firstLine(of codePoints: [Int32],
                                 startIndex: Int = 0,
                                 baseAdvance: Float,
                                 maxWidth: Float,
                                 advance: (Int32, Int32?) -> Float) -> TextLineSlice? {
        guard startIndex >= 0, startIndex < codePoints.count else { return nil }

        var index = startIndex
        var previous: Int32? = nil
        var width: Float = 0
        var breakIndex: Int? = nil
        var breakWidth: Float = 0

        while index < codePoints.count {
            let code = codePoints[index]

            // 显式换行：本行到此结束，换行符不进入任何一行（:471-478）。
            if code == 10 {
                return TextLineSlice(codePoints: Array(codePoints[startIndex..<index]),
                                     width: width,
                                     isTruncated: false,
                                     nextIndex: index + 1)
            }

            let step = baseAdvance + advance(code, previous) + 1.0
            width += step
            previous = code

            if isBreakOpportunity(code) {
                // 断点记录在「计入该字符之前」，断点字符留给下一行。
                breakIndex = index
                breakWidth = width - step
            }
            index += 1

            if maxWidth != -1, width > maxWidth {
                if let stop = breakIndex, stop > startIndex {
                    return TextLineSlice(codePoints: Array(codePoints[startIndex..<stop]),
                                         width: breakWidth,
                                         isTruncated: false,
                                         nextIndex: stop)
                }
                return TextLineSlice(codePoints: Array(codePoints[startIndex..<index]),
                                     width: width,
                                     isTruncated: true,
                                     nextIndex: index)
            }
        }

        return TextLineSlice(codePoints: Array(codePoints[startIndex..<codePoints.count]),
                             width: width,
                             isTruncated: false,
                             nextIndex: codePoints.count)
    }
}
