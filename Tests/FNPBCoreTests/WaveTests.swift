import XCTest
@testable import FNPBCore

// ============================================================================
// WaveTests — T-014 黄金值测试（T-027 大幅修订）
//
// 覆盖：
//   1) 默认值全项（WaveInfo / Spawner / SpawnerFruit / FruitInfo / BombInfo）
//      T-027 新增：waveNo / chance / min / max / minInc / maxInc / delay / delayInc
//   2) until 后处理（T-027 精修，精确符合 FUN_00053cb8 末尾循环）
//      - forever / atoi 采纳 / atoi 未采纳 / 非法 → 后处理
//      - 显式有效值不变（绝不做旧 step3 改写）
//      - 缺省取最近后续 waveNo - 1
//      - 无后续 → forever(-2)
//      - 重复 waveNo 被跳过
//      - 取所有严格更大波次的最小值（不限于数组后续索引）
//   3) 权重抽取分布（固定 LCG 种子可复现）
//   4) freeze 归零触发一次（+0x208 += 1）
//   5) 炸弹状态机 0 → 1 → 2
//
// ⚠️ 依赖假设：GameState 具备无参 init()（blueprint/GameState.swift 未在本卡注入）。
//    若编译失败需 Kimi 在最终审查时补充测试桩或 GameState 提供测试 init。
// ============================================================================

final class WaveTests: XCTestCase {

    // MARK: - 默认值表全项

    func test_WaveInfo_defaults() {
        let w = WaveInfo()

        // T-027 原始标识（未赋值占位）
        XCTAssertEqual(w.waveNo, -1)
        XCTAssertNil(w.chance)

        // until 缺省 -1（未解析处，后处理推 -2）
        XCTAssertEqual(w.until, Constants.WaveDefaults.untilUnparsed)

        // §4.1 常量表逐项
        XCTAssertEqual(w.chanceRegrowth, 0.25)
        XCTAssertEqual(w.criticalChance, 1.0)
        XCTAssertEqual(w.dt, 1.0)
        XCTAssertEqual(w.dtInc, 0.0)
        XCTAssertEqual(w.dtSpInc, 0.0)
        XCTAssertEqual(w.beforeDelay, 2.0)
        XCTAssertEqual(w.beforeDelayInc, 0.0)
        XCTAssertEqual(w.nextDelay, 0.0)
        XCTAssertEqual(w.nextDelayInc, 0.0)
        XCTAssertEqual(w.nextDelaySpInc, 0.0)
        XCTAssertTrue(w.waitForEntities)
        XCTAssertTrue(w.waitForProcessing)
        XCTAssertEqual(w.speedLoss, 0.0)
        XCTAssertEqual(w.overridePoolID, 10)
        XCTAssertEqual(w.overrideChance, 100)
        XCTAssertEqual(w.playersMin, 0)
        XCTAssertEqual(w.playersMax, -1)
        XCTAssertEqual(w.playersUpper, -1)
        XCTAssertTrue(w.spawners.isEmpty)
    }

    func test_Spawner_defaults() {
        let s = Spawner()
        XCTAssertEqual(s.name, "")
        XCTAssertEqual(s.mode, 0)

        // FUN_00053cb8 的 Spawn 元素初始化：min(+0x5c)=1，其余相关字段为 0。
        XCTAssertEqual(s.min, 1.0)
        XCTAssertEqual(s.max, 0.0)
        XCTAssertEqual(s.minInc, 0.0)
        XCTAssertEqual(s.maxInc, 0.0)
        XCTAssertEqual(s.delay, 0.0)
        XCTAssertEqual(s.delayInc, 0.0)

        // 旧字段保留
        XCTAssertEqual(s.minWait, 0.0)
        XCTAssertEqual(s.maxWait, 0.0)

        XCTAssertTrue(s.canSpawnWithPowers)
        // §4.1 spawner 元素 +0x2c = -1.0
        XCTAssertEqual(s.dontSpawnBeforeWave, -1.0)
        XCTAssertTrue(s.fruits.isEmpty)
        XCTAssertEqual(s.bombTriggerRemaining, 0)
        XCTAssertEqual(s.fruitSpawnRemaining, 0)
    }

    func test_SpawnerFruit_defaults() {
        let f = SpawnerFruit()
        XCTAssertEqual(f.kind, Constants.EntityPool.emptySlot)   // -1
        XCTAssertEqual(f.chance, 100)                             // §4.2 子节点默认
    }

