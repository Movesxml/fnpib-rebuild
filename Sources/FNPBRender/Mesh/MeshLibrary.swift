import Foundation
import Metal

public enum VerifiedTextureCatalog {
    /// 仅这些 .tex 已在 T-031 闭合为 RGB565；chest 的 4bpp 调色板仍未闭合。
    public static let verifiedRGB565BaseNames: Set<String> = ["fruit_atlas", "pinata"]

    public static func baseName(of textureName: String) -> String {
        let normalized = textureName.replacingOccurrences(of: "\\", with: "/")
        let last = (normalized as NSString).lastPathComponent.lowercased()
        guard let dot = last.lastIndex(of: ".") else { return last }
        return String(last[last.startIndex..<dot])
    }

    public static func verifiedPNGName(for textureName: String) -> String? {
        let base = baseName(of: textureName)
        return verifiedRGB565BaseNames.contains(base) ? base + ".png" : nil
    }
}

@MainActor
public protocol MeshTextureProvider: AnyObject {
    /// 仅在网格库加载期调用；失败返回 nil，调用方不得用其他图集兜底。
    func makeTexture(pngName: String) -> MTLTexture?
}

@MainActor
public final class GPUMesh {
    public let id: String
    public let textureBaseName: String
    public let vertexBuffer: MTLBuffer
    public let indexBuffer: MTLBuffer
    public let indexCount: Int
    public let texture: MTLTexture

    public init?(device: MTLDevice, decoded: DecodedMesh, texture: MTLTexture) {
        guard !decoded.vertexBytes.isEmpty, !decoded.indexBytes.isEmpty else { return nil }
        guard let vertexBuffer = decoded.vertexBytes.withUnsafeBytes({ raw -> MTLBuffer? in
            guard let base = raw.baseAddress else { return nil }
            return device.makeBuffer(bytes: base, length: raw.count, options: .storageModeShared)
        }), let indexBuffer = decoded.indexBytes.withUnsafeBytes({ raw -> MTLBuffer? in
            guard let base = raw.baseAddress else { return nil }
            return device.makeBuffer(bytes: base, length: raw.count, options: .storageModeShared)
        }) else { return nil }

        vertexBuffer.label = "FruitVertices-\(decoded.id)"
        indexBuffer.label = "FruitIndices-\(decoded.id)"
        self.id = decoded.id
        self.textureBaseName = decoded.textureBaseName
        self.vertexBuffer = vertexBuffer
        self.indexBuffer = indexBuffer
        self.indexCount = decoded.indexCount
        self.texture = texture
    }
}

@MainActor
public final class MeshLibrary {
    public private(set) var fruitMeshes: [Int32: [GPUMesh]] = [:]
    public private(set) var bombMeshes: [GPUMesh] = []
    public private(set) var diagnostics: [String] = []
    public private(set) var skippedMeshIDs: [String] = []

    public init(device: MTLDevice, content: DecodedFruitContent, textures: MeshTextureProvider) {
        for mesh in content.meshes {
            guard let pngName = VerifiedTextureCatalog.verifiedPNGName(for: mesh.textureBaseName) else {
                skippedMeshIDs.append(mesh.id)
                diagnostics.append(
                    "跳过网格 \(mesh.id)：纹理 \(mesh.textureBaseName) 尚无已验证像素格式/调色板"
                )
                continue
            }
            guard let texture = textures.makeTexture(pngName: pngName) else {
                skippedMeshIDs.append(mesh.id)
                diagnostics.append("跳过网格 \(mesh.id)：\(pngName) 未能加载")
                continue
            }
            guard let gpu = GPUMesh(device: device, decoded: mesh, texture: texture) else {
                skippedMeshIDs.append(mesh.id)
                diagnostics.append("跳过网格 \(mesh.id)：Metal buffer 创建失败")
                continue
            }
            switch mesh.kind {
            case .fruit(let typeID): fruitMeshes[typeID, default: []].append(gpu)
            case .bomb: bombMeshes.append(gpu)
            }
        }
        diagnostics.append(
            "MeshLibrary：\(fruitMeshes.count) 个水果类型、bombMeshes=\(bombMeshes.count)，跳过 \(skippedMeshIDs.count) 个网格"
        )
    }

    public func meshes(for selection: MeshSelection) -> [GPUMesh] {
        switch selection {
        case .fruit(let typeID): return fruitMeshes[typeID] ?? []
        case .bomb: return bombMeshes
        }
    }
}
