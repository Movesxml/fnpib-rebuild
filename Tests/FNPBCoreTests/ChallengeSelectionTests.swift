import XCTest
@testable import FNPBCore

// ============================================================================
// T-036 选择器测试：恢复上限 / 冷却递减 / 优先未玩 / 持久化游玩次数 /
//                   必选队列 / 洗牌确定性 / 无可用项
// 所有随机输入都由脚本化 RandomSource 提供，避免依赖系统随机。
// ============================================================================

/// 脚本化随机源：按给定 Int32 序列作答；用尽后回落到 0。
final class ScriptedRandom: RandomSource {
    private let ints: [Int32]
    private var cursor = 0
    private(set) var floatCallCount = 0
    private(set) var intCallCount = 0

    init(ints: [Int32] = []) {
        self.ints = ints
    }

    private func nextRaw() -> Int32 {
        defer { cursor += 1 }
        return cursor < ints.count ? ints[cursor] : 0
    }

    func nextFloat() -> Float {
        floatCallCount += 1
        let raw = nextRaw()
        let positive = raw >= 0 ? raw : -raw
        return Float(positive) / 1_000_000
    }

    func nextInt(_ upperBound: Int32) -> Int32 {
        intCallCount += 1
        guard upperBound > 0 else { return 0 }
        let raw = nextRaw()
        let positive = raw >= 0 ? raw : -raw
        return positive % upperBound
    }

    func snapshot() -> UInt64 { 0 }
    func restore(_ s: UInt64) {}
}

private func weight(_ select: Int32, _ regrowth: Float) -> ChallengeSelectionWeight {
    ChallengeSelectionWeight(chanceSelect: select, chanceRegrowth: regrowth)
}

final class ChallengeSelectionTests: XCTestCase {

    // MARK: 1. regrow 恢复上限

    func testRegrowClampsToBase() {
        var table = ChallengeWeightTable(entries: [
            ChallengeWeightEntry(base: 20, current: 19, regrowth: 0.2, value: 0, cooldown: 0)
        ])
        table.regrowAll()
        // 19 + 20*0.2 = 23 → clamp 20
        XCTAssertEqual(table.entries[0].current, 20)
        XCTAssertEqual(table.totalWeight, 20)
    }

    func testRegrowSingleStepWhenCurrentZero() {
        var table = ChallengeWeightTable(entries: [
            ChallengeWeightEntry(base: 20, current: 0, regrowth: 0.2, value: 0, cooldown: 0)
        ])
        table.regrowAll()
        // 0 + 20*0.2 = 4
        XCTAssertEqual(table.entries[0].current, 4)
        XCTAssertEqual(table.totalWeight, 4)
    }

    func testRegrowZeroResultStaysZero() {
        var table = ChallengeWeightTable(entries: [
            ChallengeWeightEntry(base: 20, current: 0, regrowth: 0.0, value: 0, cooldown: 0)
        ])
        table.regrowAll()
        XCTAssertEqual(table.entries[0].current, 0)
        XCTAssertEqual(table.totalWeight, 0)
    }

    // MARK: 2. 冷却递减

    func testCooldownTicksDownAndExcludesFromTotal() {
        var table = ChallengeWeightTable(entries: [
            ChallengeWeightEntry(base: 20, current: 0, regrowth: 0.2, value: 0, cooldown: 3),
            ChallengeWeightEntry(base: 20, current: 20, regrowth: 0.2, value: 1, cooldown: 0)
        ])
        table.regrowAll()
        XCTAssertEqual(table.entries[0].cooldown, 2)
        XCTAssertEqual(table.entries[0].current, 0)
        // 第二项 20 + 20*0.2 = 24 → clamp 20
        XCTAssertEqual(table.entries[1].current, 20)
        XCTAssertEqual(table.totalWeight, 20, "冷却项的 current 不计入总权重")
    }

    func testTakeWritesDefaultCooldown() {
        var table = ChallengeWeightTable(entries: [
            ChallengeWeightEntry(base: 20, current: 20, regrowth: 0.2, value: 0, cooldown: 0)
        ], defaultCooldown: 4)
        table.take(index: 0)
        XCTAssertEqual(table.entries[0].current, 0)
        XCTAssertEqual(table.entries[0].cooldown, 4)
        XCTAssertEqual(table.totalWeight, 0)
    }

