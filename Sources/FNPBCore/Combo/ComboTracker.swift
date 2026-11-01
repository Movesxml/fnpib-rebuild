//
//  ComboTracker.swift
//  FNPBCore
//
//  ComboTracking 协议实现（T-013）
//
//  来源：findings/core_logic_notes.md
//    §1.2 步骤 6.4（registerSlice）[both]
//    §1.2 步骤 9   （tickWindow / 结算）[both]
//    §2.2 分支全链（档位 / 事件）[both]
//    数值：Constants.Combo（DECISIONS T-004 M41 双源确认）
//
//  【范围】只做逻辑，不碰 UI；事件经 ComboEvent 交由调用方（GameWorld 步骤 9）分发。
//  【签名边界】ComboTracking 的方法签名集中声明于 GameWorld.swift；修改时必须
//  同步全部实现、测试替身与生产调用点，并传齐原主循环需要的实体状态。
//

import Foundation

public final class ComboTracker: ComboTracking {

    // MARK: - 注入配置

    /// 首发统计上报通道（GameState.slashesScoringEmitted 语义见 §1.2 步骤 6.4）。
    private let stats: (any StatsRecording)?

    /// combo 随机项权重 0.5（公式 `0.5*rand/8+0.75` 内字面量）。[macho H] §1.1
    private static let rhythmRandomWeight: Float = 0.5

    public init(stats: (any StatsRecording)? = nil) {
        self.stats = stats
    }

    // MARK: - ComboTracking

    /// §1.2 步骤 6.4：普通水果命中后的 combo 计数。
    /// 单果 OnSliced 计分与实体 +0x1ba 后处理均不在这里执行。
    public func registerSlice(fruitType: Int32, entity: EntityID, stateSlot0: Int32,
                              state: inout GameState, rng: any RandomSource) -> ComboEvent? {
        guard stateSlot0 != 2 && state.lastComboEntity != entity else { return nil }

        state.lastComboEntity = entity
        state.comboWindowTimer = 0

        let slot = Int(state.comboCount)
        if slot >= 0 && slot < state.comboFruitTypes.count {
            state.comboFruitTypes[slot] = fruitType
        } else if !state.comboFruitTypes.isEmpty {
            // 原 C 无边界检查；Swift 防御性写末槽，正常路径 combo 不超过 11。
            state.comboFruitTypes[state.comboFruitTypes.count - 1] = fruitType
        }

        state.comboTypeFlag = (stateSlot0 != 0) ? 1 : 0

        if state.slashesScoringEmitted && state.comboCount == 0 {
            stats?.add(.slashes, 1)
        }
        if !state.slashesScoringEmitted || state.comboCount == 0 {
            stats?.add(.slashesScoring, 1)
        }
        state.slashesScoringEmitted = true

        state.comboCount &+= 1
        if state.comboCount > Constants.Combo.countThresholdForTightWindow {
            state.comboWindowTimer = Constants.Combo.windowCap
        }

        state.rhythmFactor -= Float(state.comboCount) * rhythmTerm(rng)
        return .incremented(count: state.comboCount,
                            visualTier: ComboTier.visual(for: state.comboCount),
                            textTier: ComboTier.text(for: state.comboCount))
    }

    /// §1.2 步骤 9：只负责窗口推进、快照和统一清零。
    /// 计分与统计由 GameWorld 消费快照，避免 clearComboTracking 丢失 comboType。
    public func tickWindow(dt: Float, state: inout GameState) -> [ComboEvent] {
        if state.comboWindowTimer < Constants.Combo.windowBase {
            state.comboWindowTimer += dt
        }
        guard state.comboWindowTimer >= Constants.Combo.windowCap else { return [] }

        guard state.comboCount > 0 else {
            state.comboWindowTimer = Constants.Combo.windowBase
            state.clearComboTracking()
            return []
        }

        let settledCount = state.comboCount
        let settledTypes = state.comboFruitTypes
        let settledComboType = state.comboTypeFlag

        state.comboWindowTimer = Constants.Combo.windowBase
        state.clearComboTracking()
        return [.settled(count: settledCount,
                         fruitTypes: settledTypes,
                         comboType: settledComboType)]
    }

    /// 复位：清计时器与 combo 状态。原 reset 路径未单独导出 → [M] 语义推断。
    public func reset(state: inout GameState) {
        state.comboWindowTimer = 0
        state.clearComboTracking()
    }

    // MARK: - 内部

    /// 原 `0.5*rand/8 + 0.75`（§1.1 / §1.2 步骤 6.4）。
    /// 每调用一次消耗一次 rng，与原两处 rand 调用对齐（combo 递减 1 次、特殊果 1 次）。
    private func rhythmTerm(_ rng: any RandomSource) -> Float {
        let r = rng.nextFloat()
        return Self.rhythmRandomWeight * r / Constants.Combo.randomDivisor + Constants.Combo.randomBase
    }
}