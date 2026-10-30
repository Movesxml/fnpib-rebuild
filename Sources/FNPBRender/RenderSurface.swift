import CoreGraphics
import Foundation
import Metal
import MetalKit
import simd

/// Core 层自定义安全区结构，避免渲染层接口依赖 UIKit。
public struct EdgeInsetsInset: Sendable, Equatable {

    public var top: Float
    public var left: Float
    public var bottom: Float
    public var right: Float

    public static let zero = EdgeInsetsInset(top: 0, left: 0, bottom: 0, right: 0)

    public init(top: Float, left: Float, bottom: Float, right: Float) {
        self.top = top
        self.left = left
        self.bottom = bottom
        self.right = right
    }
}

/// 渲染表面配置请求。
///
/// `drawableSize` 为像素尺寸，对应原 `glViewport(0,0,w,h)`；
/// `viewSize` 为逻辑点尺寸，用于游戏逻辑坐标与 NDC 的换算；
/// `safeArea` 只影响 UI 层，不改变游戏坐标系。
public struct SurfaceRequest: Sendable {

    public var drawableSize: CGSize
    public var viewSize: CGSize
    public var safeArea: EdgeInsetsInset
    public var maxFPS: Float
    public var contentScale: CGFloat

    public init(
        drawableSize: CGSize,
        viewSize: CGSize,
        safeArea: EdgeInsetsInset = .zero,
        maxFPS: Float = 120,
        contentScale: CGFloat = 1
    ) {
        self.drawableSize = drawableSize
        self.viewSize = viewSize
        self.safeArea = safeArea
        self.maxFPS = maxFPS
        self.contentScale = contentScale
    }
}

/// 蓝图 S7 RenderSurface 协议。
///
/// 主线程约束：Metal 命令编码在渲染线程/主线程完成，`submit` 不等待 GPU。
@MainActor
public protocol RenderSurface: AnyObject {

    /// 分辨率自适应：替代原 glViewport，同时更新逻辑坐标系。
    func configure(_ request: SurfaceRequest)

    func beginFrame() -> Bool
    func submit(_ batch: SpriteBatch)
    func endFrame()

    /// 逻辑点尺寸。原实现按固定 15.0 归一化碰撞半径，
    /// 因此调用方必须用 logicalSize 参与切片半径换算，不能写死像素半径。
    var logicalSize: SIMD2<Float> { get }
}

/// Metal 实现。
///
/// 设计要点：
/// - `beginFrame` 获取 MTKView 的 currentRenderPassDescriptor / currentDrawable 并创建
///   command buffer + render encoder；不做任何 GPU 等待。
/// - `submit` 仅累积 CPU 实例数据，并按 `(texture, blend)` 分桶；同桶合并成一次
///   instanced draw call。
/// - `endFrame` 把实例数据 memcpy 到三槽环形 MTLBuffer 的当前槽，逐桶编码 draw，
///   最后 `present + commit`。全部 CPU 侧操作，120Hz 下正常情况下远低于 1ms；
///   但 `currentDrawable` 获取本身在 GPU 严重落后时可能阻塞，需真机 Instruments 验证 [待验证]。
@MainActor
public final class MetalRenderSurface: RenderSurface {

    private struct BucketKey: Hashable {
        let textureID: ObjectIdentifier
        let blend: BlendMode
    }

    private struct Bucket {
        let texture: MTLTexture
        let blend: BlendMode
        var instances: [SpriteInstanceGPU]
    }

    private let context: MetalContext
    private let instanceRing: InstanceBufferRing

    private weak var view: MTKView?

    private var viewport = MTLViewport()
    private var _logicalSize = SIMD2<Float>(1, 1)

    private var pendingOrder: [BucketKey] = []
    private var pending: [BucketKey: Bucket] = [:]

    private var currentCommandBuffer: MTLCommandBuffer?
    private var currentEncoder: MTLRenderCommandEncoder?
    private var currentDrawable: CAMetalDrawable?

