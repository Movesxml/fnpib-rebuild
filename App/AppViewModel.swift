//
//  AppViewModel.swift
//  App
//
//  T-022：UI 会话状态机 + 每帧快照组装（FNPBUI 单向数据流的 App 侧实现）
//
//  ┌────────────┐   handleFrame 末尾 refreshSnapshot()   ┌───────────────┐
//  │  GameHost  │ ────────────────────────────────────▶ │ AppViewModel  │
//  │  （逻辑层）│ ◀──────────────────────────────────── │  （UI 会话层）│
//  └────────────┘    send(UIIntent) → 流程方法           └───────────────┘
//                                                               │ snapshot / actions
//                                                               ▼
//                                                         FNPBUI 五屏
//
//  【持有关系（防环）】
//    GameHost ──强持有──▶ AppViewModel   （FNPBApp.swift: private(set) lazy var viewModel）
//    AppViewModel ──weak──▶ GameHost
//    ⇒ 两个方向只保留一条强引用。**不要**把 host 改成强引用（会与 lazy 持有形成保留环）。
//
//  【Swift 6 隔离】
//    全类 @MainActor。FNPBUI 的 UIActions 刻意不带隔离标注（见 GameSnapshot.swift 注释），
//    因此 actions 闭包内用 MainActor.assumeIsolated 回到主 actor —— 触发源必然是 SwiftUI
//    Button 的 action，运行在主线程。iOS 26 部署目标下该 API 可用。
//
//  【[待验证] 集中清单】见本回复末尾风险点 2/3/4/8/9；文件内每个猜测点都有同名标注。
//

import Foundation
import Observation

import FNPBCore
import FNPBUI

@Observable
@MainActor
final class AppViewModel: FNPBUIViewModel {

    // MARK: - 输出（视图唯一输入）

    private(set) var snapshot: GameSnapshot

    // MARK: - 会话状态

    /// 当前阶段。与 `snapshot.phase` 同步（refreshSnapshot 负责落盘）。
    private(set) var phase: UIPhase = .mainMenu

    /// 当前模式（结算摘要与最高分键都依赖它）。
    private(set) var mode: GameMode = .classic

    /// 音效开关（镜像 AudioEngine.masterVolume 的布尔语义，持久化见 GameHost.applySoundEnabled）。
    private(set) var soundEnabled: Bool

    /// 本局最大连击（ResultSummary 需要；ComboTracker 只保留当前值）。
    private(set) var maxComboSeen: Int = 0

    /// 本局结算摘要（仅在 phase == .results 时非 nil）。
    private(set) var result: ResultSummary?

    /// 逻辑层宿主。**weak**：宿主强持有本对象（FNPBApp.swift）。
    private(set) weak var host: GameHost?

    /// combo 窗口重置值（core_logic_notes §1.1：触发后重置 0.1，combo>9 时 0.095 封顶）。
    /// [待验证] Constants 中无对应命名常量，此处按笔记字面量落一个局部常量。
    private static let comboWindow: Float = 0.1

    // MARK: - 构造

    init(host: GameHost) {
        self.host = host
        self.soundEnabled = host.isSoundEnabled
        self.snapshot = GameSnapshot(
            phase: .mainMenu,
            mode: .classic,
            score: 0,
            bestScore: 0,
            lives: Int(Constants.MissPenalty.threshold), // Classic 三振近似 [待验证]
            elapsed: 0,      // [待验证] 本局计时未接线，v1 HUD 不显示
            pauseVisible: false,
            combo: ComboBanner(count: 0, text: Self.comboText(textTier: 1), visualTier: 0, opacity: 0),
            result: nil
        )
    }

    // MARK: - 意图入口（FNPBUIViewModel）

    /// 视图侧动作出口。
    ///
    /// [Kimi 修正 T-022 审查] UIActions 的 init 是无标签单闭包（见 GameSnapshot.swift）。
    var actions: UIActions {
        UIActions({ [weak self] intent in
            MainActor.assumeIsolated {
                self?.send(intent)
            }
        })
    }

    /// 全部 UIIntent 的落地实现（case 表以 GameSnapshot.swift 的 UIIntent 为准）。
    func send(_ intent: UIIntent) {
        switch intent {
        case .selectMode(let selected):
            startGame(mode: selected)

        case .showModeSelect:
            guard phase == .mainMenu else { return }
            phase = .modeSelect
            refreshSnapshot()

        case .pause:
            pauseGame()

        case .resume:
            resumeGame()

        case .restart:
            restartGame()

        case .quitToMenu:
            quitToMenu()

        case .toggleSound:
            toggleSound()

        case .openScreen:
            // v1 占位屏幕（extras/shop/about 等 15 个）无视图，静默忽略。
            break
        }
    }

    // MARK: - 流程（供 send 与 GameHost 调用）

