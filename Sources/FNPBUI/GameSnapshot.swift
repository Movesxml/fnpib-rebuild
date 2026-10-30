//
//  GameSnapshot.swift
//  FNPBUI — 界面层 v1（T-021）
//
//  单向数据流的两端：
//    App 层（游戏世界）  ──snapshot──▶  FNPBUI 视图
//    FNPBUI 视图        ──UIIntent──▶  App 层
//
//  ⚠️ 本文件是**纯值类型 + 协议**，不含任何 FNPBCore 类型引用。
//     App 层负责把 GameWorld / ScoreSystem / ComboTracker / WaveDirector 的状态翻译成 `GameSnapshot`。
//
//  字段来源（App 层组装时的映射参考，均为 [待验证] 的接线细节，不是 FNPBCore 既有 API）：
//    score        ← ScoreSystem 累计分
//    bestScore    ← 存档 best score（键名见 FNPBPlatform 存档映射表）
//    lives        ← Classic 模式剩余机会数（原版上限疑为 3，需 Frida 打点确认）
//    elapsed      ← 本局已用时间（Challenge 模式 HUD 需要，v1 不显示）
//    combo        ← ComboTracker 窗口状态（文本档位 clamp(combo-2,1,5)、视觉档位 clamp(combo-3,0,2) [macho]）
//    result       ← 结算时由 ScoreSystem + ComboTracker 汇总
//    pauseVisible ← App 层暂停状态机
//
//  ⚠️ 本文件刻意**不**给 `UIActions` 加 `@MainActor`：视图会把 `send` 塞进 Button 的
//     非隔离 action 闭包，加隔离标注会在 Swift 6 严格并发下产生函数值降级诊断。
//     隔离责任放在 App 层构造点（见 `UIActions` 文档）。
//

import Foundation

// MARK: - 阶段

/// 顶层界面阶段（App 层据此决定挂载哪个屏幕）。
public enum UIPhase: String, Sendable, Equatable {
    /// 主菜单（mainscreen）
    case mainMenu
    /// 模式选择（gamemode）
    case modeSelect
    /// 局内（HUD）
    case playing
    /// 暂停浮层（pause 叠加在 HUD 上）
    case paused
    /// 结算（results）
    case results
}

// MARK: - 模式

/// 三种游戏模式。命名来自解包 uiscreen 文件名（inGameClassic / inGameAdventure / inGameChallenge*）。
public enum GameMode: String, Sendable, CaseIterable, Identifiable {
    /// 对应 `inGameClassic.uiscreen`
    case classic
    /// 对应 `inGameAdventure.uiscreen`
    case adventure
    /// 对应 `inGameChallengeHud.uiscreen` + inGameChallenge* 系列
    case challenge

    public var id: String { rawValue }

    /// 模式显示名。
    /// [待验证] 原版文案在 `.uiscreen` 资源内（本地化键），.uiscreen 解析器尚未实现，
    /// 此处为枚举命名派生的占位大写文案。
    public var displayName: String {
        switch self {
        case .classic: "CLASSIC"
        case .adventure: "ADVENTURE"
        case .challenge: "CHALLENGE"
        }
    }

    /// 进入该模式后应展示的 HUD 屏幕 ID。
    public var hudScreen: ScreenID {
        switch self {
        case .classic: .inGameClassic
        case .adventure: .inGameAdventure
        case .challenge: .inGameChallengeHud
        }
    }
}

// MARK: - 连击横幅

/// HUD 连击横幅的数据载体。
/// - `text`：由 App 层按原版档位文本生成（文本档位 = clamp(combo - 2, 1, 5) [macho]）；
/// - `visualTier`：视觉档位 = clamp(combo - 3, 0, 2) [macho]（见 DECISIONS T-004/T-005）；
///   UI 只按 tier 上色，**不自行推导档位**，避免逻辑层与表现层各算一套。
public struct ComboBanner: Sendable, Equatable {
    /// 当前连击数（原版 combo 计数，GameState +0x8c [both]）。
    public var count: Int
    /// 展示文本（如 "COMBO"/"SUPER COMBO" 等档位文本，由 App 层给出原文）。
    public var text: String
    /// 视觉档位 0…2。
    public var visualTier: Int
    /// 横幅可见度 0…1（由 combo 窗口计时驱动，UI 直接当 opacity 用）。
    public var opacity: Double

    public init(count: Int, text: String, visualTier: Int, opacity: Double) {
        self.count = count
        self.text = text
        self.visualTier = visualTier
        self.opacity = opacity
    }
}

// MARK: - 结算摘要

