//
//  GameRenderer.swift
//  App
//
//  T-024：把 FNPBRender 真正挂到 App（蓝图 S7 收口 + S8 最后一公里）。
//
//  数据流（全部主线程）：
//    MetalCanvasView.draw(in:)                ← MTKView 内部 CADisplayLink，120Hz
//      → GameRenderer.drawFrame()
//      → surface.beginFrame()
//      → 读 GameHost.currentState / currentEntities（渲染直读，本卡不做插值）
//      → surface.submit(SpriteBatch) × N
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

    // MARK: - 贴图

    /// 唯一已确证图集 `fruit_atlas.png`（T-018）。
    /// UV 子矩形映射未闭合 → v1 整图集拉伸渲染 [待验证]；加载失败保持 nil。
    private var atlas: TextureHandle?

    /// 1×1 纯白兜底纹理：图集缺失时靠 `tint` 画出可辨识方块，不崩。
    private var solidTexture: TextureHandle?

    /// 图集只尝试加载一次（失败也不每帧重试 IO）。
    private var atlasLoadAttempted = false

    // MARK: - 占位常量（全部 [待验证]）

    /// 水果占位边长 / 画面短边。
    /// [待验证] 原版按 15.0 归一化 + `FruitInfo.scale`(默认 25.0) 换算屏幕尺寸，
    /// 世界→逻辑点比例未闭合；闭合后改写为 `transform.scale / 15.0 * 基准长度`。
    private static let fruitSizeRatio: Float = 0.1

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

        loadAtlasIfNeeded()

        guard let texture = atlas ?? solidTexture else { return }

        let state = host.currentState

        submitEntities(texture: texture,
                       entities: host.currentEntities,
                       logicalSize: logicalSize)

        submitSlashTrail(texture: texture,
                         trail: state.slashTrail,
                         logicalSize: logicalSize)
    }

    // MARK: - 贴图

    private func loadAtlasIfNeeded() {
        guard !atlasLoadAttempted else { return }
        atlasLoadAttempted = true

        // [待验证] 资源定位方式：资产管线（tools/AssetPipeline）产出的 PNG 如何进入
        // bundle（ContentBundle / folder reference / 扁平资源）尚未在工程中确认。
        // 这里按「扁平资源名 fruit_atlas.png」尝试，失败则永久回落纯色。
        guard let url = Bundle.main.url(forResource: "fruit_atlas", withExtension: "png") else {
            return
        }

        let asset = TextureAsset(
            id: "fruit_atlas",
            source: .url(url),
            srgb: true,
            generateMipmaps: false,
            premultipliedAlpha: true   // [待验证] PNG 是否预乘
        )
        atlas = try? textureLoader.load(asset)
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

    // MARK: - 实体精灵

    private func submitEntities(texture: TextureHandle,
                                entities: [Entity],
                                logicalSize: SIMD2<Float>) {
        guard !entities.isEmpty else { return }

        let side = min(logicalSize.x, logicalSize.y) * Self.fruitSizeRatio
        var instances: [SpriteInstance] = []
        instances.reserveCapacity(entities.count)

        for entity in entities {
            guard entity.isVisible else { continue }
            // v1 只画玩家可见的三类实体；slash/jiblet/blast 由特效任务卡负责。
            switch entity.kind {
            case .fruit, .bomb, .coin:
                break
            default:
                continue
            }

            // [待验证] `FruitInfo.typeID` 字段名由任务卡文字给出，定义本轮未注入。
            let typeID = entity.fruit?.typeID ?? Int32(entity.kind.rawValue)

            instances.append(
                SpriteInstance(
                    position: screenPoint(entity.transform.position, logicalSize: logicalSize),
                    size: SIMD2<Float>(side, side),
                    // [待验证] 原引擎水果自转表示未闭合；此处只取欧拉角 z 分量做 2D 旋转。
                    rotation: entity.transform.rotation.z,
                    // [待验证] UV 子矩形未闭合：整图集拉伸（任务卡 v1 允许）。
                    uvOrigin: SIMD2<Float>(0, 0),
                    uvSize: SIMD2<Float>(1, 1),
                    tint: Self.tint(forTypeID: typeID)
                )
            )
        }

        guard !instances.isEmpty else { return }
        surface.submit(SpriteBatch(texture: texture, instances: instances, blend: .alpha))
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

    // MARK: - 坐标与颜色

    /// 世界坐标（原点中心、y 上）→ 逻辑点坐标（左上原点、y 向下）。
    ///
    /// [待验证] 依赖「世界单位 == 逻辑点」这一前提。若原版按固定设计分辨率归一化
    /// （`15.0` 除数的语义），此处需要乘一个 world→point 比例，比例值待 Frida 闭合。
    private func screenPoint(_ world: SIMD3<Float>,
                             logicalSize: SIMD2<Float>) -> SIMD2<Float> {
        SIMD2<Float>(logicalSize.x * 0.5 + world.x,
                     logicalSize.y * 0.5 - world.y)
    }

    /// 类型 ID → 占位色。
    /// [待验证] 真实配色在 `fruitlist.xml` 的 colour 字段（T-018 未决项）；
    /// 闭合后改为查表，本函数整体删除。
    private static func tint(forTypeID typeID: Int32) -> SIMD4<Float> {
        var h = UInt32(bitPattern: typeID) &* 2_654_435_761
        h ^= h >> 13
        h = h &* 2_246_822_519

        let r = Float((h >> 0) & 0xFF) / 255.0
        let g = Float((h >> 8) & 0xFF) / 255.0
        let b = Float((h >> 16) & 0xFF) / 255.0

        // 抬底避免接近纯黑（additive/alpha 下不可见）。
        return SIMD4<Float>(0.35 + 0.65 * r,
                            0.35 + 0.65 * g,
                            0.35 + 0.65 * b,
                            1.0)
    }
}

// ============================================================================
// [待验证] 集中清单（T-024）
//
//  1. 世界单位 → 逻辑点的比例（`screenPoint`）：假设 1:1。
//  2. 水果占位尺寸（`fruitSizeRatio = 0.1`）：原版走 15.0 归一化 + FruitInfo.scale。
//  3. 刀光段宽度（`trailWidthRatio = 0.02`）与颜色（`trailTint`）。
//  4. UV 子矩形：v1 整图集拉伸，`uvOrigin/uvSize` 为全图。
//  5. 图集资源定位：`Bundle.main.url(forResource: "fruit_atlas", withExtension: "png")`，
//     资产管线落盘方式未确认。
//  6. 贴图预乘标记（`premultipliedAlpha: true`）。
//  7. 旋转：只取 `transform.rotation.z`。
//  8. 刀光按数组序连接（环形回绕时有一次跳线）。
//  9. 无渲染插值：直接读逻辑帧 state（60Hz 逻辑 / 120Hz 渲染重复帧）。
// ============================================================================