    func test_FruitInfo_defaults() {
        let f = FruitInfo()
        XCTAssertEqual(f.score, 0)
        XCTAssertFalse(f.noScore)
        XCTAssertFalse(f.noCritical)
        XCTAssertFalse(f.onside)
        XCTAssertFalse(f.onlySprinkle)
        // §4.5（macho H）
        XCTAssertEqual(f.scale, 25.0)
        XCTAssertEqual(f.collision, 1.0)
        XCTAssertEqual(f.hitInfluence, 0.75)
        XCTAssertNil(f.bomb)
        // 未直读数值字段一律 nil
        XCTAssertNil(f.newLifeAt)
        XCTAssertNil(f.chance)
        XCTAssertNil(f.chanceInc)
        XCTAssertNil(f.splats)
        XCTAssertNil(f.spread)
        XCTAssertNil(f.disappearSpeed)
    }

    func test_BombInfo_defaults() {
        // [待验证] 沿用 FruitDefaults 占位；本测试锁定占位以防实现漂移
        let b = BombInfo()
        XCTAssertEqual(b.size, Constants.FruitDefaults.scale)         // 25.0
        XCTAssertEqual(b.collision, Constants.FruitDefaults.collision) // 1.0
    }

    // MARK: - until 后处理（FUN_00053cb8 末尾循环精确复刻）

    func test_until_forever_直接转负二() {
        let result = WaveInfo.postProcessUntil(rawTokens: ["forever"], waveNos: [0])
        XCTAssertEqual(result, [-2])
    }

    func test_until_atoi小于waveNo不采纳_无后续推为负二() {
        // "1" < waveNo=2 → 未解析 → -2 → 无严格更大 → 保持 -2
        let result = WaveInfo.postProcessUntil(rawTokens: ["1"], waveNos: [2])
        XCTAssertEqual(result, [-2])
    }

    func test_until_atoi大于等于waveNo采纳() {
        let result = WaveInfo.postProcessUntil(rawTokens: ["5"], waveNos: [2])
        XCTAssertEqual(result, [5])
    }

    func test_until_非法输入无后续推为负二() {
        let result = WaveInfo.postProcessUntil(rawTokens: ["garbage"], waveNos: [5])
        XCTAssertEqual(result, [-2])
    }

    func test_until_多波次正常() {
        // waveNos 真实 0 基 [0, 1, 2]
        let result = WaveInfo.postProcessUntil(
            rawTokens: ["1", "2", "forever"],
            waveNos: [0, 1, 2]
        )
        // i=0: "1">=0 → 显式 1（不改写）
        // i=1: "2">=1 → 显式 2（不改写）
        // i=2: forever → -2
        XCTAssertEqual(result, [1, 2, -2])
    }

    // MARK: - T-027 新增黄金值（旧实现会失败的关键场景）

    /// 显式有效值绝不被后续更小 waveNo 改写。
    /// 旧实现会把 5 改写为 2-1=1；新实现保持 5（FUN_00053cb8 末尾循环只处理 -1）。
    func test_until_显式有效值不变_即使有更小后续波次() {
        let result = WaveInfo.postProcessUntil(
            rawTokens: ["5", "forever"],
            waveNos: [0, 2]
        )
        XCTAssertEqual(result, [5, -2])
    }

    /// 空串表示 XML 缺省，取「所有严格更大 waveNo」的最小值 - 1。
    func test_until_缺省取最近后续waveNo减一() {
        let result = WaveInfo.postProcessUntil(
            rawTokens: ["", "forever"],
            waveNos: [0, 3]
        )
        XCTAssertEqual(result, [2, -2])
    }

    /// 无严格更大波次 → forever(-2)。
    func test_until_无后续保持forever() {
        let result = WaveInfo.postProcessUntil(rawTokens: ["garbage"], waveNos: [5])
        XCTAssertEqual(result, [-2])
    }

    /// 重复 waveNo 不构成「严格更大」，应被跳过。
    func test_until_重复waveNo被跳过() {
        let result = WaveInfo.postProcessUntil(
            rawTokens: ["", ""],
            waveNos: [2, 2]
        )
        XCTAssertEqual(result, [-2, -2])
    }

    /// 重复 waveNo 且存在后续更大：重复项彼此跳过，但主项取真实更大值。
    func test_until_重复waveNo被跳过_但有后续更大() {
        let result = WaveInfo.postProcessUntil(
            rawTokens: ["", "", ""],
            waveNos: [0, 2, 2]
        )
        XCTAssertEqual(result, [1, -2, -2])
    }

    /// 「所有严格更大波次」不限于数组后续索引 —— 前面的 waveNo 也要算入。
    func test_until_取所有严格更大波次的最小值() {
        let result = WaveInfo.postProcessUntil(
            rawTokens: ["", "", "forever"],
            waveNos: [2, 0, 3]
        )
        XCTAssertEqual(result, [2, 1, -2])
    }

