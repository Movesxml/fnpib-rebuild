import XCTest
@testable import FNPBCore

// ============================================================================
// WaveTests — T-014 黄金值测试
//
// 覆盖：
//   1) 默认值全项（WaveInfo / Spawner / SpawnerFruit / FruitInfo / BombInfo）
//   2) until 三种输入后处理（forever / atoi 采纳 / atoi 未采纳 / 非法 → -2）
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

    // MARK: - until 三种输入后处理

    func test_until_forever_直接转负二() {
        let result = WaveInfo.postProcessUntil(rawTokens: ["forever"], waveNumbers: [1])
        XCTAssertEqual(result, [-2])
    }

    func test_until_atoi小于waveNo不采纳_推为负二() {
        // "1" < waveNo=2 → 不采纳（保留 -1）→ 末尾推 -2
        let result = WaveInfo.postProcessUntil(rawTokens: ["1"], waveNumbers: [2])
        XCTAssertEqual(result, [-2])
    }

    func test_until_atoi大于等于waveNo采纳() {
        let result = WaveInfo.postProcessUntil(rawTokens: ["5"], waveNumbers: [2])
        XCTAssertEqual(result, [5])
    }

    func test_until_非法输入推为负二() {
        let result = WaveInfo.postProcessUntil(rawTokens: ["garbage"], waveNumbers: [1])
        XCTAssertEqual(result, [-2])
    }

    func test_until_多波次正常() {
        let result = WaveInfo.postProcessUntil(
            rawTokens: ["1", "2", "forever"],
            waveNumbers: [1, 2, 3]
        )
        // i=0: "1">=1 → 1；步骤3：「1 < 2」→ 取 2-1 = 1（形同原值）
        // i=1: "2">=2 → 2；步骤3：「2 < 3」→ 取 3-1 = 2
        // i=2: forever → -2
        XCTAssertEqual(result, [1, 2, -2])
    }

    func test_until_步骤三跨波覆盖() {
        // until=0 且 waveNo=1 → 原 atoi 步不采纳(0<1)；转 -2 后不参与步骤3
        let result = WaveInfo.postProcessUntil(
            rawTokens: ["0", "0", "forever"],
            waveNumbers: [1, 2, 3]
        )
        XCTAssertEqual(result, [-2, -2, -2])
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

    func forEach(kind: EntityKind, _ body: (inout Entity) -> Bool) {
        // 保持生成序遍历（这里用插入序）
        for (_, entity) in entities where entity.kind == kind {
            var copy = entity
            if !body(&copy) { return }
        }
    }

    func entity(_ id: EntityID) -> Entity? {
        entities[id]
    }
}