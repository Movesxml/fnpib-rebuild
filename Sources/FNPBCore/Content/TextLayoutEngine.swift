import Foundation

// ============================================================================
// TextLayoutEngine.swift — 行数上限与自动缩字号（纯逻辑）
//
// 证据：shared_context/findings/uiscreen_text_rendering_macho.md §2.3
//   · 行数上限取 this+0x2c，< 1 时按 999999 处理      （font_raster_layout.txt:400-403）
//   · FUN_00320a28：每轮重排，判据「行数 <= 上限 且 未截断」，失败则字号 -1.0，
//     直到成功或字号 <= 5.0；宽度实参在 this+0x30 != 0 时传 -1（不限宽），
//     否则取 this+0x24                              （:404-420）
//   · FUN_00322624：高度受限，按 行数*字号 + (行数-1)*行距 与 +0x28 比较，
//     以 1.0 步长减字号，下限 6.0                    （text_component_update_flags.txt:110-127）
// ============================================================================

/// 排版约束。字段名后的偏移是原版 ComponentText 上的字段位置。
public struct TextLayoutConstraints: Sendable, Equatable {
    /// this+0x24：宽度上限。负数表示不限。
    public var maxWidth: Float
    /// this+0x28：高度上限；nil 表示不启用高度约束。
    public var maxHeight: Float?
    /// this+0x2c：行数上限；小于 1 时按 999999 处理。
    public var maxLines: Int32
    /// 行间距（高度公式里 (行数-1)*行距）。
    public var verticalSpacing: Float
    /// FUN_00320a28 的字号下限。
    public var minimumFontSize: Float
    /// FUN_00322624 的字号下限。
    public var heightMinimumFontSize: Float
    /// this+0x30 != 0：关闭换行，宽度实参传 -1。
    public var noWrap: Bool

    public init(maxWidth: Float,
                maxHeight: Float? = nil,
                maxLines: Int32 = 0,
                verticalSpacing: Float = 0,
                minimumFontSize: Float = 5.0,
                heightMinimumFontSize: Float = 6.0,
                noWrap: Bool = false) {
        self.maxWidth = maxWidth
        self.maxHeight = maxHeight
        self.maxLines = maxLines
        self.verticalSpacing = verticalSpacing
        self.minimumFontSize = minimumFontSize
        self.heightMinimumFontSize = heightMinimumFontSize
        self.noWrap = noWrap
    }
}

public struct TextLayoutResult: Sendable, Equatable {
    public var fontSize: Float
    public var lines: [TextLineSlice]
    public var isTruncated: Bool

    public init(fontSize: Float, lines: [TextLineSlice], isTruncated: Bool) {
        self.fontSize = fontSize
        self.lines = lines
        self.isTruncated = isTruncated
    }

    /// 原版高度公式：行数*字号 + (行数-1)*行距。
    public func totalHeight(verticalSpacing: Float) -> Float {
        guard !lines.isEmpty else { return 0 }
        return Float(lines.count) * fontSize + Float(lines.count - 1) * verticalSpacing
    }
}

public enum TextLayoutEngine {

    /// 原版对行数上限的归一化：小于 1 视为 999999。
    public static func resolvedMaxLines(_ maxLines: Int32) -> Int32 {
        maxLines < 1 ? 999_999 : maxLines
    }

    /// 用给定字号把整段码点排成多行。
    ///
    /// - Parameter advance: (当前码点, 上一码点, 字号) -> 字形推进量（不含 +1.0）。
    public static func lines(of codePoints: [Int32],
                             fontSize: Float,
                             maxWidth: Float,
                             faceScale: Float,
                             advance: (Int32, Int32?, Float) -> Float) -> [TextLineSlice] {
        var result: [TextLineSlice] = []
        var index = 0
        let base = fontSize * faceScale
        while index < codePoints.count {
            guard let slice = TextLineBreaker.firstLine(
                of: codePoints, startIndex: index, baseAdvance: base, maxWidth: maxWidth,
                advance: { code, previous in advance(code, previous, fontSize) }) else { break }
            result.append(slice)
            if slice.nextIndex <= index { break }   // 防御：不允许原地踏步
            index = slice.nextIndex
        }
        return result
    }

    /// 原版的两级缩字号：先按「行数上限 + 未截断」缩（下限 5.0），
    /// 再按高度公式缩（下限 6.0）。两段判据分别来自 FUN_00320a28 / FUN_00322624。
    public static func layout(codePoints: [Int32],
                              initialFontSize: Float,
                              constraints: TextLayoutConstraints,
                              faceScale: Float,
                              advance: (Int32, Int32?, Float) -> Float) -> TextLayoutResult {
        let limit = resolvedMaxLines(constraints.maxLines)
        let width = constraints.noWrap ? -1 : constraints.maxWidth
        var fontSize = initialFontSize

        func measure(_ size: Float) -> (lines: [TextLineSlice], truncated: Bool) {
            let lines = lines(of: codePoints, fontSize: size, maxWidth: width,
                              faceScale: faceScale, advance: advance)
            return (lines, lines.contains { $0.isTruncated })
        }

        // FUN_00320a28：行数上限 + 未截断。
        var measured = measure(fontSize)
        while (Int32(measured.lines.count) > limit || measured.truncated)
                && fontSize > constraints.minimumFontSize {
            fontSize -= 1.0
            measured = measure(fontSize)
        }

        // FUN_00322624：高度上限。
        if let maxHeight = constraints.maxHeight {
            func height(_ size: Float, _ lines: [TextLineSlice]) -> Float {
                TextLayoutResult(fontSize: size, lines: lines, isTruncated: false)
                    .totalHeight(verticalSpacing: constraints.verticalSpacing)
            }
            while height(fontSize, measured.lines) > maxHeight
                    && fontSize > constraints.heightMinimumFontSize {
                fontSize -= 1.0
                measured = measure(fontSize)
            }
        }

        return TextLayoutResult(fontSize: fontSize,
                                lines: measured.lines,
                                isTruncated: measured.truncated)
    }
}
