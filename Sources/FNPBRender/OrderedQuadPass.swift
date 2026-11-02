import Metal
import simd

public enum OrderedQuadPassError: Error, Equatable {
    case invalidViewport
    case missingShaderFunction(String)
    case unsupportedVertexStride(Int)
    case emptyVertexBuffer
}

@MainActor
public final class OrderedQuadPass {
    private let pipelineState: MTLRenderPipelineState

    nonisolated public static let vertexStride = MemoryLayout<OrderedTextureVertex>.stride

    public init(device: MTLDevice, shaderLibrary: MTLLibrary,
                colorPixelFormat: MTLPixelFormat) throws {
        // Swift SIMD2/SIMD2/SIMD4 and Metal float2/float2/float4:
        // offsets 0/8/16, total stride 32.
        guard Self.vertexStride == 32,
              MemoryLayout<OrderedTextureVertex>.alignment == 16 else {
            throw OrderedQuadPassError.unsupportedVertexStride(Self.vertexStride)
        }
        guard let vertexFunction = shaderLibrary.makeFunction(name: "orderedQuad_vertex") else {
            throw OrderedQuadPassError.missingShaderFunction("orderedQuad_vertex")
        }
        guard let fragmentFunction = shaderLibrary.makeFunction(name: "orderedQuad_fragment") else {
            throw OrderedQuadPassError.missingShaderFunction("orderedQuad_fragment")
        }

        let descriptor = MTLRenderPipelineDescriptor()
        descriptor.label = "OrderedTextureQuadPipeline"
        descriptor.vertexFunction = vertexFunction
        descriptor.fragmentFunction = fragmentFunction
        descriptor.colorAttachments[0].pixelFormat = colorPixelFormat
        descriptor.colorAttachments[0].isBlendingEnabled = true
        descriptor.colorAttachments[0].rgbBlendOperation = .add
        descriptor.colorAttachments[0].alphaBlendOperation = .add
        descriptor.colorAttachments[0].sourceRGBBlendFactor = .sourceAlpha
        descriptor.colorAttachments[0].destinationRGBBlendFactor = .oneMinusSourceAlpha
        descriptor.colorAttachments[0].sourceAlphaBlendFactor = .sourceAlpha
        descriptor.colorAttachments[0].destinationAlphaBlendFactor = .oneMinusSourceAlpha
        self.pipelineState = try device.makeRenderPipelineState(descriptor: descriptor)
    }

    public func encode(encoder: MTLRenderCommandEncoder,
                       quads: [OrderedTextureQuad],
                       viewportSize: SIMD2<Float>) throws {
        guard viewportSize.x.isFinite, viewportSize.y.isFinite,
              viewportSize.x > 0, viewportSize.y > 0 else {
            throw OrderedQuadPassError.invalidViewport
        }
        guard !quads.isEmpty else { return }

        encoder.setRenderPipelineState(pipelineState)
        var viewport = viewportSize
        encoder.setVertexBytes(&viewport, length: MemoryLayout<SIMD2<Float>>.stride, index: 1)

        // FUN_0033a6c0: one four-vertex triangle strip per component, in submit order.
        for quad in quads {
            encoder.setFragmentTexture(quad.texture.texture, index: 0)
            try quad.vertices.withUnsafeBufferPointer { buffer in
                guard let baseAddress = buffer.baseAddress else {
                    throw OrderedQuadPassError.emptyVertexBuffer
                }
                encoder.setVertexBytes(
                    UnsafeRawPointer(baseAddress),
                    length: 4 * MemoryLayout<OrderedTextureVertex>.stride,
                    index: 0)
            }
            encoder.drawPrimitives(type: .triangleStrip, vertexStart: 0, vertexCount: 4)
        }
    }
}