    /// 原版 atoi 接受数字前缀，且 strcmp 只识别精确小写 forever。
    func test_until_atoi数字前缀与大小写敏感() {
        let result = WaveInfo.postProcessUntil(
            rawTokens: [" 12xyz", "Forever", "garbage"],
            waveNos: [0, 0, 0]
        )
        XCTAssertEqual(result, [12, 0, 0])
    }

    // MARK: - 权重抽取分布（固定 RandomSource 种子可复现）

    func test_SpawnTable_总权重与基本结构() {
        let table = SpawnTable(entries: [
            SpawnerFruit(kind: 1, chance: 50),
            SpawnerFruit(kind: 2, chance: 30),
            SpawnerFruit(kind: 3, chance: 20),
        ])
        XCTAssertEqual(table.totalChance, 100)
        XCTAssertFalse(table.isEmpty)
    }

    func test_SpawnTable_空表返回空槽() {
        let table = SpawnTable(entries: [])
        let rng = SeededRandomSource(seed: 1)
        XCTAssertEqual(table.draw(using: rng), Constants.EntityPool.emptySlot)
    }

    func test_SpawnTable_全部chance为零时返回空槽() {
        let table = SpawnTable(entries: [
            SpawnerFruit(kind: 1, chance: 0),
            SpawnerFruit(kind: 2, chance: 0),
        ])
        XCTAssertTrue(table.isEmpty)
        let rng = SeededRandomSource(seed: 1)
        XCTAssertEqual(table.draw(using: rng), Constants.EntityPool.emptySlot)
    }

    func test_SpawnTable_炸弹哨兵原样返回() {
        let table = SpawnTable(entries: [
            SpawnerFruit(kind: Constants.EntityPool.bombSlot, chance: 100),
        ])
        let rng = SeededRandomSource(seed: 42)
        for _ in 0..<100 {
            XCTAssertEqual(table.draw(using: rng), Constants.EntityPool.bombSlot)
        }
    }

    func test_SpawnTable_分布近似权重() {
        let table = SpawnTable(entries: [
            SpawnerFruit(kind: 1, chance: 50),
            SpawnerFruit(kind: 2, chance: 30),
            SpawnerFruit(kind: 3, chance: 20),
        ])
        let rng = SeededRandomSource(seed: 42)
        let total = 10_000
        var counts: [Int32: Int] = [:]
        for _ in 0..<total {
            let id = table.draw(using: rng)
            counts[id, default: 0] += 1
        }
        XCTAssertEqual(Double(counts[1] ?? 0) / Double(total), 0.5, accuracy: 0.02)
        XCTAssertEqual(Double(counts[2] ?? 0) / Double(total), 0.3, accuracy: 0.02)
        XCTAssertEqual(Double(counts[3] ?? 0) / Double(total), 0.2, accuracy: 0.02)
    }

    func test_SpawnTable_同种子可复现() {
        let entries = [
            SpawnerFruit(kind: 1, chance: 40),
            SpawnerFruit(kind: 2, chance: 60),
        ]
        let runA = sampleSequence(entries: entries, seed: 12345, count: 32)
        let runB = sampleSequence(entries: entries, seed: 12345, count: 32)
        XCTAssertEqual(runA, runB)
    }

    // MARK: - freeze 归零触发一次

    func test_freezes_归零触发一次() {
        let rng = SeededRandomSource(seed: 1)
        let director = WaveDirector(playerCount: 1, rng: rng)
        director.beginGame(waves: [WaveInfo()])   // 空 spawners，forceSpawn 安全

        let sink = MockWaveEventSink()
        director.events = sink

        director.triggerFreeze(player: 0, duration: 0.5)

        var state = GameState()
        let world = StubEntityStore()

        // 第 1 次：0.5 - 0.3 = 0.2（>0），不触发
        director.tick(dt: 0.3, state: &state, world: world)
        XCTAssertEqual(sink.freezeCount, 0)

        // 第 2 次：0.2 - 0.3 → 0，触发
        director.tick(dt: 0.3, state: &state, world: world)
        XCTAssertEqual(sink.freezeCount, 1)

        // 第 3 次：before=0，guard 跳过，不再触发
        director.tick(dt: 0.3, state: &state, world: world)
        XCTAssertEqual(sink.freezeCount, 1)

        XCTAssertEqual(director.runtime.freezeOnTriggerCount, 1)   // +0x208
    }

    func test_freezes_重新触发会再次计数() {
        let director = WaveDirector(playerCount: 1, rng: SeededRandomSource(seed: 2))
        director.beginGame(waves: [WaveInfo()])
        var state = GameState()
        let world = StubEntityStore()

        // 第一轮
        director.triggerFreeze(player: 0, duration: 0.1)
        director.tick(dt: 0.2, state: &state, world: world)
        XCTAssertEqual(director.runtime.freezeOnTriggerCount, 1)

        // 第二轮（重置标志）
        director.triggerFreeze(player: 0, duration: 0.1)
        director.tick(dt: 0.2, state: &state, world: world)
        XCTAssertEqual(director.runtime.freezeOnTriggerCount, 2)
    }

