//
//  ComboTier.swift
//  FNPBCore
//
//  §2「连击族」档位公式（T-013）
//
//  双源确认（DECISIONS T-004 M41 + core_logic_notes §2.3）：
//    visual = clamp(combo - 3, 0, 2)
//    text   = clamp(combo - 2, 1, 5)
//    effect 活跃门限：combo > 2
//
//  【实现说明】combo 为 Int32，直接 `combo - 3` 在极端值下可能触发 Swift 溢出检查，
//  故统一升到 Int64 计算后 clamp 回 Int32。原 C 为 32 位有符号回绕，正常游戏值域内两者一致。
//

import Foundation

public enum ComboTier {

    /// 视觉档位：`clamp(combo - 3, 0, 2)`。§2.2 步骤 4 [both] H
    public static func visual(for comboCount: Int32) -> Int32 {
        clamped(Int64(comboCount) - Int64(Constants.Combo.visualTierOffset),
                min: Int64(Constants.Combo.visualTierMin),
                max: Int64(Constants.Combo.visualTierMax))
    }

    /// 文本档位：`clamp(combo - 2, 1, 5)`。§2.2 步骤 6 [both] H
    public static func text(for comboCount: Int32) -> Int32 {
        clamped(Int64(comboCount) - Int64(Constants.Combo.textTierOffset),
                min: Int64(Constants.Combo.textTierMin),
                max: Int64(Constants.Combo.textTierMax))
    }

    /// 特效 / 音效分支门限：`combo > 2`（§2.2 步骤 1）[both] H
    public static func isEffectActive(for comboCount: Int32) -> Bool {
        comboCount >= Constants.Combo.tierEffectStartCount
    }

    // MARK: - 内部

    private static func clamped(_ value: Int64, min lower: Int64, max upper: Int64) -> Int32 {
        Int32(Swift.min(Swift.max(value, lower), upper))
    }
}