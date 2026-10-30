import Foundation
import Metal
import MetalKit

/// 贴图资产来源。PNG/WWW 图集整页加载，不做子图切分。
public enum TextureAssetSource: Sendable, Hashable {
    case url(URL)
    case data(Data)
}

/// 贴图资产描述。
///
/// `id` 必须由调用方保证全局唯一，作为缓存键的一部分。
/// `premultipliedAlpha` 对应 T-018 中 .tex 头保留的预乘标记；实际 PNG 是否预乘
/// 需资产管线确认 [待验证]。
public struct TextureAsset: Sendable, Hashable {

    public var id: String
    public var source: TextureAssetSource
    public var srgb: Bool
    public var generateMipmaps: Bool
    public var premultipliedAlpha: Bool

    public init(
        id: String,
        source: TextureAssetSource,
        srgb: Bool = true,
        generateMipmaps: Bool = false,
        premultipliedAlpha: Bool = true
    ) {
        self.id = id
        self.source = source
        self.srgb = srgb
        self.generateMipmaps = generateMipmaps
        self.premultipliedAlpha = premultipliedAlpha
    }

    public var cacheKey: String {
        var key = "\(id)|srgb=\(srgb)|mip=\(generateMipmaps)|premul=\(premultipliedAlpha)"
        switch source {
        case .url(let url):
            key += "|url=\(url.path)"
        case .data(let data):
            // Data 内容不参与 key，调用方必须用唯一 id 区分不同 data。
            key += "|data=\(data.count)"
        }
        return key
    }
}

/// 蓝图 S7 TextureLoading。渲染层只依赖该协议。
public protocol TextureLoading: AnyObject {
    func load(_ asset: TextureAsset) throws -> TextureHandle
}

public enum TextureLoaderError: Error {
    case textureCreationFailed(assetID: String)
    case unsupportedSource(assetID: String)
}

/// MTKTextureLoader 实现。缓存按 asset.cacheKey 去重，相同图集多次请求返回同一
/// TextureHandle（同一 MTLTexture）。
///
/// 线程：内部 NSLock 串行化缓存与 loader 调用；MTLTexture 创建后只读，
/// `@unchecked Sendable` 由该不变量保证。
public final class TextureLoader: TextureLoading, @unchecked Sendable {

    private let device: MTLDevice
    private let loader: MTKTextureLoader
    private let lock = NSLock()
    private var cache: [String: TextureHandle] = [:]

    public init(device: MTLDevice) {
        self.device = device
        self.loader = MTKTextureLoader(device: device)
    }

    public func load(_ asset: TextureAsset) throws -> TextureHandle {
        lock.lock()
        defer { lock.unlock() }

        if let cached = cache[asset.cacheKey] {
            return cached
        }

        var options: [MTKTextureLoader.Option: Any] = [
            .SRGB: NSNumber(value: asset.srgb),
            .textureUsage: NSNumber(value: MTLTextureUsage.shaderRead.rawValue),
            // [待验证] MTKTextureLoader.Option.textureStorageMode 在 iOS 27 的行为；
            // .private 可避免不必要的 CPU 可读映射，加载由 MetalKit 内部 blit 完成。
            .textureStorageMode: NSNumber(value: MTLStorageMode.private.rawValue),
            .generateMipmaps: NSNumber(value: asset.generateMipmaps),
            // 图集通常按左上原点导出；MTKTextureLoader 默认也是 top-left，
            // 这里显式写出以防默认值变化 [待验证 Option 可用性]。
            .origin: NSNumber(value: MTKTextureLoader.Origin.topLeft.rawValue)
        ]

        let texture: MTLTexture
        switch asset.source {
        case .url(let url):
            texture = try loader.newTexture(URL: url, options: options)

        case .data(let data):
            texture = try loader.newTexture(data: data, options: options)
        }

        guard texture.width > 0, texture.height > 0 else {
            throw TextureLoaderError.textureCreationFailed(assetID: asset.id)
        }

        let handle = TextureHandle(
            texture: texture,
            assetID: asset.id,
            premultipliedAlpha: asset.premultipliedAlpha
        )
        cache[asset.cacheKey] = handle
        return handle
    }
}