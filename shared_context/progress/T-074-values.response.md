```swift
import Foundation
import Metal
import simd

public struct OrderedTextureVertex: Sendable, Equatable {
    public let position: SIMD2<Float>
    public let uv: SIMD2<Float>
    public let rgba: SIMD4<Float>

    public init(position: SIMD2<Float>, uv: SIMD2<Float>, rgba: SIMD4<Float>) {
        self.position = position
        self.uv = uv
        self.rgba = rgba
    }
}

public struct OrderedTextureQuad: Sendable, Equatable {
    public let vertices: [OrderedTextureVertex]
    public let texture: TextureHandle
    public let componentIndex: Int

    public static func makeVertices(
        positions: [SIMD2<Float>],
        uvs: [SIMD2<Float>],
        absoluteRGBA: SIMD4<UInt8>,
        screenVisibility: Bool
    ) -> [OrderedTextureVertex]? {
        guard screenVisibility else { return nil }
        guard absoluteRGBA.w != 0 else { return nil }
        guard positions.count == 4, uvs.count == 4 else { return nil }

        for index in 0..<4 {
            let position = positions[index]
            let uv = uvs[index]
            guard position.x.isFinite,
                  position.y.isFinite,
                  uv.x.isFinite,
                  uv.y.isFinite else {
                return nil
            }
        }

        let rgba = SIMD4<Float>(
            Float(absoluteRGBA.x) / 255.0,
            Float(absoluteRGBA.y) / 255.0,
            Float(absoluteRGBA.z) / 255.0,
            Float(absoluteRGBA.w) / 255.0
        )

        return (0..<4).map { index in
            OrderedTextureVertex(
                position: positions[index],
                uv: uvs[index],
                rgba: rgba
            )
        }
    }

    public init?(
        texture: TextureHandle,
        componentIndex: Int,
        vertices: [OrderedTextureVertex]
    ) {
        guard vertices.count == 4 else { return nil }

        for vertex in vertices {
            guard vertex.position.x.isFinite,
                  vertex.position.y.isFinite,
                  vertex.uv.x.isFinite,
                  vertex.uv.y.isFinite,
                  vertex.rgba.x.isFinite,
                  vertex.rgba.y.isFinite,
                  vertex.rgba.z.isFinite,
                  vertex.rgba.w.isFinite else {
                return nil
            }
        }

        self.vertices = vertices
        self.texture = texture
        self.componentIndex = componentIndex
    }
}
```