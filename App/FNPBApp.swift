import SwiftUI
import UIKit
import OSLog

import FNPBCore
import FNPBPlatform
import FNPBRender
import FNPBUI

// ============================================================================
// FNPBApp — SwiftUI 入口 + 装配层（蓝图 S1 收口 / S8 接线 / T-022 / T-024）
//
// 数据流：
//   CADisplayLink(DisplayLinkDriver, 120Hz)
//     → FrameStamp
//     → FixedStepDriver(1/60 固定步长 + alpha 插值)
//     → GameWorld.tick(1/60)                ← 逻辑帧
//     → AppViewModel.refreshSnapshot()      ← UI 帧（等值去抖后进 Observation）
//
//   渲染帧（独立于逻辑帧，T-024）：
//   MetalCanvasView.draw(in:) → GameRenderer.drawFrame()
//     → beginFrame → 读 currentState/currentEntities → submit → endFrame
//
// 五屏闭环（T-022）：
//   mainMenu ──send──▶ modeSelect ──selectMode(mode)──▶ playing
//   playing ──pause──▶ paused ──resume──▶ playing
//   playing/paused ──finishGame──▶ results ──restart──▶ playing
//   任意 ──quitToMenu──▶ mainMenu
//
// T-024 变更点（其余与 T-023 版一致）：
//   ① GameHost 新增 `renderDriver: GameRenderer?`（构造期创建，Metal 不可用时降级）
//   ② gameplay 的 RenderAnchorView 换为真实 Metal 视图
//   ③ TouchCoordinateMapper.logicalSize 改接渲染层 logicalSize（点，非物理像素）
//   ④ GameHost 新增只读投影 `currentEntities`（见该属性的 [待验证] 说明）
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
            // T-024：真实 Metal 渲染层。
            // `MetalContext` 创建失败（无 GPU 环境）时降级回黑屏占位，App 不崩。
            if let renderer = host.renderDriver {
                renderer.canvasView
                    .ignoresSafeArea()
            } else {
                RenderAnchorView()
            }

            // 触摸层仅在真正游玩时挂载：paused 下若仍接收触摸，
            // began 会写入 GameState 的触摸输入状态，恢复后污染切割逻辑。
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

