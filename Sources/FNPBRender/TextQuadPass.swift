import Metal
import FNPBCore

// ============================================================================
// TextQuadPass.swift — 文字的 Metal 提交
//
// 字形是每字 6 顶点（两个三角形，无索引），与地图贴图的「4 顶点 triangle strip」
// 不同，所以单独一条 pipeline；着色器复用 orderedQuad_vertex/fragment
// （它按 vertexID 取顶点，对 6 顶点同样成立，见 Shaders/orderedQuad.metal）。
//
// 顶点布局与 OrderedTextureVertex 完全一致（position / uv / rgba），
// 这样两条通道共用同一个顶点结构。
// ============================================================================

/// 一段文字的一次提交：固定 6 个顶点 + 图集纹理。
public struct TextQuad: Sendable, Equatable {
    public let vertices: [OrderedTextureVertex]
    public let texture: TextureHandle

    public init(vertices: [OrderedTextureVertex], texture: TextureHandle) {
        self.vertices = vertices
        self.texture = texture
    }

    public static func == (lhs: TextQuad, rhs: TextQuad) -> Bool {
        lhs.vertices == rhs.vertices && lhs.texture === rhs.texture
    }

    /// 把 TextMeshBuilder 的顶点（颜色是 0..255）转成渲染顶点（0..1）。与纹理无关，可单独测试。
    public static func makeVertices(from vertices: [TextVertex]) -> [OrderedTextureVertex]? {
        guard vertices.count == 6 else { return nil }
        return vertices.map { vertex in
            OrderedTextureVertex(
                position: vertex.position,
                uv: vertex.uv,
                rgba: SIMD4<Float>(vertex.color.x / 255.0,
                                   vertex.color.y / 255.0,
                                   vertex.color.z / 255.0,
                                   vertex.color.w / 255.0))
        }
    }

    public static func make(from vertices: [TextVertex],
                            texture: TextureHandle) -> TextQuad? {
        guard let converted = makeVertices(from: vertices) else { return nil }
        return TextQuad(vertices: converted, texture: texture)
    }
}

public enum TextQuadPassError: Error, Equatable {
    case invalidVertexCount(Int)
    case missingShaderFunction(String)
    case emptyBatch
}

@MainActor
public final class TextQuadPass {
    private let pipelineState: MTLRenderPipelineState

    public init(device: MTLDevice, shaderLibrary: MTLLibrary,
                colorPixelFormat: MTLPixelFormat) throws {
        guard let vertexFunction = shaderLibrary.makeFunction(name: "orderedQuad_vertex") else {
            throw TextQuadPassError.missingShaderFunction("orderedQuad_vertex")
        }
        guard let fragmentFunction = shaderLibrary.makeFunction(name: "orderedQuad_fragment") else {
            throw TextQuadPassError.missingShaderFunction("orderedQuad_fragment")
        }
        let descriptor = MTLRenderPipelineDescriptor()
        descriptor.label = "TextQuadPipeline"
        descriptor.vertexFunction = vertexFunction
        descriptor.fragmentFunction = fragmentFunction
        guard let attachment = descriptor.colorAttachments[0] else {
            throw TextQuadPassError.missingShaderFunction("colorAttachment")
        }
        attachment.pixelFormat = colorPixelFormat
        attachment.isBlendingEnabled = true
        attachment.rgbBlendOperation = .add
        attachment.alphaBlendOperation = .add
        attachment.sourceRGBBlendFactor = .sourceAlpha
        attachment.sourceAlphaBlendFactor = .sourceAlpha
        attachment.destinationRGBBlendFactor = .oneMinusSourceAlpha
        attachment.destinationAlphaBlendFactor = .oneMinusSourceAlpha
        self.pipelineState = try device.makeRenderPipelineState(descriptor: descriptor)
    }

    /// 逐段提交；每段 6 顶点按两个三角形绘制。
    public func encode(encoder: MTLRenderCommandEncoder,
                       quads: [TextQuad],
                       viewportSize: SIMD2<Float>) throws {
        guard !quads.isEmpty else { return }
        encoder.setRenderPipelineState(pipelineState)
        var viewport = viewportSize
        encoder.setVertexBytes(&viewport, length: MemoryLayout<SIMD2<Float>>.stride, index: 1)
        for quad in quads {
            guard quad.vertices.count == 6 else {
                throw TextQuadPassError.invalidVertexCount(quad.vertices.count)
            }
            encoder.setFragmentTexture(quad.texture.texture, index: 0)
            try quad.vertices.withUnsafeBufferPointer { buffer in
                guard let base = buffer.baseAddress else {
                    throw TextQuadPassError.emptyBatch
                }
                encoder.setVertexBytes(UnsafeRawPointer(base),
                                       length: 6 * MemoryLayout<OrderedTextureVertex>.stride,
                                       index: 0)
            }
            encoder.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: 6)
        }
    }
}
