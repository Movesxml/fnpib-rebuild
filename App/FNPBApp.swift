import SwiftUI
import UIKit
import FNPBCore
import FNPBPlatform

// ============================================================================
// FNPBApp — SwiftUI App 入口 + 装配层（蓝图 S1 / T-016）
//
// 数据流：
//   CADisplayLink(DisplayLinkDriver, 120Hz)
//     → FrameStamp(delta)
//     → FixedStepDriver(1/60 固定步长 + alpha 插值)
//     → GameWorld.tick(dt: 1/60, ...)         ← 验收目标
//
// ⚠️ 装配点标注（Kimi 审查请优先核对，见文件末尾 TODO 清单）：
//   [待验证-A] GameState 的初始化器 —— GameState.swift 不在共享上下文中
//   [待验证-B] EntityStore 协议的具体实现类型名 —— ECS/EntityStore.swift 同上
//   [待验证-C] SliceTesting/ComboTracking/ScoreDispatching/WaveDirecting 的真实实现
//              （T-012~T-014 已落盘，但构造签名不可见，此处暂用占位脚手架）
//   GameWorld 的十步目前全部是 [待实现] 桩，占位实现不会被调用，故行为无差别。
// ============================================================================

@main
@MainActor
struct FNPBApp: App {

    @StateObject private var host = GameHost()

    @Environment(\.scenePhase) private var scenePhase

    var body: some Scene {
        WindowGroup {
            ContentView(host: host)
                .statusBarHidden(true)
                .persistentSystemOverlays(.hidden)
                .onChange(of: scenePhase) { _, newPhase in
                    host.handleScenePhase(newPhase)
                }
        }
    }
}

// MARK: - 视图

struct ContentView: View {

    @ObservedObject var host: GameHost

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            // ── TODO(渲染层)：Metal 渲染接入点 ────────────────────────────────
            // FNPBRender 提供 MTKView 包装（SpriteBatch 自研批次渲染）后在此替换：
            //   RendererSurface(renderer: host.renderer,
            //                   interpolationAlpha: host.renderInterpolationAlpha)
            //       .ignoresSafeArea()
            // 渲染层从 GameHost 读取 alpha 做位置插值（FixedStepDriver.advance 返回值）。
            // ─────────────────────────────────────────────────────────────────

            TouchSurfaceView(router: host.touchRouter)
                .ignoresSafeArea()
        }
        .onAppear { host.start() }
    }
}

/// TouchRouting.captureView 的 SwiftUI 包装
struct TouchSurfaceView: UIViewRepresentable {

    let router: TouchRouter

    func makeUIView(context: Context) -> UIView {
        router.captureView
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        // 触摸层无状态更新需求
    }
}

// MARK: - 装配宿主

@MainActor
final class GameHost: ObservableObject {

    // MARK: 平台服务
    let displayLink: DisplayLinkDriver
    let touchRouter: TouchRouter
    let audio: AudioEngine
    let saveStore: SaveStore

    // MARK: 核心
    private let gameWorld = GameWorld()
    private let fixedStep = FixedStepDriver(step: 1.0 / 60.0, maxSubsteps: 4)

    private var state: GameState
    private var store: any EntityStore
    private var services: GameServices
    private var saveData: SaveData

    /// FixedStepDriver.advance 返回的渲染插值系数 ∈ [0,1)
    private(set) var renderInterpolationAlpha: Float = 0

    // MARK: 初始化

