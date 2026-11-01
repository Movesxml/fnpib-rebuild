import Foundation

/// FUN_0000ac24 的显式输入；三个字段均为配置管线求值后的有效运行时值。
public struct ChallengeFruitWeightEntry: Equatable, Sendable {
    /// FruitInfo +0x308。
    public var chance: Int32
    /// FruitInfo +0x318 != 0；沿用现有 FruitInfo.noCritical 的字段命名。
    public var noCritical: Bool
    /// FruitInfo +0x328。
    public var coinsMax: Int32

    public init(chance: Int32, noCritical: Bool, coinsMax: Int32) {
        self.chance = chance
        self.noCritical = noCritical
        self.coinsMax = coinsMax
    }
}

public enum ChallengeFruitWeightMap {
    /// 原全局 FruitInfo 表的值语义投影；缺省 chance 的有效值为 0。
    public static func make(from fruits: [FruitInfo]) -> [Int32: ChallengeFruitWeightEntry] {
        Dictionary(uniqueKeysWithValues: fruits.map { fruit in
            (fruit.typeID, ChallengeFruitWeightEntry(
                chance: fruit.chance ?? 0,
                noCritical: fruit.noCritical,
                coinsMax: 0))
        })
    }
}

public enum ChallengeFruitSelectionError: Error, Equatable, Sendable {
    case missingWeightEntry(fruitID: Int32)
    case candidateCountOverflow(Int)
    /// 新增安全策略：原版空候选在两次 PRNG 后越界，没有合法返回值。
    case emptyCandidates
    /// 新增安全策略：原版单候选进入回退时使用未缩放索引，通常越界。
    case unsafeFallback(count: Int32, unscaledIndex: UInt32)
    case fallbackIndexOutOfBounds(count: Int32, index: UInt32)
}

/// 原四个全局权重和及 FruitInfo +0x30c/+0x310 的值语义快照。
public struct ChallengeFruitWeightState: Equatable, Sendable {
    public var totalAll: UInt32 = 0
    public var totalFree: UInt32 = 0
    public var totalFlag: UInt32 = 0
    public var totalFlagFree: UInt32 = 0
    public var cumulativeAll: [Int32: UInt32] = [:]
    public var cumulativeFlag: [Int32: UInt32] = [:]

    public init() {}

    public init(totalAll: UInt32,
                totalFree: UInt32,
                totalFlag: UInt32,
                totalFlagFree: UInt32,
                cumulativeAll: [Int32: UInt32] = [:],
                cumulativeFlag: [Int32: UInt32] = [:]) {
        self.totalAll = totalAll
        self.totalFree = totalFree
        self.totalFlag = totalFlag
        self.totalFlagFree = totalFlagFree
        self.cumulativeAll = cumulativeAll
        self.cumulativeFlag = cumulativeFlag
    }
}

public enum ChallengeFruitSelectionMath {
    @inline(__always)
    public static func mulHi32(_ a: UInt32, _ b: UInt32) -> UInt32 {
        UInt32(truncatingIfNeeded: (UInt64(a) * UInt64(b)) >> 32)
    }

    @inline(__always)
    public static func roll(high: UInt32, total: UInt32) -> UInt32 {
        total == 0 || total == .max ? high : mulHi32(high, total)
    }

    @inline(__always)
    public static func isSignedStrictlyLess(_ lhs: UInt32, _ rhs: UInt32) -> Bool {
        Int32(bitPattern: lhs) < Int32(bitPattern: rhs)
    }

    /// 原版回退使用 count-1，因此最后候选不可达。
    public static func fallbackIndex(high: UInt32, count: Int32) -> UInt32 {
        let unsignedCount = UInt32(bitPattern: count)
        guard unsignedCount >= 2 else { return high }
        return mulHi32(high, unsignedCount &- 1)
    }
}

public enum ChallengeFruitWeightPath: Equatable, Sendable {
    case flag
    case flagFree
    case free
    case all
}

