//
//  ResultsScreen.swift
//  FNPBUI — 界面层 v1（T-021）
//
//  锚定 uiscreen：`results.uiscreen`
//
//  主要元素：
//  - 全屏背景        语义 key `screen.results.background`（[待验证] 真实文件名）
//  - RESULTS 标题
//  - 最终分数        大字（ResultSummary.finalScore）
//  - NEW BEST 徽章    isNewBest 时显示
//  - BEST / MAX COMBO / FRUIT 三列统计
//  - RESTART → `.restart`；MENU → `.quitToMenu`
//
//  ⚠️ `GameSnapshot.result == nil` 时用 score/bestScore 兜底渲染（不会崩、不显示假数据）。
//
//  疑问清单见文件末尾。
//

import SwiftUI

public struct ResultsScreen: View {
    public var snapshot: GameSnapshot
    public var actions: UIActions

    public init(snapshot: GameSnapshot, actions: UIActions) {
        self.snapshot = snapshot
        self.actions = actions
    }

    /// 无结算数据时的兜底（保证版面稳定）。
    private var summary: ResultSummary {
        snapshot.result ?? ResultSummary(
            finalScore: snapshot.score,
            bestScore: snapshot.bestScore,
            isNewBest: false,
            maxCombo: 0,
            fruitsSliced: 0,
            mode: snapshot.mode
        )
    }

    public var body: some View {
        ScreenScaffold(backgroundKey: "screen.results.background") {
            VStack(spacing: 14) {
                Text("RESULTS")
                    .font(.system(size: 22, weight: .heavy, design: .rounded))
                    .tracking(5)
                    .foregroundStyle(UIPalette.parchment.opacity(0.85))

                Text("\(summary.finalScore)")
                    .font(.system(size: 72, weight: .black, design: .rounded).monospacedDigit())
                    .foregroundStyle(UIPalette.gold)
                    .shadow(color: Color.black.opacity(0.45), radius: 6, x: 0, y: 3)
                    .lineLimit(1)
                    .minimumScaleFactor(0.4)

                if summary.isNewBest {
                    newBestBadge
                }

                HStack(spacing: 14) {
                    stat(title: "BEST", value: "\(summary.bestScore)")
                    stat(title: "MAX COMBO", value: "\(summary.maxCombo)")
                    stat(title: "FRUIT", value: "\(summary.fruitsSliced)")
                }

                HStack(spacing: 12) {
                    // 原版 results.uiscreen：retry = MENU_TEXTURE_37 "RETRY"、back = MENU_TEXTURE_30 "BACK"。
                    PillButton(title: UIStrings.text("MENU_TEXTURE_37", fallback: "RESTART"),
                               prominent: true) {
                        actions.send(.restart)
                    }
                    PillButton(title: UIStrings.text("MENU_TEXTURE_30", fallback: "MENU")) {
                        actions.send(.quitToMenu)
                    }
                }
                .frame(maxWidth: 520)
                .padding(.top, 4)
            }
            .padding(24)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }

    // MARK: 组件

    private var newBestBadge: some View {
        // 原版 results.uiscreen 的 newBest 用 GAME_TEXTURE_02 = "NEW BEST!"。
        Text(UIStrings.text("GAME_TEXTURE_02", fallback: "NEW BEST"))
            .font(.system(size: 14, weight: .black, design: .rounded))
            .tracking(3)
            .foregroundStyle(UIPalette.ink)
            .padding(.horizontal, 14)
            .padding(.vertical, 6)
            .background(Capsule().fill(UIPalette.gold))
    }

    private func stat(title: String, value: String) -> some View {
        VStack(spacing: 2) {
            Text(title)
                .font(.system(size: 11, weight: .heavy, design: .rounded))
                .tracking(2)
                .foregroundStyle(UIPalette.parchment.opacity(0.75))
            Text(value)
                .font(.system(size: 22, weight: .black, design: .rounded).monospacedDigit())
                .foregroundStyle(UIPalette.parchment)
                .lineLimit(1)
                .minimumScaleFactor(0.6)
        }
        .frame(minWidth: 110)
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
        .background(
            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .fill(Color.black.opacity(0.30))
        )
    }
}

// 疑问清单（[待验证]）：
// 1. `results.uiscreen` 实际展示的统计项未提取（原版可能只有分数 + 最佳分数 + 返回）。
//    MAX COMBO / FRUIT 两列是**假设的原版元素**，需要 .uiscreen XML 或截图确认后才能算数。
// 2. `isNewBest` 的判定（是否严格大于历史最高、是否含 0 分特例）属 App 层；
//    存档键名沿用原版（见 FNPBPlatform 存档映射表）。
// 3. 原版结算页可能有「继续 / 分享 / 内购解锁」入口（UpsellScreen），v1 未做。
// 4. 失败结算（Challenge）走的是 inGameChallengeScoreScreenCompleteFailure.uiscreen，
//    与 results 不是同一屏，v1 未实现。