    // MARK: 3. 优先未玩

    func testPriorityChallengeSelectedWhenUnplayedAndReady() {
        let challenges = [
            ChallengeDefinition(name: "a", selection: weight(20, 0.2)),
            ChallengeDefinition(name: "b", prioritySelection: true, selection: weight(20, 0.2))
        ]
        let group = ChallengeGroupDefinition(name: "g", mustSelect: 0,
                                             selection: weight(20, 0.2),
                                             challenges: challenges)
        let store = ChallengeSelectionMemoryStore()
        var selector = ChallengeGroupSelector(group: group, persistence: store)
        let rng = ScriptedRandom(ints: [0])

        let picked = selector.select(rng: rng, persistence: store)
        XCTAssertEqual(picked?.name, "b", "priority 且未游玩应直接选中")
        XCTAssertEqual(store.snapshot(forKey: ChallengeGroupSelector.challengeKey(challenges[1]))?.cooldown, 4)
        XCTAssertEqual(store.snapshot(forKey: ChallengeGroupSelector.challengeKey(challenges[1]))?.current, 0)
        XCTAssertTrue(selector.hasSelectablePriority, "b 仍未游玩，标志应保持 true")
    }

    func testPrioritySkippedWhenCoolingDown() {
        // b 已在冷却：依然走加权抽取（用 roll=0 命中 a）
        let challenges = [
            ChallengeDefinition(name: "a", selection: weight(20, 0.2)),
            ChallengeDefinition(name: "b", prioritySelection: true, selection: weight(20, 0.2))
        ]
        let group = ChallengeGroupDefinition(name: "g", mustSelect: 0,
                                             selection: weight(20, 0.2),
                                             challenges: challenges)
        let store = ChallengeSelectionMemoryStore()
        store.setSnapshot(ChallengeSelectionSnapshot(current: 0, cooldown: 3), forKey: ChallengeGroupSelector.challengeKey(challenges[1]))
        var selector = ChallengeGroupSelector(group: group, persistence: store)
        let rng = ScriptedRandom(ints: [0])

        let picked = selector.select(rng: rng, persistence: store)
        XCTAssertEqual(picked?.name, "a")
    }

    // MARK: 4. 持久化游玩次数

    func testPlayedPriorityChallengeIsNotPreferred() {
        let challenges = [
            ChallengeDefinition(name: "a", selection: weight(20, 0.2)),
            ChallengeDefinition(name: "b", prioritySelection: true, selection: weight(20, 0.2))
        ]
        let group = ChallengeGroupDefinition(name: "g", mustSelect: 0,
                                             selection: weight(20, 0.2),
                                             challenges: challenges)
        let store = ChallengeSelectionMemoryStore()
        store.setPlayCount(1, forKey: ChallengeGroupSelector.challengeKey(challenges[1]))
        var selector = ChallengeGroupSelector(group: group, persistence: store)
        // roll = 0 → 命中第一个项 a
        let rng = ScriptedRandom(ints: [0])

        let picked = selector.select(rng: rng, persistence: store)
        XCTAssertEqual(picked?.name, "a", "已游玩过的 priority 挑战不应被直接选中")
        XCTAssertFalse(selector.hasSelectablePriority)
    }

    func testPriorityFlagFlipsAfterPlayCountIncreases() {
        let challenges = [
            ChallengeDefinition(name: "a", prioritySelection: true, selection: weight(20, 0.2))
        ]
        let group = ChallengeGroupDefinition(name: "g", mustSelect: 0,
                                             selection: weight(20, 0.2),
                                             challenges: challenges)
        let store = ChallengeSelectionMemoryStore()
        var selector = ChallengeGroupSelector(group: group, persistence: store)
        XCTAssertTrue(selector.hasSelectablePriority)

        store.setPlayCount(1, forKey: ChallengeGroupSelector.challengeKey(challenges[0]))
        // 触发一次选择刷新标志
        _ = selector.select(rng: ScriptedRandom(ints: [0]), persistence: store)
        XCTAssertFalse(selector.hasSelectablePriority)
    }

