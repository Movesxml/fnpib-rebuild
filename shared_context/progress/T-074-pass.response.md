```swift
import Metal
import simd

public enum OrderedQuadPassError: Error, Equatable {
    case invalidViewport
    case missingShaderFunction(String)
    case unsupportedVertexStride(Int)
    case missingMetalTexture
    case emptyVertexBuffer
}

@MainActor
public final class OrderedQuadPass {
    private let pipelineState: MTLRenderPipelineState

    public static let vertexStride: Int = MemoryLayout<OrderedTextureVertex>.stride

    public init(
        device: MTLDevice,
        shaderLibrary: MTLLibrary,
        colorPixelFormat: MTLPixelFormat
    ) throws {
        guard Self.vertexStride == 32 else {
            throw OrderedQuadPassError.unsupportedVertexStride(Self.vertexStride)
        }

        guard let vertexFunction = shaderLibrary.makeFunction(name: "orderedQuad_vertex") else {
            throw OrderedQuadPassError.missingShaderFunction("orderedQuad_vertex")
        }
        guard let fragmentFunction = shaderLibrary.makeFunction(name: "orderedQuad_fragment") else {
            throw OrderedQuadPassError.missingShaderFunction("orderedQuad_fragment")
        }

        let descriptor = MTLRenderPipelineDescriptor()
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

    public func encode(
        encoder: MTLRenderCommandEncoder,
        quads: [OrderedTextureQuad],
        viewportSize: SIMD2<Float>
    ) throws {
        guard viewportSize.x.isFinite, viewportSize.y.isFinite,
              viewportSize.x > 0, viewportSize.y > 0 else {
            throw OrderedQuadPassError.invalidViewport
        }
        guard !quads.isEmpty else { return }

        encoder.setRenderPipelineState(pipelineState)

        var viewport = viewportSize
        encoder.setVertexBytes(
            &viewport,
            length: MemoryLayout<SIMD2<Float>>.stride,
            index: 1
        )

        for quad in quads {
            let texture = try resolveMetalTexture(quad.texture)
            encoder.setFragmentTexture(texture, index: 0)

            try quad.vertices.withUnsafeBufferPointer { buffer in
                guard let baseAddress = buffer.baseAddress else {
                    throw OrderedQuadPassError.emptyVertexBuffer
                }

                encoder.setVertexBytes(
                    UnsafeRawPointer(baseAddress),
                    length: 4 * MemoryLayout<OrderedTextureVertex>.stride,
                    index: 0
                )
            }

            encoder.drawPrimitives(
                type: .triangleStrip,
                vertexStart: 0,
                vertexCount: 4
            )
        }
    }

    private func resolveMetalTexture(_ handle: TextureHandle) throws -> MTLTexture {
        guard let texture = firstTexture(in: handle) else {
            throw OrderedQuadPassError.missingMetalTexture
        }
        return texture
    }

    private func firstTexture(in value: Any) -> MTLTexture? {
        if let texture = value as? MTLTexture {
            return texture
        }

        let mirror = Mirror(reflecting: value)

        if mirror.displayStyle == .optional {
            for child in mirror.children {
                if let texture = firstTexture(in: child.value) {
                    return texture
                }
            }
            return nil
        }

        for child in mirror.children {
            if let texture = firstTexture(in: child.value) {
                return texture
            }
        }

        return nil
    }
}
```

```metal
#include <metal_stdlib>
using namespace metal;

struct OrderedVertex {
    float2 position;
    float2 uv;
    float4 rgba;
};

struct OrderedVertexOut {
    float4 position [[position]];
    float2 uv;
    float4 rgba;
};

vertex OrderedVertexOut orderedQuad_vertex(
    uint vertexID [[vertex_id]],
    constant OrderedVertex *vertices [[buffer(0)]],
    constant float2 &viewportSize [[buffer(1)]]
) {
    OrderedVertex vertex = vertices[vertexID];

    OrderedVertexOut out;
    out.position = float4(
        vertex.position.x / viewportSize.x * 2.0 - 1.0,
        1.0 - vertex.position.y / viewportSize.y * 2.0,
        0.0,
        1.0
    );
    out.uv = vertex.uv;
    out.rgba = vertex.rgba;
    return out;
}

fragment float4 orderedQuad_fragment(
    OrderedVertexOut in [[stage_in]],
    texture2d<float> texture0 [[texture(0)]]
) {
    constexpr sampler s(coord::normalized, address::clamp_to_edge, filter::linear);
    return texture0.sample(s, in.uv) * in.rgba;
}
```