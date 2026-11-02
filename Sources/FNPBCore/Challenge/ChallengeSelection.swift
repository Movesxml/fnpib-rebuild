import Foundation

// ============================================================================
// ChallengeSelection — 挑战权重选择器与回合计划（核心已验证，App 未接线）
//
// 反编译依据（全部来自 macho，任务卡范围内）：
//   FUN_0003994c  权重容器构造（项 20 字节；+0x10 存默认 cooldown）
//   FUN_000399a0  容器 regrow：cooldown<1 → current 恢复；否则 cooldown-=1
//   FUN_00039a28  按索引清除：total-=current、current=0、cooldown=默认
//   FUN_00039b24  加权抽取：累加 current 找区间、清零、写 cooldown、返回 value
//   FUN_0006ec3c  组内选挑战：priority&&未游玩&&cooldown==0 → regrow+take；否则 regrow+draw
//   FUN_0006ebdc  刷新「组内存在可优先挑战」标志
//   FUN_0006ed78  tier 内选组：先 regrow → 扫组标志&&cooldown==0 → take；否则 draw；
//                 随后对选中组调 FUN_0006ec3c 选挑战
//   FUN_0006ee88  回合计划：每组 mustSelect 次构建必选队列 → 特殊组门控与选择 →
//                 成对交换洗牌 → 按洗牌序先消耗队列、其余走 tier 选择
//   FUN_00060d04 / FUN_00062be4 / FUN_00062ca4  特殊单例随机组
//   FUN_00039a64 / FUN_0003994c 内部 64 位 PRNG —— 注入 RandomSource；
//                                                  生产装配使用 OriginalLCGRandom
//   FUN_00061090 / FUN_000610cc  UI 与控制器接线（尚未接入）
//   FUN_002f69c4  持久化 key 的字符串哈希（改用名称，见风险点）
//
// 与任务卡措辞的已知差异见文件末尾「实现差异」注释块。
// ============================================================================

// MARK: - 持久化 key

/// 原版组与挑战使用两张独立 map；分类必须与 UInt32 哈希一起构成键。
public enum ChallengeSelectionKey: Hashable, Sendable {
    case group(UInt32)
    case challenge(UInt32)
}

// MARK: - 20 字节权重项

/// 原版容器项（20 字节）。偏移语义见文件头表格。
///
/// 字段名按任务卡：base / current / regrowth / value / cooldown。
/// ⚠️ 其中 `regrowth` 对应原版 +0x08（regrow 乘数），`value` 对应 +0x0C
///   （`FUN_00039b24` 的返回值，调用方当作数组索引）。任务卡列举顺序
///   与二进制偏移顺序不同，本实现按偏移命名。
public struct ChallengeWeightEntry: Sendable, Equatable {
    /// +0x00：regrow 的上界，同时是恢复目标的满值。
    public var base: Int32
    /// +0x04：当前权重，参与 totalWeight 累加与扣减。
    public var current: Int32
    /// +0x08：regrow 的恢复比例（float）。
    public var regrowth: Float
    /// +0x0C：抽取返回值，调用方用它在挑战/组数组中取项。
    public var value: Int32
    /// +0x10：冷却帧数；被选中后写默认值（任务卡：4）。
    public var cooldown: Int32

    public init(base: Int32,
                current: Int32,
                regrowth: Float,
                value: Int32,
                cooldown: Int32) {
        self.base = base
        self.current = current
        self.regrowth = regrowth
        self.value = value
        self.cooldown = cooldown
    }
}

// MARK: - 权重容器

/// 原版 `FUN_0003994c` 构造的容器：项数组 + 总权重 + rng 状态 + 默认 cooldown。
/// 本实现剥离 rng 状态（改为注入 RandomSource），保留 totalWeight 与默认 cooldown。
public struct ChallengeWeightTable: Sendable, Equatable {
    public private(set) var entries: [ChallengeWeightEntry]
    /// 原版容器 +0x10（构造函数传入，任务卡记为 4）。
    public var defaultCooldown: Int32
    /// 原版容器 +0x0C（`param_1[3]`）：只累计非冷却项的 current。
    public private(set) var totalWeight: Int32

