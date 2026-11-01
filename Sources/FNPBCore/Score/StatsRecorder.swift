//
//  StatsRecorder.swift
//  FNPBCore
//
//  统计计数、命中率及发售版 combo 结算统计。
//  排名算法直接对应 Mach-O FUN_0002e030；combo_bonus 档位表尚未闭合，禁止臆造。
//

import Foundation

public final class StatsRecorder: StatsRecording {

    private var counters: [StatsKey: Int32] = [:]
    private var dynamicCounters: [String: Int32] = [:]
    private var fruitNames: [Int32: String]

    /// 原 Stats +0x2e4 / +0x2e8 与全局 DAT_0052bfdc。
    public private(set) var bestComboCount: Int32 = 0
    public private(set) var bestComboFruitTypes = GameState.emptyComboSlots
    public private(set) var bestComboRank: Int32 = -1

    public init(fruitNames: [Int32: String] = [:]) {
        self.fruitNames = fruitNames
    }

    public func configureFruitNames(_ names: [Int32: String]) {
        fruitNames = names
    }

    public func add(_ key: StatsKey, _ value: Int32) {
        counters[key, default: 0] = counters[key, default: 0] &+ value
    }

    public func report(_ dynamicKey: String, _ value: Int32) {
        dynamicCounters[dynamicKey, default: 0] =
            dynamicCounters[dynamicKey, default: 0] &+ value
    }

    public func recordCombo(count: Int32, fruitTypes: [Int32], modePrefix: String?) {
        guard count >= 2 else { return }
        let types = Array(fruitTypes.prefix(Int(count)))

        if count >= 3 {
            if let modePrefix {
                report("\(modePrefix)_combos", 1)
            }
            add(.combos, 1)
            if types.contains(where: { fruitNames[$0] == "strawberry" }) {
                report("strawberry_combo_total", 1)
            }

            // FUN_0002ca24 的 best_combo 是“新值减旧值，负值归零”的增量。
            let previous = value(forDynamicKey: "best_combo")
            report("best_combo", max(0, count - previous))
            // combo_bonus 还需要 FUN_0002c450 的档位数组；未读取前不上报假值。
        }

        if count > bestComboCount {
            replaceBestCombo(count: count, fruitTypes: fruitTypes)
        } else if count == bestComboCount {
            let newRank = ComboPatternRank.rank(types, fruitNames: fruitNames)
            if newRank > bestComboRank {
                replaceBestCombo(count: count, fruitTypes: fruitTypes)
            }
        }
    }

    private func replaceBestCombo(count: Int32, fruitTypes: [Int32]) {
        bestComboCount = count
        bestComboFruitTypes = Array(fruitTypes.prefix(GameState.comboSlotCount))
        if bestComboFruitTypes.count < GameState.comboSlotCount {
            bestComboFruitTypes += [Int32](repeating: Constants.EntityPool.emptySlot,
                                           count: GameState.comboSlotCount - bestComboFruitTypes.count)
        }
        bestComboRank = ComboPatternRank.rank(Array(fruitTypes.prefix(Int(count))),
                                              fruitNames: fruitNames)
    }

    public func value(for key: StatsKey) -> Int32 {
        counters[key] ?? 0
    }

    public func value(forDynamicKey key: String) -> Int32 {
        dynamicCounters[key] ?? 0
    }

    public func reset() {
        counters.removeAll()
        dynamicCounters.removeAll()
        bestComboCount = 0
        bestComboFruitTypes = GameState.emptyComboSlots
        bestComboRank = -1
    }

    public func accuracy(externalCorrection: Float = 0) -> Int32 {
        AccuracyFormula.rate(totalFruit: value(for: .totalfruit),
                             slashes: value(for: .slashes),
                             slashesScoring: value(for: .slashesScoring),
                             externalCorrection: externalCorrection)
    }
}

/// Mach-O FUN_0002e030。输入仅取当前 combo 的有效水果，不包含 11 槽末尾的 -1。
public enum ComboPatternRank {
    private static let smallComboRanks: [Int32] = [-1, -1, -1, 0, 1, 2, 3]
    private static let singleFruitRanks: [String: Int32] = [
        "apple": 6, "apple_red": 6, "orange": 7, "pineapple": 8,
        "watermelon": 9, "kiwi": 10, "mango": 11, "strawberry": 12,
        "pear": 13, "banana": 14, "lime": 15, "lemon": 16,
        "coconut": 17, "passionfruit": 18
    ]

    public static func rank(_ types: [Int32], fruitNames: [Int32: String]) -> Int32 {
        var orderedTypes: [Int32] = []
        var counts: [Int] = []
        for type in types {
            if let index = orderedTypes.firstIndex(of: type) {
                counts[index] += 1
            } else {
                orderedTypes.append(type)
                counts.append(1)
            }
        }

        let distinct = orderedTypes.count
        if distinct == 3 && types.count == 5 && counts.prefix(2).contains(2) {
            return 21
        }
        if distinct == types.count && types.count > 4 {
            return 4
        }
        if distinct == 1, let name = fruitNames[types[0]], let rank = singleFruitRanks[name] {
            return rank
        }
        if distinct == 2 {
            let alternating = types.indices.allSatisfy { index in
                types[index] == orderedTypes[index % 2]
            }
            if alternating { return 24 }
            if types.count == 5 && counts.prefix(2).contains(2) {
                return 20
            }
        }
        if counts.contains(4) { return 23 }
        if counts.contains(3) { return 22 }
        return types.count < smallComboRanks.count ? smallComboRanks[types.count] : 5
    }
}

// MARK: - 命中率公式

public enum AccuracyFormula {
    public static func rate(totalFruit: Int32,
                            slashes: Int32,
                            slashesScoring: Int32,
                            externalCorrection: Float = 0) -> Int32 {
        guard totalFruit > 0 else { return 0 }

        let misses = Float(slashes &- slashesScoring)
        let total = Float(totalFruit)
        let ratio = (total + externalCorrection
                     + Constants.Scoring.hitRateK * misses * total) / total

        let scaled = ratio >= 0 ? ratio * Constants.Scoring.hitRateScale : 0
        guard scaled.isFinite else { return 0 }
        if scaled <= 0 { return 0 }
        if scaled >= Float(Constants.Scoring.intMax) { return Constants.Scoring.intMax }
        return Int32(scaled)
    }
}
