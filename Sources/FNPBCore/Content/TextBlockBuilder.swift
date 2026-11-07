import Foundation

// ============================================================================
// TextBlockBuilder.swift — 从字符串到顶点的整条组装（纯逻辑）
//
// 把已按证据实现的几层串起来：
//   1. 排版：TextLayoutEngine（断行 / 缩字号，§2.2-2.3）
//   2. 行距：TextLineMetrics（§2.6，汇编定案）
//   3. 字形：TextFontMetrics 提供位图、推进、字距、bearing
//   4. 图集：GlyphAtlas 分配 UV
//   5. 对齐：TextAlignment（水平）+ TextVerticalAlignment（竖直，§2.6）
//   6. 网格：TextMeshBuilder（每字形 6 顶点，§4.11）
//
// [推断] bearing → 记录 +0x28/+0x2c 的映射：四角公式里 c2 = pen + (−a, −b) 是字形盒的左上角，
// 屏幕 y 向下、FreeType 的 bitmap_top 向上，故取 a = −bearingX、b = bearingY。
// 实机对比后再订正这一处。
// ============================================================================

public struct TextBlockGeometry: Sendable {
    public var vertices: [TextVertex]
    public var atlas: GlyphAtlas
    public var fontSize: Float
    public var lines: [TextLineSlice]
    public var isTruncated: Bool
    /// 每行的顶点区间（用于按行做对齐偏移）。
    public var lineVertexRanges: [Range<Int>]

    public init(vertices: [TextVertex], atlas: GlyphAtlas, fontSize: Float,
                lines: [TextLineSlice], isTruncated: Bool,
                lineVertexRanges: [Range<Int>]) {
        self.vertices = vertices
        self.atlas = atlas
        self.fontSize = fontSize
        self.lines = lines
        self.isTruncated = isTruncated
        self.lineVertexRanges = lineVertexRanges
    }
}

public enum TextBlockBuilder {

    /// 组装整段文字。
    ///
    /// - Parameters:
    ///   - alignmentFlags: 归一化后的对齐掩码；传 nil 表示不做对齐偏移（每行都在原点）。
    ///   - verticalSpacing: 原版 this+0x4c，缺省 1。
    public static func build(codePoints: [Int32],
                             initialFontSize: Float,
                             constraints: TextLayoutConstraints,
                             metrics: any TextFontMetrics,
                             color: SIMD4<Float>,
                             alignmentFlags: UInt32? = nil,
                             verticalSpacing: Float = 1,
                             atlas: GlyphAtlas = GlyphAtlas(),
                             alternateWinding: Bool = true) -> TextBlockGeometry {
        var atlas = atlas
        var lines = [TextLineSlice]()
        var lineGlyphVertices = [[Int]]()
        var vertices = [TextVertex]()

        let layout = TextLayoutEngine.layout(text: codePoints,
                                             initialFontSize: initialFontSize,
                                             constraints: constraints,
                                             metrics: metrics)
        lines = layout.lines
        let fontSize = layout.fontSize
        let pitch = TextLineMetrics.verticalPitch(currentFontSize: fontSize,
                                                  requestedFontSize: initialFontSize,
                                                  verticalSpacing: verticalSpacing)

        // 第一遍：按行累加推进量并生成顶点（行内 y 先取 0）。
        for line in lines {
            let start = vertices.count
            var penX: Float = 0
            var previous: Int32? = nil
            for code in line.codePoints {
                let advance = metrics.advance(codePoint: code, previous: previous,
                                              fontSize: fontSize) + 1.0
                previous = code
                guard let bitmap = metrics.glyphBitmap(codePoint: code, fontSize: fontSize),
                      let slot = try? atlas.insert(bitmap) else {
                    penX += advance
                    continue
                }
                let record = TextGlyphRecord(
                    characterCode: code,
                    uvMinimum: slot.uvMinimum,
                    uvMaximum: slot.uvMaximum,
                    offsetX: -Float(bitmap.bearingX),
                    offsetY: Float(bitmap.bearingY),
                    pen: SIMD2<Float>(penX, 0),
                    width: Float(bitmap.width),
                    height: Float(bitmap.height),
                    rotation: 0,
                    color: color)
                vertices.append(contentsOf: TextMeshBuilder.vertices(
                    for: record, alternateWinding: alternateWinding))
                penX += advance
            }
            lineGlyphVertices.append([start, vertices.count])
        }

        // 第二遍：按行求网格包围盒，做对齐偏移。
        let ranges = lineGlyphVertices.map { $0[0]..<$0[1] }
        if let flags = alignmentFlags, !vertices.isEmpty {
            var meshTop = [Int32]()
            var meshBottom = [Int32]()
            var meshLeft = [Int32]()
            var meshRight = [Int32]()
            for range in ranges {
                guard !range.isEmpty else {
                    meshTop.append(0); meshBottom.append(0)
                    meshLeft.append(0); meshRight.append(0)
                    continue
                }
                let slice = vertices[range]
                let xs = slice.map { $0.position.x }
                let ys = slice.map { $0.position.y }
                meshLeft.append(Int32((xs.min() ?? 0).rounded()))
                meshRight.append(Int32((xs.max() ?? 0).rounded()))
                meshTop.append(Int32((ys.min() ?? 0).rounded()))
                meshBottom.append(Int32((ys.max() ?? 0).rounded()))
            }

            let vertical = TextVerticalAlignmentInput(
                flags: flags,
                pitch: Int32(pitch),
                fontSize: Int32(fontSize),
                meshTop: meshTop,
                meshBottom: meshBottom,
                heightLimit: Int32(constraints.maxHeight ?? 0))
            let yOffsets = TextVerticalAlignment.lineOffsets(vertical)

            for (index, range) in ranges.enumerated() where !range.isEmpty {
                let yOffset = index < yOffsets.count ? yOffsets[index] : 0
                let meshWidth = meshRight[index] - meshLeft[index]
                let xOffset = TextAlignment.horizontalOffset(
                    flags: flags,
                    widthLimit: Int32(constraints.maxWidth < 0 ? 0 : constraints.maxWidth),
                    meshWidth: meshWidth)
                for i in range {
                    let old = vertices[i]
                    vertices[i] = TextVertex(
                        position: SIMD2<Float>(old.position.x + Float(xOffset),
                                              old.position.y + Float(yOffset)),
                        color: old.color,
                        uv: old.uv)
                }
            }
        }

        return TextBlockGeometry(vertices: vertices,
                                 atlas: atlas,
                                 fontSize: fontSize,
                                 lines: lines,
                                 isTruncated: layout.isTruncated,
                                 lineVertexRanges: ranges)
    }
}