    public init(entries: [ChallengeWeightEntry] = [], defaultCooldown: Int32 = 4) {
        self.entries = entries
        self.defaultCooldown = defaultCooldown
        self.totalWeight = entries.reduce(Int32(0)) { sum, entry in
            entry.cooldown < 1 ? sum + entry.current : sum
        }
    }

    /// FUN_000399a0。
    ///
    /// 逐项：
    ///   cooldown >= 1 → cooldown -= 1（current 不变，**且不计入 totalWeight**）
    ///   cooldown <  1 → current = Int32(round(Float(current) + Float(base)*regrowth))
    ///                   若结果 == 0 保持 0，否则 clamp 到 base
    ///
    /// ⚠️ 公式按 macho：`FloatVectorMult(regrowth, Float(base))` 再
    ///   `FloatVectorAdd(Float(current))`。任务卡写作 `current*regrowth + base`，
    ///   与二进制不符，本实现以 macho 为准。
    public mutating func regrowAll() {
        var sum: Int32 = 0
        for i in entries.indices {
            if entries[i].cooldown < 1 {
                let base = entries[i].base
                let grown = Int32((Float(entries[i].current)
                                   + Float(base) * entries[i].regrowth).rounded())
                let clamped = grown == 0 ? 0 : min(base, grown)
                entries[i].current = clamped
                sum += clamped
            } else {
                entries[i].cooldown -= 1
            }
        }
        totalWeight = sum
    }

    /// FUN_00039a28：按索引清除。
    /// totalWeight -= current；current = 0；cooldown = defaultCooldown。
    public mutating func take(index: Int) {
        guard entries.indices.contains(index) else { return }
        totalWeight -= entries[index].current
        entries[index].current = 0
        entries[index].cooldown = defaultCooldown
    }

    /// FUN_00039b24：加权抽取。
    ///
    /// 原版流程：total<=0 → 返回索引 0；否则生成 `roll ∈ [0, total)`，
    /// 顺序累加 **所有项** 的 current，首个 `roll < 累计` 的项被选中：
    /// total -= current、current = 0、cooldown = 默认，返回该项的 value。
    /// 未命中区间时同样返回索引 0，不能改成空结果或重新抽取。
    ///
    /// ⚠️ 原版累加所有项（含冷却项），但 totalWeight 只含非冷却项；正常不变量下
    ///   冷却项 current 恒为 0，累加无影响。若持久化恢复了「cooldown>0 且 current>0」
    ///   的状态，行为可能与直觉不同——[待验证]，见风险点。
    ///
    /// 随机数来源：注入 RandomSource；生产装配使用已验证的 OriginalLCGRandom。
    public mutating func draw(rng: any RandomSource) -> Int? {
        guard totalWeight > 0 else { return 0 }
        let roll = rng.nextInt(totalWeight)
        var cumulative: Int32 = 0
        for i in entries.indices {
            cumulative += entries[i].current
            if roll < cumulative {
                totalWeight -= entries[i].current
                entries[i].current = 0
                entries[i].cooldown = defaultCooldown
                return Int(entries[i].value)
            }
        }
        return 0
    }

    /// 原版写回（FUN_0006ec3c / FUN_0006ed78 的持久化循环）使用的快照。
    public func snapshot(at index: Int) -> ChallengeSelectionSnapshot? {
        guard entries.indices.contains(index) else { return nil }
        return ChallengeSelectionSnapshot(current: entries[index].current,
                                          cooldown: entries[index].cooldown)
    }
}

// MARK: - 持久化接口

/// 原版持久化条目：map 值为 { +0 current, +4 cooldown, +8 playCount }。
public struct ChallengeSelectionSnapshot: Sendable, Equatable {
    public var current: Int32
    public var cooldown: Int32
    public init(current: Int32, cooldown: Int32) {
        self.current = current
        self.cooldown = cooldown
    }
}

/// 原版持久化读写：组使用 save+0x13c，挑战使用 save+0x154。
/// key 是名称经 FUN_002f69c4 得到的 UInt32 位模式，并保留组／挑战分类。
public protocol ChallengeSelectionPersisting: AnyObject {
    func snapshot(forKey key: ChallengeSelectionKey) -> ChallengeSelectionSnapshot?
    func setSnapshot(_ snapshot: ChallengeSelectionSnapshot, forKey key: ChallengeSelectionKey)
    /// 只有挑战记录含 plays；组记录在原版没有此字段。
    func playCount(forKey key: ChallengeSelectionKey) -> Int32
    /// FUN_00060108：回合产生非 pending 结果后，当前挑战 plays 加一。
    func incrementPlayCount(forKey key: ChallengeSelectionKey)
}

