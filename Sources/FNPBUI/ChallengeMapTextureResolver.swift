//
//  ChallengeMapTextureResolver.swift
//  FNPBUI
//
//  Exact texturePath mappings verified by reverse/generate_challenge_atlas_asset.py.
//  Unknown paths fail explicitly; no case folding or basename guessing.
//

import UIKit

public enum ChallengeMapTextureKey: String, Sendable, Equatable, CaseIterable {
    case challengeFlipper
    case challengeBasicPoster
    case challengePosterDeco01
    case challengeIconSlot
    case challengeAtlas
    case challengeTick
    case challengeCross
    case challengePosterDeco02
    case challengeLocations
}

public struct ChallengeMapResolvedUV: Sendable, Equatable {
    public var u: Float
    public var v: Float
    public var width: Float
    public var height: Float

    public init(u: Float, v: Float, width: Float, height: Float) {
        self.u = u
        self.v = v
        self.width = width
        self.height = height
    }
}

public struct ChallengeMapResolvedTexture {
    public let textureKey: ChallengeMapTextureKey
    public let image: UIImage
    /// nil means retain the component's static UV; non-nil is the controller's runtime icon UV.
    public let resolvedUV: ChallengeMapResolvedUV?

    public init(textureKey: ChallengeMapTextureKey, image: UIImage,
                resolvedUV: ChallengeMapResolvedUV?) {
        self.textureKey = textureKey
        self.image = image
        self.resolvedUV = resolvedUV
    }
}

public enum ChallengeMapTextureResolutionError: Error, Equatable, Sendable {
    case missingTexturePath
    case unsupportedTexturePath(String)
    case imageUnavailable(textureKey: ChallengeMapTextureKey)
    case iconIndexRequiresChallengeAtlas(texturePath: String)
    case iconIndexOutOfRange(Int32)
}

public enum ChallengeMapTextureResolver {
    public static let texturePathToKey: [String: ChallengeMapTextureKey] = [
        "textures/adventureprogress/flipper.tex": .challengeFlipper,
        "textures/menus/basicPoster.tex": .challengeBasicPoster,
        "textures/menus/posterDeco01.tex": .challengePosterDeco01,
        "textures/adventureprogress/iconSlot.tex": .challengeIconSlot,
        "textures/adventureProgress/iconSlot.tex": .challengeIconSlot,
        "textures/adventureprogress/challengeAtlas.tex": .challengeAtlas,
        "textures/adventureprogress/tick.tex": .challengeTick,
        "textures/adventureprogress/cross.tex": .challengeCross,
        "textures/menus/posterDeco02.tex": .challengePosterDeco02,
        "textures/adventureProgress/locations.tex": .challengeLocations,
    ]

    public static func resolve(
        texturePath: String?, iconIndex: Int32?, bundle: Bundle = .main
    ) -> Result<ChallengeMapResolvedTexture, ChallengeMapTextureResolutionError> {
        guard let texturePath else { return .failure(.missingTexturePath) }
        guard let textureKey = texturePathToKey[texturePath] else {
            return .failure(.unsupportedTexturePath(texturePath))
        }

        let resolvedUV: ChallengeMapResolvedUV?
        if let iconIndex {
            guard textureKey == .challengeAtlas else {
                return .failure(.iconIndexRequiresChallengeAtlas(texturePath: texturePath))
            }
            guard (0..<64).contains(iconIndex) else {
                return .failure(.iconIndexOutOfRange(iconIndex))
            }
            // ChallengeMapController: ((index & 7) / 8, (index >> 3) / 8), size 1/8.
            resolvedUV = ChallengeMapResolvedUV(
                u: Float(iconIndex & 7) / 8,
                v: Float(iconIndex >> 3) / 8,
                width: 1.0 / 8.0,
                height: 1.0 / 8.0)
        } else {
            resolvedUV = nil
        }

        guard let image = UIArtwork.image(textureKey.rawValue, bundle: bundle) else {
            return .failure(.imageUnavailable(textureKey: textureKey))
        }
        return .success(ChallengeMapResolvedTexture(
            textureKey: textureKey, image: image, resolvedUV: resolvedUV))
    }
}