    public init(context: MetalContext) {
        self.context = context
        self.instanceRing = InstanceBufferRing(device: context.device)
    }

    public var logicalSize: SIMD2<Float> {
        _logicalSize
    }

    public func attach(_ view: MTKView) {
        self.view = view
    }

    public func configure(_ request: SurfaceRequest) {
        let scale = max(1, Float(request.contentScale))
        let drawableWidth = max(1, Float(request.drawableSize.width))
        let drawableHeight = max(1, Float(request.drawableSize.height))

        // viewSize 由 SwiftUI/UIKit 层给出（点）。若布局尚未完成则用 drawable/scale 兜底。
        let logicalWidth = request.viewSize.width > 0
            ? Float(request.viewSize.width)
            : drawableWidth / scale
        let logicalHeight = request.viewSize.height > 0
            ? Float(request.viewSize.height)
            : drawableHeight / scale

        _logicalSize = SIMD2<Float>(max(1, logicalWidth), max(1, logicalHeight))

        // 原 macho FUN_002ee2a0:
        //   glDepthMask(1); glDepthFunc(0x203 /* GL_LEQUAL */);
        //   glClear(0x4500 /* GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT */);
        //   glViewport(0, 0, drawableWidth, drawableHeight)
        // Metal 对应：MTKView 的 render pass clear + 本 viewport。
        viewport = MTLViewport(
            originX: 0,
            originY: 0,
            width: Double(drawableWidth),
            height: Double(drawableHeight),
            znear: 0,
            zfar: 1
        )

        // 原逻辑在固定归一化坐标下运行：碰撞半径按 15.0 归一化
        // （d / 15.0 -> 0.5 * (d / 15.0) + 0.5）。 modernization 后必须由
        // logicalSize 反算 sliceRadiusSquared，例如：
        //   normalizedRadius = pixelRadius * 15.0 / min(logicalSize.x, logicalSize.y)
        // 具体基准轴（短边/高度）待 Frida 打点确认 [待验证]。
        // 这里只保证 logicalSize 是逻辑点尺寸，且不包含 safeArea。
        _ = request.safeArea

        if let view {
            let fps = request.maxFPS > 0 ? request.maxFPS : 120
            view.preferredFramesPerSecond = Int(max(1, min(120, fps)).rounded())
        }
    }

    public func beginFrame() -> Bool {
        guard currentCommandBuffer == nil else {
            return false
        }
        guard let view,
              let passDescriptor = view.currentRenderPassDescriptor,
              let drawable = view.currentDrawable,
              let commandBuffer = context.commandQueue.makeCommandBuffer(),
              let encoder = commandBuffer.makeRenderCommandEncoder(descriptor: passDescriptor) else {
            return false
        }

        encoder.label = "SpriteFrame"
        encoder.setViewport(viewport)

        var uniforms = SpriteUniforms(viewportSize: _logicalSize)
        encoder.setVertexBytes(
            &uniforms,
            length: MemoryLayout<SpriteUniforms>.stride,
            index: 1
        )

        pendingOrder.removeAll(keepingCapacity: true)
        pending.removeAll(keepingCapacity: true)
        instanceRing.beginFrame()

        currentCommandBuffer = commandBuffer
        currentEncoder = encoder
        currentDrawable = drawable
        return true
    }

    public func submit(_ batch: SpriteBatch) {
        guard currentEncoder != nil, !batch.instances.isEmpty else {
            return
        }

        let key = BucketKey(
            textureID: ObjectIdentifier(batch.texture),
            blend: batch.blend
        )

        if pending[key] == nil {
            pending[key] = Bucket(
                texture: batch.texture.texture,
                blend: batch.blend,
                instances: []
            )
            // 保留首次提交顺序。同 texture+blend 的后续批次合并到同一桶；
            // 跨桶顺序保持首次出现顺序，避免字典无序导致画面跳变。
            // 注意：合并同桶可能让后续同桶实例提前到该桶首次位置绘制；
            // 对 2D 游戏通常可接受，若出现透明排序问题需改为 per-batch 不合并。
            pendingOrder.append(key)
        }

        var bucket = pending[key]!
        bucket.instances.append(contentsOf: batch.instances.lazy.map(SpriteInstanceGPU.init))
        pending[key] = bucket
    }

