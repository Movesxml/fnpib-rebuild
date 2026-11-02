import Foundation
import CoreGraphics
import Metal
import simd
import FNPBRender
import FNPBUI

@MainActor
final class ChallengeMapQuadAdapter {
    private let textureLoader: TextureLoader
    private var textureCache: [ChallengeMapTextureKey: TextureHandle] = [:]

    init(device: MTLDevice) {
        self.textureLoader = TextureLoader(device: device)
    }

    func makeQuads(components: [ChallengeMapLayoutComponent],
                   viewportSize: CGSize) throws -> [OrderedTextureQuad] {
        guard viewportSize.width.isFinite, viewportSize.height.isFinite,
              viewportSize.width > 0, viewportSize.height > 0 else {
            throw ChallengeMapQuadAdapterError.invalidViewport(viewportSize)
        }

        var result: [OrderedTextureQuad] = []
        result.reserveCapacity(components.count)
        for component in components {
            guard let texturePath = component.texturePath else { continue }
            guard component.screenVisibility, component.absoluteRGBA.alpha != 0 else { continue }
            let componentIndex = component.index

            let resolved: ChallengeMapResolvedTexture
            switch ChallengeMapTextureResolver.resolve(
                texturePath: texturePath, iconIndex: component.iconIndex) {
            case .success(let value): resolved = value
            case .failure(let error):
                throw ChallengeMapQuadAdapterError.textureResolutionFailed(
                    componentIndex: componentIndex, error: error)
            }

            let sourcePositions = ChallengeMapLayoutGeometry.positions(
                for: component, deviceWidth: viewportSize.width,
                deviceHeight: viewportSize.height)
            let sourceUVs = ChallengeMapLayoutGeometry.texCoords(
                for: component, resolvedUV: resolved.resolvedUV)
            guard sourcePositions.count == 4, sourceUVs.count == 4,
                  sourcePositions.allSatisfy({ $0.x.isFinite && $0.y.isFinite }),
                  sourceUVs.allSatisfy({ $0.x.isFinite && $0.y.isFinite }) else {
                throw ChallengeMapQuadAdapterError.invalidGeometry(componentIndex: componentIndex)
            }
            let positions = sourcePositions.map { SIMD2<Float>(Float($0.x), Float($0.y)) }
            let uvs = sourceUVs.map { SIMD2<Float>(Float($0.x), Float($0.y)) }
            let color = component.absoluteRGBA
            let rgba = SIMD4<UInt8>(color.red, color.green, color.blue, color.alpha)
            guard let vertices = OrderedTextureQuad.makeVertices(
                positions: positions, uvs: uvs, absoluteRGBA: rgba,
                screenVisibility: true) else {
                throw ChallengeMapQuadAdapterError.invalidGeometry(componentIndex: componentIndex)
            }

            let texture = try textureHandle(for: resolved.textureKey)
            guard let quad = OrderedTextureQuad(
                texture: texture, componentIndex: componentIndex, vertices: vertices) else {
                throw ChallengeMapQuadAdapterError.invalidQuad(componentIndex: componentIndex)
            }
            result.append(quad)
        }
        return result
    }

    private func textureHandle(for key: ChallengeMapTextureKey) throws -> TextureHandle {
        if let cached = textureCache[key] { return cached }
        guard let url = UIArtwork.url(for: key.rawValue) else {
            throw ChallengeMapQuadAdapterError.missingTextureURL(key.rawValue)
        }
        let handle = try textureLoader.load(TextureAsset(
            id: "challengeMap/" + key.rawValue,
            source: .url(url), srgb: false,
            generateMipmaps: false, premultipliedAlpha: false))
        textureCache[key] = handle
        return handle
    }
}

enum ChallengeMapQuadAdapterError: LocalizedError {
    case invalidViewport(CGSize)
    case invalidGeometry(componentIndex: Int)
    case textureResolutionFailed(componentIndex: Int, error: ChallengeMapTextureResolutionError)
    case missingTextureURL(String)
    case invalidQuad(componentIndex: Int)

    var errorDescription: String? {
        switch self {
        case .invalidViewport(let size):
            return "ChallengeMapQuadAdapter: invalid viewport \(size.width)x\(size.height)."
        case .invalidGeometry(let index):
            return "ChallengeMapQuadAdapter: invalid geometry for component \(index)."
        case .textureResolutionFailed(let index, let error):
            return "ChallengeMapQuadAdapter: texture resolution failed for component \(index): \(error)."
        case .missingTextureURL(let name):
            return "ChallengeMapQuadAdapter: missing texture URL for \(name)."
        case .invalidQuad(let index):
            return "ChallengeMapQuadAdapter: failed to construct quad for component \(index)."
        }
    }
}