/// 内存实现仅供测试；正式 App 必须使用 SaveStore 的持久化适配。
public final class ChallengeSelectionMemoryStore: ChallengeSelectionPersisting {
    public private(set) var snapshots: [ChallengeSelectionKey: ChallengeSelectionSnapshot] = [:]
    public private(set) var playCounts: [ChallengeSelectionKey: Int32] = [:]

    public init() {}

    public func snapshot(forKey key: ChallengeSelectionKey) -> ChallengeSelectionSnapshot? {
        snapshots[key]
    }

    public func setSnapshot(_ snapshot: ChallengeSelectionSnapshot, forKey key: ChallengeSelectionKey) {
        snapshots[key] = snapshot
    }

    public func playCount(forKey key: ChallengeSelectionKey) -> Int32 {
        guard case .challenge = key else { return 0 }
        return playCounts[key] ?? 0
    }

    public func incrementPlayCount(forKey key: ChallengeSelectionKey) {
        guard case .challenge = key else { return }
        playCounts[key] = (playCounts[key] ?? 0) &+ 1
    }

    /// 测试辅助：模拟挑战游玩次数，不提供组 plays 的非原版状态。
    public func setPlayCount(_ count: Int32, forKey key: ChallengeSelectionKey) {
        guard case .challenge = key else { return }
        playCounts[key] = count
    }
}

// MARK: - 组内选择器（FUN_0006ec3c）

/// 一个挑战组的选择器：持有该组的挑战与权重容器，以及原版组对象 +0xC 的
/// 「存在可优先挑战」标志。
public struct ChallengeGroupSelector: Sendable {
    public let group: ChallengeGroupDefinition
    public private(set) var table: ChallengeWeightTable
    /// 原版组对象 +0xC（`FUN_0006ebdc` 维护）。
    public private(set) var hasSelectablePriority: Bool

    public init(group: ChallengeGroupDefinition,
                persistence: any ChallengeSelectionPersisting,
                defaultCooldown: Int32 = 4) {
        self.group = group
        let entries = group.challenges.enumerated().map { index, challenge -> ChallengeWeightEntry in
            let key = Self.challengeKey(challenge)
            let snapshot = persistence.snapshot(forKey: key)
            return ChallengeWeightEntry(
                base: challenge.selection.chanceSelect,
                // ⚠️ 初始 current 取 chanceSelect（[待验证]，见风险点）。
                current: snapshot?.current ?? challenge.selection.chanceSelect,
                regrowth: challenge.selection.chanceRegrowth,
                value: Int32(index),
                cooldown: snapshot?.cooldown ?? 0)
        }
        self.table = ChallengeWeightTable(entries: entries, defaultCooldown: defaultCooldown)
        self.hasSelectablePriority = Self.computePriority(group: group, persistence: persistence)
    }

    public static func challengeKey(_ challenge: ChallengeDefinition) -> ChallengeSelectionKey {
        .challenge(OriginalStringHash.hash(challenge.name))
    }

    private static func computePriority(group: ChallengeGroupDefinition,
                                        persistence: any ChallengeSelectionPersisting) -> Bool {
        group.challenges.contains { challenge in
            challenge.prioritySelection
                && persistence.playCount(forKey: challengeKey(challenge)) == 0
        }
    }

