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
    private let rng: OriginalLCGRandom

    /// 唯一保留的占位：特效模块（原 FUN_00033ca0 / FUN_00035a08）待特效任务卡。
    private let effects: PlaceholderEffectEmitter

    // MARK: 真实内容（T-030）
    private(set) var originalContent: OriginalContent?
    private(set) var contentLoadError: String?

    // MARK: 挑战回合装配与发售版 UISF 结算
    private var challengeAssembler: ChallengeRoundAssembler?
    private(set) var currentChallengeRound: ChallengeRound?
    private(set) var challengeConfigurationError: String?
    private var challengeSettlement: ChallengeSettlementController?
    private var challengeBonusSettlement: ChallengeBonusSettlementHost?
    private var challengeMap: ChallengeMapController?
    private var pendingChallengeMapRound: Int?
    private var hasPresentedChallengeMap = false
    private var actChangeSoundPending = false
    private var challengeIconTargets: [String: Int32] = [:]
    private var challengeRoundStartScore: Int32 = 0
    private var challengeHUDAnimationPlayer: UIScreenAnimationPlayer?
    private var challengeResultAnimationPlayer: UIScreenAnimationPlayer?
    private var challengeMapAnimationPlayer: UIScreenAnimationPlayer?
    private var challengeBackgroundAnimationPlayer: UIScreenAnimationPlayer?
    private var gameBackgroundAnimationPlayer: UIScreenAnimationPlayer?
    private var challengeVisibleTargets: [String: Bool] = [:]
    private var challengeBackgroundVisible = false

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

        // 算法已按发售版 LCG 闭合；启动种子的原运行时来源仍未核实，保留旧数值且不冒充官方种子。
        let rng = OriginalLCGRandom(seed: 0x5DEE_CE66_D)
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
    var challengeHUD: ChallengeHUDState? {
        guard currentMode == .challenge, let round = currentChallengeRound else { return nil }
        let runtime = gameWorld.challenge
        let controller = challengeSettlement
        var mapState: ChallengeMapHUDState?
        var mapProjectionError: String?
        if let map = challengeMap, let input = map.snapshot {
            let spinner = input.isBonus ? "bossChallengeContainer.spinner" : "challengeContainer.spinner"
            var components: [ChallengeMapLayoutComponent] = []
            if let player = challengeMapAnimationPlayer {
                do {
                    components = try Self.makeChallengeMapComponents(
                        from: UIScreenLayoutProjection.project(player),
                        iconTargets: challengeIconTargets,
                        visibleTargets: challengeVisibleTargets)
                } catch {
                    mapProjectionError = "挑战地图组件投影失败：\(error.localizedDescription)"
                }
            } else {
                mapProjectionError = "挑战地图缺少 UIScreen 动画播放器"
            }
            mapState = ChallengeMapHUDState(
                controllerState: Int(map.state),
                rounds: input.rounds.enumerated().map { index, round in
                    ChallengeMapRoundHUDState(
                        id: index,
                        challengeName: round.challengeName,
                        outcomeRawValue: round.outcome.map { Int($0.rawValue) },
                        iconIndex: challengeIconTargets["\(spinner).adventureNode_\(index + 1)"])
                },
                components: components)
        }
        var bonusState: ChallengeBonusHUDState?
        if let host = challengeBonusSettlement,
           let totalScore = host.totalScore,
           let finaleScore = host.finaleScore,
           let lives = host.lives {
            bonusState = ChallengeBonusHUDState(
                totalScore: Int(totalScore),
                finaleScore: Int(finaleScore),
                lives: Int(lives),
                scoreCounterValue: Int(host.scoreCounterValue),
                resultVisible: host.resultVisible,
                isBonusFinished: host.isBonusFinished,
                isFinished: host.isFinished,
                lifeScoreVisible: (1...3).map { host.isLifeScoreVisible(index: Int32($0)) })
        }
        let errorMessage: String?
        if let configurationError = challengeConfigurationError,
           let projectionError = mapProjectionError {
            errorMessage = "\(configurationError)；\(projectionError)"
        } else {
            errorMessage = challengeConfigurationError ?? mapProjectionError
        }
        return ChallengeHUDState(
            challengeName: round.challenge.name,
            roundNumber: round.roundIndex + 1,
            roundCount: challengeAssembler?.plan.count ?? 0,
            timeRemaining: runtime?.endsOnTimer == true
                ? Double(max(0, runtime?.countdown ?? 0)) : nil,
            hudVisible: challengeVisibleTargets["inGameChallengeHud"] ?? true,
            timerVisible: challengeVisibleTargets["Timer"] ?? (runtime?.endsOnTimer == true),
            backgroundVisible: challengeBackgroundVisible,
            resultRawValue: controller.map { Int($0.outcome.rawValue) },
            resultVisible: controller?.normalResultVisible ?? false,
            resultFinished: controller?.isNormalResultFinished ?? false,
            canAdvance: challengeAssembler?.plan.outcomes.contains(where: {
                $0 == nil
            }) ?? false,
            map: mapState,
            bonus: bonusState,
            errorMessage: errorMessage)
    }

    /// Converts Core values at the composition boundary; FNPBUI never imports Core.
    private static func makeChallengeMapComponents(
        from projection: UIScreenLayoutProjection,
        iconTargets: [String: Int32],
        visibleTargets: [String: Bool]
    ) throws -> [ChallengeMapLayoutComponent] {
        let orderedComponents = projection.orderedVisibleComponents(
            visibleTargets: visibleTargets)
        var result: [ChallengeMapLayoutComponent] = []
        result.reserveCapacity(orderedComponents.count)
        for component in orderedComponents {
            guard let worldMatrix = ChallengeMapLayoutMatrix4(
                elements: component.worldMatrix.elements),
                  component.texCoord.position.count == 2,
                  component.texCoord.size.count == 2 else {
                throw ChallengeHostError("组件 \(component.name) 的矩阵或 UV 维度无效")
            }
            let corners = ChallengeMapLayoutCorners(
                minimumXMinimumY: ChallengeMapLayoutPoint(
                    x: component.worldCorners.minimumXMinimumY.x,
                    y: component.worldCorners.minimumXMinimumY.y,
                    z: component.worldCorners.minimumXMinimumY.z),
                maximumXMinimumY: ChallengeMapLayoutPoint(
                    x: component.worldCorners.maximumXMinimumY.x,
                    y: component.worldCorners.maximumXMinimumY.y,
                    z: component.worldCorners.maximumXMinimumY.z),
                maximumXMaximumY: ChallengeMapLayoutPoint(
                    x: component.worldCorners.maximumXMaximumY.x,
                    y: component.worldCorners.maximumXMaximumY.y,
                    z: component.worldCorners.maximumXMaximumY.z),
                minimumXMaximumY: ChallengeMapLayoutPoint(
                    x: component.worldCorners.minimumXMaximumY.x,
                    y: component.worldCorners.minimumXMaximumY.y,
                    z: component.worldCorners.minimumXMaximumY.z))
            result.append(ChallengeMapLayoutComponent(
                name: component.name,
                index: component.index,
                parentIndex: component.parentIndex,
                worldMatrix: worldMatrix,
                worldCorners: corners,
                width: component.width,
                height: component.height,
                effectiveOrigin: ChallengeMapLayoutPoint(
                    x: component.effectiveOrigin.x,
                    y: component.effectiveOrigin.y,
                    z: component.effectiveOrigin.z),
                localRGBA: ChallengeMapLayoutColor(
                    red: component.localRGBA.red, green: component.localRGBA.green,
                    blue: component.localRGBA.blue, alpha: component.localRGBA.alpha),
                absoluteRGBA: ChallengeMapLayoutColor(
                    red: component.absoluteRGBA.red, green: component.absoluteRGBA.green,
                    blue: component.absoluteRGBA.blue, alpha: component.absoluteRGBA.alpha),
                // The Core draw list has already applied this node's override and
                // excluded every descendant of a hidden parent.
                enabled: visibleTargets[component.name] ?? component.enabled,
                screenVisibility: component.screenVisibility,
                texturePath: component.texturePath,
                texCoordPos: SIMD2(component.texCoord.position[0], component.texCoord.position[1]),
                texCoordSize: SIMD2(component.texCoord.size[0], component.texCoord.size[1]),
                iconIndex: iconTargets[component.name]))
        }
        return result
    }

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
            waveSpawnBridge?.tuning.actualSize = gameWorld.motionTuning.actualSize
            // 先推进已有 UISF 时间线，再跑控制器并启动本帧新动画；新动画从 0 ms 开始，
            // 完成 game_over 时产生的 game_over_real 会在同一逻辑帧被消费。
            advanceClassicAnimations(deltaSeconds: step)
            advanceChallengeAnimations(deltaSeconds: step)
            gameWorld.tick(dt: step, state: &state, world: &store, services: services)
            consumeChallengeEvents()
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
        if mode == .challenge, !ensureChallengeAnimations() {
            Self.contentLogger.error("挑战开局被拒绝：动画资源不可用")
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
        guard configureMode(content: content, mode: mode) else { return false }
        shouldRunDisplayLink = true
        displayLink.start()
        return true
    }

    /// 挑战接线顺序与 FUN_00061128 / WaveManager setup 对齐：
    /// 回合装配 → 注入挑战水果 → beginGame → customWave → 激活条件运行时。
    /// 任一步失败都拒绝开局，不退回普通波、不用默认 tier/difficulty 冒充存档配置。
    private func configureMode(content: OriginalContent, mode: GameMode) -> Bool {
        challengeConfigurationError = nil
        challengeSettlement = nil
        challengeBonusSettlement = nil
        challengeMap = nil
        pendingChallengeMapRound = nil
        hasPresentedChallengeMap = false
        actChangeSoundPending = false
        challengeIconTargets.removeAll(keepingCapacity: false)
        challengeRoundStartScore = 0
        challengeHUDAnimationPlayer?.reset()
        challengeResultAnimationPlayer?.reset()
        challengeMapAnimationPlayer?.reset()
        challengeBackgroundAnimationPlayer?.reset()
        gameBackgroundAnimationPlayer?.reset()
        challengeVisibleTargets.removeAll(keepingCapacity: false)
        challengeBackgroundVisible = false
        switch mode {
        case .classic, .adventure:
            challengeAssembler = nil
            currentChallengeRound = nil
            waveDirector.setChallengeFruit(nil)
            gameWorld.configureChallenge(nil)
            waveDirector.beginGame(waves: content.waves.waves, fruits: content.fruits.fruits)
            return true

        case .challenge:
            do {
                let tierIndex = saveData.challengeSession.initialTierIndex(
                    validTierCount: content.challengeCatalog.tiers.count)
                guard tierIndex >= 0, Int(tierIndex) < content.challengeCatalog.tiers.count else {
                    challengeConfigurationError = "挑战 tier 越界：\(tierIndex)"
                    return false
                }
                let tier = content.challengeCatalog.tiers[Int(tierIndex)]
                let roundCount = ChallengeTierSelector.rollRoundCount(tier: tier, rng: rng)
                let difficulty = saveData.challengeSession.clampedDifficulty(roundCount: roundCount)
                var assembler = try ChallengeRoundAssembler(
                    catalog: content.challengeCatalog,
                    fruits: content.fruits.fruits,
                    conditionDefinitions: content.challengeConditions,
                    persistence: saveStore,
                    random: rng,
                    tierIndex: tierIndex,
                    difficulty: difficulty,
                    roundCount: roundCount)
                let round = try assembler.startFirstRound()

                waveDirector.setChallengeFruit(round.fruitID)
                waveDirector.beginGame(waves: content.challengeWaves.waves,
                                       fruits: content.fruits.fruits)
                guard waveDirector.configureChallengeWave(
                    customWave: round.challenge.customWave,
                    forceWave: round.challenge.forceWave) else {
                    challengeConfigurationError =
                        "挑战 \(round.challenge.name) 的 customWave 无法配置"
                    return false
                }

                gameWorld.configureChallenge(round.runtime)
                if round.runtime.isBonusRound {
                    gameWorld.startInitialChallengeBonusIntro()
                } else {
                    gameWorld.startInitialChallengeRound()
                }
                challengeAssembler = assembler
                currentChallengeRound = round
                challengeRoundStartScore = scoreSystem.total
                if round.runtime.isBonusRound {
                    // Start the queued resource animation now. Otherwise the first
                    // frame would mistake "not started yet" for a completed intro.
                    consumeChallengeEvents()
                }
                return true
            } catch {
                challengeConfigurationError = String(describing: error)
                Self.contentLogger.error(
                    "挑战开局被拒绝：\(error.localizedDescription, privacy: .public)")
                return false
            }
        }
    }

    // MARK: 挑战资源、回合结算与事件消费

    private func ensureChallengeAnimations() -> Bool {
        if challengeHUDAnimationPlayer != nil,
           challengeResultAnimationPlayer != nil,
           challengeMapAnimationPlayer != nil,
           challengeBackgroundAnimationPlayer != nil,
           gameBackgroundAnimationPlayer != nil {
            return true
        }
        do {
            challengeHUDAnimationPlayer = try UIScreenAnimationPlayer(
                data: OriginalContentBundle.readResource(named: "challengeAnimations"))
            challengeResultAnimationPlayer = try UIScreenAnimationPlayer(
                data: OriginalContentBundle.readResource(named: "challengeScoreAnimations"))
            challengeMapAnimationPlayer = try UIScreenAnimationPlayer(
                data: OriginalContentBundle.readResource(named: "challengeMapAnimations"))
            challengeBackgroundAnimationPlayer = try UIScreenAnimationPlayer(
                data: OriginalContentBundle.readResource(named: "challengeBackgroundAnimations"))
            gameBackgroundAnimationPlayer = try UIScreenAnimationPlayer(
                data: OriginalContentBundle.readResource(named: "backgroundAnimations"))
            return true
        } catch {
            challengeHUDAnimationPlayer = nil
            challengeResultAnimationPlayer = nil
            challengeMapAnimationPlayer = nil
            challengeBackgroundAnimationPlayer = nil
            gameBackgroundAnimationPlayer = nil
            challengeConfigurationError = "挑战动画加载失败：\(error.localizedDescription)"
            Self.contentLogger.error("挑战动画加载失败：\(error.localizedDescription, privacy: .public)")
            return false
        }
    }

    /// 与 Classic 相同，先推进已有时间线，再让 GameWorld 产生本帧事件。
    /// state 7 的回合分发只发生一次；成功后旧结果控制器立即退出装配。
    private func advanceChallengeAnimations(deltaSeconds: Float) {
        guard currentMode == .challenge else { return }
        do {
            if var player = gameBackgroundAnimationPlayer {
                let output = try player.advance(deltaSeconds: deltaSeconds)
                gameBackgroundAnimationPlayer = player
                processChallengeAnimationOutput(output)
            }
            if var player = challengeHUDAnimationPlayer {
                let output = try player.advance(deltaSeconds: deltaSeconds)
                challengeHUDAnimationPlayer = player
                processChallengeAnimationOutput(output)
            }
            if gameWorld.challenge?.phase == .bonusIntro,
               let player = challengeHUDAnimationPlayer,
               try !player.isPlayingRecursively(component: "bonusIntro", animation: "play") {
                // FUN_0005ffa8 runs before the game update: resume on this frame,
                // then let GameWorld consume the restored HUD events below.
                gameWorld.completeChallengeBonusIntro()
            }
            if var bonusHost = challengeBonusSettlement {
                let output = try bonusHost.update(deltaSeconds: deltaSeconds)
                let didFinish = try processChallengeBonusOutput(output)
                challengeBonusSettlement = bonusHost
                if didFinish {
                    gameWorld.updateChallengeSettlement(controllerState: 7, substate: 3)
                    challengeBonusSettlement = nil
                    challengeBackgroundVisible = false
                    // bonus host 持有并退出了旧背景；后续普通结果仍需要
                    // 同一原始 UISF 的独立新播放器，不能遗留 nil 到下一回合。
                    challengeBackgroundAnimationPlayer = try UIScreenAnimationPlayer(
                        data: OriginalContentBundle.readResource(
                            named: "challengeBackgroundAnimations"))
                    try beginChallengeMap()
                }
                return
            }
            if var map = challengeMap,
               var mapPlayer = challengeMapAnimationPlayer,
               let assembler = challengeAssembler,
               let content = originalContent {
                let output = try map.update(
                    deltaSeconds: deltaSeconds,
                    input: assembler.makeMapInput(
                        challengeTypes: content.challengeTypes,
                        isInitialPresentation: !hasPresentedChallengeMap,
                        playActChangeSound: actChangeSoundPending),
                    random: rng,
                    player: &mapPlayer)
                challengeMap = map
                challengeMapAnimationPlayer = mapPlayer
                try processChallengeMapOutput(output)
                return
            }
            guard var controller = challengeSettlement,
                  var resultPlayer = challengeResultAnimationPlayer,
                  var backgroundPlayer = challengeBackgroundAnimationPlayer else { return }
            let output = try controller.update(
                deltaSeconds: deltaSeconds,
                resultPlayer: &resultPlayer,
                backgroundPlayer: &backgroundPlayer,
                canAnimateResultExit: canAnimateChallengeResultExit())
            challengeSettlement = controller
            challengeResultAnimationPlayer = resultPlayer
            challengeBackgroundAnimationPlayer = backgroundPlayer
            processChallengeAnimationOutput(output)
            if controller.state == 7 {
                try dispatchChallengeSettlement(controller)
            }
        } catch {
            rejectChallenge("挑战动画／结算推进失败：\(error.localizedDescription)")
        }
    }

    private func canAnimateChallengeResultExit() -> Bool {
        guard let runtime = gameWorld.challenge else { return false }
        // FUN_00062a28(parent)：普通 tier 且失败回合数==3 时跳过结果退场。
        let suppressOutro = !runtime.isBonusRound
            && (runtime.roundsPlayed - runtime.roundsPassed) == 3
        return !suppressOutro
    }

    private func dispatchChallengeSettlement(_ controller: ChallengeSettlementController) throws {
        challengeBackgroundVisible = false
        switch controller.substate {
        case 2:
            // 原版结果背景退出后回到地图；回合只能在地图 state 9 的
            // startRound 分发后装配，禁止在这里擅自选择下一槽位。
            gameWorld.updateChallengeSettlement(controllerState: 7, substate: 3)
            challengeSettlement = nil
            try beginChallengeMap()
        case 5:
            gameWorld.updateChallengeSettlement(
                controllerState: controller.state,
                substate: controller.substate)
            challengeSettlement = nil
        default:
            throw ChallengeHostError("未知挑战结算分发子状态：\(controller.substate)")
        }
    }

    private func beginChallengeMap() throws {
        guard let assembler = challengeAssembler,
              let content = originalContent,
              var player = challengeMapAnimationPlayer else {
            throw ChallengeHostError("挑战地图缺少真实装配器、原始内容或 UISF 资源")
        }
        var input = assembler.makeMapInput(
            challengeTypes: content.challengeTypes,
            isInitialPresentation: !hasPresentedChallengeMap,
            playActChangeSound: actChangeSoundPending)
        if input.actChange, !actChangeSoundPending {
            actChangeSoundPending = true
            input = assembler.makeMapInput(
                challengeTypes: content.challengeTypes,
                isInitialPresentation: !hasPresentedChallengeMap,
                playActChangeSound: true)
        }
        var map = ChallengeMapController()
        let output = try map.begin(input: input, player: &player)
        challengeMap = map
        challengeMapAnimationPlayer = player
        hasPresentedChallengeMap = true
        pendingChallengeMapRound = nil
        challengeVisibleTargets["inGameChallengeHud"] = false
        try processChallengeMapOutput(output)
    }

    private func processChallengeMapOutput(_ output: ChallengeMapOutput) throws {
        processChallengeAnimationOutput(output.animations)
        for command in output.commands {
            switch command {
            case let .setVisible(component, visible):
                challengeVisibleTargets[component] = visible
            case let .setIcon(component, iconIndex):
                challengeIconTargets[component] = iconIndex
            case let .playSound(key):
                audio.play(key)
            case let .fadeOutSound(key, duration):
                audio.fadeOut(key, duration: duration)
            case let .prepareRound(index):
                pendingChallengeMapRound = Int(index)
            case let .startRound(index):
                guard pendingChallengeMapRound == Int(index) else {
                    throw ChallengeHostError("地图开局与已选择的回合不一致")
                }
                try startChallengeMapRound(at: Int(index))
            case .advanceTier:
                try advanceChallengeTier()
            case .clearActChangeSound:
                actChangeSoundPending = false
            }
        }
    }

    /// FUN_00061090 / FUN_0005fc1c：普通章节 +1，bonus 重建同一 tier；越界保持原 tier。
    private func advanceChallengeTier() throws {
        guard let current = challengeAssembler, let content = originalContent else {
            throw ChallengeHostError("章节晋升缺少真实装配器或原始内容")
        }
        let nextTierIndex = current.tier.isBonusRound ? current.tierIndex : current.tierIndex + 1
        guard nextTierIndex >= 0,
              Int(nextTierIndex) < content.challengeCatalog.tiers.count else { return }
        let tier = content.challengeCatalog.tiers[Int(nextTierIndex)]
        let roundCount = ChallengeTierSelector.rollRoundCount(tier: tier, rng: rng)
        challengeAssembler = try ChallengeRoundAssembler(
            catalog: content.challengeCatalog,
            fruits: content.fruits.fruits,
            conditionDefinitions: content.challengeConditions,
            persistence: saveStore,
            random: rng,
            tierIndex: nextTierIndex,
            difficulty: current.difficulty,
            predicateP: current.predicateP,
            roundCount: roundCount,
            deferInitialRoundAssembly: true)
        if nextTierIndex == 0 {
            audio.play("act-change")
            actChangeSoundPending = false
        }
    }

    func requestChallengeMapRound(index: Int) {
        guard var map = challengeMap,
              var player = challengeMapAnimationPlayer else { return }
        do {
            let output = try map.selectRound(index: index, player: &player)
            challengeMap = map
            challengeMapAnimationPlayer = player
            try processChallengeMapOutput(output)
        } catch {
            rejectChallenge("无法选择地图回合：\(error.localizedDescription)")
        }
    }

    private func startChallengeMapRound(at index: Int) throws {
        guard var assembler = challengeAssembler, let content = originalContent else {
            throw ChallengeHostError("地图开局缺少真实装配器或原始内容")
        }
        let round = try assembler.selectRound(at: index)
        waveDirector.setChallengeFruit(round.fruitID)
        waveDirector.beginGame(waves: content.challengeWaves.waves,
                               fruits: content.fruits.fruits)
        guard waveDirector.configureChallengeWave(
            customWave: round.challenge.customWave,
            forceWave: round.challenge.forceWave) else {
            throw ChallengeHostError("挑战 \(round.challenge.name) 的地图回合 customWave 无法配置")
        }
        gameWorld.updateChallengeSettlement(
            controllerState: 7,
            substate: round.runtime.isBonusRound ? 1 : 2,
            nextChallenge: round.challenge,
            nextSelectedFruitName: round.fruitName)
        challengeAssembler = assembler
        currentChallengeRound = round
        challengeRoundStartScore = scoreSystem.total
        challengeMap = nil
        pendingChallengeMapRound = nil
        challengeMapAnimationPlayer?.reset()
    }

    private func consumeChallengeEvents() {
        for event in gameWorld.drainChallengeEvents() {
            switch event {
            case let .roundFinished(outcome):
                finishChallengeRound(outcome: outcome)
            case let .playSound(key), let .playMusic(key):
                audio.play(key)
            case let .playAnimation(target, name):
                playChallengeAnimation(target: target, name: name)
            case let .setVisible(target, visible):
                challengeVisibleTargets[target] = visible
            case .nextRound:
                // state 7 已完成真实波次、水果和条件配置；此事件只是运行时通知。
                break
            case .cleanedUp:
                viewModel.finishGame()
            }
        }
    }

    private func finishChallengeRound(outcome: ChallengeOutcome) {
        guard var assembler = challengeAssembler, let round = currentChallengeRound else {
            rejectChallenge("回合结束时缺少真实挑战装配状态")
            return
        }
        assembler.recordCurrentRoundOutcome(outcome)
        challengeAssembler = assembler
        saveData.challengeSession.recordRound(
            challengeName: round.challenge.name,
            tierIndex: assembler.tierIndex,
            roundIndex: round.roundIndex,
            outcome: outcome)
        if round.runtime.isBonusRound {
            // Parent FUN_00068560 reports this stat before starting the bonus result machine.
            statsRecorder.report("NEW_MODE_complete", 1)
            saveData.stats["NEW_MODE_complete", default: 0] &+= 1
        }
        guard saveStore.saveMergingChallengeData(saveData) else {
            rejectChallenge("挑战回合存档失败：\(saveStore.lastError?.localizedDescription ?? "unknown")")
            return
        }
        // FUN_0006d80c 是独立 bonus 状态机，禁止误入普通结果控制器。
        if round.runtime.isBonusRound {
            do {
                let completed = ChallengeBonusAchievementUpdate(
                    achievement: .newModeComplete, value: 1)
                if try !saveStore.applyAchievementUpdates([completed]).isEmpty {
                    saveData = saveStore.load()
                }
                guard let runtime = gameWorld.challenge else {
                    throw ChallengeHostError("bonus 回合缺少挑战运行时")
                }
                let totalScore = scoreSystem.total
                let finaleScore = totalScore &- challengeRoundStartScore
                let lives = Int32(3) &- (runtime.roundsPlayed &- runtime.roundsPassed)
                guard var backgroundPlayer = challengeBackgroundAnimationPlayer else {
                    throw ChallengeHostError("bonus 回合结算缺少背景动画资源")
                }
                let backgroundOutput = try backgroundPlayer.playRecursively(
                    component: "", animation: "animate_in")
                challengeBackgroundAnimationPlayer = backgroundPlayer
                processChallengeAnimationOutput(backgroundOutput)
                guard let transferredBackground = challengeBackgroundAnimationPlayer else {
                    throw ChallengeHostError("bonus 回合背景动画所有权转移失败")
                }
                let scorePlayer = try UIScreenAnimationPlayer(
                    data: OriginalContentBundle.readResource(
                        named: "challengeScoreCompleteAnimations"))
                var bonusHost = ChallengeBonusSettlementHost(
                    scorePlayer: scorePlayer,
                    backgroundPlayer: transferredBackground)
                let animations = try bonusHost.begin(
                    totalScore: totalScore,
                    finaleScore: finaleScore,
                    lives: lives)
                challengeBonusSettlement = bonusHost
                challengeBackgroundAnimationPlayer = nil
                challengeBackgroundVisible = true
                processChallengeAnimationOutput(animations)
            } catch {
                rejectChallenge("无法开始 bonus 回合结算：\(error.localizedDescription)")
            }
            return
        }
        do {
            guard var resultPlayer = challengeResultAnimationPlayer,
                  var backgroundPlayer = challengeBackgroundAnimationPlayer else {
                throw ChallengeHostError("普通回合结算缺少真实动画资源")
            }
            var controller = ChallengeSettlementController()
            let output = try controller.beginNormalResults(
                outcome: outcome,
                resultPlayer: &resultPlayer,
                backgroundPlayer: &backgroundPlayer)
            challengeSettlement = controller
            challengeResultAnimationPlayer = resultPlayer
            challengeBackgroundAnimationPlayer = backgroundPlayer
            challengeBackgroundVisible = true
            processChallengeAnimationOutput(output)
        } catch {
            rejectChallenge("无法开始普通回合结算：\(error.localizedDescription)")
        }
    }

    private func processChallengeBonusOutput(
        _ output: ChallengeBonusSettlementHostOutput
    ) throws -> Bool {
        processChallengeAnimationOutput(output.animations)
        if !output.achievements.isEmpty {
            let newlyUnlocked = try saveStore.applyAchievementUpdates(output.achievements)
            if !newlyUnlocked.isEmpty {
                saveData = saveStore.load()
            }
        }
        if let roundCommand = output.roundCommand {
            switch roundCommand {
            case .beginLifeTally:
                store.clear()
            case .finishRound:
                store.clear()
                audio.stop("Music-bonus")
                audio.stop("Music-bonus-end")
                challengeVisibleTargets["inGameChallengeHud"] = false
            }
        }
        return output.didFinish
    }

    private func playChallengeAnimation(target: String, name: String) {
        do {
            if target == "Background" {
                guard var player = gameBackgroundAnimationPlayer else {
                    throw ChallengeHostError("独立 Background 屏幕动画资源不可用")
                }
                // PlayAnimation 的第一个参数是屏幕名；根组件递归定位 inGame。
                let output = try player.playRecursively(component: "", animation: name)
                gameBackgroundAnimationPlayer = player
                processChallengeAnimationOutput(output)
                return
            }
            guard var player = challengeHUDAnimationPlayer else {
                throw ChallengeHostError("挑战 HUD 动画资源不可用")
            }
            // inGameChallengeHud 是屏幕名，生成资源的根组件名为空字符串。
            let component = target == "inGameChallengeHud" ? "" : target
            let output = try player.playRecursively(component: component, animation: name)
            challengeHUDAnimationPlayer = player
            processChallengeAnimationOutput(output)
        } catch {
            rejectChallenge("挑战动画 \(target)/\(name) 启动失败：\(error.localizedDescription)")
        }
    }

    private func processChallengeAnimationOutput(_ output: [UIScreenAnimationOutput]) {
        for item in output {
            switch item {
            case let .event(_, _, command, arguments):
                switch command {
                case "PlaySound":
                    if let key = arguments.first { audio.play(key) }
                case "PlayAnimation":
                    if arguments.count == 2 {
                        playChallengeAnimation(target: arguments[0], name: arguments[1])
                    }
                default:
                    rejectChallenge("未支持的原始挑战动画事件：\(command)")
                }
            case .completed:
                break
            }
        }
    }

    func requestNextChallengeRound() {
        guard var controller = challengeSettlement,
              var background = challengeBackgroundAnimationPlayer,
              controller.isNormalResultFinished,
              let assembler = challengeAssembler,
              assembler.plan.outcomes.contains(where: { $0 == nil }) else { return }
        do {
            let output = try controller.requestNextRound(backgroundPlayer: &background)
            challengeSettlement = controller
            challengeBackgroundAnimationPlayer = background
            processChallengeAnimationOutput(output)
        } catch {
            rejectChallenge("无法请求下一挑战回合：\(error.localizedDescription)")
        }
    }

    func requestChallengeCleanup() {
        guard var controller = challengeSettlement,
              var background = challengeBackgroundAnimationPlayer,
              controller.isNormalResultFinished else { return }
        do {
            let output = try controller.requestCleanup(backgroundPlayer: &background)
            challengeSettlement = controller
            challengeBackgroundAnimationPlayer = background
            processChallengeAnimationOutput(output)
        } catch {
            rejectChallenge("无法退出挑战回合：\(error.localizedDescription)")
        }
    }

    private func rejectChallenge(_ message: String) {
        challengeConfigurationError = message
        Self.contentLogger.error("挑战流程已终止：\(message, privacy: .public)")
        viewModel.finishGame()
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
        // 挑战选择器会绕过 GameHost 快照直接写盘；这里只合并该子树，不能用整份旧快照覆盖。
        _ = saveStore.saveMergingChallengeData(saveData)
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

private struct ChallengeHostError: LocalizedError {
    let message: String

    init(_ message: String) {
        self.message = message
    }

    var errorDescription: String? { message }
}

// MARK: - 唯一保留的占位服务

/// ⚠️ 占位：特效模块尚未重建（原 FUN_00033ca0 / FUN_00035a08，命中特效 vtable+0x44）。
/// 待特效任务卡落盘后替换为真实 EffectEmitting 实现；在此之前不产生任何视觉效果。
final class PlaceholderEffectEmitter: EffectEmitting {
    func emit(_ kind: Int32, at position: SIMD3<Float>) {
        // 待特效任务卡
    }
}
