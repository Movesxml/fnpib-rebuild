//
//  UISupport.swift
//  FNPBUI — 界面层 v1（T-021）
//
//  共享视觉基元（配色 / 素材装载 / 按钮 / 屏幕骨架）。
//
//  ⚠️ 这是 FNPBUI 里**唯一 import UIKit 的文件**：
//     仅因为 `Image(uiImage:)` 需要 `UIImage` 把 assets 管线产出的 PNG 装进 SwiftUI。
//     本文件不含任何 `UIViewRepresentable`——MTKView / TouchRouter.captureView 的桥接
//     若存在，归 FNPBRender / FNPBPlatform（此处不重复实现，也不猜它们的 API）。
//
//  ⚠️ 素材策略（遵守任务卡「禁止臆造资源名」）：
//     不硬编码任何未经确认的 PNG 文件名。所有素材按**语义 key**（`screen.<uiscreen>.<element>`）
//     查找，查不到即色块回落并保留版面，绝不导致崩溃。
//     [待验证] key → 真实文件名的映射待 tools/AssetPipeline 产出清单后回填
//     （届时只需改 `UIArtwork` 内部，视图代码不用动）。
//

import SwiftUI
import UIKit

// MARK: - 配色

/// 占位配色方案。
/// [待验证] 原版主色取自贴图（assets_png），未做取色采样；此处为可读性占位值，
/// 资产管线落地后应按真实贴图采样替换。
public enum UIPalette {
    /// 深色墨（按钮上的深色文字）
    public static var ink: Color { Color(red: 0.10, green: 0.08, blue: 0.07) }
    /// 羊皮纸白（主要文字）
    public static var parchment: Color { Color(red: 0.97, green: 0.93, blue: 0.83) }
    /// 金色（主按钮 / 高亮）
    public static var gold: Color { Color(red: 0.98, green: 0.76, blue: 0.24) }
    /// 朱红（危险 / 生命标记）
    public static var accent: Color { Color(red: 0.86, green: 0.25, blue: 0.16) }
    /// 背景兜底色
    public static var backdrop: Color { Color(red: 0.16, green: 0.12, blue: 0.10) }
    /// 面板填充
    public static var panelFill: Color { Color(red: 0.20, green: 0.15, blue: 0.12).opacity(0.95) }
    /// 全屏遮罩
    public static var scrim: Color { Color.black.opacity(0.60) }
    /// 缺图占位块
    public static var placeholder: Color { Color(red: 0.30, green: 0.24, blue: 0.20) }
}

// MARK: - 素材装载

public enum UIArtwork {

    /// assets_png 产物在 bundle 内的子目录。
    /// [待验证] 与 pipeline / XcodeGen 的 resources 拷贝目标需对齐（当前假设为 `Assets/`，且允许平铺兜底）。
    public static var subdirectory: String { "Assets" }

    /// 按语义 key 查 png 文件路径。找不到返回 nil（调用方回落色块）。
    public static func url(for key: String, bundle: Bundle = .main) -> URL? {
        bundle.url(forResource: key, withExtension: "png", subdirectory: subdirectory)
            ?? bundle.url(forResource: key, withExtension: "png")
    }

    /// 按语义 key 装载图像。
    /// 先试 asset catalog（若资产管线最终产出 xcassets，UIImage(named:) 自带缓存），
    /// 再回落到 bundle 内的 png 产物。
    public static func image(_ key: String, bundle: Bundle = .main) -> UIImage? {
        if let named = UIImage(named: key, in: bundle, compatibleWith: nil) {
            return named
        }
        guard let url = url(for: key, bundle: bundle) else { return nil }
        return UIImage(contentsOfFile: url.path)
    }

    // MARK: - 按 UISF 引用装载（Content/artworkManifest.json 驱动）