    // MARK: 5. 必选队列

    func testMustSelectGroupsFillQueueFirst() {
        let a1 = ChallengeDefinition(name: "a1", selection: weight(20, 0.2))
        let a2 = ChallengeDefinition(name: "a2", selection: weight(20, 0.2))
        let g1 = ChallengeGroupDefinition(name: "g1", mustSelect: 1,
                                          selection: weight(20, 0.2), challenges: [a1])
        let g2 = ChallengeGroupDefinition(name: "g2", mustSelect: 1,
                                          selection: weight(20, 0.2), challenges: [a2])
        let tier = ChallengeTierDefinition(name: "t", numRounds: 3, groups: [g1, g2])

        let store = ChallengeSelectionMemoryStore()
        var selector = ChallengeTierSelector(tier: tier, persistence: store)
        // 洗牌 + 后续组选择都会消耗随机数
        let rng = ScriptedRandom(ints: Array(repeating: 0, count: 64))

        let plan = selector.planRound(persistence: store, rng: rng)
        XCTAssertEqual(plan.count, 3)
        XCTAssertTrue(plan.remainingMustSelect.isEmpty,
                      "必选数量 2 <= 槽位数 3，队列应被全部消耗")

        let names = plan.slots.compactMap { $0?.name }
        XCTAssertTrue(names.contains("a1"), "必选队列中的 a1 必须出现在计划中")
        XCTAssertTrue(names.contains("a2"), "必选队列中的 a2 必须出现在计划中")
        XCTAssertEqual(selector.groupTable.entries.map(\.current), [0, 0])
        XCTAssertEqual(selector.groupTable.entries.map(\.cooldown), [3, 3],
                       "必选落槽必须清父组权重；第三次组选择再把冷却从4减到3")
    }

    func testMustSelectExceedingRoundsLeavesRemainder() {
        let a1 = ChallengeDefinition(name: "a1", selection: weight(20, 0.2))
        let a2 = ChallengeDefinition(name: "a2", selection: weight(20, 0.2))
        let g1 = ChallengeGroupDefinition(name: "g1", mustSelect: 2,
                                          selection: weight(20, 0.2), challenges: [a1])
        let g2 = ChallengeGroupDefinition(name: "g2", mustSelect: 2,
                                          selection: weight(20, 0.2), challenges: [a2])
        let tier = ChallengeTierDefinition(name: "t", numRounds: 2, groups: [g1, g2])

        let store = ChallengeSelectionMemoryStore()
        var selector = ChallengeTierSelector(tier: tier, persistence: store)
        let rng = ScriptedRandom(ints: Array(repeating: 0, count: 64))

        let plan = selector.planRound(persistence: store, rng: rng)
        XCTAssertEqual(plan.count, 2)
        XCTAssertEqual(plan.remainingMustSelect.count, 2,
                       "4 个必选仅 2 个槽位，剩余 2 个留在队列")
    }

    // MARK: 6. 洗牌确定性

    func testShuffleDeterministicUnderSameScript() {
        let challenges = (0..<4).map { i in
            ChallengeDefinition(name: "c\(i)", selection: weight(20, 0.2))
        }
        let groups = (0..<3).map { i in
            ChallengeGroupDefinition(name: "g\(i)", mustSelect: 1,
                                     selection: weight(20, 0.2), challenges: challenges)
        }
        let tier = ChallengeTierDefinition(name: "t", numRounds: 4, groups: groups)

        func run() -> [String?] {
            let store = ChallengeSelectionMemoryStore()
            var selector = ChallengeTierSelector(tier: tier, persistence: store)
            let rng = ScriptedRandom(ints: [0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3,
                                            0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3])
            let plan = selector.planRound(persistence: store, rng: rng)
            return plan.slots.map { $0?.name }
        }

        XCTAssertEqual(run(), run(), "同一随机序列应产生相同的槽位顺序")
    }

    func testShufflePairwiseSwapsInPlace() {
        var array = [0, 1, 2, 3]
        // 每轮两索引：0,1 → 交换；2,3 → 交换
        let rng = ScriptedRandom(ints: [0, 1, 2, 3])
        ChallengeTierSelector.shufflePairwise(&array, rng: rng)
        XCTAssertEqual(array, [1, 0, 3, 2])
    }