    public func endFrame() {
        guard let commandBuffer = currentCommandBuffer,
              let encoder = currentEncoder,
              let drawable = currentDrawable else {
            resetFrame()
            return
        }

        let stride = MemoryLayout<SpriteInstanceGPU>.stride

        var totalBytes = 0
        for key in pendingOrder {
            guard let bucket = pending[key], !bucket.instances.isEmpty else { continue }
            totalBytes = Self.align(totalBytes, to: 256)
            totalBytes += bucket.instances.count * stride
        }

        let buffer = totalBytes > 0
            ? instanceRing.currentBuffer(minimumLength: totalBytes)
            : nil

        var offset = 0
        for key in pendingOrder {
            guard let bucket = pending[key], !bucket.instances.isEmpty else { continue }

            let byteCount = bucket.instances.count * stride
            let alignedOffset = Self.align(offset, to: 256)

            if let buffer {
                bucket.instances.withUnsafeBufferPointer { pointer in
                    guard let baseAddress = pointer.baseAddress else { return }
                    memcpy(
                        buffer.contents().advanced(by: alignedOffset),
                        baseAddress,
                        byteCount
                    )
                }
            }

            if let buffer,
               let pipeline = try? context.pipeline(for: bucket.blend),
               let depthState = context.depthState(writeDepth: bucket.blend == .opaque) {

                encoder.setRenderPipelineState(pipeline)
                encoder.setDepthStencilState(depthState)
                encoder.setVertexBuffer(buffer, offset: alignedOffset, index: 0)
                encoder.setFragmentTexture(bucket.texture, index: 0)
                encoder.drawPrimitives(
                    type: .triangleStrip,
                    vertexStart: 0,
                    vertexCount: 4,
                    instanceCount: bucket.instances.count
                )
            }

            offset = alignedOffset + byteCount
        }

        encoder.endEncoding()
        commandBuffer.present(drawable)
        commandBuffer.commit()

        resetFrame()
    }

    private func resetFrame() {
        currentCommandBuffer = nil
        currentEncoder = nil
        currentDrawable = nil
        pendingOrder.removeAll(keepingCapacity: true)
        pending.removeAll(keepingCapacity: true)
    }

    @inline(__always)
    private static func align(_ value: Int, to alignment: Int) -> Int {
        (value + alignment - 1) & ~(alignment - 1)
    }
}

/// 三槽实例缓冲环：
/// - 每帧轮转一个槽，避免 CPU 写当前帧时覆盖 GPU 仍可能读取的上一帧数据。
/// - MTKView 的 maximumDrawableCount 默认 3，与槽数一致；若后续改成更多 in-flight 帧，
///   需同步增加槽数 [待验证]。
private final class InstanceBufferRing {

    private let device: MTLDevice
    private var buffers: [MTLBuffer?]
    private var slot = -1

    private static let frameCount = 3

    init(device: MTLDevice) {
        self.device = device
        self.buffers = Array(repeating: nil, count: Self.frameCount)
    }

    func beginFrame() {
        slot = (slot + 1) % buffers.count
    }

    func currentBuffer(minimumLength: Int) -> MTLBuffer? {
        guard slot >= 0, slot < buffers.count else {
            return nil
        }

        if let buffer = buffers[slot], buffer.length >= minimumLength {
            return buffer
        }

        guard let buffer = device.makeBuffer(
            length: max(minimumLength, 1),
            options: .storageModeShared
        ) else {
            return nil
        }

        buffers[slot] = buffer
        return buffer
    }
}