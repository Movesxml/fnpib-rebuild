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
//   FUN_0003994c / FUN_00039b24  权重容器自带 64 位 LCG（种子 = app+0x1b4 低 32 位）；
//                                抽签推进自身状态，洗牌/门控仍用注入 RandomSource
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

/// 原版 `FUN_0003994c` 构造的容器：项数组 + 总权重 + 自带 64 位 LCG + 默认 cooldown。
///
/// 原版每个容器在构造时拷贝 `app+0x1b4` 的低 32 位作为种子、高 32 位清零
/// （findings/challenge_weighted_container_macho.md:145-160），抽签时只推进自己的
/// 状态（同文件 FUN_00039b24:84-94）；进程内多个容器同源但各自独立推进。
public struct ChallengeWeightTable: Sendable, Equatable {
    public private(set) var entries: [ChallengeWeightEntry]
    /// 原版容器 +0x10（构造函数传入，任务卡记为 4）。
    public var defaultCooldown: Int32
    /// 原版容器 +0x0C（`param_1[3]`）：只累计非冷却项的 current。
    public private(set) var totalWeight: Int32

    /// 原版容器 +0x14/+0x18（`param_1[5..6]`）的 64 位 LCG 状态。
    /// 原版构造时高 32 位写 0；生产调用方必须传入零扩展的 32 位种子。
    private var lcgState: UInt64