    /// FUN_0006ec3c：组内选挑战。
    ///
    /// 顺序（macho）：
    ///   1. 遍历挑战：`prioritySelection && playCount==0 && 项 cooldown==0` 的首项
    ///      → `regrowAll()` 然后 `take(index:)`，直接选中（不抽取）。
    ///   2. 若无命中 → `regrowAll()` 后 `draw(rng:)`。
    ///   3. 把**所有项**的 current/cooldown 写回持久化。
    ///   4. 刷新本组 hasSelectablePriority。
    @discardableResult
    public mutating func select(rng: any RandomSource,
                                persistence: any ChallengeSelectionPersisting)
    -> ChallengeDefinition? {
        var selected: Int?
        for index in group.challenges.indices {
            let challenge = group.challenges[index]
            guard challenge.prioritySelection,
                  persistence.playCount(forKey: Self.challengeKey(challenge)) == 0,
                  table.entries[index].cooldown == 0 else { continue }
            table.regrowAll()
            table.take(index: index)
            selected = index
            break
        }
        if selected == nil {
            table.regrowAll()
            selected = table.draw(rng: rng)
        }

        writeBackAll(persistence: persistence)
        hasSelectablePriority = Self.computePriority(group: group, persistence: persistence)

        guard let selected, group.challenges.indices.contains(selected) else { return nil }
        return group.challenges[selected]
    }

    private func writeBackAll(persistence: any ChallengeSelectionPersisting) {
        for index in group.challenges.indices {
            guard let snapshot = table.snapshot(at: index) else { continue }
            persistence.setSnapshot(snapshot,
                                    forKey: Self.challengeKey(group.challenges[index]))
        }
    }
}

// MARK: - tier 内选组（FUN_0006ed78）

/// 一个 tier 的选择器：组级权重容器 + 各组的选择器。
///
/// 与组内选择器的差异（macho）：本层**先 regrow 再扫组标志**。
public struct ChallengeTierSelector: Sendable {
    public let tier: ChallengeTierDefinition
    public private(set) var groupTable: ChallengeWeightTable
    public private(set) var selectors: [ChallengeGroupSelector]
    public private(set) var specialSelector: ChallengeSpecialGroupSelector?

    public init(tier: ChallengeTierDefinition,
                persistence: any ChallengeSelectionPersisting,
                defaultCooldown: Int32 = 4,
                specialChallenges: ChallengeSpecialGroupDefinition? = nil) {
        self.tier = tier
        let entries = tier.groups.enumerated().map { index, group -> ChallengeWeightEntry in
            let key = Self.groupKey(group: group)
            let snapshot = persistence.snapshot(forKey: key)
            return ChallengeWeightEntry(
                base: group.selection.chanceSelect,
                current: snapshot?.current ?? group.selection.chanceSelect,
                regrowth: group.selection.chanceRegrowth,
                value: Int32(index),
                cooldown: snapshot?.cooldown ?? 0)
        }
        self.groupTable = ChallengeWeightTable(entries: entries, defaultCooldown: defaultCooldown)
        self.selectors = tier.groups.map {
            ChallengeGroupSelector(group: $0, persistence: persistence,
                                   defaultCooldown: defaultCooldown)
        }
        self.specialSelector = specialChallenges.map {
            ChallengeSpecialGroupSelector(definition: $0, persistence: persistence,
                                          defaultCooldown: defaultCooldown)
        }
    }

    public static func groupKey(group: ChallengeGroupDefinition) -> ChallengeSelectionKey {
        .group(OriginalStringHash.hash(group.name))
    }

    /// FUN_0006ed78：tier 内选一个组，再对该组调 FUN_0006ec3c 选挑战。
    ///
    /// 顺序（macho）：
    ///   1. `groupTable.regrowAll()`（**无条件先 regrow**）。
    ///   2. 遍历组：`组.hasSelectablePriority && 组项 cooldown==0` 的首项
    ///      → `take(index:)`，直接选中；否则 `draw(rng:)`。
    ///   3. 写回所有组级 current/cooldown 快照。
    ///   4. 对被选中组执行组内选择。
    @discardableResult
    public mutating func select(rng: any RandomSource,
                                persistence: any ChallengeSelectionPersisting)
    -> ChallengeDefinition? {
        groupTable.regrowAll()

        var selectedGroup: Int?
        for index in tier.groups.indices {
            guard selectors.indices.contains(index),
                  selectors[index].hasSelectablePriority,
                  groupTable.entries[index].cooldown == 0 else { continue }
            groupTable.take(index: index)
            selectedGroup = index
            break
        }
        if selectedGroup == nil {
            selectedGroup = groupTable.draw(rng: rng)
        }

        writeBackGroupTable(persistence: persistence)

        guard let selectedGroup, tier.groups.indices.contains(selectedGroup) else { return nil }
        return selectors[selectedGroup].select(rng: rng, persistence: persistence)
    }