/// 单局结算摘要（results.uiscreen）。
///
/// [待验证] 字段与 FNPBCore 的对应关系需在接线任务卡中确认：
/// - `fruitsSliced` 需要一个「本局切中水果数」计数器，现有 ScoreSystem 是否暴露该值未核实；
///   若没有，App 层用 0 填充，UI 只显示 0，不会崩。
/// - `maxCombo` 同理需要一个「本局最大连击」记录（ComboTracker 当前只有当前值）。
public struct ResultSummary: Sendable, Equatable {
    public var finalScore: Int
    public var bestScore: Int
    public var isNewBest: Bool
    public var maxCombo: Int
    public var fruitsSliced: Int
    public var mode: GameMode

    public init(
        finalScore: Int,
        bestScore: Int,
        isNewBest: Bool,
        maxCombo: Int,
        fruitsSliced: Int,
        mode: GameMode
    ) {
        self.finalScore = finalScore
        self.bestScore = bestScore
        self.isNewBest = isNewBest
        self.maxCombo = maxCombo
        self.fruitsSliced = fruitsSliced
        self.mode = mode
    }
}

// MARK: - 快照

/// 界面层唯一输入。纯值、`Sendable`、无游戏类型依赖。
public struct GameSnapshot: Sendable, Equatable {

    /// 顶层阶段（App 层据此选择挂载的屏幕）。
    public var phase: UIPhase
    /// 当前模式。
    public var mode: GameMode
    /// 当前局内分数。
    public var score: Int
    /// 历史最高分。
    public var bestScore: Int
    /// 剩余生命（Classic 三振出局语义）。
    public var lives: Int
    /// 生命上限（用于决定 HUD 上画几个叉）。
    public var maxLives: Int
    /// 本局已用秒数。
    public var elapsed: TimeInterval
    /// 暂停浮层是否可见。与 `phase == .paused` 独立维护：
    /// 原版 pause.uiscreen 是叠加层，HUD 仍需绘制在下面 [待验证]。
    public var pauseVisible: Bool
    /// 连击横幅（无连击时为 nil）。
    public var combo: ComboBanner?
    /// 结算摘要（非结算阶段为 nil）。
    public var result: ResultSummary?
    /// 音效开关状态（pause 浮层上的开关）。
    public var soundOn: Bool

    public init(
        phase: UIPhase = .mainMenu,
        mode: GameMode = .classic,
        score: Int = 0,
        bestScore: Int = 0,
        lives: Int = 3,
        maxLives: Int = 3,
        elapsed: TimeInterval = 0,
        pauseVisible: Bool = false,
        combo: ComboBanner? = nil,
        result: ResultSummary? = nil,
        soundOn: Bool = true
    ) {
        self.phase = phase
        self.mode = mode
        self.score = score
        self.bestScore = bestScore
        self.lives = lives
        self.maxLives = maxLives
        self.elapsed = elapsed
        self.pauseVisible = pauseVisible
        self.combo = combo
        self.result = result
        self.soundOn = soundOn
    }

    /// 主菜单初始快照（无进行中局）。
    public static let mainMenu = GameSnapshot()
}

// MARK: - 反向意图

/// 界面 → App 层的全部反向通路。
/// 与任务卡列出的回调一一对应：
/// `onPauseTapped`→`.pause`、`onResumeTapped`→`.resume`、
/// `onRestartTapped`→`.restart`、`onQuitTapped`→`.quitToMenu`、`onModeSelected`→`.selectMode(_:)`。
public enum UIIntent: Sendable, Equatable {
    /// 主菜单 PLAY → 进入 gamemode
    case showModeSelect
    /// 选择模式并开局
    case selectMode(GameMode)
    /// 暂停
    case pause
    /// 恢复
    case resume
    /// 重开本局
    case restart
    /// 退出回主菜单
    case quitToMenu
    /// 音效开关
    case toggleSound
    /// 打开占位屏幕（v1 未实现的 15 个；App 层可忽略或暂弹提示）
    case openScreen(ScreenID)
}

/// 闭包式意图通道。
///
/// 闭包**假定在主线程调用**（SwiftUI 事件与渲染都在 MainActor）。
/// App 层（Composition Root）构造示例：
/// /// ```swift
/// let actions = UIActions { intent in
///     MainActor.assumeIsolated { model.send(intent) }   // Swift 5.9+ / iOS 17+
/// }
/// ```
/// [待验证] 若 App 层 `model` 不是 `@MainActor`，此处写法需相应调整（接线任务卡确认）。
public struct UIActions {
    public var send: (UIIntent) -> Void

    public init(_ send: @escaping (UIIntent) -> Void) {
        self.send = send
    }

    /// 空实现（预览 / 快照测试用）。
    public static var noop: UIActions { UIActions { _ in } }
}

// MARK: - ViewModel 协议

/// 单向数据流中枢：App 层实现，把游戏世界翻译成 `GameSnapshot`，并消费 `UIIntent`。
/// 典型实现是 `@Observable @MainActor final class`，每帧（或按事件）更新 `snapshot`。
@MainActor
public protocol FNPBUIViewModel: AnyObject {
    var snapshot: GameSnapshot { get }
    func send(_ intent: UIIntent)
}
