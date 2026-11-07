import SwiftUI
import OSLog
import FNPBRender
import FNPBUI

@MainActor
struct ChallengeMapTextureOverlay: View {
    let metalContext: MetalContext
    let adapter: ChallengeMapQuadAdapter
    let components: [ChallengeMapLayoutComponent]

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
            quads = try adapter.makeQuads(
                components: components, viewportSize: viewportSize)
        } catch {
            quads = []
            textQuads = []
            errorMessage = error.localizedDescription
            logger.error("地图组件适配失败：\(error.localizedDescription, privacy: .public)")
            return
        }

        // 文字：11 条本地化文案来自 T-077 产出的 challengeMapStrings.json。
        // 注意：这里每次组件更新都会重排一次，真机上应先做缓存 [待优化]。
        if let renderer = textRenderer ?? ChallengeMapTextRenderer(device: metalContext.device) {
            textRenderer = renderer
            do {
                let strings = try renderer.loadStrings()
                textQuads = try renderer.makeTextQuads(
                    components: components, strings: strings, viewportSize: viewportSize)
            } catch {
                textQuads = []
                logger.error("地图文字渲染失败：\(error.localizedDescription, privacy: .public)")
            }
        }
        errorMessage = nil
    }
}
