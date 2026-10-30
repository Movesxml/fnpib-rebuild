//
//  InGameHUDScreen.swift
//  FNPBUI — 界面层 v1（T-021）
//
//  锚定 uiscreen：`inGameClassic.uiscreen`（v1 只做 Classic HUD；
//  Adventure / Challenge HUD 见占位 ID `inGameAdventure` / `inGameChallengeHud`）
//
//  主要元素：
//  - 左上角分数块      score（[exe] `ComponentScore` / `HUDControl` 类存在）
//  - 右上角暂停按钮    → `.pause`（进入 `pause.uiscreen` 浮层）
//  - 屏幕中央连击横幅  combo（档位由 App 层算好，UI 只上色；
//                      视觉档位 clamp(combo-3,0,2) [macho]）
//  - 左下角生命标记    lives / maxLives（[待验证] 原版用叉号图标与 3 次上限）
//
//  ⚠️ 本屏是**叠加层**：不画背景（背景由游戏渲染层负责），空白区域不拦截触摸，
//     只有暂停按钮可点。`allowsHitTesting(false)` 只包在装饰元素上。
//
//  疑问清单见文件末尾。
//

import SwiftUI

public struct InGameHUDScreen: View {
    public var snapshot: GameSnapshot
    public var actions: UIActions

    public init(snapshot: GameSnapshot, actions: UIActions) {
        self.snapshot = snapshot
        self.actions = actions
    }

    public var body: some View {
        GeometryReader { proxy in
            let isLandscape = proxy.size.width >= proxy.size.height
            VStack(spacing: 0) {
                topRow
                Spacer(minLength: 0)
                comboOverlay
                Spacer(minLength: 0)
                bottomRow
            }
            .padding(.horizontal, isLandscape ? 34 : 18)
            .padding(.vertical, isLandscape ? 16 : 10)
            .frame(width: proxy.size.width, height: proxy.size.height)
        }
        // HUD 整体透明；触摸事件穿透到下方渲染视图（暂停按钮自身仍可点）。
        .background(Color.clear)
    }

    // MARK: 顶栏

    private var topRow: some View {
        HStack(alignment: .top, spacing: 16) {
            scoreBlock
                .allowsHitTesting(false)
            Spacer(minLength: 0)
            pauseButton
        }
    }

    private var scoreBlock: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("SCORE")
                .font(.system(size: 11, weight: .heavy, design: .rounded))
                .tracking(2)
                .foregroundStyle(UIPalette.parchment.opacity(0.80))
            Text("\(snapshot.score)")
                .font(.system(size: 38, weight: .black, design: .rounded).monospacedDigit())
                .foregroundStyle(UIPalette.parchment)
                .lineLimit(1)
                .minimumScaleFactor(0.6)
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 8)
        .background(
            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .fill(Color.black.opacity(0.30))
        )
    }

    private var pauseButton: some View {
        // [待验证] 原版暂停按钮用贴图（pause.uiscreen 相关素材）；此处用 SF Symbol 占位。
        Button {
            actions.send(.pause)
        } label: {
            Image(systemName: "pause.fill")
                .font(.system(size: 20, weight: .black))
                .foregroundStyle(UIPalette.ink)
                .frame(width: 52, height: 52)
                .background(Circle().fill(UIPalette.gold))
        }
        .buttonStyle(.plain)
        .accessibilityLabel(Text("Pause"))
    }

    // MARK: 连击横幅

    @ViewBuilder
    private var comboOverlay: some View {
        if let combo = snapshot.combo, combo.opacity > 0.01 {
            VStack(spacing: 0) {
                Text(combo.text)
                    .font(.system(size: 44, weight: .black, design: .rounded))
                    .foregroundStyle(comboColor(combo.visualTier))
                    .shadow(color: Color.black.opacity(0.55), radius: 6, x: 0, y: 3)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                Text("x\(combo.count)")
                    .font(.system(size: 18, weight: .heavy, design: .rounded).monospacedDigit())
                    .foregroundStyle(UIPalette.parchment)
            }
            .padding(.horizontal, 24)
            .opacity(combo.opacity)
            .allowsHitTesting(false)
        }
    }

    /// 视觉档位配色：0/1/2 三档（clamp 已在 App 层完成，这里再夹一次防越界）。
    private func comboColor(_ tier: Int) -> Color {
        switch min(max(tier, 0), 2) {
        case 0: UIPalette.gold
        case 1: Color(red: 1.00, green: 0.58, blue: 0.16)
        default: UIPalette.accent
        }
    }

    // MARK: 底栏

    private var bottomRow: some View {
        HStack(alignment: .bottom) {
            livesRow
                .allowsHitTesting(false)
            Spacer(minLength: 0)
            // [待验证] 原版 HUD 右下角疑似有波次/进度指示（WaveManager 相关），
            // 语义未闭合前不画，避免臆造。
        }
    }

    private var livesRow: some View {
        HStack(spacing: 6) {
            // [待验证] 原版生命图标为叉号（三振出局），上限 3；用 SF Symbol 占位。
            ForEach(0..<max(snapshot.maxLives, 0), id: \.self) { index in
                Image(systemName: "xmark")
                    .font(.system(size: 17, weight: .black))
                    .foregroundStyle(
                        index < snapshot.lives
                            ? UIPalette.accent
                            : UIPalette.parchment.opacity(0.22)
                    )
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(
            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .fill(Color.black.opacity(0.30))
        )
    }
}

// 疑问清单（[待验证]）：
// 1. 生命数量上限与扣血规则（切炸弹是否 -1）未从 macho 闭合；HUD 只是显示 `lives/maxLives`。
// 2. 分数块在屏幕上的实际锚点（mainscreen/inGameClassic.uiscreen 坐标）未提取。
// 3. Classic 模式是否显示计时（原版 Classic 无倒计时，Challenge 才有）——
//    本 HUD 故意不画计时，`GameSnapshot.elapsed` 仅留给 Challenge HUD 卡。
// 4. `inGameClassic.uiscreen` 可能还含道具/特殊果提示位；无证据不实现。
// 5. 暂停按钮的触达区域 52pt 是自定值，不是原版尺寸。
