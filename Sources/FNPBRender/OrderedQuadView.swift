import SwiftUI
import UIKit
import MetalKit
import simd

@MainActor
public final class OrderedQuadCanvasView: MTKView, MTKViewDelegate {
    private let metalContext: MetalContext
    private var orderedQuadPass: OrderedQuadPass?
    private var lastReportedError: String?

    public var quads: [OrderedTextureQuad] = []
    public var onError: (String) -> Void

    public init(metalContext: MetalContext, onError: @escaping (String) -> Void) {
        self.metalContext = metalContext
        self.onError = onError
        super.init(frame: .zero, device: metalContext.device)

        colorPixelFormat = .bgra8Unorm
        depthStencilPixelFormat = .invalid
        clearColor = MTLClearColor(red: 0, green: 0, blue: 0, alpha: 0)
        isOpaque = false
        backgroundColor = .clear
        layer.isOpaque = false
        isPaused = false
        enableSetNeedsDisplay = false
        preferredFramesPerSecond = 120
        delegate = self

        do {
            orderedQuadPass = try OrderedQuadPass(
                device: metalContext.device,
                shaderLibrary: metalContext.shaderLibrary,
                colorPixelFormat: colorPixelFormat)
        } catch {
            orderedQuadPass = nil
            report(error: error)
        }
    }

    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {}

    public func draw(in view: MTKView) {
        guard let orderedQuadPass else { return }
        let width = bounds.width
        let height = bounds.height
        guard width.isFinite, height.isFinite, width > 0, height > 0 else { return }
        guard let descriptor = currentRenderPassDescriptor,
              let drawable = currentDrawable,
              let commandBuffer = metalContext.commandQueue.makeCommandBuffer(),
              let encoder = commandBuffer.makeRenderCommandEncoder(descriptor: descriptor) else {
            report(message: "OrderedQuadCanvasView: unable to create render pass resources.")
            return
        }

        do {
            try orderedQuadPass.encode(
                encoder: encoder, quads: quads,
                viewportSize: SIMD2<Float>(Float(width), Float(height)))
            encoder.endEncoding()
            commandBuffer.present(drawable)
            commandBuffer.commit()
            lastReportedError = nil
        } catch {
            encoder.endEncoding()
            commandBuffer.commit()
            report(error: error)
        }
    }

    private func report(error: Error) {
        report(message: error.localizedDescription)
    }

    private func report(message: String) {
        guard lastReportedError != message else { return }
        lastReportedError = message
        onError(message)
    }
}

@MainActor
public struct OrderedQuadMetalView: UIViewRepresentable {
    public let metalContext: MetalContext
    public let quads: [OrderedTextureQuad]
    public let onError: (String) -> Void

    public init(metalContext: MetalContext, quads: [OrderedTextureQuad] = [],
                onError: @escaping (String) -> Void = { _ in }) {
        self.metalContext = metalContext
        self.quads = quads
        self.onError = onError
    }

    public func makeUIView(context: Context) -> OrderedQuadCanvasView {
        let view = OrderedQuadCanvasView(metalContext: metalContext, onError: onError)
        view.quads = quads
        return view
    }

    public func updateUIView(_ uiView: OrderedQuadCanvasView, context: Context) {
        uiView.quads = quads
        uiView.onError = onError
    }
}