    init() {
        let saveStore = SaveStore()
        let audioEngine = AudioEngine(configuration: AudioEngine.Configuration())
        let displayLink = DisplayLinkDriver()
        let touchRouter = TouchRouter(
            mapper: TouchCoordinateMapper(logicalSize: { GameHost.currentLogicalSize() })
        )

        self.saveStore = saveStore
        self.audio = audioEngine
        self.displayLink = displayLink
        self.touchRouter = touchRouter

        // [待验证-A] GameState 默认构造
        self.state = GameState()
        // [验证-B] EntityStore 具体实现 = GenerationOrderStore（ECS/EntityStore.swift）
        self.store = GenerationOrderStore()

        // [待验证-C] 以下 4 个占位实现待 Core 服务落盘后替换（见文件末尾脚手架）
        self.services = GameServices(
            slice: PlaceholderSliceTester(),
            combo: PlaceholderComboTracker(),
            score: PlaceholderScoreSystem(),
            stats: PlaceholderStatsRecorder(),
            waves: PlaceholderWaveDirector(),
            audio: audioEngine,
            effects: PlaceholderEffectEmitter(),
            rng: SplitMix64Random(seed: 0x5DEE_CE66_D)
        )

        self.saveData = saveStore.load()

        // 接线：CADisplayLink → FrameStamp → FixedStepDriver → GameWorld.tick
        displayLink.onFrame = { [weak self] stamp in
            self?.handleFrame(stamp)
        }
        touchRouter.onTouch = { [weak self] sample in
            self?.handleTouch(sample)
        }
        displayLink.setPreferredFrameRate(DisplayLinkDriver.maximumFrameRate)

        // 恢复最高分等持久化状态
        applySaveDataToServices()
    }

    // MARK: 生命周期

    func start() {
        displayLink.setPreferredFrameRate(DisplayLinkDriver.maximumFrameRate)
        displayLink.start()
    }

    func handleScenePhase(_ phase: ScenePhase) {
        switch phase {
        case .active:
            displayLink.resetTimeBase()     // 后台停留时长不得计入 dt
            displayLink.start()
        case .inactive, .background:
            displayLink.stop()
            persist()
        @unknown default:
            break
        }
    }

    // MARK: 驱动链（验收核心）

    private func handleFrame(_ stamp: FrameStamp) {
        // R7：首帧 dt == 0，显式 prime 让 GameWorld 用兜底步长推进
        if stamp.isFirstFrame {
            gameWorld.prime()
        }

        let alpha = fixedStep.advance(delta: stamp.clampedDelta()) { step in
            gameWorld.tick(dt: step, state: &state, world: &store, services: services)
        }
        renderInterpolationAlpha = alpha
    }

    // MARK: 输入

    private func handleTouch(_ sample: TouchSample) {
        // ── TODO(T-016 装配)：触点写入 GameState ────────────────────────────
        // 原版语义（macho §1.2）：
        //   game+0x10/+0x14/+0x18 = 触摸点（命中特效位置也用这组，见 §1.2 步骤 6.3.3）
        //   game+0xa5            = slash 轨迹激活标志（began 置 1，ended 由轨迹超时清）
        //   game+0x17c           = 轨迹持续计时（由 GameWorld 步骤 3 推进）
        //
        // GameState.swift 的属性名不在共享上下文中，此处**不臆造**字段名；
        // 该文件可见后用 `state.<touchPosition>` / `state.<slashActive>` 接线即可。
        _ = sample
    }

    // MARK: 存档

    private func applySaveDataToServices() {
        // TODO(T-017)：把 saveData.highscores / stats 灌入 ScoreSystem / StatsRecorder
        // 真实实现落盘后在此接线；占位实现无状态，暂无动作。
    }

    func persist() {
        saveStore.save(saveData)
    }
}

extension GameHost {

    /// [待验证] 逻辑分辨率来源。
    /// 原版按固定设计分辨率渲染再缩放；现代实现应取 windowScene 的像素尺寸并
    /// 交给渲染层做 Safe Area 适配。此处给「物理像素」作为世界坐标可见范围，
    /// 与 TouchCoordinateMapper.worldUnitsPerLogicalUnit 联手控制手感。
    static func currentLogicalSize() -> SIMD2<Float> {
        let scenes = UIApplication.shared.connectedScenes.compactMap { $0 as? UIWindowScene }
        let scene = scenes.first { $0.activationState == .foregroundActive } ?? scenes.first
        guard let screen = scene?.screen else {
            return SIMD2<Float>(1024, 768)          // 兜底（不应命中）
        }
        let bounds = screen.bounds
        return SIMD2<Float>(Float(bounds.width * screen.scale),
                            Float(bounds.height * screen.scale))
    }
}