    // MARK: 7. 无可用权重仍按原版回退索引 0

    func testDrawReturnsZeroWhenNoWeight() {
        var table = ChallengeWeightTable(entries: [
            ChallengeWeightEntry(base: 20, current: 0, regrowth: 0.2, value: 7, cooldown: 0)
        ])
        XCTAssertEqual(table.draw(rng: ScriptedRandom(ints: [0])), 0,
                       "FUN_00039b24 的零权重回退是字面索引 0，不是首项 value")
    }

    func testGroupReturnsFirstChallengeWhenEverythingCoolingDown() {
        let challenge = ChallengeDefinition(name: "only", selection: weight(20, 0.2))
        let group = ChallengeGroupDefinition(name: "g", mustSelect: 0,
                                             selection: weight(20, 0.2),
                                             challenges: [challenge])
        let store = ChallengeSelectionMemoryStore()
        store.setSnapshot(ChallengeSelectionSnapshot(current: 0, cooldown: 5),
                          forKey: ChallengeGroupSelector.challengeKey(challenge))
        var selector = ChallengeGroupSelector(group: group, persistence: store)

        let picked = selector.select(rng: ScriptedRandom(ints: [0]), persistence: store)
        XCTAssertEqual(picked?.name, "only", "零总权重时原版仍选索引 0")
        // regrow 递减一次 cooldown；零权重回退不再次清除该项。
        XCTAssertEqual(store.snapshot(forKey: ChallengeGroupSelector.challengeKey(challenge))?.cooldown, 4)
        XCTAssertEqual(store.snapshot(forKey: ChallengeGroupSelector.challengeKey(challenge))?.current, 0)
    }

    // MARK: 8. 特殊挑战组

    private func specialFixture() -> (ChallengeTierDefinition, ChallengeSpecialGroupDefinition) {
        let ordinary = ChallengeDefinition(name: "ordinary", selection: weight(20, 0.2))
        let special = ChallengeDefinition(name: "special", selection: weight(20, 0.2))
        let tier = ChallengeTierDefinition(
            name: "t", numRounds: 1,
            groups: [ChallengeGroupDefinition(name: "g", challenges: [ordinary])])
        let configuration = ChallengeSpecialGroupDefinition(
            numPerGame: 1, group: ChallengeGroupDefinition(challenges: [special]))
        return (tier, configuration)
    }

    func testSpecialGroupDisabledOrWrongTierDoesNotRoll() {
        let (tier, configuration) = specialFixture()
        for tierIndex in [Int32(0), 2] {
            let store = ChallengeSelectionMemoryStore()
            var selector = ChallengeTierSelector(
                tier: tier, persistence: store, specialChallenges: configuration)
            let rng = ScriptedRandom(ints: Array(repeating: 0, count: 8))
            let plan = selector.planRound(persistence: store, rng: rng,
                                          difficulty: 2, tierIndex: tierIndex)
            XCTAssertEqual(plan.challenge(at: 0)?.name, "ordinary")
            XCTAssertEqual(rng.floatCallCount, 0)
            XCTAssertEqual(selector.specialSelector?.selectionCount, 0)
        }

        let zeroStore = ChallengeSelectionMemoryStore()
        var zeroConfiguration = configuration
        zeroConfiguration.numPerGame = 0
        var zeroSelector = ChallengeTierSelector(
            tier: tier, persistence: zeroStore, specialChallenges: zeroConfiguration)
        let zeroRNG = ScriptedRandom()
        _ = zeroSelector.planRound(persistence: zeroStore, rng: zeroRNG,
                                   difficulty: 2, tierIndex: 1)
        XCTAssertEqual(zeroRNG.floatCallCount, 0, "numPerGame == 0 时不掷特殊组随机数")

        let store = ChallengeSelectionMemoryStore()
        var selector = ChallengeTierSelector(tier: tier, persistence: store)
        let rng = ScriptedRandom()
        _ = selector.planRound(persistence: store, rng: rng, difficulty: 2, tierIndex: 1)
        XCTAssertEqual(rng.floatCallCount, 0, "真实文档无特殊组时不得额外消耗 RNG")
    }