    private func writeBackGroupTable(persistence: any ChallengeSelectionPersisting) {
        for index in tier.groups.indices {
            guard let snapshot = groupTable.snapshot(at: index) else { continue }
            let key = Self.groupKey(group: tier.groups[index])
            persistence.setSnapshot(snapshot, forKey: key)
        }
    }

    /// FUN_0006ee88：生成回合计划。
    ///
    /// 1. 对每个 `mustSelect > 0` 的组，重复 mustSelect 次调用组内选择，
    ///    结果依次进入必选队列（组间顺序 = tier.groups 顺序，组内顺序 = 调用顺序）。
    /// 2. 特殊组仅在 numPerGame != 0、本局尚未选中且 tierIndex 非 0/2 时掷一次；
    ///    命中后立即计数并走普通组内选择，结果追加到同一队列。
    /// 3. 创建 `0..<numRounds` 槽位顺序，用注入 RNG 执行原版成对交换洗牌：
    ///    `n/2` 轮，每轮生成两个 `[0,n)` 索引并交换。
    /// 4. 按洗牌后的槽位顺序填充：先消耗队列，队列空后每槽走 tier 选择。
    ///
    /// 原版在队列挑战落到某槽时还会 `FUN_00039a28(tier+0x40, challenge+0x54)`；
    /// 普通必选记录父组索引，特殊组记录 -1，越界清除保持无操作。
    public mutating func planRound(persistence: any ChallengeSelectionPersisting,
                                   rng: any RandomSource,
                                   difficulty: Int32 = 0,
                                   tierIndex: Int32 = 0,
                                   roundCount: Int32? = nil) -> ChallengeRoundPlan {
        var mustSelectQueue: [(challenge: ChallengeDefinition, groupIndex: Int)] = []
        for index in tier.groups.indices {
            guard selectors.indices.contains(index) else { continue }
            let mustSelect = tier.groups[index].mustSelect
            guard mustSelect > 0 else { continue }
            var remaining = mustSelect
            while remaining > 0 {
                if let picked = selectors[index].select(rng: rng, persistence: persistence) {
                    mustSelectQueue.append((picked, index))
                }
                remaining -= 1
            }
        }

        // FUN_0006ee88 在普通必选构建之后、FUN_00039a64 洗牌之前处理特殊组。
        if let picked = specialSelector?.select(rng: rng, persistence: persistence,
                                               difficulty: difficulty, tierIndex: tierIndex) {
            mustSelectQueue.append((picked, -1))
        }

        let slotCount = max(0, Int(roundCount ?? tier.numRounds))
        var order = Array(0..<slotCount)
        Self.shufflePairwise(&order, rng: rng)

        var slots = [ChallengeDefinition?](repeating: nil, count: slotCount)
        var queueIndex = 0
        for slot in order {
            if queueIndex < mustSelectQueue.count {
                let required = mustSelectQueue[queueIndex]
                slots[slot] = required.challenge
                // challenge+0x54 是 FUN_0006f178 写入的父组索引；原机在此
                // 再清一次该父组的 tier 权重，而不是重复清挑战自身权重。
                groupTable.take(index: required.groupIndex)
                queueIndex += 1
            } else {
                slots[slot] = select(rng: rng, persistence: persistence)
            }
        }
        return ChallengeRoundPlan(
            slots: slots,
            remainingMustSelect: mustSelectQueue[queueIndex...].map(\.challenge))
    }

    /// FUN_0005fc1c：min==max 时不推进 RNG；否则用同一个量化浮点随机值
    /// 计算 min + (max-min)*rand，再向零取整。nextFloat 上界不包含 1。
    public static func rollRoundCount(tier: ChallengeTierDefinition,
                                      rng: any RandomSource) -> Int32 {
        let lower = tier.numRoundsMin
        let upper = tier.numRoundsMax
        guard lower != upper else { return lower }
        return Int32(Float(lower) + Float(upper - lower) * rng.nextFloat())
    }

    /// FUN_0005f94c：新局只清特殊组计数，权重和持久化快照保持不变。
    public mutating func resetGame() {
        specialSelector?.resetGame()
    }

