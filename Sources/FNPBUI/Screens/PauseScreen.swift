//
//  PauseScreen.swift
//  FNPBUI — 界面层 v1（T-021）
//
//  锚定 uiscreen：`pause.uiscreen`
//
//  主要元素：
//  - 全屏半透明遮罩（HUD 仍透出，符合叠加层语义）
//  - 面板：PAUSED 标题
//  - RESUME   → `.resume`
//  - RESTART  → `.restart`
//  - QUIT     → `.quitToMenu`
//  - 音效开关 → `.toggleSound`（[待验证] 原版 pause 页是否有音效开关；
//               状态位来自 GameSnapshot.soundOn，App 层负责持久化）
//
//  ⚠️ 本视图**不判断**是否该显示：`GameSnapshot.pauseVisible` 的判定与挂载由 App 层完成，
//     避免视图内出现两套可见性来源。
//
//  疑问清单见文件末尾。
//

import SwiftUI

public struct PauseScreen: View {
    public var snapshot: GameSnapshot
    public var actions: UIActions

    public init(snapshot: GameSnapshot, actions: UIActions) {
        self.snapshot = snapshot
        self.actions = actions
    }

    public var body: some View {
        ZStack {
            UIPalette.scrim
                .ignoresSafeArea()

            VStack(spacing: 12) {
                Text("PAUSED")
                    .font(.system(size: 28, weight: .black, design: .rounded))
                    .tracking(4)
                    .foregroundStyle(UIPalette.parchment)
                    .padding(.bottom, 4)

                PillButton(title: "RESUME", prominent: true) {
                    actions.send(.resume)
                }

                PillButton(title: "RESTART") {
                    actions.send(.restart)
                }

                PillButton(title: "QUIT") {
                    actions.send(.quitToMenu)
                }

                PillButton(
                    title: snapshot.soundOn ? "SOUND: ON" : "SOUND: OFF",
                    compact: true
                ) {
                    actions.send(.toggleSound)
                }
                .padding(.top, 4)
            }
            .frame(maxWidth: 360)
            .padding(24)
            .background(
                RoundedRectangle(cornerRadius: 26, style: .continuous)
                    .fill(UIPalette.panelFill)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 26, style: .continuous)
                    .strokeBorder(UIPalette.gold.opacity(0.50), lineWidth: 2)
            )
            .padding(24)
        }
    }
}

// 疑问清单（[待验证]）：
// 1. 原版 pause.uiscreen 的按钮集合与顺序未提取（QUIT / RESTART 是否存在需从 .uiscreen XML 确认）。
// 2. 是否有音效/音乐分离开关、是否有「继续购买」类按钮（UpsellScreen 可能挂在这里）均未确认。
// 3. 暂停时游戏主循环是否完全冻结（macho 的 dt 兜底分支见 core_logic_notes §1.2 步骤 1），
//    属 App 层/GameWorld 职责，本视图不涉及。
