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
    /// 不进协议签名——ComboTracking 的签名由 GameWorld.swift 固定。
    private let stats: (any StatsRecording)?

    /// 特殊果得分加成量（原 `DAT_004d90b4`，`+0x110 += DAT_004d90b4`）。
    /// ⚠️ [待验证] ARM __stubs 懒绑定桩，静态镜像中不可解（Constants Pending #3）；
    /// 默认 0 = 不改变分值，运行时实测后经初始化注入。
    private let specialFruitBonus: Int32

    /// combo 随机项权重 0.5（公式 `0.5*rand/8+0.75` 内字面量）。[macho H] §1.1
    private static let rhythmRandomWeight: Float = 0.5

    public init(stats: (any StatsRecording)? = nil, specialFruitBonus: Int32 = 0) {
        self.stats = stats
        self.specialFruitBonus = specialFruitBonus
    }

    // MARK: - ComboTracking

    /// §1.2 步骤 6.4：非炸弹命中后的 combo 计数。
    ///
    /// `stateSlot0` 是实体 int 下标 0x21：值 2 跳过窗口计数；原 +0x90
    /// 也取自该槽是否非零，不是水果 typeID 是否非零。
    public func registerSlice(fruitType: Int32, entity: EntityID, stateSlot0: Int32,
                              state: inout GameState, rng: any RandomSource) -> ComboEvent? {
        var event: ComboEvent?

        // stateSlot0==2 或同一实体均跳过 combo 计数；特殊果分支仍会执行。
        if stateSlot0 != 2 && state.lastComboEntity != entity {
            state.lastComboEntity = entity
            state.comboWindowTimer = 0                              // +0x174 = 0

            // comboArr[+0x8c] = type（写入位置为当前计数，0 基）
            let slot = Int(state.comboCount)
            if slot >= 0 && slot < state.comboFruitTypes.count {
                state.comboFruitTypes[slot] = fruitType
            } else {
                // 原 C 无边界检查；Swift 越界会 trap → 防御性写末槽
                // [待验证] 理论上 combo ≤ 11（数组容量），此分支不应触发
                if !state.comboFruitTypes.isEmpty {
                    state.comboFruitTypes[state.comboFruitTypes.count - 1] = fruitType
                }
            }

            state.comboTypeFlag = (stateSlot0 != 0) ? 1 : 0          // +0x90 = (entity[0x21] != 0)

            // 原顺序：+0x51==0 时只发 slashesScoring；若 +0x51==1 且新窗口
            // combo==0，则发 slashes + slashesScoring；窗口后续命中不重复发。
            if state.slashesScoringEmitted && state.comboCount == 0 {
                stats?.add(.slashes, 1)
            }
            if !state.slashesScoringEmitted || state.comboCount == 0 {
                stats?.add(.slashesScoring, 1)
            }
            state.slashesScoringEmitted = true

            state.comboCount &+= 1                                   // combo++（32 位回绕语义）
            if state.comboCount > Constants.Combo.countThresholdForTightWindow {
                state.comboWindowTimer = Constants.Combo.windowCap   // combo>9 → 0.095
            }

            // +0x54 -= combo * (0.5*rand/8 + 0.75)
            state.rhythmFactor -= Float(state.comboCount) * rhythmTerm(rng)

            event = .incremented(count: state.comboCount,
                                 visualTier: ComboTier.visual(for: state.comboCount),
                                 textTier: ComboTier.text(for: state.comboCount))
        }

        // 特殊果加成（+0x1ba）：与 combo 计数解耦，命中即生效。
        if state.specialFruitBonusEnabled {
            let term = rhythmTerm(rng)
            state.lastSliceScore &+= specialFruitBonus                // +0x110 += DAT_004d90b4 [待验证]
            let specialDelta = Constants.Combo.rhythmPenalty * term   // +0x54 += -3.0 * (...)
            state.rhythmFactor += specialDelta
            if event == nil {
                event = .specialBonusApplied(delta: specialDelta)
            }
        }

        return event
    }

    /// §1.2 步骤 9：combo 窗口推进与到期结算。
    ///
    /// 原文（macho FUN_00016214 步骤 9）：
    ///   若 +0x174 < DAT_00017024 → +0x174 += dt
    ///   若 +0x174 >= DAT_00017028 → 结算（+0x174=0.1、回调链、统计），随后统一清零
    ///   若 +0x174 >= DAT_00017024 → 直接走清零分支
    ///
    /// 重建取值：DAT_00017024 视作 windowBase(0.1) 推进上限，
    ///           DAT_00017028 视作 windowCap(0.095) 结算阈值
    ///           （T-006「combo 窗口 0.1/0.095」+ §7 待读常量按此口径闭合）。
    /// ⚠️ [待验证] 两个数据段常量精确值尚未直读；若后续读到不同值，只需改 Constants。
    public func tickWindow(dt: Float, state: inout GameState) -> [ComboEvent] {
        // 推进：未达上限才累加（原 `+0x174 < DAT_00017024`）
        if state.comboWindowTimer < Constants.Combo.windowBase {
            state.comboWindowTimer += dt
        }

        // 未到期
        guard state.comboWindowTimer >= Constants.Combo.windowCap else { return [] }

        // 到期但无活动 combo：幂等清零（原「直接走清零分支」），不派发事件
        guard state.comboCount > 0 else {
            state.comboWindowTimer = Constants.Combo.windowBase
            state.clearComboTracking()
            return []
        }

        let settledCount = state.comboCount
        let settledTypes = state.comboFruitTypes

        // combo >= 3：统计 combos（原 `"%s_combos"` + `"combos"`）
        // ⚠️ [待验证] 动态键 `"%s_combos"` 的 %s 语义未闭合（FUN_0000342c/000042b4），不臆造；
        //     strawberry_combo_total 需要 fruitType ID 映射，亦未闭合。
        if settledCount >= Constants.Combo.tierEffectStartCount {
            stats?.add(.combos, 1)
        }

        // 结算后：+0x174 = 0.1（作为「已结算」标记，防同帧重复结算）
        state.comboWindowTimer = Constants.Combo.windowBase
        // 统一清零：combo=0; +0x90=0; +0x180=0; +0x178=0; memset(+0x60, 0xff, 0x2c)
        state.clearComboTracking()

        return [.settled(count: settledCount, fruitTypes: settledTypes)]
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