    func testSpecialGroupThresholdsAndSingleSelectionPerGame() {
        let (tier, configuration) = specialFixture()
        let cases: [(difficulty: Int32, roll: Int32, selected: Bool)] = [
            (0, 199_999, true), (0, 200_000, false),
            (1, 499_999, true), (1, 500_000, false),
            (2, 799_999, true), (2, 800_000, false),
            (99, 799_999, true), (99, 800_000, false)
        ]
        for test in cases {
            let store = ChallengeSelectionMemoryStore()
            var selector = ChallengeTierSelector(
                tier: tier, persistence: store, specialChallenges: configuration)
            let rng = ScriptedRandom(ints: [test.roll, 0, 0])
            let plan = selector.planRound(persistence: store, rng: rng,
                                          difficulty: test.difficulty, tierIndex: 1)
            XCTAssertEqual(plan.challenge(at: 0)?.name,
                           test.selected ? "special" : "ordinary")
            XCTAssertEqual(rng.floatCallCount, 1)
            XCTAssertEqual(selector.specialSelector?.selectionCount,
                           test.selected ? 1 : 0)
        }
    }

    func testSpecialGroupResetsOnlySelectionCountOnNewGame() {
        let (tier, configuration) = specialFixture()
        let store = ChallengeSelectionMemoryStore()
        var selector = ChallengeTierSelector(
            tier: tier, persistence: store, specialChallenges: configuration)
        let rng = ScriptedRandom(ints: Array(repeating: 0, count: 16))
        XCTAssertEqual(selector.planRound(persistence: store, rng: rng,
                                          difficulty: 2, tierIndex: 1).challenge(at: 0)?.name,
                       "special")
        XCTAssertEqual(selector.planRound(persistence: store, rng: rng,
                                          difficulty: 2, tierIndex: 1).challenge(at: 0)?.name,
                       "ordinary")
        XCTAssertEqual(rng.floatCallCount, 1, "命中后同一局不再进行特殊组判定")
        selector.resetGame()
        XCTAssertEqual(selector.specialSelector?.selectionCount, 0)
        XCTAssertEqual(selector.planRound(persistence: store, rng: rng,
                                          difficulty: 2, tierIndex: 1).challenge(at: 0)?.name,
                       "special")
        XCTAssertEqual(rng.floatCallCount, 2)
    }

    func testSpecialGroupJoinsQueueBeforePairwiseShuffle() {
        let required = ChallengeDefinition(name: "required", selection: weight(20, 0.2))
        let special = ChallengeDefinition(name: "special", selection: weight(20, 0.2))
        let tier = ChallengeTierDefinition(
            name: "t", numRounds: 2,
            groups: [ChallengeGroupDefinition(name: "g", mustSelect: 1,
                                              challenges: [required])])
        let configuration = ChallengeSpecialGroupDefinition(
            numPerGame: 1, group: ChallengeGroupDefinition(challenges: [special]))
        let store = ChallengeSelectionMemoryStore()
        var selector = ChallengeTierSelector(
            tier: tier, persistence: store, specialChallenges: configuration)
        // 特殊门控 roll=0；必选及特殊组内选择 roll=0；洗牌交换槽位 0 和 1。
        let rng = ScriptedRandom(ints: [0, 0, 0, 0, 1])
        let plan = selector.planRound(persistence: store, rng: rng,
                                      difficulty: 2, tierIndex: 1)
        XCTAssertEqual(plan.slots.map { $0?.name }, ["special", "required"])
        XCTAssertEqual(rng.floatCallCount, 1)
    }

    // MARK: 9. 回合结果接口

    func testRoundCountUsesOriginalFloatRangeAndTruncation() {
        let tier = ChallengeTierDefinition(numRounds: 4, numRoundsMin: 3, numRoundsMax: 7)
        XCTAssertEqual(ChallengeTierSelector.rollRoundCount(
            tier: tier, rng: ScriptedRandom(ints: [0])), 3)
        XCTAssertEqual(ChallengeTierSelector.rollRoundCount(
            tier: tier, rng: ScriptedRandom(ints: [500_000])), 5)
        XCTAssertEqual(ChallengeTierSelector.rollRoundCount(
            tier: tier, rng: ScriptedRandom(ints: [999_999])), 6,
                       "浮点随机上界不包含 1，不能直接取 nextInt(max-min+1)")
    }

