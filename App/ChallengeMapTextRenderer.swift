import Foundation
import CoreGraphics
import Metal
import FNPBCore
import FNPBRender
import FNPBUI

/// 把挑战地图的本地化文案变成 Metal 可直接提交的文字段。
///
/// 缓存策略（真机必需）：
///   · 每个字体一份 FreeType 度量 + 一张图集 + 一张已上传的纹理；
///   · 每条文案的**局部顶点**按 (文本, 字号, 颜色) 缓存，形状不变就不重排、不重栅格化；
///   · 每帧只做「局部顶点 + 组件原点」的平移与 6 顶点切片。
/// 图集只在新增字形时标脏并重新上传一次。
@MainActor
final class ChallengeMapTextRenderer {

    enum TextRenderError: LocalizedError {
        case missingFont(String)
        case missingStringsResource
        case textureUploadFailed(String)

        var errorDescription: String? {
            switch self {
            case .missingFont(let name): return "缺少字体文件：\(name)"
            case .missingStringsResource: return "包内缺少 challengeMapStrings.json"
            case .textureUploadFailed(let name): return "文字图集纹理创建失败：\(name)"
            }
        }
    }

    private struct BlockKey: Hashable {
        let text: String
        let fontSize: Float
        let color: SIMD4<Float>
    }

    private final class FontContext {
        let metrics: FreeTypeTextFontMetrics
        var atlas: GlyphAtlas
        var texture: TextureHandle?
        /// 图集是否自上次上传后新增过字形。
        var atlasDirty: Bool = false
        var blocks: [BlockKey: [TextVertex]] = [:]

        init(metrics: FreeTypeTextFontMetrics, atlas: GlyphAtlas = GlyphAtlas()) {
            self.metrics = metrics
            self.atlas = atlas
        }
    }

    private let device: MTLDevice
    private var fonts: [String: FontContext] = [:]
    private var cachedStrings: [String: ChallengeMapStrings] = [:]

    init(device: MTLDevice) {
        self.device = device
    }

    /// 读取包内的本地化文案 JSON（按资源名缓存）。
    func loadStrings(named name: String, bundle: Bundle = .main) throws -> ChallengeMapStrings {
        if let cached = cachedStrings[name] { return cached }
        // Content 资源被 XcodeGen 平铺到 bundle 根目录。
        guard let url = bundle.url(forResource: name, withExtension: "json") else {
            throw TextRenderError.missingStringsResource
        }
        let strings = try ChallengeMapStrings.load(from: Data(contentsOf: url))
        cachedStrings[name] = strings
        return strings
    }

    func loadStrings(bundle: Bundle = .main) throws -> ChallengeMapStrings {
        try loadStrings(named: "challengeMapStrings", bundle: bundle)
    }

    /// 单屏入口（保留给只画地图屏的调用方）。
    func makeTextQuads(components: [ChallengeMapLayoutComponent],
                       strings: ChallengeMapStrings,
                       viewportSize: CGSize) throws -> [TextQuad] {
        try makeTextQuads(screens: [(components, strings)], viewportSize: viewportSize)
    }

    /// 多屏入口：按传入顺序生成文字段（背景屏在前，地图屏在后）。
    func makeTextQuads(screens: [(components: [ChallengeMapLayoutComponent],
                                  strings: ChallengeMapStrings)],
                       viewportSize: CGSize) throws -> [TextQuad] {
        guard viewportSize.width > 0, viewportSize.height > 0 else { return [] }
        var all: [TextQuad] = []
        for screen in screens {
            all.append(contentsOf: try makeTextQuads(components: screen.components,
                                                     strings: screen.strings,
                                                     viewportSize: viewportSize,
                                                     helper: true))
        }
        return all
    }