/// 渲染降级占位。
///
/// T-024 起仅在 `GameHost.renderDriver == nil`（`MetalContext()` 返回 nil）时使用；
/// 正常路径由 `GameRenderer.canvasView`（FNPBRender.MetalViewRepresentable）接管。
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

    // MARK: 渲染（T-024）
    /// 渲染驱动。构造期创建；`MetalContext()` 为 failable，失败时为 nil
    ///（游戏逻辑照常运行，画面降级为黑屏占位）。
    let renderDriver: GameRenderer?

    // MARK: 核心
    private var gameWorld: GameWorld
    private let motionTuning: FruitMotionTuning
    /// spawnSink 是 weak，GameHost 必须强持有生成桥；内容不可用时保持 nil。
    private var waveSpawnBridge: WaveSpawnBridge?
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

    // MARK: 真实内容（T-030）
    private(set) var originalContent: OriginalContent?
    private(set) var contentLoadError: String?

    // MARK: 发售版 Classic UISF 动画
    private var classicAnimationPlayer: UIScreenAnimationPlayer?
    private(set) var classicAnimationLoadError: String?
    /// FUN_00071838_1 只有 out 完成后才隐藏；恢复时 in 立即使控件可见。
    private(set) var visibleClassicCrosses: Set<Int> = []
    private static let contentLogger = Logger(subsystem: "com.example.fnpib",
                                              category: "original-content")

    // MARK: 运行时状态
    private var state: GameState
    private var store: any EntityStore
    private var services: GameServices
    private var saveData: SaveData

    private(set) var currentMode: GameMode = .classic

    /// FixedStepDriver.advance 返回的渲染插值系数 ∈ [0,1)
    /// [待验证] T-024 渲染层暂未消费该值（直接读逻辑帧，不做插值）。
    private(set) var renderInterpolationAlpha: Float = 0

    /// DisplayLink 的「期望运行」状态：区分「因暂停而停」与「因后台而停」。
    private var shouldRunDisplayLink = false

    /// UI 会话对象。宿主强持有；AppViewModel 侧对宿主为 weak（防环）。
    private(set) lazy var viewModel: AppViewModel = AppViewModel(host: self)

    // MARK: 初始化

    init() {
        // ── T-024：渲染层最先创建，触摸映射需要读它的 logicalSize ──────────────
        let renderer: GameRenderer?
        if let metalContext = MetalContext() {
            renderer = GameRenderer(metalContext: metalContext)
        } else {
            renderer = nil
        }

        let saveStore = SaveStore()
        let audioEngine = AudioEngine(configuration: AudioEngine.Configuration())
        let displayLink = DisplayLinkDriver()
        let touchRouter = TouchRouter(
            mapper: TouchCoordinateMapper(logicalSize: {
                // T-024：改接渲染层逻辑尺寸（点）。
                // 原实现返回屏幕物理像素（bounds × scale），与 RenderSurface.logicalSize
                // 不同量纲（任务卡已知项）。
                // 触摸事件必在主线程；assumeIsolated 而非 Task { }，避免异步化破坏
                // “同步读取尺寸”的语义（AppViewModel 已有同款用法）。
                MainActor.assumeIsolated { () -> SIMD2<Float> in
                    if let size = renderer?.logicalSize, size.x > 2, size.y > 2 {
                        return size
                    }
                    // 视图首次布局完成前 logicalSize 为 (1,1)，退回物理像素兜底。
                    return GameHost.currentLogicalSize()
                }
            })
        )

        // [Kimi 修正 T-022 审查] PRNG 序列 [待验证]，勿改动算法
        let rng = SplitMix64Random(seed: 0x5DEE_CE66_D)
        let stats = StatsRecorder()
        let score = ScoreSystem()
        let combo = ComboTracker(stats: stats)
        let waves = WaveDirector(playerCount: 1, rng: rng)
        // 刀形状只读触摸输入，不读 last-hit 字段：hitPoint(+0x104) 会在每个
        // 水果命中后被改写，previousSlashPosition(+0xf8) 也只是命中时保存的旧触摸点。
        // 线段构造本身仍为 [待验证]，但状态来源已由完整 FUN_00016214 闭合。
        let slice = SliceTester(
            intersector: DefaultShapeIntersector(),
            queryProvider: { state in
                SliceQuery(
                    cutter: state.isSlashInputActive
                        ? .line(a: state.previousTouchPosition, b: state.slashPosition)
                        : nil,
                    cutDirection: state.slashPosition - state.previousTouchPosition,
                    cutRadiusSquared: state.sliceRadiusSquared
                )
            }
        )
        let effects = PlaceholderEffectEmitter()

        self.renderDriver = renderer
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
        // bridge 固定捕获此实例；重开局只能 clear()，不能替换 store。
        let entityStore = GenerationOrderStore()
        self.store = entityStore
        self.saveData = saveStore.load()

        let contentResult = OriginalContentBundle.load()
        let resolvedContent: OriginalContent?
        let resolvedError: String?
        switch contentResult {
        case .success(let loaded):
            resolvedContent = loaded
            resolvedError = nil
        case .failure(let failure):
            resolvedContent = nil
            resolvedError = failure.errorDescription ?? String(describing: failure)
        }
        self.originalContent = resolvedContent
        self.contentLoadError = resolvedError
        if let url = Bundle.main.url(forResource: "classicAnimations", withExtension: "json") {
            do {
                self.classicAnimationPlayer = try UIScreenAnimationPlayer(data: Data(contentsOf: url))
            } catch {
                self.classicAnimationLoadError = String(describing: error)
            }
        } else {
            self.classicAnimationLoadError = "Content/classicAnimations.json 未进入应用资源"
        }

        let tuning = FruitMotionTuning()
        self.motionTuning = tuning

        var onSliced = FruitOnSliced()
        var spawnBridge: WaveSpawnBridge?
        if let resolvedContent {
            let fruits = resolvedContent.fruits
            stats.configureFruitNames(Dictionary(uniqueKeysWithValues: fruits.fruits.map {
                ($0.typeID, $0.name)
            }))
            stats.configureComboBonuses(resolvedContent.comboBonuses)
            onSliced = FruitOnSliced(
                critical: fruits.critical,
                fruitTypeCount: fruits.fruits.count,
                starfruitTypeID: fruits.fruits.first(where: { $0.name == "starfruit" })?.typeID)
            let bridge = WaveSpawnBridge(store: entityStore,
                                         rng: rng,
                                         fruits: resolvedContent.fruits.fruits,
                                         bomb: resolvedContent.fruits.bomb,
                                         tuning: tuning)
            spawnBridge = bridge
            waves.spawnSink = bridge
        }
        self.waveSpawnBridge = spawnBridge
        self.gameWorld = GameWorld(motionTuning: tuning,
                                   onSliced: onSliced,
                                   magicBeanScore: resolvedContent?.classic.magicBean.score)

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

        // T-024：回填渲染数据源（放最后：此时 self 的全部存储属性已初始化）。
        renderer?.host = self
        if let resolvedError {
            Self.contentLogger.error("原始内容加载失败：\(resolvedError, privacy: .public)")
        }
        if let classicAnimationLoadError {
            Self.contentLogger.error("Classic 动画加载失败：\(classicAnimationLoadError, privacy: .public)")
        }
    }

    // MARK: 只读投影（供 AppViewModel 组装快照）

    var currentState: GameState { state }
    var currentScore: Int32 { scoreSystem.total }
    var currentTotalFruitSliced: Int32 { statsRecorder.value(for: .totalfruit) }
    var classicHearts: [ClassicHeartState] {
        visibleClassicCrosses.sorted().compactMap { index in
            var scale = SIMD2<Float>(1, 1)
            do {
                if let values = try classicAnimationPlayer?.sampleActive(
                    component: "misscounters.cross\(index)", track: "scale"),
                   values.count == 3, values.allSatisfy({ $0.isFinite && $0 >= 0 }) {
                    scale = SIMD2(values[0], values[1])
                }
            } catch {
                classicAnimationLoadError = String(describing: error)
                Self.contentLogger.error("Classic 生命动画采样失败：\(error.localizedDescription, privacy: .public)")
            }
            return ClassicHeartState(index: index, scale: Double(scale.x))
        }
    }
    /// [Kimi 修正 T-022 审查] SaveData 无 soundEnabled 字段（Persistence.swift 字段表
    /// 只有 version/highscores/criticalChance/rated/challengeData/stats）——原版音效开关
    /// 在 settings.xml，映射未闭合。v1 用内存态，不持久化，标 [待验证]。
    private(set) var soundEnabled = true
    var isSoundEnabled: Bool { soundEnabled }

    // MARK: 只读投影（渲染层，T-024）

    /// 当前实体快照（按生成序），供 `GameRenderer` 提取精灵。
    ///
    /// [Kimi 修正 T-024 审查] 真实 API 是 `EntityStore.forEach(_:)`（inout Entity，
    /// 返回 Bool 控制续停）——收集值拷贝即得生成序快照。
    var currentEntities: [Entity] {
        var collected: [Entity] = []
        collected.reserveCapacity(store.aliveCount)
        store.forEach { entity in
            collected.append(entity)
            return true
        }
        return collected
    }

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
            // FUN_00025164 的宽高比必须来自当前真实渲染视口；未布局或 Metal
            // 不可用时才沿用宿主尺寸兜底，无效值由 FruitMotionTuning 防护。
            if let size = renderDriver?.logicalSize,
               size.x > 0, size.y > 0, size.x.isFinite, size.y.isFinite {
                gameWorld.motionTuning.actualSize = size
            } else {
                gameWorld.motionTuning.actualSize = GameHost.currentLogicalSize()
            }
            // 先推进已有 UISF 时间线，再跑控制器并启动本帧新动画；新动画从 0 ms 开始，
            // 完成 game_over 时产生的 game_over_real 会在同一逻辑帧被消费。
            advanceClassicAnimations(deltaSeconds: step)
            gameWorld.tick(dt: step, state: &state, world: &store, services: services)
            consumeClassicEvents()
        }
        renderInterpolationAlpha = alpha

        // 三振或炸弹阈值只进入 Classic 结束动画；两段动画完成后才进入结算。
        // isFaulted(+0xa4) 是命中时写入的原始状态，不再是独立的即时结算条件。
        if state.classicPhase == .results {
            viewModel.finishGame()
        }

        // T-024：渲染层不走「帧末通知」通路——`MTKView` 以 `isPaused = false` 自驱
        // （preferredFramesPerSecond = 120），每次 draw 时直接读
        // `currentState` / `currentEntities`。因此这里只刷新 UI 快照。
        // 选该通路的理由：注入文件里 `MetalCanvasView.onDraw` 是唯一帧入口，
        // 不存在「由逻辑层主动触发一次渲染」的 API。
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

    // MARK: 流程方法（T-022 / T-030）

    /// 只有真实内容可用才重置并开局；失败保留当前状态并返回 false。
    @discardableResult
    func startGame(mode: GameMode) -> Bool {
        guard let content = ensureContent() else {
            Self.contentLogger.error(
                "开局被拒绝：原始内容不可用 — \(self.contentLoadError ?? "unknown", privacy: .public)")
            return false
        }

        if mode == .classic, !ensureClassicAnimations() {
            Self.contentLogger.error("经典开局被拒绝：动画资源不可用")
            return false
        }

        currentMode = mode
        state = GameState()
        switch mode {
        case .classic:
            state.comboStatsPrefix = "CLASSIC"
        case .adventure:
            state.comboStatsPrefix = "NEW_MODE"
        case .challenge:
            state.comboStatsPrefix = nil // 原模式表索引未闭合，不猜成 ALL。
        }

        // [待验证] 切割半径²：初值 0 会让 HitTest 门控（`0.0 < +0xf0`）永不通过。
        // 原式按 15.0 归一化碰撞半径（core_logic_notes §1.1 / RenderSurface 注释），
        // 暂取 15² = 225；归一化语义闭合后应改为按 logicalSize 换算。
        state.sliceRadiusSquared = 225.0

        // [待验证] 原版 levelTier 开局写入点尚未闭合。
        state.levelTier = Constants.Simulation.lowLevelEffectCutoff

        // store.clear 对应 param_2==0 的强制清理，不经过正常漏切计数。
        store.clear()
        // 必须先读档再重置：FUN_0002504c 每局从存档 +0x100 读取整数初值。
        saveData = saveStore.load()
        gameWorld.resetForNewGame(isClassicMode: mode == .classic,
                                  initialCriticalChance: saveData.criticalChance)
        classicAnimationPlayer?.reset()
        // inGameClassic 开局三颗 active heart 直接可见，不播放入场动画。
        visibleClassicCrosses = mode == .classic ? [1, 2, 3] : []
        scoreSystem.reset()
        comboTracker.reset(state: &state)
        statsRecorder.reset()
        waveDirector.beginGame(waves: content.waves.waves, fruits: content.fruits.fruits)
        shouldRunDisplayLink = true
        displayLink.start()
        return true
    }

    // MARK: Classic UISF 动画消费

    private func advanceClassicAnimations(deltaSeconds: Float) {
        guard var player = classicAnimationPlayer else { return }
        do {
            let output = try player.advance(deltaSeconds: deltaSeconds)
            classicAnimationPlayer = player
            processClassicAnimationOutput(output)
        } catch {
            classicAnimationLoadError = String(describing: error)
            Self.contentLogger.error("Classic 动画推进失败：\(error.localizedDescription, privacy: .public)")
        }
    }

    private func consumeClassicEvents() {
        for event in gameWorld.drainClassicEvents() {
            switch event {
            case let .missCross(index):
                guard (1...3).contains(index) else { continue }
                visibleClassicCrosses.insert(Int(index))
                startClassicAnimation(component: "misscounters.cross\(index)", animation: "out")
            case let .restoreCross(index):
                guard (1...3).contains(index) else { continue }
                visibleClassicCrosses.insert(Int(index))
                startClassicAnimation(component: "misscounters.cross\(index)", animation: "in")
            case let .magicBeanPopup(kind, _):
                // FUN_00074254 的位置参数已保留在事件中；原控件坐标投影待 HUD 整组接入。
                startClassicAnimation(component: kind.rawValue, animation: "trigger")
            case .gameOver:
                startClassicAnimation(component: "gameOverContainer", animation: "game_over")
            case .gameOverReal:
                startClassicAnimation(component: "gameOverContainer", animation: "game_over_real")
            case .results:
                break
            }
        }
    }

    private func startClassicAnimation(component: String, animation: String) {
        guard var player = classicAnimationPlayer else {
            classicAnimationLoadError = "Classic 动画资源不可用，无法启动 \(component)/\(animation)"
            return
        }
        do {
            let output = try player.play(component: component, animation: animation)
            classicAnimationPlayer = player
            processClassicAnimationOutput(output)
        } catch {
            classicAnimationLoadError = String(describing: error)
            Self.contentLogger.error("Classic 动画启动失败：\(error.localizedDescription, privacy: .public)")
        }
    }

    private func processClassicAnimationOutput(_ output: [UIScreenAnimationOutput]) {
        for item in output {
            switch item {
            case let .event(_, _, command, arguments):
                if command == "PlaySound", let key = arguments.first {
                    audio.play(key)
                }
            case let .completed(component, animation):
                if component == "gameOverContainer", animation == "game_over",
                   state.classicPhase == .gameOver {
                    gameWorld.completeClassicAnimation(state: &state)
                    consumeClassicEvents()
                } else if component == "gameOverContainer", animation == "game_over_real",
                          state.classicPhase == .gameOverReal {
                    gameWorld.completeClassicAnimation(state: &state)
                    consumeClassicEvents()
                } else if component.hasPrefix("misscounters.cross"), animation == "out",
                          let index = Int(component.dropFirst("misscounters.cross".count)) {
                    // FUN_00071838_1：out 完成回调在这里隐藏控件，而不是漏切瞬间隐藏。
                    // 同回调的 heartLostSml 粒子创建仍属于尚未重建的特效系统。
                    visibleClassicCrosses.remove(index)
                }
            }
        }
    }

    private func ensureClassicAnimations() -> Bool {
        if classicAnimationPlayer != nil { return true }
        guard let url = Bundle.main.url(forResource: "classicAnimations", withExtension: "json") else {
            classicAnimationLoadError = "Content/classicAnimations.json 未进入应用资源"
            return false
        }
        do {
            classicAnimationPlayer = try UIScreenAnimationPlayer(data: Data(contentsOf: url))
            classicAnimationLoadError = nil
            return true
        } catch {
            classicAnimationLoadError = String(describing: error)
            return false
        }
    }

    /// 重开：以当前模式重新开局，复用已验证内容。
    @discardableResult
    func restart() -> Bool {
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
        classicAnimationPlayer?.reset()
        visibleClassicCrosses.removeAll(keepingCapacity: false)
        _ = gameWorld.drainClassicEvents()
        persist()
    }

    // MARK: 内容（T-030）

    private func ensureContent() -> OriginalContent? {
        if let originalContent { return originalContent }

        switch OriginalContentBundle.load() {
        case .success(let content):
            originalContent = content
            contentLoadError = nil
            installSpawnBridge(with: content)
            return content
        case .failure(let failure):
            let message = failure.errorDescription ?? String(describing: failure)
            contentLoadError = message
            Self.contentLogger.error("原始内容重载失败：\(message, privacy: .public)")
            return nil
        }
    }

    private func installSpawnBridge(with content: OriginalContent) {
        let bridge = WaveSpawnBridge(store: store,
                                     rng: rng,
                                     fruits: content.fruits.fruits,
                                     bomb: content.fruits.bomb,
                                     tuning: motionTuning)
        waveSpawnBridge = bridge
        waveDirector.spawnSink = bridge

        let fruits = content.fruits
        statsRecorder.configureFruitNames(Dictionary(uniqueKeysWithValues: fruits.fruits.map {
            ($0.typeID, $0.name)
        }))
        statsRecorder.configureComboBonuses(content.comboBonuses)
        gameWorld = GameWorld(
            motionTuning: motionTuning,
            onSliced: FruitOnSliced(
                critical: fruits.critical,
                fruitTypeCount: fruits.fruits.count,
                starfruitTypeID: fruits.fruits.first(where: { $0.name == "starfruit" })?.typeID),
            magicBeanScore: content.classic.magicBean.score)
    }

    // MARK: 触摸（macho §1.2 语义）

    /// 触摸输入只写 slashPosition；hitPoint 保留给“最后命中实体位置”。
    /// +0xa5 是切中后的轨迹写槽状态，不能拿来表示手指是否按下。
    func touchBegan(at position: SIMD3<Float>) {
        state.previousTouchPosition = position
        state.slashPosition = position
        state.isSlashInputActive = true
    }

    func touchMoved(to position: SIMD3<Float>) {
        guard state.isSlashInputActive else { return }
        state.previousTouchPosition = state.slashPosition
        state.slashPosition = position
    }

    /// 结束后立即关闭切割形状；已切中产生的轨迹仍按原 0.05 秒规则写槽。
    func touchEnded() {
        state.isSlashInputActive = false
        state.previousTouchPosition = state.slashPosition
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

    /// 逻辑像素尺寸（兜底用）。TouchCoordinateMapper 要求 SIMD2<Float>。
    ///
    /// T-024：正常路径已改接 `RenderSurface.logicalSize`（逻辑点）；
    /// 本函数仅作为「渲染视图尚未布局」时的兜底（返回屏幕物理像素）。
    /// [待验证] 两套量纲混用是否符合原版归一化语义——闭合后应删除本兜底。
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
