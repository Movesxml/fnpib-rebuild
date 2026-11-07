import Foundation

// ============================================================================
// TextMesh.swift — ComponentText 单字形的顶点生成（纯逻辑）
//
// 证据（全部来自发售版 Mach-O 反编译）：
//   · 记录字段与偏移      shared_context/findings/uiscreen_text_rendering_macho.md §4.5-4.11
//   · 四角公式与绕序      shared_context/findings/glyph_vertex_order_macho.md
//   · 顶点结构 0x30 字节  同文件 §4.11（位置 +0x00、颜色 +0x18、UV +0x28）
//
// 本文件只负责「给定一个字形记录，产出 6 个顶点」。它不做排版（行宽/换行/字距）、
// 不做光栅化、不碰纹理——那些分别属于排版层与渲染层。
// ============================================================================

/// 原版 ComponentText 的单字形记录（0x4c 记录里被顶点生成读取到的字段）。
///
/// 偏移与语义逐项对应反编译；未在本结构出现的字段（字体面指针、状态位等）
/// 属于排版/光栅化阶段，不进入网格生成。
public struct TextGlyphRecord: Sendable, Equatable {
    /// +0x00：字符码。0x0a 表示换行，不产生顶点（glyph_vertex_order_macho.md §0）。
    public var characterCode: Int32
    /// +0x18/+0x1c：图集 UV 的左上角（u0, v0）。
    public var uvMinimum: SIMD2<Float>
    /// +0x20/+0x24：图集 UV 的右下角（u1, v1）。
    public var uvMaximum: SIMD2<Float>
    /// +0x28：横向内边距 a（参与四角公式）。
    public var offsetX: Float
    /// +0x2c：纵向内边距 b。
    public var offsetY: Float
    /// +0x30/+0x34：笔位置（字形原点）。
    public var pen: SIMD2<Float>
    /// +0x38：字形宽 w。
    public var width: Float
    /// +0x3c：字形高 h。
    public var height: Float
    /// +0x40：旋转角，**弧度**（反编译里直接传给 sinf/cosf，没有度→弧度换算）。
    public var rotation: Float
    /// +0x44：颜色。原版把每个字节直接 vcvt.f32.u32 转 float，**不除以 255**。
    public var color: SIMD4<Float>

    public init(characterCode: Int32,
                uvMinimum: SIMD2<Float>,
                uvMaximum: SIMD2<Float>,
                offsetX: Float,
                offsetY: Float,
                pen: SIMD2<Float>,
                width: Float,
                height: Float,
                rotation: Float,
                color: SIMD4<Float>) {
        self.characterCode = characterCode
        self.uvMinimum = uvMinimum
        self.uvMaximum = uvMaximum
        self.offsetX = offsetX
        self.offsetY = offsetY
        self.pen = pen
        self.width = width
        self.height = height
        self.rotation = rotation
        self.color = color
    }

    /// 与原版相同的「是否产生顶点」判据：宽高非负、且不是换行。
    public var producesVertices: Bool {
        width >= 0 && height >= 0 && characterCode != 0x0a
    }
}

/// 一个顶点，布局等于原版的 0x30 字节结构。
///
/// | 偏移 | 内容 |
/// |---|---|
/// | +0x00/+0x04 | 位置 x/y |
/// | +0x08/+0x0c/+0x10 | 固定 0 |
/// | +0x14 | 固定 1.0 |
/// | +0x18..+0x24 | R/G/B/A（0..255 直接转 float） |
/// | +0x28/+0x2c | 纹理 UV |
public struct TextVertex: Sendable, Equatable {
    public var position: SIMD2<Float>
    public var color: SIMD4<Float>
    public var uv: SIMD2<Float>

    public init(position: SIMD2<Float>, color: SIMD4<Float>, uv: SIMD2<Float>) {
        self.position = position
        self.color = color
        self.uv = uv
    }

    /// 与原版 0x30 完全一致的打包顺序（供渲染层直接写缓冲）。
    public var packedFloats: [Float] {
        [position.x, position.y,
         0, 0, 0,
         1.0,
         color.x, color.y, color.z, color.w,
         uv.x, uv.y]
    }
}

/// 四角的编号顺序（与 glyph_vertex_order_macho.md 的 c0..c3 一致）。
public enum TextGlyphCorner: Int, Sendable, CaseIterable {
    /// (w−a, −b)
    case topRight = 0
    /// (−a, h−b)
    case bottomLeft = 1
    /// (−a, −b)
    case topLeft = 2
    /// (w−a, h−b)
    case bottomRight = 3
}

/// 字形 → 顶点的纯值转换。
public enum TextMeshBuilder {

    /// 四角位置：c = pen + R(θ)·(dx, dy)，R(p,q) = (p·cosθ − q·sinθ, p·sinθ + q·cosθ)。
    public static func corners(for glyph: TextGlyphRecord) -> [SIMD2<Float>] {
        let a = glyph.offsetX
        let b = glyph.offsetY
        let right = glyph.width - a
        let bottom = glyph.height - b
        let cosTheta = cosf(glyph.rotation)
        let sinTheta = sinf(glyph.rotation)

        func rotate(_ dx: Float, _ dy: Float) -> SIMD2<Float> {
            SIMD2<Float>(dx * cosTheta - dy * sinTheta,
                         dx * sinTheta + dy * cosTheta)
        }

        return [
            glyph.pen + rotate(right, -b),      // c0
            glyph.pen + rotate(-a, bottom),     // c1
            glyph.pen + rotate(-a, -b),         // c2
            glyph.pen + rotate(right, bottom)   // c3
        ]
    }

    /// 每个角对应的 UV。UV 严格跟角走，与绕序无关。
    public static func uv(for corner: TextGlyphCorner, in glyph: TextGlyphRecord) -> SIMD2<Float> {
        switch corner {
        case .topRight:     return SIMD2<Float>(glyph.uvMaximum.x, glyph.uvMaximum.y)
        case .bottomLeft:   return SIMD2<Float>(glyph.uvMinimum.x, glyph.uvMinimum.y)
        case .topLeft:      return SIMD2<Float>(glyph.uvMinimum.x, glyph.uvMaximum.y)
        case .bottomRight:  return SIMD2<Float>(glyph.uvMaximum.x, glyph.uvMinimum.y)
        }
    }

    /// 6 个顶点 = 两个三角形 (0,1,2) + (3,4,5)，共享对角线 c0–c1。
    ///
    /// - Parameter alternateWinding: 对应原版渲染器全局 +0x1b4 == 1 的那条支路。
    ///   两条支路只交换第 2/3 与第 5/6 个顶点，位置与 UV 都不变，绕序相反。
    public static func vertices(for glyph: TextGlyphRecord,
                                alternateWinding: Bool = true) -> [TextVertex] {
        guard glyph.producesVertices else { return [] }
        let corner = corners(for: glyph)
        let order: [TextGlyphCorner] = alternateWinding
            ? [.topRight, .bottomLeft, .topLeft, .bottomRight, .bottomLeft, .topRight]
            : [.topRight, .topLeft, .bottomLeft, .bottomRight, .topRight, .bottomLeft]
        return order.map { c in
            TextVertex(position: corner[c.rawValue],
                       color: glyph.color,
                       uv: uv(for: c, in: glyph))
        }
    }
}
