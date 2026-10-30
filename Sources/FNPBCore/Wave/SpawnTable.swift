import Foundation

// ============================================================================
// SpawnTable — 按 chance 累计和的权重抽取（core_logic_notes M19 / §5.3）
//
// 反编译证据：
//   - M19：`param_1[1]` 累加（原累积和字段 +0x4，默认 0 起始）
//   - §5.3 步骤 3：`条目 +0x18 < 2 → 从概率池抽 ID`
//   - §5.1 哨兵语义：-1 = 空槽、-2 = 炸弹 [both H]
//
// 设计：
//   - 累计和在 init 预计算（`[Int32]`），draw 走二分查找 O(log n)
//   - 抽取源为注入的 `RandomSource`（保证回归可复现）
//   - 空表 / 累计和 ≤0 → 返回 `Constants.EntityPool.emptySlot`（-1）
//   - **不解释 kind 语义**（-2 炸弹由上层分流；这里只如实返回）
// ============================================================================

public struct SpawnTable: Sendable {

    /// 候选列表（保持原始顺序 —— 顺序决定同名 chance 的命中优先级）。
    public let entries: [SpawnerFruit]

    /// 累计和（对应原 `+0x4` 语义：`cumulative[i] = sum(chance[0...i])`）。
    /// Swift 侧以属性持有、避免每次 draw 重算。
    private let cumulative: [Int32]

    public init(entries: [SpawnerFruit]) {
        self.entries = entries
        var acc: [Int32] = []
        acc.reserveCapacity(entries.count)
        var sum: Int32 = 0
        for entry in entries {
            // chance <= 0 的条目在原实现等价值为「永不命中」；
            // 这里不做特殊处理，由 cumulative 单调不减自然归属下一个正权条目
            // （与 §4.2「子节点 chance 默认 100」一致）。
            sum = sum &+ max(0, entry.chance)
            acc.append(sum)
        }
        self.cumulative = acc
    }

    /// 总权重（即 `cumulative.last`，无候选时为 0）。
    public var totalChance: Int32 {
        cumulative.last ?? 0
    }

    /// 是否为空表（无候选或总权重 ≤0）。
    public var isEmpty: Bool {
        entries.isEmpty || totalChance <= 0
    }

    /// 按权重抽取一个 kind。
    ///
    /// - 输入无额外状态，可安全并发调用（`RandomSource` 需线程安全，由外部保证）。
    /// - 空表 / 总权重 ≤ 0 → 返回 `Constants.EntityPool.emptySlot`（-1）[macho H]。
    /// - 返回的 kind 保持原始语义：`-2` = 炸弹、`-1` = 空槽（二者都应在上层分流）。
    public func draw(using rng: any RandomSource) -> Int32 {
        let total = totalChance
        guard total > 0, !cumulative.isEmpty else {
            return Constants.EntityPool.emptySlot
        }

        let roll = rng.nextInt(total)   // [0, total)
        // 二分：定位第一个 cumulative[i] > roll 的 i
        var lo = 0
        var hi = cumulative.count
        while lo < hi {
            let mid = (lo + hi) / 2
            if roll < cumulative[mid] {
                hi = mid
            } else {
                lo = mid + 1
            }
        }
        guard lo < entries.count else {
            // 浮点 / 越界保护：正常二分不应到达
            return Constants.EntityPool.emptySlot
        }
        return entries[lo].kind
    }

    /// 便利构造：从 `Spawner.fruits` 直接构建。
    public init(spawner: Spawner) {
        self.init(entries: spawner.fruits)
    }
}