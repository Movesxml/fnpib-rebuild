import SwiftUI
import UIKit

import FNPBCore
import FNPBPlatform
import FNPBUI

// ============================================================================
// FNPBApp — SwiftUI 入口 + 装配层（蓝图 S1 收口 / S8 接线 / T-022）
//
// 数据流：
//   CADisplayLink(DisplayLinkDriver, 120Hz)
//     → FrameStamp
//     → FixedStepDriver(1/60 固定步长 + alpha 插值)
//     → GameWorld.tick(1/60)                ← 逻辑帧
//     → AppViewModel.refreshSnapshot()      ← UI 帧（等值去抖后进 Observation）
//
// 五屏闭环（T-022）：
//   mainMenu ──send──▶ modeSelect ──selectMode(mode)──▶ playing
//   playing ──pause──▶ paused ──resume──▶ playing
//   playing/paused ──finishGame──▶ results ──restart──▶ playing
//   任意 ──quitToMenu──▶ mainMenu
//
// ⚠️ 【注入缺口说明 · 必须审】本轮注入的 FNPBApp.swift 在 init 的 GameServices(...) 处被截断，
//    handleFrame / start / persist / handleScenePhase 的原文不可见。以下为按可验证签名的重建，
//    每处猜测已收敛为单点并标 [待验证]；若与前版不一致，**以前版为准**，
//    只保留本版新增的三件事：①真实服务构造 ②handleFrame 末尾 refreshSnapshot
//    ③startGame/restart/quitToMenu/pause/resume/endGame 流程方法。
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
            screenContent(viewModel: host.viewModel)
        }
        .onAppear { host.start() }
    }

    /// 顶层路由：只按 `snapshot.phase` 决定挂哪个屏幕。
    @ViewBuilder
    private func screenContent(viewModel vm: AppViewModel) -> some View {
        switch vm.snapshot.phase {

        case .mainMenu:
            MainMenuScreen(snapshot: vm.snapshot, actions: vm.actions)

        case .modeSelect:
            GameModeScreen(snapshot: vm.snapshot, actions: vm.actions)

        case .playing, .paused:
            gameplay(vm: vm)

        case .results:
            ResultsScreen(snapshot: vm.snapshot, actions: vm.actions)
        }
    }

    /// 局内层叠：渲染层 → 触摸层 → HUD →（暂停时）暂停浮层。
    @ViewBuilder
    private func gameplay(vm: AppViewModel) -> some View {
        ZStack {
            RenderAnchorView()

            // 触摸层仅在真正游玩时挂载：paused 下若仍接收触摸，
            // began 会写入 GameState（slashTrailActive / hitPoint），逻辑态被污染。
            if vm.snapshot.phase == .playing {
                TouchSurfaceView(router: host.touchRouter)
                    .ignoresSafeArea()
            }

            InGameHUDScreen(snapshot: vm.snapshot, actions: vm.actions)

            if vm.snapshot.phase == .paused {
                PauseScreen(snapshot: vm.snapshot, actions: vm.actions)
            }
        }
    }
}