    private func makeTextQuads(components: [ChallengeMapLayoutComponent],
                               strings: ChallengeMapStrings,
                               viewportSize: CGSize,
                               helper isHelper: Bool) throws -> [TextQuad] {
        _ = isHelper

        var quads: [TextQuad] = []
        for component in components {
            guard let entry = strings.entry(componentIndex: component.index) else { continue }
            let context = try fontContext(for: entry.fontName)
            let color = Self.color(component.absoluteRGBA)
            let key = BlockKey(text: entry.text, fontSize: entry.fontSize, color: color)

            let localVertices: [TextVertex]
            if let cached = context.blocks[key] {
                localVertices = cached
            } else {
                let block = TextBlockBuilder.build(
                    codePoints: Self.codePoints(entry.text),
                    initialFontSize: entry.fontSize,
                    constraints: TextLayoutConstraints(maxWidth: -1, maxLines: 1),
                    metrics: context.metrics,
                    color: color,
                    atlas: context.atlas)
                context.atlas = block.atlas
                context.atlasDirty = true
                context.blocks[key] = block.vertices
                localVertices = block.vertices
            }
            guard !localVertices.isEmpty else { continue }

            if context.texture == nil || context.atlasDirty {
                let upload = try TextAtlasTexture(device: device, atlas: context.atlas)
                context.texture = TextureHandle(
                    texture: upload.texture,
                    assetID: "challengeMapText/\(entry.fontName)",
                    premultipliedAlpha: false)
                context.atlasDirty = false
            }
            guard let texture = context.texture else {
                throw TextRenderError.textureUploadFailed(entry.fontName)
            }

            let origin = Self.origin(of: component, viewportSize: viewportSize)
            let moved = localVertices.map { vertex in
                TextVertex(position: SIMD2<Float>(vertex.position.x + origin.x,
                                                 vertex.position.y + origin.y),
                           color: vertex.color,
                           uv: vertex.uv)
            }
            for start in stride(from: 0, to: moved.count, by: 6) {
                let end = min(start + 6, moved.count)
                guard end - start == 6,
                      let quad = TextQuad.make(from: Array(moved[start..<end]),
                                               texture: texture) else { continue }
                quads.append(quad)
            }
        }
        return quads
    }

    // MARK: - 内部

    private func fontContext(for fontName: String) throws -> FontContext {
        if let existing = fonts[fontName] { return existing }
        guard let url = Self.fontURL(for: fontName),
              let metrics = FreeTypeTextFontMetrics(fontURL: url) else {
            throw TextRenderError.missingFont(fontName)
        }
        let context = FontContext(metrics: metrics)
        fonts[fontName] = context
        return context
    }

    /// 原版字体路径形如 FontsTrueType/bronic.ttf；包内 Content 资源是平铺的。
    static func fontURL(for fontName: String) -> URL? {
        let file = (fontName as NSString).lastPathComponent
        let base = (file as NSString).deletingPathExtension
        let ext = (file as NSString).pathExtension
        return Bundle.main.url(forResource: base, withExtension: ext)
            ?? Bundle.main.url(forResource: file, withExtension: nil)
    }

    static func codePoints(_ text: String) -> [Int32] {
        text.unicodeScalars.map { Int32($0.value) }
    }

    static func color(_ rgba: ChallengeMapLayoutColor) -> SIMD4<Float> {
        SIMD4<Float>(Float(rgba.red), Float(rgba.green),
                     Float(rgba.blue), Float(rgba.alpha))
    }

    /// 组件在屏幕上的左上角（与贴图四边形用同一套投影）。
    static func origin(of component: ChallengeMapLayoutComponent,
                       viewportSize: CGSize) -> SIMD2<Float> {
        let positions = ChallengeMapLayoutGeometry.positions(
            for: component, deviceWidth: viewportSize.width, deviceHeight: viewportSize.height)
        guard let first = positions.first else { return SIMD2<Float>(0, 0) }
        var minX = first.x
        var minY = first.y
        for point in positions {
            minX = min(minX, point.x)
            minY = min(minY, point.y)
        }
        return SIMD2<Float>(Float(minX), Float(minY))
    }
}