    /// 清单：UISF 里的贴图引用 → assets_png/textures 下的相对 png 路径。
    /// 由 reverse/build_artwork_manifest.py 生成，未命中项不会进这张表。
    static let textureManifest: [String: String] = {
        guard let url = Bundle.main.url(forResource: "artworkManifest", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let document = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
              let resolved = document["resolved"] as? [[String: Any]] else {
            return [:]
        }
        var table: [String: String] = [:]
        for entry in resolved {
            guard let reference = entry["reference"] as? String,
                  let png = entry["png"] as? String else { continue }
            table[reference] = png
        }
        return table
    }()

    /// 贴图包在 bundle 里的子目录名；XcodeGen 的 folder 引用可能保留原名，两处都试。
    private static let artworkDirectories = ["Artwork", "textures"]

    /// NSCache 本身线程安全（文档保证），但类型不是 Sendable，故显式声明。
    nonisolated(unsafe) private static let textureCache = NSCache<NSString, UIImage>()

    /// 按 UISF 引用（如 textures/menus/basicPoster.tex）装载纹理；未命中返回 nil。
    public static func textureImage(for reference: String, bundle: Bundle = .main) -> UIImage? {
        let cacheKey = reference as NSString
        if let cached = textureCache.object(forKey: cacheKey) { return cached }
        guard let png = textureManifest[reference] else { return nil }
        for directory in artworkDirectories {
            if let url = bundle.url(forResource: png, withExtension: nil, subdirectory: directory)
                ?? bundle.url(forResource: (png as NSString).lastPathComponent,
                              withExtension: nil, subdirectory: directory),
               let image = UIImage(contentsOfFile: url.path) {
                textureCache.setObject(image, forKey: cacheKey)
                return image
            }
        }
        return nil
    }

    /// challengeAtlas.tex 是 1024×1024 的 8×8 图集。原控制器以
    /// ((index & 7) / 8, (index >> 3) / 8) 设置 UV，每格恰为 128×128。
    public static func challengeIcon(_ index: Int32, bundle: Bundle = .main) -> UIImage? {
        guard (0..<64).contains(index),
              let atlas = image("challengeAtlas", bundle: bundle),
              let source = atlas.cgImage,
              source.width == 1024, source.height == 1024 else { return nil }
        let cell = 128
        let rectangle = CGRect(x: Int(index & 7) * cell,
                               y: Int(index >> 3) * cell,
                               width: cell, height: cell)
        guard let crop = source.cropping(to: rectangle) else { return nil }
        return UIImage(cgImage: crop, scale: atlas.scale, orientation: atlas.imageOrientation)
    }
}

/// 素材视图：有图用图，无图用色块（版面结构保持不变）。
public struct ArtworkImage: View {
    public let key: String
    public let fallback: Color
    public let contentMode: ContentMode

    public init(
        key: String,
        fallback: Color = UIPalette.placeholder,
        contentMode: ContentMode = .fill
    ) {
        self.key = key
        self.fallback = fallback
        self.contentMode = contentMode
    }

    public var body: some View {
        Group {
            if let image = UIArtwork.image(key) {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: contentMode)
            } else {
                fallback
            }
        }
    }
}

// MARK: - 按钮

/// 胶囊主按钮。原版按钮贴图未知 → 纯色块 + 文字实现。
/// [待验证] 原版按钮美术（mainscreen 上的 PLAY 等）文件名未确认；
/// 拿到后把 `.background(...)` 换成 `ArtworkImage(key:)` 即可。
public struct PillButton: View {
    public let title: String
    public let subtitle: String?
    public let prominent: Bool
    public let compact: Bool
    public let action: () -> Void

    public init(
        title: String,
        subtitle: String? = nil,
        prominent: Bool = false,
        compact: Bool = false,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.subtitle = subtitle
        self.prominent = prominent
        self.compact = compact
        self.action = action
    }

    private var cornerRadius: CGFloat { prominent ? 22 : 16 }

    public var body: some View {
        Button(action: action) {
            VStack(spacing: 2) {
                Text(title)
                    .font(.system(
                        size: prominent ? 30 : (compact ? 15 : 20),
                        weight: .heavy,
                        design: .rounded
                    ))
                if let subtitle {
                    Text(subtitle)
                        .font(.system(size: 11, weight: .semibold, design: .rounded))
                        .opacity(0.75)
                }
            }
            .foregroundStyle(prominent ? UIPalette.ink : UIPalette.parchment)
            .frame(maxWidth: .infinity)
            .padding(.vertical, prominent ? 16 : 10)
            .padding(.horizontal, 18)
            .background(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .fill(prominent ? UIPalette.gold : UIPalette.panelFill)
                    .overlay(
                        RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                            .strokeBorder(
                                UIPalette.gold.opacity(prominent ? 0.0 : 0.85),
                                lineWidth: 2
                            )
                    )
            )
            .contentShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
        }
        .buttonStyle(.plain)
    }
}

// MARK: - 屏幕骨架

/// 全屏背景 + 可读性暗角 + 内容。
/// 背景 `.ignoresSafeArea()`（铺满），内容尊重 safe area —— 刘海屏横屏时文字不会被切。
public struct ScreenScaffold<Content: View>: View {
    public let backgroundKey: String
    public let content: Content

    public init(backgroundKey: String, @ViewBuilder content: () -> Content) {
        self.backgroundKey = backgroundKey
        self.content = content()
    }

    public var body: some View {
        ZStack {
            ArtworkImage(key: backgroundKey, fallback: UIPalette.backdrop)
                .ignoresSafeArea()
                .allowsHitTesting(false)

            // 原版美术自带压暗渐变（[待验证]），这里补一层保证任意背景上文字可读。
            LinearGradient(
                colors: [
                    Color.black.opacity(0.42),
                    Color.black.opacity(0.08),
                    Color.black.opacity(0.50)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            .allowsHitTesting(false)

            content
        }
    }
}
