import Foundation
import Metal
import simd

public enum MeshPassError: Error, CustomStringConvertible {
    case missingShaderFunction(String)
    case depthStateCreationFailed
    case pipelineCreationFailed(String)

    public var description: String {
        switch self {
        case .missingShaderFunction(let name): return "fruit.metal 缺少函数 \(name)"
        case .depthStateCreationFailed: return "无法创建 FruitMeshDepth"
        case .pipelineCreationFailed(let reason): return "MeshPass 管线创建失败：\(reason)"
        }
    }
}

private struct MeshUniforms {
    var mvp: simd_float4x4
}

@MainActor
public final class MeshPass {
    public static let vertexFunctionName = "fruit_vertex"
    public static let fragmentFunctionName = "fruit_fragment"

    private let pipeline: MTLRenderPipelineState
    private let depthState: MTLDepthStencilState

    public init(
        device: MTLDevice,
        shaderLibrary: MTLLibrary,
        colorPixelFormat: MTLPixelFormat
    ) throws {
        guard let vertexFunction = shaderLibrary.makeFunction(name: Self.vertexFunctionName) else {
            throw MeshPassError.missingShaderFunction(Self.vertexFunctionName)
        }
        guard let fragmentFunction = shaderLibrary.makeFunction(name: Self.fragmentFunctionName) else {
            throw MeshPassError.missingShaderFunction(Self.fragmentFunctionName)
        }

        let descriptor = MTLRenderPipelineDescriptor()
        descriptor.label = "FruitMeshPass"
        descriptor.vertexFunction = vertexFunction
        descriptor.fragmentFunction = fragmentFunction
        descriptor.colorAttachments[0].pixelFormat = colorPixelFormat
        descriptor.colorAttachments[0].isBlendingEnabled = false
        descriptor.depthAttachmentPixelFormat = .depth32Float

        let depthDescriptor = MTLDepthStencilDescriptor()
        depthDescriptor.label = "FruitMeshDepth"
        depthDescriptor.depthCompareFunction = .lessEqual
        depthDescriptor.isDepthWriteEnabled = true
        guard let depthState = device.makeDepthStencilState(descriptor: depthDescriptor) else {
            throw MeshPassError.depthStateCreationFailed
        }

        do {
            self.pipeline = try device.makeRenderPipelineState(descriptor: descriptor)
        } catch {
            throw MeshPassError.pipelineCreationFailed(String(describing: error))
        }
        self.depthState = depthState
    }

    /// 在同一 encoder 中先调用本方法，再编码 2D 刀光。
    /// uniform 使用 buffer(2)，不会覆盖 sprite 在 buffer(1) 的 viewport。
    public func encode(
        encoder: MTLRenderCommandEncoder,
        batches: [MeshBatch],
        viewProjection: MeshMatrix
    ) {
        guard !batches.isEmpty else { return }
        encoder.setRenderPipelineState(pipeline)
        encoder.setCullMode(.none) // [待验证] 原始 winding 未闭合，不能猜测剔除面。
        encoder.setDepthStencilState(depthState)
        let vp = viewProjection.simdMatrix

        for batch in batches where !batch.modelMatrices.isEmpty {
            encoder.setVertexBuffer(batch.mesh.vertexBuffer, offset: 0, index: 0)
            encoder.setFragmentTexture(batch.mesh.texture, index: 0)
            for model in batch.modelMatrices {
                var uniforms = MeshUniforms(mvp: vp * model.simdMatrix)
                encoder.setVertexBytes(
                    &uniforms,
                    length: MemoryLayout<MeshUniforms>.stride,
                    index: 2
                )
                encoder.drawIndexedPrimitives(
                    type: .triangle,
                    indexCount: batch.mesh.indexCount,
                    indexType: .uint32,
                    indexBuffer: batch.mesh.indexBuffer,
                    indexBufferOffset: 0
                )
            }
        }
    }
}
