import Foundation

// ============================================================================
// GlyphAtlas.swift — 字形灰度位图的图集打包（纯逻辑，与光栅化实现无关）
//
// 证据：shared_context/findings/uiscreen_text_rendering_macho.md §3
//   · 每个字形是独立的 8bit 灰度位图，行跨度 = slot+0x54（§3.5）；
//   · 字体面尺寸 0x100×0x100 = 256×256（§3.2/§3.4）——本实现默认同样大小。
//
// 说明：**打包顺序与位置不影响画面**，只影响图集内存布局；原版的插入函数
// FUN_003666bc 尚未导出，因此这里不宣称复刻它的排布，只保证「每个字形拿到
// 自己那块像素对应的 UV」。视觉等价，排布不同。
// ============================================================================

/// 图集里一块字形区域的分配结果。
public struct GlyphAtlasSlot: Sendable, Equatable {
    public var x: Int
    public var y: Int
    public var width: Int
    public var height: Int
    /// 纹理坐标（左下、右上），已按图集尺寸归一化。
    public var uvMinimum: SIMD2<Float>
    public var uvMaximum: SIMD2<Float>

    public init(x: Int, y: Int, width: Int, height: Int,
                uvMinimum: SIMD2<Float>, uvMaximum: SIMD2<Float>) {
        self.x = x
        self.y = y
        self.width = width
        self.height = height
        self.uvMinimum = uvMinimum
        self.uvMaximum = uvMaximum
    }
}

public enum GlyphAtlasError: Error, Equatable, Sendable {
    case bitmapTooLarge(width: Int, height: Int, atlasWidth: Int, atlasHeight: Int)
    case outOfSpace(requiredHeight: Int, atlasHeight: Int)
    case pixelCountMismatch(expected: Int, actual: Int)
}

/// 简单的货架式打包器（shelf packing）。
///
/// 不做旋转、不做空洞回收——字形位图尺寸小且数量有限，货架式足够，
/// 且行为完全可预测、便于测试。
public struct GlyphAtlas {
    public let width: Int
    public let height: Int
    /// 每块之间留 1px，避免线性采样时相邻字形渗色。
    public let padding: Int

    /// 灰度画布，长度 = width*height。
    public private(set) var pixels: [UInt8]
    private var cursorX: Int = 0
    private var cursorY: Int = 0
    private var shelfHeight: Int = 0

    public init(width: Int = 256, height: Int = 256, padding: Int = 1) {
        self.width = width
        self.height = height
        self.padding = padding
        self.pixels = [UInt8](repeating: 0, count: max(0, width * height))
    }

    /// 把一块位图放进图集，返回它在图集里的位置与 UV。
    public mutating func insert(_ bitmap: TextGlyphBitmap) throws -> GlyphAtlasSlot {
        guard bitmap.width <= width, bitmap.height <= height else {
            throw GlyphAtlasError.bitmapTooLarge(width: bitmap.width, height: bitmap.height,
                                                 atlasWidth: width, atlasHeight: height)
        }
        if bitmap.pixels.count < bitmap.height * bitmap.pitch {
            throw GlyphAtlasError.pixelCountMismatch(expected: bitmap.height * bitmap.pitch,
                                                     actual: bitmap.pixels.count)
        }

        if cursorX + bitmap.width > width {
            cursorX = 0
            cursorY += shelfHeight + padding
            shelfHeight = 0
        }
        if cursorY + bitmap.height > height {
            throw GlyphAtlasError.outOfSpace(requiredHeight: cursorY + bitmap.height,
                                             atlasHeight: height)
        }

        let originX = cursorX
        let originY = cursorY

        // 逐行按 pitch 拷贝，只写 width 列。
        for row in 0..<bitmap.height {
            let sourceRow = row * bitmap.pitch
            let destinationRow = (originY + row) * width + originX
            for column in 0..<bitmap.width {
                let sourceIndex = sourceRow + column
                guard sourceIndex < bitmap.pixels.count else { break }
                pixels[destinationRow + column] = bitmap.pixels[sourceIndex]
            }
        }

        cursorX += bitmap.width + padding
        shelfHeight = max(shelfHeight, bitmap.height)

        let u0 = Float(originX) / Float(width)
        let v0 = Float(originY) / Float(height)
        let u1 = Float(originX + bitmap.width) / Float(width)
        let v1 = Float(originY + bitmap.height) / Float(height)
        return GlyphAtlasSlot(x: originX, y: originY,
                              width: bitmap.width, height: bitmap.height,
                              uvMinimum: SIMD2<Float>(u0, v0),
                              uvMaximum: SIMD2<Float>(u1, v1))
    }

    /// 取某点的灰度值（越界返回 0）。
    public func sample(x: Int, y: Int) -> UInt8 {
        guard x >= 0, x < width, y >= 0, y < height else { return 0 }
        return pixels[y * width + x]
    }
}
