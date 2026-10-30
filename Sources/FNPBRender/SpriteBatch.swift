import Foundation
import Metal
import simd

/// 混合模式。对应原 GL 固定管线中的 opaque / 普通 alpha / 加色混合。
public enum BlendMode: String, Sendable, Hashable, CaseIterable {
    case opaque
    case alpha
    case additive
}

/// 纹理句柄。缓存由 TextureLoader 负责，渲染层只持有 MTLTexture。
///
/// `@unchecked Sendable`：MTLTexture 创建完成后可跨线程读取；本句柄不再修改。
public final class TextureHandle: @unchecked Sendable {

    public let texture: MTLTexture
    public let assetID: String
    public let premultipliedAlpha: Bool
    public let pixelSize: SIMD2<Int>

    public init(
        texture: MTLTexture,
        assetID: String,
        premultipliedAlpha: Bool = true
    ) {
        self.texture = texture
        self.assetID = assetID
        self.premultipliedAlpha = premultipliedAlpha
        self.pixelSize = SIMD2(texture.width, texture.height)
    }
}

/// CPU 侧单实例描述。
///
/// 坐标系：`position` / `size` 使用逻辑点坐标（左上原点、y 向下），
/// 由 RenderSurface 的 logicalSize 做 NDC 映射。这样高 DPI 像素尺寸与
/// 游戏逻辑坐标解耦，切割半径换算不会随机型漂移。
///
/// `rotation` 单位为弧度。
/// `uvOrigin` / `uvSize` 为图集整页上的归一化 UV 子矩形，由调用方给出。
public struct SpriteInstance: Sendable, Equatable {

    public var position: SIMD2<Float>
    public var size: SIMD2<Float>
    public var rotation: Float
    public var uvOrigin: SIMD2<Float>
    public var uvSize: SIMD2<Float>
    public var tint: SIMD4<Float>

    public init(
        position: SIMD2<Float>,
        size: SIMD2<Float>,
        rotation: Float = 0,
        uvOrigin: SIMD2<Float> = SIMD2<Float>(0, 0),
        uvSize: SIMD2<Float> = SIMD2<Float>(1, 1),
        tint: SIMD4<Float> = SIMD4<Float>(1, 1, 1, 1)
    ) {
        self.position = position
        self.size = size
        self.rotation = rotation
        self.uvOrigin = uvOrigin
        self.uvSize = uvSize
        self.tint = tint
    }
}

/// GPU 实例布局。必须与 `Shaders/sprite.metal` 中的 `SpriteInstanceGPU` 逐字段一致。
///
/// Swift 侧布局（64 字节 stride）：
/// - offset 0  : position (SIMD2<Float>)
/// - offset 8  : size     (SIMD2<Float>)
/// - offset 16 : rotation (Float)
/// - offset 20 : _pad0    (Float)
/// - offset 24 : uvOrigin (SIMD2<Float>)
/// - offset 32 : uvSize   (SIMD2<Float>)
/// - offset 40 : _pad1    (SIMD2<Float>)
/// - offset 48 : tint     (SIMD4<Float>, 16 字节对齐)
public struct SpriteInstanceGPU: Sendable {

    public var position: SIMD2<Float>
    public var size: SIMD2<Float>
    public var rotation: Float
    public var _pad0: Float
    public var uvOrigin: SIMD2<Float>
    public var uvSize: SIMD2<Float>
    public var _pad1: SIMD2<Float>
    public var tint: SIMD4<Float>

    public init(_ sprite: SpriteInstance) {
        self.position = sprite.position
        self.size = sprite.size
        self.rotation = sprite.rotation
        self._pad0 = 0
        self.uvOrigin = sprite.uvOrigin
        self.uvSize = sprite.uvSize
        self._pad1 = SIMD2<Float>(0, 0)
        self.tint = sprite.tint
    }
}

/// 顶点 uniform。与 shader 中 `SpriteUniforms` 一致。
public struct SpriteUniforms: Sendable {
    public var viewportSize: SIMD2<Float>

    public init(viewportSize: SIMD2<Float>) {
        self.viewportSize = viewportSize
    }
}

/// 一次提交的 CPU 侧批次。GPU 实例数据由 `MetalRenderSurface` 的
/// `InstanceBufferRing` 每帧上传，不在本结构里持有 MTLBuffer。
public struct SpriteBatch: Sendable {

    public var texture: TextureHandle
    public var instances: [SpriteInstance]
    public var blend: BlendMode

    public init(
        texture: TextureHandle,
        instances: [SpriteInstance],
        blend: BlendMode = .alpha
    ) {
        self.texture = texture
        self.instances = instances
        self.blend = blend
    }
}