//
//  GameRenderer.swift
//  App
//
//  T-024 接入渲染；T-032 将水果/炸弹切换为真实 3D 网格。
//
//  数据流（全部主线程）：
//    MetalCanvasView.draw(in:)                ← MTKView 内部 CADisplayLink，120Hz
//      → GameRenderer.drawFrame()
//      → surface.beginFrame()
//      → 读 GameHost.currentState / currentEntities（渲染直读，本卡不做插值）
//      → 每个实体的全部已验证子网格提交 MeshBatch
//      → 刀光提交 SpriteBatch；endFrame 内先画 3D，再画 2D
//      → surface.endFrame()                   ← defer 保证配对
//
//  【坐标系】两套约定不一致，本文件只做一次变换（screenPoint(_:logicalSize:)）：
//    世界坐标  = 原点屏幕中心、X 右 Y 上（TouchRouter 注释）
//    SpriteInstance = 逻辑点坐标、左上原点、y 向下（SpriteBatch 注释）
//    ⇒ screenX = W/2 + world.x；screenY = H/2 − world.y
//
//  【[待验证] 集中清单】见文件末尾注释块。
//

import Foundation
import Metal
import SwiftUI
import UIKit
import simd
import os.log

import FNPBCore
import FNPBRender

@MainActor
final class GameRenderer {

    // MARK: - 依赖

    let metalContext: MetalContext
    let surface: MetalRenderSurface
    let textureLoader: TextureLoader

    /// 渲染数据源。**weak**：GameHost 强持有本对象（`GameHost.renderDriver`），
    /// 本对象反向弱引用宿主，避免保留环。
    weak var host: GameHost?

    // MARK: - 真实网格与刀光贴图

    private var meshLibrary: MeshLibrary?
    private var meshLoadAttempted = false
    private static let meshLogger = Logger(subsystem: "com.example.fnpib", category: "FruitMesh")

    /// 只供刀光使用；水果/炸弹没有贴图时不得退回纯色或整图集 sprite。
    private var solidTexture: TextureHandle?

    // MARK: - 刀光占位常量（全部 [待验证]）

    /// 刀光段宽度 / 画面短边。[待验证]
    private static let trailWidthRatio: Float = 0.02

    /// 刀光着色（additive 混合）。[待验证] 原版刀光颜色在特效模块内，未提取。
    private static let trailTint = SIMD4<Float>(0.85, 0.92, 1.0, 1.0)

    // MARK: - 初始化

    init(metalContext: MetalContext) {
        self.metalContext = metalContext
        self.surface = MetalRenderSurface(context: metalContext)
        self.textureLoader = TextureLoader(device: metalContext.device)
        self.solidTexture = Self.makeSolidTexture(device: metalContext.device)
    }

    // MARK: - 视图桥接（复用 FNPBRender，不另写 UIViewRepresentable）

    /// 复用 `MetalViewRepresentable`。
    ///
    /// `MetalViewRepresentable.bind(_:)` 内部已做三件事：
    ///   ① `view.onDraw = onDraw`（帧入口）
    ///   ② `view.onDrawableSizeChange` → `surface.configure(SurfaceRequest(...))`
    ///   ③ `surface.attach(view)`
    /// 因此本文件**不再调用 configure**（任务卡第 4 条「桥接内部已处理则复用」）。
    var canvasView: MetalViewRepresentable {
        MetalViewRepresentable(
            metalContext: metalContext,
            surface: surface,
            onDraw: { [weak self] _ in
                self?.drawFrame()
            },
            onResize: { _, _ in
                // configure 已由 MetalViewRepresentable 内部完成，此处无额外动作。
            }
        )
    }

    /// 渲染层逻辑尺寸（点）。TouchCoordinateMapper 的 logicalSize 数据源。
    var logicalSize: SIMD2<Float> { surface.logicalSize }

    // MARK: - 帧回调

    private func drawFrame() {
        // 【硬约束】beginFrame 与 endFrame 必须严格配对：
        // MetalRenderSurface.beginFrame 在 currentCommandBuffer 非 nil 时永久返回 false，
        // 任何漏掉 endFrame 的早退都会让整条渲染链死锁。
        guard surface.beginFrame() else { return }
        defer { surface.endFrame() }

        guard let host else { return }

        let logicalSize = surface.logicalSize
        guard logicalSize.x > 0, logicalSize.y > 0 else { return }

        loadMeshesIfNeeded()

        if let meshLibrary {
            let requests = MeshSceneAdapter.drawRequests(from: host.currentEntities)
            let batches = MeshSceneAdapter.batches(from: requests, library: meshLibrary)
            for batch in batches {
                surface.submit(batch)
            }
        }

        // 刀光仍走原有 2D sprite；3D 提交不依赖刀光纹理是否可用。
        guard let texture = solidTexture else { return }
        submitSlashTrail(texture: texture,
                         trail: host.currentState.slashTrail,
                         logicalSize: logicalSize)
    }

    // MARK: - 网格资源

    private func loadMeshesIfNeeded() {
        guard !meshLoadAttempted else { return }
        meshLoadAttempted = true

        if let error = surface.meshPipelineError {
            Self.meshLogger.error("3D 管线创建失败：\(error, privacy: .public)")
        }
        guard let manifestURL = Bundle.main.url(forResource: "fruitModels", withExtension: "json"),
              let binaryURL = Bundle.main.url(forResource: "fruitMeshes", withExtension: "bin") else {
            Self.meshLogger.error("缺少 fruitModels.json 或 fruitMeshes.bin；不使用占位水果")
            return
        }

        do {
            let content = try FruitModelLoader.load(manifestURL: manifestURL, binaryURL: binaryURL)
            let provider = BundleMeshTextureProvider(bundle: .main, loader: textureLoader)
            let library = MeshLibrary(
                device: metalContext.device,
                content: content,
                textures: provider
            )
            meshLibrary = library
            for message in library.diagnostics {
                Self.meshLogger.warning("\(message, privacy: .public)")
            }
        } catch {
            Self.meshLogger.error("网格资源加载失败：\(String(describing: error), privacy: .public)")
        }
    }

