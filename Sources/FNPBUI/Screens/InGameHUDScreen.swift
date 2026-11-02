//
//  InGameHUDScreen.swift
//  FNPBUI
//
//  Classic 生命布局取自 inGameClassic.uiscreen 的 480×320 逻辑画布。
//  active/backing 分别使用 hud_cross 图集的红心／灰心区域，不用 misspool 叉号代替。
//  分数字体、连击文案、暂停图标仍是既有占位，不代表这些子系统已完成原版视觉重建。
//

import SwiftUI

public struct InGameHUDScreen: View {
    public var snapshot: GameSnapshot
    public var actions: UIActions

    private struct HeartLayout {
        var index: Int
        var activePosition: CGPoint
        var backingPosition: CGPoint
        var size: CGFloat
    }

    /// backing* 与 cross* 的 originFromCenter 均已开启，所以这些坐标是中心点。
    /// 保留原浮点值及 backing/cross 的 0.5px 纵向差，而不是凑整后改变相对位置。
    private static let heartLayouts = [
        HeartLayout(index: 1,
                    activePosition: CGPoint(x: 386.9993896484375, y: 16),
                    backingPosition: CGPoint(x: 386.9993896484375, y: 16), size: 28),
        HeartLayout(index: 2,
                    activePosition: CGPoint(x: 419.9993896484375, y: 18.5),
                    backingPosition: CGPoint(x: 419.9993896484375, y: 19), size: 35),
        HeartLayout(index: 3,
                    activePosition: CGPoint(x: 458.99994015157275, y: 21.5),
                    backingPosition: CGPoint(x: 458.99994015157275, y: 22), size: 42)
    ]

    public init(snapshot: GameSnapshot, actions: UIActions) {
        self.snapshot = snapshot
        self.actions = actions
    }

    public var body: some View {
        GeometryReader { proxy in
            let canvasScale = min(proxy.size.width / 480, proxy.size.height / 320)

            ZStack {
                scoreBlock
                    .padding(.horizontal, proxy.size.width >= proxy.size.height ? 34 : 18)
                    .padding(.vertical, proxy.size.width >= proxy.size.height ? 16 : 10)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .allowsHitTesting(false)

                comboOverlay
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .allowsHitTesting(false)

                if snapshot.mode == .classic {
                    classicHearts(canvasScale: canvasScale, canvasOrigin: CGPoint(
                        x: (proxy.size.width - 480 * canvasScale) / 2,
                        y: (proxy.size.height - 320 * canvasScale) / 2
                    ))
                    .allowsHitTesting(false)
                }

                if let challenge = snapshot.challenge {
                    challengeHUD(challenge)
                }

                // 原 pause 位于逻辑画布 (0,320)，不是右上角；美术与触摸尺寸仍待闭合。
                pauseButton
                    .padding(.horizontal, proxy.size.width >= proxy.size.height ? 34 : 18)
                    .padding(.vertical, proxy.size.width >= proxy.size.height ? 16 : 10)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
            }
            .frame(width: proxy.size.width, height: proxy.size.height)
        }
        .background(Color.clear)
    }

    // MARK: 挑战实时状态与结果导航

