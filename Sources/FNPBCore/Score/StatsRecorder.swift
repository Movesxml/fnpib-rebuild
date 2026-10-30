//
//  StatsRecorder.swift
//  FNPBCore
//
//  StatsRecording 协议实现 + 命中率公式（T-013）
//
//  来源：
//    §3.4 统计键名（macho 发售版原文）[macho H]
//    §3.3 FUN_00065ad4 命中率公式 [macho 源码级]
//    K = -0.2 / SCALE = 100（pending_constants §9，见 Constants.Scoring）
//

import Foundation

public final class StatsRecorder: StatsRecording {

    /// 静态键计数（原 FUN_00027588 计数入口）。
    private var counters: [StatsKey: Int32] = [:]

    /// 动态键计数（`"%s_combos"` / `"strawberry_combo_total"` 等，§3.4）。
    private var dynamicCounters: [String: Int32] = [:]

    public init() {}

    // MARK: - StatsRecording

    /// 静态键累加。32 位回绕语义用 `&+`。
    public func add(_ key: StatsKey, _ value: Int32) {
        counters[key, default: 0] = counters[key, default: 0] &+ value
    }

    /// 动态键累加（原字符串哈希通道）。
    public func report(_ dynamicKey: String, _ value: Int32) {
        dynamicCounters[dynamicKey, default: 0] =
            dynamicCounters[dynamicKey, default: 0] &+ value
    }

    // MARK: - 查询（非协议方法）

    public func value(for key: StatsKey) -> Int32 {
        counters[key] ?? 0
    }

    public func value(forDynamicKey key: String) -> Int32 {
        dynamicCounters[key] ?? 0
    }

    public func reset() {
        counters.removeAll()
        dynamicCounters.removeAll()
    }

    // MARK: - 命中率（§3.3）

    /// 以自身 `slashes` / `slashesScoring` / `totalfruit` 计数计算命中率。
    /// - Parameter externalCorrection: 原 `*(param_1 + 0x2c)` 外部修正项 X
    public func accuracy(externalCorrection: Float = 0) -> Int32 {
        AccuracyFormula.rate(totalFruit: value(for: .totalfruit),
                             slashes: value(for: .slashes),
                             slashesScoring: value(for: .slashesScoring),
                             externalCorrection: externalCorrection)
    }
}

// MARK: - 命中率公式

/// §3.3 `FUN_00065ad4` 还原：
/// ```
/// misses = slashes - slashesScoring
/// f      = (total + X + K * misses * total) / total
/// result = f >= 0 ? f * SCALE : 0
/// ```
public enum AccuracyFormula {

    /// 计算命中率整数结果（原 C `(int)` 向零截断）。
    /// - Parameters:
    ///   - totalFruit: 统计键 `totalfruit`
    ///   - slashes: 统计键 `slashes`
    ///   - slashesScoring: 统计键 `slashesScoring`
    ///   - externalCorrection: 原 `*(param_1 + 0x2c)` 外部修正项 X
    public static func rate(totalFruit: Int32,
                            slashes: Int32,
                            slashesScoring: Int32,
                            externalCorrection: Float = 0) -> Int32 {
        // 防御：原实现 total 为 0 时浮点除零；Swift 不允许 NaN → Int32 转换
        guard totalFruit > 0 else { return 0 }

        let misses = Float(slashes &- slashesScoring)           // 32 位回绕语义
        let total = Float(totalFruit)
        let ratio = (total + externalCorrection
                     + Constants.Scoring.hitRateK * misses * total) / total

        let scaled = ratio >= 0 ? ratio * Constants.Scoring.hitRateScale : 0
        guard scaled.isFinite else { return 0 }
        if scaled <= 0 { return 0 }
        if scaled >= Float(Constants.Scoring.intMax) { return Constants.Scoring.intMax }
        return Int32(scaled)                                     // 向零截断，等价 C `(int)`
    }
}