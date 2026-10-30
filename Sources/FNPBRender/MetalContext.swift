import Metal
import MetalKit
import SwiftUI
import UIKit

/// Metal 渲染上下文：设备、命令队列、默认着色器库、管线与深度状态缓存。
///
/// 线程约束：本类型及 MTKView 包装均限定主线程。渲染提交只做主线程侧的
/// command buffer 编码，不在主线程等待 GPU 完成。
@MainActor
public final class MetalContext {

    /// 与原 glClear/颜色附件对应的像素格式。
    /// 使用 sRGB 格式以便 PNG 贴图按 sRGB 采样后正确输出。
    public static let colorPixelFormat: MTLPixelFormat = .bgra8Unorm_srgb

    /// 原 macho 渲染初始化中 glDepthFunc(0x203)=GL_LEQUAL、glDepthMask(1)，
    /// 因此保留深度附件；2D 精灵按提交顺序绘制，opaque 写深度、alpha/additive 不写。
    public static let depthPixelFormat: MTLPixelFormat = .depth32Float

    public let device: MTLDevice
    public let commandQueue: MTLCommandQueue

    private let library: MTLLibrary
    private var pipelines: [BlendMode: MTLRenderPipelineState] = [:]
    private var depthStates: [Bool: MTLDepthStencilState] = [:]

    public init?() {
        guard let device = MTLCreateSystemDefaultDevice(),
              let queue = device.makeCommandQueue(),
              let library = device.makeDefaultLibrary() else {
            return nil
        }
        self.device = device
        self.commandQueue = queue
        self.library = library
    }

    /// 懒创建并缓存三种混合模式的管线。
    /// 着色器文件 `Shaders/sprite.metal` 编译进 app 默认库。
    public func pipeline(for blend: BlendMode) throws -> MTLRenderPipelineState {
        if let cached = pipelines[blend] {
            return cached
        }

        guard let vertexFunction = library.makeFunction(name: "sprite_vertex"),
              let fragmentFunction = library.makeFunction(name: "sprite_fragment") else {
            throw MetalContextError.missingShaderFunction
        }

        let descriptor = MTLRenderPipelineDescriptor()
        descriptor.label = "SpritePipeline-\(blend.rawValue)"
        descriptor.vertexFunction = vertexFunction
        descriptor.fragmentFunction = fragmentFunction
        descriptor.colorAttachments[0].pixelFormat = Self.colorPixelFormat
        descriptor.depthAttachmentPixelFormat = Self.depthPixelFormat

        switch blend {
        case .opaque:
            descriptor.colorAttachments[0].isBlendingEnabled = false

        case .alpha:
            // 预乘 alpha：src=1, dst=1-srcAlpha。
            // 若某图集最终确认是非预乘 PNG，这里应改为 sourceAlpha / oneMinusSourceAlpha。
            descriptor.colorAttachments[0].isBlendingEnabled = true
            descriptor.colorAttachments[0].rgbBlendOperation = .add
            descriptor.colorAttachments[0].alphaBlendOperation = .add
            descriptor.colorAttachments[0].sourceRGBBlendFactor = .one
            descriptor.colorAttachments[0].destinationRGBBlendFactor = .oneMinusSourceAlpha
            descriptor.colorAttachments[0].sourceAlphaBlendFactor = .one
            descriptor.colorAttachments[0].destinationAlphaBlendFactor = .oneMinusSourceAlpha

        case .additive:
            // 加色混合：src=1, dst=1。用于刀光/爆炸等特效。
            descriptor.colorAttachments[0].isBlendingEnabled = true
            descriptor.colorAttachments[0].rgbBlendOperation = .add
            descriptor.colorAttachments[0].alphaBlendOperation = .add
            descriptor.colorAttachments[0].sourceRGBBlendFactor = .one
            descriptor.colorAttachments[0].destinationRGBBlendFactor = .one
            descriptor.colorAttachments[0].sourceAlphaBlendFactor = .one
            descriptor.colorAttachments[0].destinationAlphaBlendFactor = .one
        }

        let state = try device.makeRenderPipelineState(descriptor: descriptor)
        pipelines[blend] = state
        return state
    }