    /// FUN_00039a64 的「成对交换」洗牌结构：n/2 轮，每轮取两个 `[0,n)` 索引交换。
    /// 随机源为注入 RandomSource；生产装配使用已验证 OriginalLCGRandom。
    static func shufflePairwise(_ array: inout [Int], rng: any RandomSource) {
        let n = array.count
        guard n > 1 else { return }
        let bound = Int32(n)
        let rounds = n / 2
        for _ in 0..<rounds {
            let a = Int(rng.nextInt(bound))
            let b = Int(rng.nextInt(bound))
            guard array.indices.contains(a), array.indices.contains(b) else { continue }
            array.swapAt(a, b)
        }
    }
}

// MARK: - 特殊单例随机组（FUN_00060d04 / FUN_00062be4 / FUN_00062ca4）

public struct ChallengeSpecialGroupSelector: Sendable {
    public let definition: ChallengeSpecialGroupDefinition
    public private(set) var selector: ChallengeGroupSelector
    public private(set) var selectionCount: Int32 = 0

    public init(definition: ChallengeSpecialGroupDefinition,
                persistence: any ChallengeSelectionPersisting,
                defaultCooldown: Int32 = 4) {
        self.definition = definition
        self.selector = ChallengeGroupSelector(group: definition.group,
                                               persistence: persistence,
                                               defaultCooldown: defaultCooldown)
    }

    /// 返回 nil 既可能是未触发，也可能是命中后空组无挑战；两种情况都不重掷门控。
    public mutating func select(rng: any RandomSource,
                                persistence: any ChallengeSelectionPersisting,
                                difficulty: Int32,
                                tierIndex: Int32) -> ChallengeDefinition? {
        guard definition.numPerGame != 0,
              selectionCount == 0,
              tierIndex != 0, tierIndex != 2 else { return nil }
        let threshold: Float
        switch difficulty {
        case 0: threshold = 0.2
        case 1: threshold = 0.5
        default: threshold = 0.8
        }
        guard rng.nextFloat() < threshold else { return nil }
        // 原机先增加本局计数，再经 FUN_00062ca4 调普通组内选择器。
        selectionCount += 1
        return selector.select(rng: rng, persistence: persistence)
    }

    public mutating func resetGame() {
        selectionCount = 0
    }
}

// MARK: - 回合计划

/// 原版结果数组（`+0x78`，每项 8 字节：挑战指针 + ChallengeOutcome）。
public struct ChallengeRoundPlan: Sendable, Equatable {
    public private(set) var slots: [ChallengeDefinition?]
    public private(set) var outcomes: [ChallengeOutcome?]
    /// 未消耗的必选（原版正常情况下应为空）。
    public private(set) var remainingMustSelect: [ChallengeDefinition]

    public init(slots: [ChallengeDefinition?] = [],
                remainingMustSelect: [ChallengeDefinition] = []) {
        self.slots = slots
        outcomes = Array(repeating: nil, count: slots.count)
        self.remainingMustSelect = remainingMustSelect
    }

    public var count: Int { slots.count }

    /// 按当前索引取 challenge 的纯值接口。
    public func challenge(at index: Int) -> ChallengeDefinition? {
        guard slots.indices.contains(index) else { return nil }
        return slots[index]
    }

    public func outcome(at index: Int) -> ChallengeOutcome? {
        guard outcomes.indices.contains(index) else { return nil }
        return outcomes[index]
    }

    /// FUN_00060108 把当前回合结果写回槽位 +4；pending 不是可记录的结果。
    public mutating func record(_ outcome: ChallengeOutcome, at index: Int) {
        guard outcomes.indices.contains(index), outcome != .pending else { return }
        outcomes[index] = outcome
    }
}

// ============================================================================
// 已核实的实现边界
//
// 1) 持久化 key 使用原版名称哈希，并按组／挑战分表；SaveStore 已提供磁盘适配。
// 2) 生产随机源为已验证 OriginalLCGRandom；测试使用脚本化 RandomSource。
// 3) 特殊组核心已闭合；App 的 tier/difficulty 与回合 UI 尚未接线。
// 4) [待验证] 持久化恢复状态的 FPToFixed 舍入与真机全序列尚未闭合。
// ============================================================================