    private static func makeSolidTexture(device: MTLDevice) -> TextureHandle? {
        let descriptor = MTLTextureDescriptor.texture2DDescriptor(
            pixelFormat: .rgba8Unorm,
            width: 1,
            height: 1,
            mipmapped: false
        )
        descriptor.usage = .shaderRead
        // 需要 CPU 侧 replace(region:) 写入，因此不能是 .private。
        descriptor.storageMode = .shared

        guard let texture = device.makeTexture(descriptor: descriptor) else { return nil }

        var pixel: UInt32 = 0xFFFF_FFFF   // 白，RGBA8
        withUnsafeBytes(of: &pixel) { raw in
            guard let base = raw.baseAddress else { return }
            texture.replace(
                region: MTLRegion(
                    origin: MTLOrigin(x: 0, y: 0, z: 0),
                    size: MTLSize(width: 1, height: 1, depth: 1)
                ),
                mipmapLevel: 0,
                withBytes: base,
                bytesPerRow: 4
            )
        }

        return TextureHandle(texture: texture,
                             assetID: "solid-white",
                             premultipliedAlpha: false)
    }

    // MARK: - 刀光轨迹

    private func submitSlashTrail(texture: TextureHandle,
                                  trail: SlashTrail,
                                  logicalSize: SIMD2<Float>) {
        // 环形缓冲 8 槽，未写入槽为 (0,0,0)：过滤后再按数组序连接相邻点。
        // [待验证] 槽位回绕后数组序 ≠ 时间序，可能出现一次跨环跳线（v1 接受；
        //          原版按 `DAT_005573b4` 槽位指针顺序绘制，闭合后可改为按槽位轮转遍历）。
        let raw = trail.points

        var screenPoints: [SIMD2<Float>] = []
        screenPoints.reserveCapacity(raw.count)
        for point in raw where simd_length_squared(point) > 1e-6 {
            screenPoints.append(screenPoint(point, logicalSize: logicalSize))
        }
        guard screenPoints.count >= 2 else { return }

        let width = min(logicalSize.x, logicalSize.y) * Self.trailWidthRatio
        var instances: [SpriteInstance] = []
        instances.reserveCapacity(screenPoints.count - 1)

        for index in 1..<screenPoints.count {
            let a = screenPoints[index - 1]
            let b = screenPoints[index]
            let delta = b - a
            let length = simd_length(delta)
            guard length > 1e-4 else { continue }

            // 屏幕逻辑坐标（y 向下）里 atan2 得到的就是 SpriteInstance 的正向旋转角，
            // 因为 shader 的旋转与 y 翻转同处一套「逻辑 → NDC」变换内。
            instances.append(
                SpriteInstance(
                    position: (a + b) * 0.5,
                    size: SIMD2<Float>(length, width),
                    rotation: atan2(delta.y, delta.x),
                    tint: Self.trailTint
                )
            )
        }

        guard !instances.isEmpty else { return }
        surface.submit(SpriteBatch(texture: texture, instances: instances, blend: .additive))
    }

    // MARK: - 刀光坐标

    /// 世界坐标（原点中心、y 上）→ 逻辑点坐标（左上原点、y 向下）。
    /// [待验证] 1 世界单位 == 1 逻辑点，比例仍需 Frida 闭合。
    private func screenPoint(_ world: SIMD3<Float>,
                             logicalSize: SIMD2<Float>) -> SIMD2<Float> {
        SIMD2<Float>(logicalSize.x * 0.5 + world.x,
                     logicalSize.y * 0.5 - world.y)
    }
}

@MainActor
private final class BundleMeshTextureProvider: MeshTextureProvider {
    private let bundle: Bundle
    private let loader: TextureLoader

    init(bundle: Bundle, loader: TextureLoader) {
        self.bundle = bundle
        self.loader = loader
    }

    func makeTexture(pngName: String) -> MTLTexture? {
        let name = pngName as NSString
        guard let url = bundle.url(
            forResource: name.deletingPathExtension,
            withExtension: name.pathExtension
        ) else { return nil }
        let asset = TextureAsset(
            id: "fruit-mesh-\(name.deletingPathExtension)",
            source: .url(url),
            srgb: true,
            generateMipmaps: false,
            premultipliedAlpha: false // 资产管线输出普通 RGBA PNG，未做预乘。
        )
        return try? loader.load(asset).texture
    }
}

extension Entity: MeshRenderableEntity {
    public var renderEntityType: Int32 { kind.rawValue }
    public var renderFruitTypeID: Int32 { fruit?.typeID ?? -1 }
    public var renderPosition: SIMD3<Float> { transform.position }
    public var renderEulerXYZ: SIMD3<Float> { transform.rotation }
    public var renderScale: Float { transform.scale }
    public var renderIsVisible: Bool { isVisible }
}

// ============================================================================
// [待验证] 集中清单（T-032）
//  1. 世界单位 → 逻辑点、实体 scale/100、欧拉顺序和正交深度均为视觉重建参数。
//  2. UV 原样直通；方向、原始 winding 与 binmodel MATRIX0 布局仍需真机/反编译闭合。
//  3. chest.tex 调色板未闭合，因此 super_chest 明确跳过，不使用灰度或图集兜底。
//  4. 刀光宽度/颜色、环形缓冲遍历顺序和无渲染插值仍是既有待验证项。
// ============================================================================