// ============================================================================
// MARK: - 装配脚手架（临时实现）
//
// 这些类型只是为了「App 能编译并驱动 GameWorld.tick」的最小实现，**不是**玩法逻辑。
// T-012~T-014 的真实实现（SliceTester / ComboTracker / ScoreSystem / WaveDirector，
// 以及统计与特效实现）落盘后，在 GameHost.init 中替换，并删除本区块。
// 由于 GameWorld 十步当前均为 [待实现] 桩，替换前后行为一致。
// ============================================================================

private final class PlaceholderSliceTester: SliceTesting {
    func isSliced(game: GameState, entity: Entity) -> Bool { false }
    func isNearMiss(game: GameState, entity: Entity) -> Bool { false }
}

private final class PlaceholderComboTracker: ComboTracking {
    func registerSlice(fruitType: Int32, entity: EntityID,
                       state: inout GameState, rng: any RandomSource) -> ComboEvent? { nil }
    func tickWindow(dt: Float, state: inout GameState) -> [ComboEvent] { [] }
    func reset(state: inout GameState) {}
}

private final class PlaceholderScoreSystem: ScoreDispatching {
    private(set) var total: Int32 = 0
    @discardableResult
    func dispatch(score: Int32, comboType: Int32, isScoring: Bool, mode: Int32) -> Int32 {
        total = Int32(clamping: Int64(total) + Int64(score))
        return total
    }
    func reset() { total = 0 }
}

/// 可用的统计容器（签名完整，无需占位语义）
private final class PlaceholderStatsRecorder: StatsRecording {
    private(set) var values: [String: Int32] = [:]
    func add(_ key: StatsKey, _ value: Int32) {
        values[key.rawValue, default: 0] += value
    }
    func report(_ dynamicKey: String, _ value: Int32) {
        values[dynamicKey, default: 0] += value
    }
}

private final class PlaceholderWaveDirector: WaveDirecting {
    func tick(dt: Float, state: inout GameState, world: any EntityStore) {}
}

private final class PlaceholderEffectEmitter: EffectEmitting {
    func emit(_ kind: Int32, at position: SIMD3<Float>) {}
}

/// 确定性 PRNG（SplitMix64）。回放一致性要求的 snapshot/restore 直接映射内部状态。
/// [待验证] 原版是 32 位定点随机（§5.3 DAT_005a7930 固定点随机），
/// 序列必然不同；此处只保证「可复现 + 均匀分布」，若需逐帧复刻原版请等 PRNG 任务卡。
private final class SplitMix64Random: RandomSource {

    private var state: UInt64

    init(seed: UInt64) {
        self.state = seed == 0 ? 0x9E37_79B9_7F4A_7C15 : seed
    }

    func nextFloat() -> Float {
        // 取高 24 位 → [0, 1)
        Float(next() >> 40) * (1.0 / 16_777_216.0)
    }

    func nextInt(_ upperBound: Int32) -> Int32 {
        guard upperBound > 0 else { return 0 }
        return Int32((next() >> 33) % UInt64(upperBound))
    }

    func snapshot() -> UInt64 { state }

    func restore(_ s: UInt64) { state = s == 0 ? 0x9E37_79B9_7F4A_7C15 : s }

    private func next() -> UInt64 {
        state &+= 0x9E37_79B9_7F4A_7C15
        var z = state
        z = (z ^ (z >> 30)) &* 0xBF58_476D_1CE4_E5B9
        z = (z ^ (z >> 27)) &* 0x94D0_49BB_1331_11EB
        return z ^ (z >> 31)
    }
}