//
//  MainMenuScreen.swift
//  FNPBUI — 界面层 v1（T-021）
//
//  锚定 uiscreen：`mainscreen.uiscreen`
//
//  主要元素（含证据来源）：
//  - 全屏背景     语义 key `screen.mainscreen.background`（[待验证] 真实文件名）
//  - 标题 LOGO    macho 内含标题串 "Fruit Ninja: Puss In Boots" [macho] → 用文字实现
//  - PLAY 主按钮  进入 `gamemode`（[待验证] 原版是否直接开局、跳过模式选择）
//  - EXTRAS       [exe] `ExtrasScreen` 类存在 → `extras.uiscreen`（占位屏幕）
//  - SHOP         [exe] `UpsellScreen` 类存在 → `shopScreen.uiscreen`（占位屏幕）
//  - ABOUT        `about.uiscreen` 文件存在；入口位置 [待验证]
//  - 最高分       [待验证] 原版主菜单是否展示 best score；此处仅在 > 0 时显示
//
//  疑问清单见文件末尾。
//

import SwiftUI

public struct MainMenuScreen: View {
    public var snapshot: GameSnapshot
    public var actions: UIActions

    public init(snapshot: GameSnapshot, actions: UIActions) {
        self.snapshot = snapshot
        self.actions = actions
    }

    public var body: some View {
        ScreenScaffold(backgroundKey: "screen.mainscreen.background") {
            VStack(spacing: 0) {
                Spacer(minLength: 8)
                titleBlock
                Spacer(minLength: 8)
                PillButton(title: "PLAY", prominent: true) {
                    actions.send(.showModeSelect)
                }
                .frame(maxWidth: 280)
                Spacer(minLength: 12)
                secondaryRow
                Spacer(minLength: 8)
                bestScoreRow
            }
            .padding(.horizontal, 40)
            .padding(.vertical, 20)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }

    // MARK: 组件

    private var titleBlock: some View {
        VStack(spacing: 2) {
            Text("FRUIT NINJA")
                .font(.system(size: 54, weight: .black, design: .rounded))
                .foregroundStyle(UIPalette.gold)
                .shadow(color: Color.black.opacity(0.45), radius: 6, x: 0, y: 3)
            Text("PUSS IN BOOTS")
                .font(.system(size: 20, weight: .heavy, design: .rounded))
                .tracking(5)
                .foregroundStyle(UIPalette.parchment)
        }
        .lineLimit(1)
        .minimumScaleFactor(0.5)
    }

    private var secondaryRow: some View {
        HStack(spacing: 12) {
            PillButton(title: "EXTRAS", compact: true) {
                actions.send(.openScreen(.extras))
            }
            PillButton(title: "SHOP", compact: true) {
                actions.send(.openScreen(.shop))
            }
            PillButton(title: "ABOUT", compact: true) {
                actions.send(.openScreen(.about))
            }
        }
        .frame(maxWidth: 520)
    }

    @ViewBuilder
    private var bestScoreRow: some View {
        if snapshot.bestScore > 0 {
            HStack(spacing: 8) {
                Text("BEST")
                Text("\(snapshot.bestScore)")
                    .font(.system(size: 16, weight: .black, design: .rounded).monospacedDigit())
            }
            .font(.system(size: 14, weight: .bold, design: .rounded))
            .foregroundStyle(UIPalette.parchment.opacity(0.85))
        }
    }
}

// 疑问清单（[待验证]）：
// 1. `mainscreen.uiscreen` 内按钮的实际锚点坐标 / 层级未提取（.uiscreen XML 解析器尚未实现）。
// 2. 背景贴图在 assets_png 中的真实文件名未知 → 走语义 key + 色块回落，禁止臆造文件名。
// 3. PLAY 是否直达 classic 模式（跳过 gamemode）未确认；现按「先进模式选择」接线。
// 4. 主菜单是否展示 best score 未确认（无证据则宁可不显示：现仅在 > 0 时显示）。
// 5. 竖屏适配为「按比例堆叠 + minimumScaleFactor」的简单兜底，未做专门布局 [待验证]。