    private func challengeHUD(_ challenge: ChallengeHUDState) -> some View {
        ZStack {
            if challenge.hudVisible {
                VStack(spacing: 3) {
                    Text(challenge.challengeName)
                        .font(.system(size: 17, weight: .heavy, design: .rounded))
                        .lineLimit(2)
                        .multilineTextAlignment(.center)
                    Text("ROUND \(challenge.roundNumber) / \(challenge.roundCount)")
                        .font(.system(size: 12, weight: .bold, design: .rounded).monospacedDigit())
                    if let remaining = challenge.timeRemaining, challenge.timerVisible {
                        Text("\(max(0, Int(ceil(remaining)))) s")
                            .font(.system(size: 24, weight: .black, design: .rounded).monospacedDigit())
                    }
                }
                .foregroundStyle(UIPalette.parchment)
                .padding(.horizontal, 16)
                .padding(.vertical, 9)
                .background(RoundedRectangle(cornerRadius: 14).fill(Color.black.opacity(0.35)))
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .padding(.top, 14)
                .allowsHitTesting(false)
            }

            if let map = challenge.map {
                VStack(spacing: 12) {
                    Text("CHALLENGE MAP")
                        .font(.system(size: 24, weight: .black, design: .rounded))
                        .foregroundStyle(UIPalette.parchment)
                    ForEach(map.rounds) { round in
                        HStack(spacing: 10) {
                            if let iconIndex = round.iconIndex,
                               let icon = UIArtwork.challengeIcon(iconIndex) {
                                Image(uiImage: icon)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 52, height: 52)
                            }
                            PillButton(
                                title: "\(round.id + 1). \(round.challengeName)",
                                prominent: round.outcomeRawValue == nil,
                                compact: true
                            ) {
                                actions.send(.selectChallengeMapRound(round.id))
                            }
                        }
                        .disabled(!map.canSelect || round.outcomeRawValue != nil)
                        .opacity(round.outcomeRawValue == nil ? 1 : 0.55)
                    }
                }
                .padding(20)
                .background(RoundedRectangle(cornerRadius: 20).fill(UIPalette.panelFill))
                .padding(.horizontal, 24)
            }

            if challenge.resultRawValue != nil,
               challenge.backgroundVisible,
               challenge.resultVisible || challenge.resultFinished {
                VStack(spacing: 14) {
                    Text(challenge.resultRawValue == 1 ? "ROUND COMPLETE" : "ROUND FAILED")
                        .font(.system(size: 27, weight: .black, design: .rounded))
                        .foregroundStyle(UIPalette.parchment)
                    if challenge.resultFinished {
                        HStack(spacing: 12) {
                            if challenge.canAdvance {
                                PillButton(title: "NEXT", prominent: true, compact: true) {
                                    actions.send(.nextChallengeRound)
                                }
                            }
                            PillButton(title: "MAP", compact: true) {
                                actions.send(.cleanupChallenge)
                            }
                        }
                        .frame(maxWidth: 360)
                    }
                }
                .padding(24)
                .background(RoundedRectangle(cornerRadius: 20).fill(UIPalette.panelFill))
                .padding(.horizontal, 24)
            }

            if let bonus = challenge.bonus, bonus.resultVisible {
                challengeBonusPanel(bonus)
            }

            if let error = challenge.errorMessage {
                Text(error)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(UIPalette.parchment)
                    .multilineTextAlignment(.center)
                    .padding(16)
                    .background(RoundedRectangle(cornerRadius: 14).fill(UIPalette.accent))
                    .padding(24)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            }
        }
    }

    /// 仅投影独立 bonus 状态机的真实数值；原版图集与 UISF 坐标尚未闭合。
    private func challengeBonusPanel(_ bonus: ChallengeBonusHUDState) -> some View {
        VStack(spacing: 10) {
            Text("BONUS")
                .font(.system(size: 13, weight: .heavy, design: .rounded))
                .tracking(2)
                .foregroundStyle(UIPalette.parchment.opacity(0.85))
            Text("\(bonus.scoreCounterValue)")
                .font(.system(size: 40, weight: .black, design: .rounded).monospacedDigit())
                .foregroundStyle(UIPalette.parchment)
                .lineLimit(1)
                .minimumScaleFactor(0.6)
            HStack(spacing: 22) {
                VStack(spacing: 2) {
                    Text("FINALE")
                        .font(.system(size: 11, weight: .heavy, design: .rounded))
                    Text("\(bonus.finaleScore)")
                        .font(.system(size: 22, weight: .black, design: .rounded).monospacedDigit())
                }
                VStack(spacing: 2) {
                    Text("LIVES")
                        .font(.system(size: 11, weight: .heavy, design: .rounded))
                    Text("\(bonus.displayedLives) / 3")
                        .font(.system(size: 22, weight: .black, design: .rounded).monospacedDigit())
                }
            }
            .foregroundStyle(UIPalette.parchment)
            HStack(spacing: 8) {
                ForEach(0..<3, id: \.self) { index in
                    let visible = index < bonus.lifeScoreVisible.count
                        && bonus.lifeScoreVisible[index]
                    Circle()
                        .fill(visible ? UIPalette.gold : Color.black.opacity(0.25))
                        .frame(width: 18, height: 18)
                        .overlay(Circle().stroke(
                            UIPalette.parchment.opacity(visible ? 0.90 : 0.35), lineWidth: 1))
                }
            }
            if bonus.isBonusFinished {
                Text("BONUS COMPLETE")
                    .font(.system(size: 12, weight: .bold, design: .rounded))
                    .foregroundStyle(UIPalette.parchment.opacity(0.80))
            }
        }
        .padding(20)
        .background(RoundedRectangle(cornerRadius: 20).fill(UIPalette.panelFill))
        .padding(.horizontal, 24)
        .allowsHitTesting(false)
    }

    // MARK: 原图集生命图标

    private func classicHearts(canvasScale: CGFloat, canvasOrigin: CGPoint) -> some View {
        ZStack {
            ForEach(Self.heartLayouts, id: \.index) { layout in
                let side = layout.size * canvasScale
                let activePosition = CGPoint(
                    x: canvasOrigin.x + layout.activePosition.x * canvasScale,
                    y: canvasOrigin.y + layout.activePosition.y * canvasScale
                )
                let backingPosition = CGPoint(
                    x: canvasOrigin.x + layout.backingPosition.x * canvasScale,
                    y: canvasOrigin.y + layout.backingPosition.y * canvasScale
                )
                let heart = snapshot.classicHearts.first { $0.index == layout.index }

                ArtworkImage(key: "classicHeartBacking", fallback: .clear, contentMode: .fit)
                    .frame(width: side, height: side)
                    .position(backingPosition)
                if let heart {
                    ArtworkImage(key: "classicHeartActive", fallback: .clear, contentMode: .fit)
                        .frame(width: side, height: side)
                        .scaleEffect(heart.scale)
                        .position(activePosition)
                }
            }
        }
    }

    // MARK: 既有占位控件

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
        }
    }

    private func comboColor(_ tier: Int) -> Color {
        switch min(max(tier, 0), 2) {
        case 0: UIPalette.gold
        case 1: Color(red: 1.00, green: 0.58, blue: 0.16)
        default: UIPalette.accent
        }
    }
}