    /// - Parameter seed: 原版 `app+0x1b4` 的低 32 位；默认 0 保持旧调用可编译。
    public init(entries: [ChallengeWeightEntry] = [],
                defaultCooldown: Int32 = 4,
                seed: UInt64 = 0) {
        self.entries = entries
        self.defaultCooldown = defaultCooldown
        self.lcgState = seed
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
    /// 原版流程：先推进一次容器自己的 64 位 LCG；
    /// total 为 0 或 0xffffffff 时不缩放，否则 `roll ∈ [0, total)`。
    /// 顺序累加 **所有项** 的 current，首个 `roll < 累计` 的项被选中：
    /// total -= current、current = 0、cooldown = 默认，返回该项的 value。
    /// 未命中区间时同样返回字面 0（不是首项 value），不能改成空结果或重新抽取。
    ///
    /// ⚠️ 原版累加所有项（含冷却项），但 totalWeight 只含非冷却项；正常不变量下
    ///   冷却项 current 恒为 0，累加无影响。若持久化恢复了「cooldown>0 且 current>0」
    ///   的状态，行为可能与直觉不同——[待验证]，见风险点。
    ///
    /// 随机数来源：容器自带的 64 位 LCG；传入的 RandomSource 不读取、不推进。
    /// 洗牌、特殊组门控和水果选择仍由调用方使用注入的 RandomSource。
    public mutating func draw(rng _: any RandomSource) -> Int? {
        // [macho] FUN_00039b24:85-91 无条件推进容器自己的 64 位状态：
        //   state = state * 0x5d588b656c078965 + 0x269ec3
        // 再把新状态的高 32 位按总权重缩放（同函数 :92-93）；total 为 0 / 0xffffffff
        // 时不缩放，直接使用完整高 32 位。
        lcgState = lcgState &* 0x5d58_8b65_6c07_8965 &+ 0x0000_0000_0026_9ec3
        let high = UInt32(truncatingIfNeeded: lcgState >> 32)
        // [macho] FUN_00039b24:92-93 与 :102 全部按 **32 位无符号**处理：
        // 总权重是 uint，roll 是 umull 取高 32 位，区间比较也是 uint。
        // 用 Int32 有符号比较会在 total==0/-1（roll=完整 high32，bit31 可能为 1）时判反。
        let total = UInt32(bitPattern: totalWeight)
        let roll: UInt32
        if total != 0 && total != UInt32.max {
            roll = UInt32((UInt64(high) * UInt64(total)) >> 32)
        } else {
            roll = high
        }
        var cumulative: UInt32 = 0
        for i in entries.indices {
            cumulative = cumulative &+ UInt32(bitPattern: entries[i].current)
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

    /// - Parameter initialCurrent: 挑战项 current 的初始值。
    ///   [macho] 原版写的是**全局默认**（partyChallenges/defaults@chanceSelect，官方数据为 20），
    ///   而不是该挑战自己的 chanceSelect——后者只作为 base（regrow 的上限）
    ///   （findings/challenge_round_setup_macho.md:770-792；Mach-O __DATA 0x52cb54 = 0x14）。
    /// - Parameter seed: 原版 `app+0x1b4` 的低 32 位；该组的权重容器持有自己的 LCG 状态。
    public init(group: ChallengeGroupDefinition,
                persistence: any ChallengeSelectionPersisting,
                defaultCooldown: Int32 = 4,
                initialCurrent: Int32 = 20,
                seed: UInt64 = 0) {
        self.group = group
        let entries = group.challenges.enumerated().map { index, challenge -> ChallengeWeightEntry in
            let key = Self.challengeKey(challenge)
            let snapshot = persistence.snapshot(forKey: key)
            return ChallengeWeightEntry(
                base: challenge.selection.chanceSelect,
                current: snapshot?.current ?? initialCurrent,
                regrowth: challenge.selection.chanceRegrowth,
                value: Int32(index),
                cooldown: snapshot?.cooldown ?? 0)
        }
        self.table = ChallengeWeightTable(entries: entries,
                                          defaultCooldown: defaultCooldown,
                                          seed: seed)
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

    /// - Parameter initialCurrent: 组项 / 挑战项 current 的初始值，见
    ///   ChallengeGroupSelector.init 的说明（原版取全局默认，官方数据 20）。
    /// - Parameter seed: 原版 `app+0x1b4` 的低 32 位；组级容器与每个组/特殊组容器
    ///   都拷贝同一个种子，之后各自独立推进（findings/prng_seed_provenance_macho.md §4）。
    public init(tier: ChallengeTierDefinition,
                persistence: any ChallengeSelectionPersisting,
                defaultCooldown: Int32 = 4,
                specialChallenges: ChallengeSpecialGroupDefinition? = nil,
                initialCurrent: Int32 = 20,
                seed: UInt64 = 0) {
        self.tier = tier
        let entries = tier.groups.enumerated().map { index, group -> ChallengeWeightEntry in
            let key = Self.groupKey(group: group)
            let snapshot = persistence.snapshot(forKey: key)
            return ChallengeWeightEntry(
                base: group.selection.chanceSelect,
                current: snapshot?.current ?? initialCurrent,
                regrowth: group.selection.chanceRegrowth,
                value: Int32(index),
                cooldown: snapshot?.cooldown ?? 0)
        }
        self.groupTable = ChallengeWeightTable(entries: entries,
                                               defaultCooldown: defaultCooldown,
                                               seed: seed)
        self.selectors = tier.groups.map {
            ChallengeGroupSelector(group: $0, persistence: persistence,
                                   defaultCooldown: defaultCooldown,
                                   initialCurrent: initialCurrent,
                                   seed: seed)
        }
        self.specialSelector = specialChallenges.map {
            ChallengeSpecialGroupSelector(definition: $0, persistence: persistence,
                                          defaultCooldown: defaultCooldown,
                                          initialCurrent: initialCurrent,
                                          seed: seed)
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

    /// - Parameter seed: 原版 `app+0x1b4` 的低 32 位；特殊组挑战容器也从同一种子起步。
    public init(definition: ChallengeSpecialGroupDefinition,
                persistence: any ChallengeSelectionPersisting,
                defaultCooldown: Int32 = 4,
                initialCurrent: Int32 = 20,
                seed: UInt64 = 0) {
        self.definition = definition
        self.selector = ChallengeGroupSelector(group: definition.group,
                                               persistence: persistence,
                                               defaultCooldown: defaultCooldown,
                                               initialCurrent: initialCurrent,
                                               seed: seed)
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
// 2) 权重抽签使用容器自带 LCG（种子为 app+0x1b4 低 32 位）；洗牌/特殊组门控/
//    水果选择仍使用注入的 RandomSource（生产为 OriginalLCGRandom）。
// 3) 特殊组核心已闭合；App 的 tier/difficulty 与回合 UI 尚未接线。
// 4) [待验证] 持久化恢复状态的 FPToFixed 舍入与真机全序列尚未闭合。
// ============================================================================