/// 四个包装函数均按 catalog 原索引顺序动态构造候选，不硬编码水果 ID。
public enum ChallengeFruitCandidates {
    public static let defaultExcludedName = "banana"
    public static let smallNames: Set<String> = ["strawberry", "kiwifruit", "lime"]
    public static let mediumNames: Set<String> = [
        "orange", "mango", "apple_red", "tomato", "apple",
        "plum", "passionfruit", "lemon", "peach", "pear",
    ]
    public static let bigNames: Set<String> = ["banana", "watermelon", "pineapple"]

    public static func defaultCandidates(from catalog: [FruitInfo]) -> [Int32] {
        catalog.filter { $0.name != defaultExcludedName }.map(\.typeID)
    }

    public static func names(for size: ChallengeFruitSize) -> Set<String>? {
        switch size {
        case .normal: return nil
        case .small: return smallNames
        case .medium: return mediumNames
        case .big: return bigNames
        }
    }

    /// normal 没有专门覆盖，返回 nil；缺失名称自然不产生候选。
    public static func candidates(for size: ChallengeFruitSize,
                                  from catalog: [FruitInfo]) -> [Int32]? {
        guard let names = names(for: size) else { return nil }
        return catalog.filter { names.contains($0.name) }.map(\.typeID)
    }
}

/// FUN_0000ac24：保留原缓存复用、32 位回绕和非常规回退，不做常规化修正。
public struct ChallengeFruitSelector: Sendable {
    public private(set) var state: ChallengeFruitWeightState

    public init(state: ChallengeFruitWeightState = ChallengeFruitWeightState()) {
        self.state = state
    }

    public static func resolvePath(predicateP: Int32,
                                   param1: Int32) -> ChallengeFruitWeightPath {
        if predicateP == 1 {
            return param1 == 1 ? .flag : .flagFree
        }
        return param1 == 0 ? .free : .all
    }

    private func totalWeight(for path: ChallengeFruitWeightPath) -> UInt32 {
        switch path {
        case .flag: return state.totalFlag
        case .flagFree: return state.totalFlagFree
        case .free: return state.totalFree
        case .all: return state.totalAll
        }
    }

    /// T_all<=0 才重建；只清 T_all，其余三个全局和继续累加。
    public static func rebuildIfNeeded(
        state: inout ChallengeFruitWeightState,
        candidates: [Int32],
        weights: [Int32: ChallengeFruitWeightEntry]
    ) throws {
        guard Int32(bitPattern: state.totalAll) <= 0 else { return }
        state.totalAll = 0
        for fruitID in candidates {
            guard let entry = weights[fruitID] else {
                throw ChallengeFruitSelectionError.missingWeightEntry(fruitID: fruitID)
            }
            let weight = UInt32(bitPattern: entry.chance)
            state.totalAll = state.totalAll &+ weight
            state.cumulativeAll[fruitID] = state.totalAll

            let isFree = entry.coinsMax <= 0
            if isFree {
                state.totalFree = state.totalFree &+ weight
            }
            if entry.noCritical {
                state.totalFlag = state.totalFlag &+ weight
                if isFree {
                    state.totalFlagFree = state.totalFlagFree &+ weight
                }
            }
            // 未标记项也写入此前累计值。
            state.cumulativeFlag[fruitID] = state.totalFlag
        }
    }

    public static func scanWeighted(
        path: ChallengeFruitWeightPath,
        roll: UInt32,
        candidates: [Int32],
        weights: [Int32: ChallengeFruitWeightEntry],
        state: ChallengeFruitWeightState
    ) throws -> Int32? {
        switch path {
        case .flag, .all:
            for fruitID in candidates {
                let cache = path == .flag ? state.cumulativeFlag : state.cumulativeAll
                let cumulative = cache[fruitID] ?? 0
                if ChallengeFruitSelectionMath.isSignedStrictlyLess(roll, cumulative) {
                    return fruitID
                }
            }
        case .flagFree, .free:
            var local: UInt32 = 0
            for fruitID in candidates {
                guard let entry = weights[fruitID] else {
                    throw ChallengeFruitSelectionError.missingWeightEntry(fruitID: fruitID)
                }
                let included = entry.coinsMax <= 0 && (path == .free || entry.noCritical)
                guard included else { continue }
                local = local &+ UInt32(bitPattern: entry.chance)
                if ChallengeFruitSelectionMath.isSignedStrictlyLess(roll, local) {
                    return fruitID
                }
            }
        }
        return nil
    }