    /// 只有真实内容开局成功才进入 playing；失败保留当前界面与诊断。
    func startGame(mode selected: GameMode) {
        guard let host, host.startGame(mode: selected) else {
            refreshSnapshot()
            return
        }
        self.mode = selected
        self.maxComboSeen = 0
        self.result = nil
        phase = .playing
        refreshSnapshot()
    }

    /// 暂停：停 DisplayLink（逻辑帧冻结），保留现场。
    func pauseGame() {
        guard phase == .playing, let host else { return }
        host.pauseGame()
        phase = .paused
        refreshSnapshot()
    }

    /// 继续：重启 DisplayLink。
    func resumeGame() {
        guard phase == .paused, let host else { return }
        phase = .playing
        host.resumeGame()
        refreshSnapshot()
    }

    /// 重开成功后才清理结算并进入 playing；失败保留当前会话。
    func restartGame() {
        guard let host, host.restart() else {
            refreshSnapshot()
            return
        }
        maxComboSeen = 0
        result = nil
        phase = .playing
        refreshSnapshot()
    }

    /// 回主菜单：停 DisplayLink 并持久化。
    func quitToMenu() {
        host?.quitToMenu()
        maxComboSeen = 0
        result = nil
        phase = .mainMenu
        refreshSnapshot()
    }

    /// 音效开关：切 AudioEngine.masterVolume 并写存档（收敛在 GameHost 内）。
    func toggleSound() {
        guard let host else { return }
        soundEnabled.toggle()
        host.applySoundEnabled(soundEnabled)
    }

    /// 结算入口。Classic 控制器依次等待 game_over、game_over_real 完成，
    /// 进入 +0x44==4 后由 GameHost 调用；三振和炸弹命中本身不直接显示结算。
    func finishGame() {
        guard phase == .playing || phase == .paused, let host else { return }

        let finalScore = Int(host.currentScore)
        let previousBest = Int(host.bestScore(for: mode))
        let best = Int(host.recordBestScore(host.currentScore, for: mode))

        let summary = ResultSummary(
            finalScore: finalScore,
            bestScore: best,
            isNewBest: finalScore > previousBest,
            maxCombo: maxComboSeen,
            fruitsSliced: Int(host.currentTotalFruitSliced),   // ← StatsRecorder 键 totalfruit
            mode: mode
        )

        result = summary
        phase = .results
        host.endGame()          // 停 DisplayLink：结算界面不再驱动逻辑
        refreshSnapshot()
    }

    // MARK: - 快照组装（GameHost.handleFrame 末尾调用）

    /// 用当前逻辑状态刷新 `snapshot`。
    ///
    /// 等值去抖：`GameSnapshot` 是 Equatable，值未变时不赋值 → 不触发 Observation 失效，
    /// 避免 120Hz 下 SwiftUI 每帧无条件重建视图树。
    func refreshSnapshot() {
        guard let host else { return }
        let state = host.currentState
        let comboCount = Int(state.comboCount)

        if comboCount > maxComboSeen {
            maxComboSeen = comboCount
        }

        var next = snapshot
        next.phase = phase
        next.mode = mode
        next.score = Int(host.currentScore)
        next.bestScore = Int(host.bestScore(for: mode))
        next.lives = max(0, Int(Constants.MissPenalty.threshold) - Int(state.missedFruitCount))
        next.classicHearts = mode == .classic ? host.classicHearts : []
        next.combo = comboBanner(count: comboCount, windowTimer: state.comboWindowTimer)
        next.pauseVisible = (phase == .paused)
        if phase == .results {
            next.result = result
        }

        if next != snapshot {
            snapshot = next
        }
    }

    // MARK: - 私有

    /// combo 横幅。
    ///
    /// 档位双源确认（DECISIONS T-004 / T-005）：
    ///   视觉档位 = clamp(combo − 3, 0, 2)；文本档位 = clamp(combo − 2, 1, 5)。
    private func comboBanner(count: Int, windowTimer: Float) -> ComboBanner {
        let visualTier = min(max(count - 3, 0), 2)
        let textTier = min(max(count - 2, 1), 5)

        // [待验证] 可见度方向：§1.2 步骤 9 记 `+0x174` 为「推进 → 到期结算」，
        // 故按「累加到 0.1 结算」取 1 − t/0.1。若为递减式，仅改此式。
        let opacity: Double = {
            guard count > 0 else { return 0 }
            let remaining = 1 - windowTimer / Self.comboWindow
            return Double(min(max(remaining, 0), 1))
        }()

        return ComboBanner(
            count: count,
            text: Self.comboText(textTier: textTier),
            visualTier: visualTier,
            opacity: opacity
        )
    }

    /// [待验证] 档位文案：原版 5 档文案在 `.uiscreen` 资源（本地化键）内，解析器尚未实现，
    /// 故统一占位 "COMBO"，不臆造原文。
    private static func comboText(textTier: Int) -> String {
        _ = textTier
        return "COMBO"
    }
}