    /// 原 glDepthFunc(GL_LEQUAL, 0x0203) 的 Metal 映射。
    /// opaque 写入深度，alpha/additive 仅测试不写深度。
    public func depthState(writeDepth: Bool) -> MTLDepthStencilState? {
        if let cached = depthStates[writeDepth] {
            return cached
        }

        let descriptor = MTLDepthStencilDescriptor()
        descriptor.label = writeDepth ? "SpriteDepthWrite" : "SpriteDepthRead"
        descriptor.depthCompareFunction = .lessEqual
        descriptor.isDepthWriteEnabled = writeDepth

        guard let state = device.makeDepthStencilState(descriptor: descriptor) else {
            return nil
        }
        depthStates[writeDepth] = state
        return state
    }
}

public enum MetalContextError: Error {
    case missingShaderFunction
}

/// MTKView 子类：把 `draw` 与 drawableSize 变化转成闭包，供 SwiftUI 外层驱动
/// `MetalRenderSurface.beginFrame/submit/endFrame`。
@MainActor
public final class MetalCanvasView: MTKView, MTKViewDelegate {

    public let metalContext: MetalContext
    public var onDraw: ((MTKView) -> Void)?
    public var onDrawableSizeChange: ((CGSize, CGFloat) -> Void)?

    public init(metalContext: MetalContext) {
        self.metalContext = metalContext
        super.init(frame: .zero, device: metalContext.device)

        colorPixelFormat = MetalContext.colorPixelFormat
        depthStencilPixelFormat = MetalContext.depthPixelFormat
        framebufferOnly = true
        isPaused = false
        enableSetNeedsDisplay = false

        // ProMotion：MTKView 内部使用 CADisplayLink，preferredFramesPerSecond 设上限 120。
        // 逻辑帧仍由 FNPBPlatform 的 DisplayLinkDriver 以 60Hz 固定步长驱动。
        // [待验证] iOS 27 上 MTKView 是否直接支持 120Hz，以及是否需要 CAMetalLayer 额外配置。
        preferredFramesPerSecond = 120
        clearColor = MTLClearColorMake(0, 0, 0, 1)

        delegate = self
    }

    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func draw(in view: MTKView) {
        onDraw?(view)
    }

    public func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        onDrawableSizeChange?(size, view.contentScaleFactor)
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        onDrawableSizeChange?(drawableSize, contentScaleFactor)
    }
}

/// SwiftUI 嵌入入口。
/// 用法：
/// ```swift
/// MetalViewRepresentable(metalContext: context, surface: surface) { view in
///     guard surface.beginFrame() else { return }
///     // world.render(surface)
///     surface.endFrame()
/// }
/// ```
@MainActor
public struct MetalViewRepresentable: UIViewRepresentable {

    public typealias UIViewType = MetalCanvasView

    public let metalContext: MetalContext
    public let surface: MetalRenderSurface?

    private let onDraw: (MTKView) -> Void
    private let onResize: (CGSize, CGFloat) -> Void

    public init(
        metalContext: MetalContext,
        surface: MetalRenderSurface? = nil,
        onDraw: @escaping (MTKView) -> Void = { _ in },
        onResize: @escaping (CGSize, CGFloat) -> Void = { _, _ in }
    ) {
        self.metalContext = metalContext
        self.surface = surface
        self.onDraw = onDraw
        self.onResize = onResize
    }

    public func makeUIView(context: Context) -> MetalCanvasView {
        let view = MetalCanvasView(metalContext: metalContext)
        bind(view)
        surface?.attach(view)
        return view
    }

    public func updateUIView(_ uiView: MetalCanvasView, context: Context) {
        bind(uiView)
        surface?.attach(uiView)
    }

    private func bind(_ view: MetalCanvasView) {
        view.onDraw = onDraw
        view.onDrawableSizeChange = { [weak view] size, scale in
            guard let view else { return }
            onResize(size, scale)
            surface?.configure(
                SurfaceRequest(
                    drawableSize: size,
                    viewSize: view.bounds.size,
                    safeArea: .zero,
                    maxFPS: Float(view.preferredFramesPerSecond),
                    contentScale: scale
                )
            )
        }
    }
}