    public mutating func select(
        candidates: [Int32],
        weights: [Int32: ChallengeFruitWeightEntry],
        param1: Int32,
        predicateP: Int32,
        random: any RandomSource
    ) throws -> Int32 {
        guard candidates.count <= Int(Int32.max) else {
            throw ChallengeFruitSelectionError.candidateCountOverflow(candidates.count)
        }
        let count = Int32(candidates.count)
        try Self.rebuildIfNeeded(state: &state, candidates: candidates, weights: weights)

        let path = Self.resolvePath(predicateP: predicateP, param1: param1)
        let high = Self.nextHighBits(random)
        let roll = ChallengeFruitSelectionMath.roll(high: high,
                                                    total: totalWeight(for: path))
        if let hit = try Self.scanWeighted(path: path, roll: roll, candidates: candidates,
                                           weights: weights, state: state) {
            return hit
        }

        let fallbackHigh = Self.nextHighBits(random)
        if count <= 0 { throw ChallengeFruitSelectionError.emptyCandidates }
        if count < 2 {
            throw ChallengeFruitSelectionError.unsafeFallback(
                count: count, unscaledIndex: fallbackHigh)
        }
        let index = ChallengeFruitSelectionMath.fallbackIndex(high: fallbackHigh, count: count)
        guard UInt64(index) < UInt64(candidates.count) else {
            throw ChallengeFruitSelectionError.fallbackIndexOutOfBounds(count: count, index: index)
        }
        return candidates[Int(index)]
    }

    /// FUN_00061128(param_2==0)：默认初选与模式覆盖共享同一缓存并分别消耗 PRNG。
    public mutating func selectNewGameChallengeFruit(
        size: ChallengeFruitSize,
        catalog: [FruitInfo],
        weights: [Int32: ChallengeFruitWeightEntry],
        predicateP: Int32,
        random: any RandomSource
    ) throws -> ChallengeFruitNewGameSelection {
        let defaultSelection = try select(
            candidates: ChallengeFruitCandidates.defaultCandidates(from: catalog),
            weights: weights, param1: 0, predicateP: predicateP, random: random)
        guard let modeIDs = ChallengeFruitCandidates.candidates(for: size, from: catalog) else {
            return ChallengeFruitNewGameSelection(
                defaultSelection: defaultSelection, finalSelection: defaultSelection,
                appliedMode: .normal)
        }
        let finalSelection = try select(candidates: modeIDs, weights: weights,
                                        param1: 0, predicateP: predicateP, random: random)
        return ChallengeFruitNewGameSelection(
            defaultSelection: defaultSelection, finalSelection: finalSelection, appliedMode: size)
    }

    /// 当前生产随机源 OriginalLCGRandom 的 nextInt(0) 恰好推进一次并返回新高 32 位。
    private static func nextHighBits(_ random: any RandomSource) -> UInt32 {
        UInt32(bitPattern: random.nextInt(0))
    }
}

public struct ChallengeFruitNewGameSelection: Equatable, Sendable {
    public var defaultSelection: Int32
    public var finalSelection: Int32
    public var appliedMode: ChallengeFruitSize

    public init(defaultSelection: Int32,
                finalSelection: Int32,
                appliedMode: ChallengeFruitSize) {
        self.defaultSelection = defaultSelection
        self.finalSelection = finalSelection
        self.appliedMode = appliedMode
    }
}
