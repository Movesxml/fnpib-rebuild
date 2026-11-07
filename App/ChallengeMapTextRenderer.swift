import Foundation
import CoreGraphics
import Metal
import FNPBCore
import FNPBRender
import FNPBUI

/// 把挑战地图的 11 条本地化文案变成 Metal 可直接提交的文字段。
///
/// 数据：Content/challengeMapStrings.json（T-077，由发售版 StringTables 导出）
///       组件位置来自 UISF 布局投影（ChallengeMapLayoutComponent）。
/// 字形：FreeType（vendor）→ 灰度图集 → RGBA 纹理。
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

    private let device: MTLDevice
    private var metricsCache: [String: FreeTypeTextFontMetrics] = [:]

    init(device: MTLDevice) {
        self.device = device
    }

    /// 读取包内的 challengeMapStrings.json。
    func loadStrings(bundle: Bundle = .main) throws -> ChallengeMapStrings {
        // Content 资源在 bundle 根目录（XcodeGen 把 Content 平铺进 .app）。
        guard let url = bundle.url(forResource: "challengeMapStrings", withExtension: "json")
        else { throw TextRenderError.missingStringsResource }
        return try ChallengeMapStrings.load(from: Data(contentsOf: url))
    }

    /// 为每个有文案的组件生成文字段；返回的纹理已按字体内建。
    func makeTextQuads(components: [ChallengeMapLayoutComponent],
                       strings: ChallengeMapStrings,
                       viewportSize: CGSize) throws -> [TextQuad] {
        guard viewportSize.width > 0, viewportSize.height > 0 else { return [] }

        // 1. 先按字体分组，逐条排版进各自的图集。
        struct Pending {
            let entry: ChallengeMapStringEntry
            let vertices: [TextVertex]
            let origin: SIMD2<Float>
        }
        var atlases: [String: GlyphAtlas] = [:]
        var pending: [Pending] = []

        for component in components {
            guard let entry = strings.entry(componentIndex: component.index) else { continue }
            guard let metrics = metrics(for: entry.fontName) else {
                throw TextRenderError.missingFont(entry.fontName)
            }
            var atlas = atlases[entry.fontName] ?? GlyphAtlas()
            let constraints = TextLayoutConstraints(maxWidth: -1, maxLines: 1)
            let block = TextBlockBuilder.build(codePoints: Self.codePoints(entry.text),
                                               initialFontSize: entry.fontSize,
                                               constraints: constraints,
                                               metrics: metrics,
                                               color: Self.color(component.absoluteRGBA),
                                               atlas: atlas)
            atlas = block.atlas
            atlases[entry.fontName] = atlas
            guard !block.vertices.isEmpty else { continue }
            let origin = Self.origin(of: component, viewportSize: viewportSize)
            pending.append(Pending(entry: entry, vertices: block.vertices, origin: origin))
        }

        // 2. 每个字体上传一张图集纹理。
        var textures: [String: TextureHandle] = [:]
        for (fontName, atlas) in atlases {
            let upload = try TextAtlasTexture(device: device, atlas: atlas)
            textures[fontName] = TextureHandle(
                texture: upload.texture,
                assetID: "challengeMapText/\(fontName)",
                premultipliedAlpha: false)
        }

        // 3. 组装成 6 顶点的文字段，并整体平移到组件位置。
        var quads: [TextQuad] = []
        for item in pending {
            guard let texture = textures[item.entry.fontName] else {
                throw TextRenderError.textureUploadFailed(item.entry.fontName)
            }
            let moved = item.vertices.map { vertex in
                TextVertex(position: SIMD2<Float>(vertex.position.x + item.origin.x,
                                                 vertex.position.y + item.origin.y),
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

    private func metrics(for fontName: String) -> FreeTypeTextFontMetrics? {
        if let cached = metricsCache[fontName] { return cached }
        guard let url = Self.fontURL(for: fontName) else { return nil }
        guard let metrics = FreeTypeTextFontMetrics(fontURL: url) else { return nil }
        metricsCache[fontName] = metrics
        return metrics
    }

    /// 原版字体路径形如 FontsTrueType/bronic.ttf；包内的 Content 资源是平铺的。
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
