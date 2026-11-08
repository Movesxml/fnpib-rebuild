import SwiftUI
import OSLog
import FNPBCore
import FNPBRender
import FNPBUI

@MainActor
struct ChallengeMapTextureOverlay: View {
    let metalContext: MetalContext
    let adapter: ChallengeMapQuadAdapter
    let components: [ChallengeMapLayoutComponent]
    /// inGameChallengeBackground 的投影；先于地图提交，因此位于其下层。
    let backgroundComponents: [ChallengeMapLayoutComponent]

    @State private var quads: [OrderedTextureQuad] = []
    @State private var textQuads: [TextQuad] = []
    @State private var textRenderer: ChallengeMapTextRenderer?
    @State private var errorMessage: String?
    private let logger = Logger(
        subsystem: "com.example.fnpib", category: "ChallengeMapTextureOverlay")

    var body: some View {
        GeometryReader { proxy in
            Group {
                if let errorMessage {
                    Text(errorMessage)
                        .font(.footnote)
                        .foregroundStyle(.red)
                        .multilineTextAlignment(.center)
                        .frame(width: proxy.size.width, height: proxy.size.height)
                } else {
                    OrderedQuadMetalView(
                        metalContext: metalContext, quads: quads, textQuads: textQuads,
                        onError: { message in
                            logger.error("地图 Metal 错误：\(message, privacy: .public)")
                            errorMessage = message
                        })
                    .frame(width: proxy.size.width, height: proxy.size.height)
                }
            }
            .onAppear { updateQuads(viewportSize: proxy.size) }
            .onChange(of: proxy.size) { _, newSize in
                updateQuads(viewportSize: newSize)
            }
            .onChange(of: components) { _, _ in
                updateQuads(viewportSize: proxy.size)
            }
        }
        .allowsHitTesting(false)
    }

    private func updateQuads(viewportSize: CGSize) {
        do {
            // 背景屏先提交，地图后提交 —— 绘制顺序即层级。
            let background = try adapter.makeQuads(
                components: backgroundComponents, viewportSize: viewportSize)
            let map = try adapter.makeQuads(
                components: components, viewportSize: viewportSize)
            quads = background + map
        } catch {
            quads = []
            textQuads = []
            errorMessage = error.localizedDescription
            logger.error("地图组件适配失败：\(error.localizedDescription, privacy: .public)")
            return
        }

        // 文字：11 条本地化文案来自 T-077 产出的 challengeMapStrings.json。
        // 注意：这里每次组件更新都会重排一次，真机上应先做缓存 [待优化]。
        let renderer: ChallengeMapTextRenderer
        if let existing = textRenderer {
            renderer = existing
        } else {
            renderer = ChallengeMapTextRenderer(device: metalContext.device)
            textRenderer = renderer
        }
        do {
            // 地图屏 11 条 + 背景屏（Lives 等）；背景先提交，与四边形层级一致。
            var screens: [(components: [ChallengeMapLayoutComponent],
                           strings: ChallengeMapStrings)] = []
            if !backgroundComponents.isEmpty,
               let backgroundStrings = try? renderer.loadStrings(named: "challengeBackgroundStrings") {
                screens.append((backgroundComponents, backgroundStrings))
            }
            let mapStrings = try renderer.loadStrings()
            screens.append((components, mapStrings))
            textQuads = try renderer.makeTextQuads(screens: screens, viewportSize: viewportSize)
        } catch {
            textQuads = []
            logger.error("地图文字渲染失败：\(error.localizedDescription, privacy: .public)")
        }
        errorMessage = nil
    }
}
