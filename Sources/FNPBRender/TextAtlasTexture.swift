import Metal
import FNPBCore

// ============================================================================
// TextAtlasTexture.swift — 把 GlyphAtlas 上传成 Metal 纹理
//
// 图集是 8bit 灰度；现有着色器按 texture * vertexColor 工作（orderedQuad.metal:33-39），
// 所以把它展开成 RGBA8（RGB=255、A=灰度），文字颜色交给顶点色。
// ============================================================================

public enum TextAtlasTextureError: Error, Equatable {
    case emptyAtlas
    case allocationFailed
    case uploadFailed
}

public struct TextAtlasTexture {
    public let texture: MTLTexture

    public init(device: MTLDevice, atlas: GlyphAtlas) throws {
        guard atlas.width > 0, atlas.height > 0 else {
            throw TextAtlasTextureError.emptyAtlas
        }
        let descriptor = MTLTextureDescriptor.texture2DDescriptor(
            pixelFormat: .rgba8Unorm,
            width: atlas.width,
            height: atlas.height,
            mipmapped: false)
        descriptor.usage = .shaderRead
        descriptor.storageMode = .managed
        guard let texture = device.makeTexture(descriptor: descriptor) else {
            throw TextAtlasTextureError.allocationFailed
        }
        texture.label = "GlyphAtlas"

        let bytes = atlas.packedRGBA8()
        guard bytes.count == atlas.width * atlas.height * 4 else {
            throw TextAtlasTextureError.uploadFailed
        }
        bytes.withUnsafeBytes { raw in
            guard let base = raw.baseAddress else { return }
            texture.replace(region: MTLRegionMake2D(0, 0, atlas.width, atlas.height),
                            mipmapLevel: 0,
                            withBytes: base,
                            bytesPerRow: atlas.width * 4)
        }
        self.texture = texture
    }
}