    func testFixedRoundCountDoesNotConsumeRandomness() {
        let tier = ChallengeTierDefinition(numRounds: 4, numRoundsMin: 4, numRoundsMax: 4)
        let rng = ScriptedRandom(ints: [999_999])
        XCTAssertEqual(ChallengeTierSelector.rollRoundCount(tier: tier, rng: rng), 4)
        XCTAssertEqual(rng.floatCallCount, 0)
        XCTAssertEqual(rng.intCallCount, 0)
    }

    func testPlanUsesRolledRoundCountInsteadOfStaticNumRounds() {
        let challenge = ChallengeDefinition(name: "a", selection: weight(20, 0.2))
        let tier = ChallengeTierDefinition(
            numRounds: 4, numRoundsMin: 1, numRoundsMax: 2,
            groups: [ChallengeGroupDefinition(name: "g", challenges: [challenge])])
        let store = ChallengeSelectionMemoryStore()
        var selector = ChallengeTierSelector(tier: tier, persistence: store)
        let count = ChallengeTierSelector.rollRoundCount(tier: tier, rng: ScriptedRandom())
        let plan = selector.planRound(persistence: store, rng: ScriptedRandom(), roundCount: count)
        XCTAssertEqual(plan.count, 1)
    }

    func testRoundPlanRecordAndLookup() {
        let a = ChallengeDefinition(name: "a", selection: weight(20, 0.2))
        var plan = ChallengeRoundPlan(slots: [nil, a])
        XCTAssertNil(plan.challenge(at: 0))
        XCTAssertEqual(plan.challenge(at: 1)?.name, "a")
        XCTAssertNil(plan.outcome(at: 1))
        plan.record(.pending, at: 1)
        XCTAssertNil(plan.outcome(at: 1), "pending 不得写成已结算结果")
        plan.record(.pass, at: 1)
        XCTAssertEqual(plan.outcome(at: 1), .pass)
        XCTAssertNil(plan.challenge(at: 2))
        XCTAssertNil(plan.outcome(at: 2))
    }

    // MARK: 10. 原版哈希 key 与组／挑战分表

    func testSelectionKeysUseOnlyOriginalNameHash() {
        let challenge = ChallengeDefinition(name: "Hash/Name")
        let group = ChallengeGroupDefinition(name: "Hash/Name")
        let expected = OriginalStringHash.hash("Hash/Name")

        XCTAssertEqual(ChallengeGroupSelector.challengeKey(challenge), .challenge(expected))
        XCTAssertEqual(ChallengeTierSelector.groupKey(group: group), .group(expected))
        XCTAssertNotEqual(ChallengeGroupSelector.challengeKey(challenge),
                          ChallengeTierSelector.groupKey(group: group))
    }

    func testSameHashUsesIndependentMemoryTablesAndGroupHasNoPlays() {
        let hash = OriginalStringHash.hash("same-name")
        let group = ChallengeSelectionKey.group(hash)
        let challenge = ChallengeSelectionKey.challenge(hash)
        let store = ChallengeSelectionMemoryStore()
        store.setSnapshot(ChallengeSelectionSnapshot(current: 11, cooldown: 2), forKey: group)
        store.setSnapshot(ChallengeSelectionSnapshot(current: 33, cooldown: 4), forKey: challenge)
        store.setPlayCount(7, forKey: challenge)
        store.setPlayCount(99, forKey: group)

        XCTAssertEqual(store.snapshot(forKey: group),
                       ChallengeSelectionSnapshot(current: 11, cooldown: 2))
        XCTAssertEqual(store.snapshot(forKey: challenge),
                       ChallengeSelectionSnapshot(current: 33, cooldown: 4))
        XCTAssertEqual(store.playCount(forKey: challenge), 7)
        XCTAssertEqual(store.playCount(forKey: group), 0)
    }
}