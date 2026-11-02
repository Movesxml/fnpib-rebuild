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
                        metalContext: metalContext, quads: quads,
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
            errorMessage = nil
        } catch {
            quads = []
            errorMessage = error.localizedDescription
            logger.error("地图组件适配失败：\(error.localizedDescription, privacy: .public)")
        }
    }
}
