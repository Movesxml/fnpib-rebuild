//
//  GameModeScreen.swift
//  FNPBUI — 界面层 v1（T-021）
//
//  锚定 uiscreen：`gamemode.uiscreen`
//
//  主要元素：
//  - 全屏背景        语义 key `screen.gamemode.background`（[待验证] 真实文件名）
//  - 三张模式卡片    Classic / Adventure / Challenge
//                    锚点来自解包文件名：`inGameClassic.uiscreen`、`inGameAdventure.uiscreen`、
//                    `inGameChallengeHud.uiscreen`（+ inGameChallenge* 系列）
//  - 卡片配图        语义 key `screen.gamemode.card.<mode>`（[待验证] 真实文件名；缺图走色块）
//  - BACK 返回       → 主菜单
//
//  [待验证] 原版 gamemode 是否还包含锁定态（挑战模式逐关解锁，见 inGameChallengeMapScreen）
//           与「需要内购解锁」的视觉标记；v1 一律显示为可选。
//

import SwiftUI

public struct GameModeScreen: View {
    public var snapshot: GameSnapshot
    public var actions: UIActions

    public init(snapshot: GameSnapshot, actions: UIActions) {
        self.snapshot = snapshot
        self.actions = actions
    }

    public var body: some View {
        ScreenScaffold(backgroundKey: "screen.gamemode.background") {
            VStack(spacing: 16) {
                Text("SELECT MODE")
                    .font(.system(size: 26, weight: .black, design: .rounded))
                    .tracking(3)
                    .foregroundStyle(UIPalette.parchment)
                    .lineLimit(1)
                    .minimumScaleFactor(0.6)

                HStack(spacing: 16) {
                    ForEach(GameMode.allCases) { mode in
                        modeCard(mode)
                    }
                }
                .frame(maxWidth: 760)

                HStack(spacing: 12) {
                    PillButton(title: "BACK", compact: true) {
                        actions.send(.quitToMenu)
                    }
                    .frame(maxWidth: 160)

                    if snapshot.bestScore > 0 {
                        Text("BEST \(snapshot.bestScore)")
                            .font(.system(size: 14, weight: .heavy, design: .rounded).monospacedDigit())
                            .foregroundStyle(UIPalette.parchment.opacity(0.85))
                    }
                }
            }
            .padding(24)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }

    // MARK: 组件

    private func modeCard(_ mode: GameMode) -> some View {
        Button {
            actions.send(.selectMode(mode))
        } label: {
            VStack(spacing: 10) {
                ArtworkImage(
                    key: "screen.gamemode.card.\(mode.rawValue)",
                    fallback: UIPalette.placeholder
                )
                .frame(height: 110)
                .frame(maxWidth: .infinity)
                .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))

                Text(mode.displayName)
                    .font(.system(size: 18, weight: .heavy, design: .rounded))
                    .tracking(1)
                    .foregroundStyle(UIPalette.parchment)
                    .lineLimit(1)
                    .minimumScaleFactor(0.6)
            }
            .padding(12)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .fill(UIPalette.panelFill)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .strokeBorder(UIPalette.gold.opacity(0.55), lineWidth: 2)
            )
            .contentShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
        }
        .buttonStyle(.plain)
    }
}

// 疑问清单（[待验证]）：
// 1. 卡片配图与背景图真实文件名未知（语义 key 策略同上）。
// 2. 模式文案（CLASSIC/ADVENTURE/CHALLENGE）为枚举名派生占位，原文案在 .uiscreen 内。
// 3. Challenge 是否需要先进 inGameChallengeMapScreen（地图）而非直接开局，未确认；
//    当前统一发 `.selectMode(.challenge)`，由 App 层决定是否插入地图流程。
// 4. 三卡横排在窄屏（竖屏 iPhone）会挤压；v1 只保证横屏正确，竖屏靠 minimumScaleFactor 兜底。