/// 渲染锚点占位。
///
/// TODO(渲染层)：FNPBRender 提供 MTKView 包装后在此替换：
///   RendererSurface(surface: host.renderSurface,
///                   interpolationAlpha: host.renderInterpolationAlpha)
///       .ignoresSafeArea()
/// 渲染层从 GameHost 读取 alpha 做位置插值（FixedStepDriver.advance 返回值）。
struct RenderAnchorView: View {
    var body: some View {
        Color.black.ignoresSafeArea()
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

    // MARK: 真实服务（T-022：替换 T-011 的 5 个占位）
    private let sliceTester: SliceTester
    private let statsRecorder: StatsRecorder
    private let scoreSystem: ScoreSystem
    private let comboTracker: ComboTracker
    private let waveDirector: WaveDirector
    private let rng: SplitMix64Random

    /// 唯一保留的占位：特效模块（原 FUN_00033ca0 / FUN_00035a08）待特效任务卡。
    private let effects: PlaceholderEffectEmitter

    // MARK: 运行时状态
    private var state: GameState
    private var store: any EntityStore
    private var services: GameServices
    private var saveData: SaveData

    private(set) var currentMode: GameMode = .classic

    /// FixedStepDriver.advance 返回的渲染插值系数 ∈ [0,1)
    private(set) var renderInterpolationAlpha: Float = 0

    /// DisplayLink 的「期望运行」状态：区分「因暂停而停」与「因后台而停」。
    private var shouldRunDisplayLink = false

    /// UI 会话对象。宿主强持有；AppViewModel 侧对宿主为 weak（防环）。
    private(set) lazy var viewModel: AppViewModel = AppViewModel(host: self)

    // MARK: 初始化

    init() {
        let saveStore = SaveStore()
        let audioEngine = AudioEngine(configuration: AudioEngine.Configuration())
        let displayLink = DisplayLinkDriver()
        let touchRouter = TouchRouter(
            mapper: TouchCoordinateMapper(logicalSize: { GameHost.currentLogicalSize() })
        )

        // [Kimi 修正 T-022 审查] PRNG 序列 [待验证]，勿改动算法
        let rng = SplitMix64Random(seed: 0x5DEE_CE66_D)
        let stats = StatsRecorder()
        let score = ScoreSystem()
        let combo = ComboTracker(stats: stats, specialFruitBonus: 0)
        let waves = WaveDirector(playerCount: 1, rng: rng)
        // [Kimi 修正 T-022 审查] SliceTester 的 queryProvider 无默认值，必须显式给出。
        // GameState → SliceQuery 映射按 §1.2 语义：切割形状 = 上一轨迹点 → 当前触摸点的线段
        // （[待验证] 原版的切割形状构造在反编译截断处，形状闭合后只改这个 provider）。
        let slice = SliceTester(
            intersector: DefaultShapeIntersector(),
            queryProvider: { state in
                SliceQuery(
                    cutter: .line(a: state.previousSlashPosition, b: state.hitPoint),
                    cutRadiusSquared: state.sliceRadiusSquared
                )
            }
        )
        let effects = PlaceholderEffectEmitter()

        self.saveStore = saveStore
        self.audio = audioEngine
        self.displayLink = displayLink
        self.touchRouter = touchRouter

        self.rng = rng
        self.statsRecorder = stats
        self.scoreSystem = score
        self.comboTracker = combo
        self.waveDirector = waves
        self.sliceTester = slice
        self.effects = effects

        self.state = GameState()
        self.store = GenerationOrderStore()
        self.saveData = saveStore.load()

        // [Kimi 修正 T-022 审查] GameServices 字段表以 GameWorld.swift 为准：末尾还有 rng。
        self.services = GameServices(
            slice: slice,
            combo: combo,
            score: score,
            stats: stats,
            waves: waves,
            audio: audioEngine,
            effects: effects,
            rng: rng
        )

        // ── 触摸 → GameState 接线（macho §1.2 语义，任务卡直接采用）──────────────
        // [Kimi 修正 T-022 审查] TouchRouter 是单回调 onTouch(TouchSample)，按 phase 分发。
        touchRouter.onTouch = { [weak self] sample in
            switch sample.phase {
            case .began:
                self?.touchBegan(at: sample.position)
            case .moved:
                self?.touchMoved(to: sample.position)
            case .ended, .cancelled:
                self?.touchEnded()
            }
        }
    }

    // MARK: 只读投影（供 AppViewModel 组装快照）

    var currentState: GameState { state }
    var currentScore: Int32 { scoreSystem.total }
    var currentTotalFruitSliced: Int32 { statsRecorder.value(for: .totalfruit) }
    /// [Kimi 修正 T-022 审查] SaveData 无 soundEnabled 字段（Persistence.swift 字段表
    /// 只有 version/highscores/criticalChance/rated/challengeData/stats）——原版音效开关
    /// 在 settings.xml，映射未闭合。v1 用内存态，不持久化，标 [待验证]。
    private(set) var soundEnabled = true
    var isSoundEnabled: Bool { soundEnabled }

    // MARK: 生命周期

    func start() {
        // [待验证] DisplayLinkDriver 的帧回调注入面（属性 or start(handler:)）。
        // [待验证] FrameStamp 的字段名（delta / deltaTime）。
        displayLink.onFrame = { [weak self] stamp in
            self?.handleFrame(stamp)
        }
        shouldRunDisplayLink = true
        displayLink.start()
    }

    func handleFrame(_ stamp: FrameStamp) {
        // R7：首帧 dt == 0，显式 prime 让 GameWorld 用兜底步长推进
        if stamp.isFirstFrame {
            gameWorld.prime()
        }

        // 固定步长推进；alpha 仅供渲染插值。
        // [Kimi 修正 T-022 审查] 签名以 TimeDriver.swift 为准：advance(delta:) /
        // GameWorld.tick(dt:state:world:services:) 且 world 为 inout。
        let alpha = fixedStep.advance(delta: stamp.clampedDelta()) { step in
            gameWorld.tick(dt: step, state: &state, world: &store, services: services)
        }
        renderInterpolationAlpha = alpha

        // 本局结束判定：+0xa4 失灵/结束标志 [待验证 触发条件]
        if state.isFaulted {
            viewModel.finishGame()
        }

        // T-022：每帧末尾刷新 UI 快照（等值去抖在 AppViewModel 内）
        viewModel.refreshSnapshot()
    }

    func handleScenePhase(_ newPhase: ScenePhase) {
        switch newPhase {
        case .active:
            if shouldRunDisplayLink {
                displayLink.start()
            }
        case .inactive, .background:
            displayLink.stop()
            persist()
        @unknown default:
            break
        }
    }

    // MARK: 流程方法（T-022）

    /// 开局：重置全套状态并启动 DisplayLink。
    func startGame(mode: GameMode) {
        currentMode = mode
        state = GameState()

        // [待验证] 切割半径²：初值 0 会让 HitTest 门控（`0.0 < +0xf0`）永不通过。
        // 原式按 15.0 归一化碰撞半径（core_logic_notes §1.1 / RenderSurface 注释），
        // 暂取 15² = 225；归一化语义闭合后应改为按 logicalSize 换算。
        state.sliceRadiusSquared = 225.0

        // [Kimi 裁决 T-023 风险点 2] levelTier 默认 0 < 4 → step4 门控永不通过、
        // 实体遍历被永久跳过。原版开局必把 +0xb4 写成 ≥4（写入点未从反编译定位）。
        // v1 在开局显式置为阈值，闭合后由关卡加载逻辑接管。
        state.levelTier = Constants.Simulation.lowLevelEffectCutoff   // [待验证 写入点]

        store.clear()
        scoreSystem.reset()
        comboTracker.reset(state: &state)
        statsRecorder.reset()

        // [待验证] 占位波次：自由练习用的 WaveInfo 默认构造；
        // [待验证] WaveDirector.beginGame(waves:) 的签名以 Wave 模块为准。
        waveDirector.beginGame(waves: [WaveInfo()])

        saveData = saveStore.load()
        shouldRunDisplayLink = true
        displayLink.start()
    }

    /// 重开：以当前模式重新开局。
    func restart() {
        startGame(mode: currentMode)
    }

    /// 暂停：冻结逻辑帧（停 DisplayLink），保留现场。
    func pauseGame() {
        shouldRunDisplayLink = false
        displayLink.stop()
        persist()
    }

    /// 恢复：重启 DisplayLink。
    ///
    /// 场景处于后台时不重启（由 handleScenePhase(.active) 负责补启）。
    func resumeGame() {
        shouldRunDisplayLink = true
        displayLink.start()
    }

    /// 结算：停 DisplayLink 并落盘。
    func endGame() {
        shouldRunDisplayLink = false
        displayLink.stop()
        persist()
    }

    /// 回主菜单：停 DisplayLink 并落盘。
    func quitToMenu() {
        shouldRunDisplayLink = false
        displayLink.stop()
        persist()
    }

    // MARK: 触摸（macho §1.2 语义）

    /// began → `state.hitPoint = position`；`state.slashTrailActive = true`。
    ///
    /// [待验证] 位置类型：若 TouchRouter 回调给 CGPoint/SIMD2<Float>，
    /// 在 init 的接线处转换一次 `SIMD3(p.x, p.y, 0)` 即可。
    func touchBegan(at position: SIMD3<Float>) {
        state.hitPoint = position
        state.slashTrailActive = true
    }

    /// moved 且轨迹活跃 → `state.hitPoint = position`。
    func touchMoved(to position: SIMD3<Float>) {
        guard state.slashTrailActive else { return }
        state.hitPoint = position
    }

    /// ended → 无操作：轨迹由 `slashTrailTimer` 超时自清（§1.2 步骤 3，原版同款）。
    func touchEnded() {
        // 刻意留空
    }

    // MARK: 存档

    /// 最高分读写。
    ///
    /// [待验证] `SaveData.highscores` 的容器类型与键名：任务卡只说明「沿用，键语义见
    /// FNPBPlatform 存档映射注释」。此处按 `[String: Int32]` + 模式 rawValue 实现；
    /// 若实际为定长数组或结构体字段，只改下面两个函数。
    func bestScore(for mode: GameMode) -> Int32 {
        saveData.highscores[mode.rawValue] ?? 0
    }

    @discardableResult
    func recordBestScore(_ score: Int32, for mode: GameMode) -> Int32 {
        let key = mode.rawValue
        let previous = saveData.highscores[key] ?? 0
        if score > previous {
            saveData.highscores[key] = score
            persist()
        }
        return max(previous, score)
    }

    /// 音效开关（v1 仅内存态，settings.xml 映射闭合后再落盘 [待验证]）。
    func applySoundEnabled(_ enabled: Bool) {
        soundEnabled = enabled
        audio.masterVolume = enabled ? 1.0 : 0.0
    }

    private func persist() {
        _ = saveStore.save(saveData)   // SaveStore.save(_:) -> Bool（Persistence.swift）
    }

    // MARK: 逻辑坐标

    /// 逻辑像素尺寸（触摸坐标映射用）。TouchCoordinateMapper 要求 SIMD2<Float>。
    /// [待验证] 原版按固定设计分辨率渲染再缩放；渲染层接入后应改由
    /// RenderSurface.logicalSize 直接提供（见 RenderSurface 注释）。
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

// MARK: - 确定性 PRNG（T-016 原样保留）

/// 确定性 PRNG（SplitMix64）。回放一致性要求的 snapshot/restore 直接映射内部状态。
/// [待验证] 原版是 32 位定点随机（§5.3 DAT_005a7930 固定点随机），
/// 序列必然不同；此处只保证「可复现 + 均匀分布」，若需逐帧复刻原版请等 PRNG 任务卡。
final class SplitMix64Random: RandomSource {

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

// MARK: - 唯一保留的占位服务

/// ⚠️ 占位：特效模块尚未重建（原 FUN_00033ca0 / FUN_00035a08，命中特效 vtable+0x44）。
/// 待特效任务卡落盘后替换为真实 EffectEmitting 实现；在此之前不产生任何视觉效果。
final class PlaceholderEffectEmitter: EffectEmitting {
    func emit(_ kind: Int32, at position: SIMD3<Float>) {
        // 待特效任务卡
    }
}