    // MARK: - 炸弹状态机

    func test_炸弹状态机_0到1到2() {
        let director = WaveDirector(playerCount: 1, rng: SeededRandomSource(seed: 7))
        director.beginGame(waves: [WaveInfo()])
        var state = GameState()
        let world = StubEntityStore()

        XCTAssertEqual(director.runtime.bombState, 0)

        // 0 → 1（arm 计时写入 [10, 20)）
        director.tick(dt: 1.0 / 60.0, state: &state, world: world)
        XCTAssertEqual(director.runtime.bombState, 1)
        XCTAssertGreaterThanOrEqual(director.runtime.bombArmTimer, 10.0)
        XCTAssertLessThan(director.runtime.bombArmTimer, 20.0)

        // bombArmFlag 未置位 → 状态保持 1
        director.tick(dt: 1.0 / 60.0, state: &state, world: world)
        XCTAssertEqual(director.runtime.bombState, 1)

        // 置位 → 迁 2
        director.runtime.bombArmFlag = 1
        director.tick(dt: 1.0 / 60.0, state: &state, world: world)
        XCTAssertEqual(director.runtime.bombState, 2)

        // 已到终态，不再前迁
        director.tick(dt: 1.0 / 60.0, state: &state, world: world)
        XCTAssertEqual(director.runtime.bombState, 2)
    }

    // MARK: - 辅助

    private func sampleSequence(entries: [SpawnerFruit],
                                seed: UInt64,
                                count: Int) -> [Int32] {
        let table = SpawnTable(entries: entries)
        let rng = SeededRandomSource(seed: seed)
        var out: [Int32] = []
        out.reserveCapacity(count)
        for _ in 0..<count {
            out.append(table.draw(using: rng))
        }
        return out
    }
}

// MARK: - 测试替身：确定性随机源（LCG）

/// 确定性 LCG 随机源，固定种子即可复现分布。
/// 与 `FNPBCore.RandomSource` 协议一致。
final class SeededRandomSource: RandomSource {

    private var state: UInt64

    init(seed: UInt64 = 1) {
        // 避免 0 态锁死
        self.state = seed == 0 ? 1 : seed
    }

    func nextFloat() -> Float {
        // Numerical Recipes LCG（64 位实现）
        state = state &* 6364136223846793005 &+ 1442695040888963407
        // 取高 32 位并规约到 [0,1)
        let bits = UInt32(truncatingIfNeeded: state >> 32)
        return Float(bits) / (Float(UInt32.max) + 1.0)
    }

    func nextInt(_ upperBound: Int32) -> Int32 {
        guard upperBound > 0 else { return 0 }
        let v = Int32(nextFloat() * Float(upperBound))
        // 防御性截断（浮点误差理论上可产生 == upperBound）
        return min(max(v, 0), upperBound - 1)
    }

    func snapshot() -> UInt64 { state }
    func restore(_ s: UInt64) { state = s == 0 ? 1 : s }
}

// MARK: - 测试替身：事件收集

final class MockWaveEventSink: WaveEventSink {
    private(set) var freezeCount = 0
    private(set) var waveStarts: [Int] = []

    func onFreeze(playerIndex: Int) {
        freezeCount += 1
    }

    func onWaveStart(waveIndex: Int, wave: WaveInfo) {
        waveStarts.append(waveIndex)
    }
}

// MARK: - 测试替身：最小 EntityStore

/// 空世界实现（本卡测试不依赖实体遍历）。
final class StubEntityStore: EntityStore {
    private(set) var entities: [EntityID: Entity] = [:]
    private var nextRaw: UInt32 = 1

    func spawn(_ prototype: EntityPrototype) -> EntityID {
        let id = EntityID(rawValue: nextRaw)
        nextRaw += 1
        var entity = Entity(id: id, kind: prototype.kind)
        entity.transform = prototype.transform
        entity.fruit = prototype.fruit
        entities[id] = entity
        return id
    }

    func despawn(_ id: EntityID) {
        entities.removeValue(forKey: id)
    }

    func clear() {
        entities.removeAll()
    }

    func forEach(_ body: (inout Entity) -> Bool) {
        // 保持生成序遍历（这里用插入序）
        for (_, entity) in entities {
            var copy = entity
            if !body(&copy) { return }
        }
    }

    func entity(_ id: EntityID) -> Entity? {
        entities[id]
    }

    var aliveCount: Int { entities.count }
}