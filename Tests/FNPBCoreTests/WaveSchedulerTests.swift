import XCTest
@testable import FNPBCore

// ============================================================================
// WaveSchedulerTests — T-029 调度黄金值测试
//
// 覆盖任务卡 §8 要求：
//   1) 批次数量公式（min/max/minInc、区间端点、负值钳制、spInc 增量）
//   2) random 类型只在初始化阶段解析一次
//   3) 类型顺序（显式 fruit/bomb 保序）
//   4) timer（delay + delayInc*spInc）
//   5) 候选 until / forever / 重复 waveNo
//   6) currentChance 增长与选中清零
//   7) freeze 结束选择下一波
//   8) 真实 38 波 + 真实水果池开局：wave0 watermelon 生成 1
//
// ⚠️ 依赖测试替身：SeededRandomSource / MockWaveEventSink / StubEntityStore
//    （定义于 WaveTests.swift，同一 test target）。
// ============================================================================

final class WaveSchedulerTests: XCTestCase {

    // MARK: - 1) 批次数量公式

    func testBatchCountUsesMinMaxAndInc() {
        // min=2, max=5, minInc=1（加载器已把 maxinc 覆盖进 minInc 槽）
        let spawner = makeSpawner(min: 2, max: 5, minInc: 1, delay: 0.5, delayInc: 0.25)
        let wave = makeWave(waveNo: 0, until: -2, spawners: [spawner])
        let director = WaveDirector(playerCount: 1, rng: SeededRandomSource(seed: 42))
        director.beginGame(waves: [wave], fruits: [])

        XCTAssertEqual(director.runtime.spawnBatches.count, 1)
        let batch = director.runtime.spawnBatches[0][0]

        // spInc=0 → 区间 [2, 5)
        XCTAssertGreaterThanOrEqual(batch.total, 2)
        XCTAssertLessThan(batch.total, 5)
        XCTAssertEqual(batch.remaining, batch.total)
        XCTAssertEqual(batch.timer, 0.5, accuracy: 1e-6)
        XCTAssertEqual(batch.kinds, [1])
    }

    func testBatchCountEndpoints() {
        // min == max，无随机
        let spawner = makeSpawner(min: 3, max: 3)
        let wave = makeWave(waveNo: 0, until: -2, spawners: [spawner])
        let rng = CountingRandomSource(seed: 11)
        let director = WaveDirector(playerCount: 1, rng: rng)
        director.beginGame(waves: [wave], fruits: [])

        let batch = director.runtime.spawnBatches[0][0]
        XCTAssertEqual(batch.total, 3)
        XCTAssertEqual(rng.nextIntCalls, 0, "min == max 时不应消耗随机数")
    }

    func testBatchCountClampsNegativeToZero() {
        let spawner = makeSpawner(min: -2, max: -1)
        let wave = makeWave(waveNo: 0, until: -2, spawners: [spawner])
        let director = WaveDirector(playerCount: 1, rng: SeededRandomSource(seed: 5))
        director.beginGame(waves: [wave], fruits: [])

        let batch = director.runtime.spawnBatches[0][0]
        XCTAssertEqual(batch.total, 0)
        XCTAssertEqual(batch.remaining, 0)
    }

    func testBatchCountTruncatesTowardZero() {
        // trunc(1.9)=1, trunc(2.9)=2 → 区间 [1, 2)
        let spawner = makeSpawner(min: 1.9, max: 2.9)
        let wave = makeWave(waveNo: 0, until: -2, spawners: [spawner])
        let director = WaveDirector(playerCount: 1, rng: SeededRandomSource(seed: 9))
        director.beginGame(waves: [wave], fruits: [])
        XCTAssertEqual(director.runtime.spawnBatches[0][0].total, 1)
    }

    func testBatchCountUsesSpIncOnSecondSelection() {
        let spawner = makeSpawner(min: 2, max: 5, minInc: 1)
        let wave = makeWave(waveNo: 0, until: -2, spawners: [spawner])
        let director = WaveDirector(playerCount: 1, rng: SeededRandomSource(seed: 21))
        director.beginGame(waves: [wave], fruits: [])
        XCTAssertEqual(director.runtime.currentWaveSpInc, 0)

        // 第二次选择：spInc=1 → 区间 [3, 6)
        director.selectNextWave()
        XCTAssertEqual(director.runtime.currentWaveSpInc, 1)
        let batch = director.runtime.spawnBatches[0][0]
        XCTAssertGreaterThanOrEqual(batch.total, 3)
        XCTAssertLessThan(batch.total, 6)
    }

    // MARK: - 2) random 只在初始化阶段解析一次

    func testRandomResolvedOnceAtInit() {
        var apple = FruitInfo()
        apple.name = "apple"
        apple.typeID = 0
        apple.chance = 100

        var banana = FruitInfo()
        banana.name = "banana"
        banana.typeID = 5
        banana.chance = 300

        var pear = FruitInfo()
        pear.name = "pear"
        pear.typeID = 7
        pear.chance = nil   // 权重 0，不应被 random 命中

        let spawner = makeSpawner(min: 4, max: 4,
                                  types: [.random, .random, .fruit(9), .bomb])
        let wave = makeWave(waveNo: 0, until: -2, spawners: [spawner])

        let rng = CountingRandomSource(seed: 7)
        let director = WaveDirector(playerCount: 1, rng: rng)
        director.beginGame(waves: [wave], fruits: [apple, banana, pear])

        // 初始化：两个 random 各一次水果权重抽取；min == max 不抽数量。
        XCTAssertEqual(rng.nextIntCalls, 2)
        XCTAssertEqual(rng.nextIntUpperBounds, [400, 400])

        let batch = director.runtime.spawnBatches[0][0]
        XCTAssertEqual(batch.kinds.count, 4)
        XCTAssertEqual(batch.kinds[2], 9, "显式 fruit 保序")
        XCTAssertEqual(batch.kinds[3], Constants.EntityPool.bombSlot, "显式 bomb 保序")
        XCTAssertTrue([0, 5].contains(batch.kinds[0]))
        XCTAssertTrue([0, 5].contains(batch.kinds[1]))

        // FUN_00056098：生成时只随机选择已解析表的索引，不再抽水果权重。
        let sink = RecordingSpawnSink()
        director.spawnSink = sink
        var state = GameState()
        let world = StubEntityStore()
        for _ in 0..<8 {
            director.tick(dt: 0.1, state: &state, world: world)
        }
        XCTAssertEqual(rng.nextIntCalls, 6)
        XCTAssertEqual(Array(rng.nextIntUpperBounds.dropFirst(2)), [4, 4, 4, 4])
        XCTAssertEqual(sink.fruits.count + sink.bombs.count, 4)
    }

    func testRandomWithoutPositiveChanceUsesEmptySlotNotFruitZero() {
        // 水果池里没有任何 chance 正权重
        var pear = FruitInfo()
        pear.name = "pear"
        pear.typeID = 7
        pear.chance = nil

        let spawner = makeSpawner(min: 1, max: 1, types: [.random])
        let wave = makeWave(waveNo: 0, until: -2, spawners: [spawner])
        let director = WaveDirector(playerCount: 1, rng: SeededRandomSource(seed: 3))
        director.beginGame(waves: [wave], fruits: [pear])

        let batch = director.runtime.spawnBatches[0][0]
        XCTAssertEqual(batch.kinds, [Constants.EntityPool.emptySlot],
                       "无权重时返回空槽，不允许水果 0 兜底")
    }

    // MARK: - 3) 从初始化后的保序类型表随机取项

    func testSpawnDrawsRandomIndexFromResolvedTypes() {
        let spawner = makeSpawner(min: 3, max: 3,
                                  types: [.fruit(2), .fruit(4), .fruit(6)])
        let wave = makeWave(waveNo: 0, until: -2, spawners: [spawner])
        let rng = QueuedIndexRandomSource(indices: [0, 2, 1])
        let director = WaveDirector(playerCount: 1, rng: rng)
        let sink = RecordingSpawnSink()
        director.spawnSink = sink
        director.beginGame(waves: [wave], fruits: [])

        var state = GameState()
        let world = StubEntityStore()
        director.tick(dt: 0.1, state: &state, world: world)

        XCTAssertEqual(sink.fruits.map { $0.kind }, [2, 6, 4])
        XCTAssertEqual(rng.nextIntUpperBounds, [3, 3, 3])
        XCTAssertEqual(director.runtime.spawnBatches[0][0].remaining, 0)
    }

    // MARK: - 4) timer

    func testBatchTimerUsesDelayAndInc() {
        // delay=0.4, delayInc=0.2, spInc=0 → 间隔 0.4
        let spawner = makeSpawner(min: 2, max: 2, delay: 0.4, delayInc: 0.2)
        let wave = makeWave(waveNo: 0, until: -2, spawners: [spawner])
        let director = WaveDirector(playerCount: 1, rng: SeededRandomSource(seed: 1))
        let sink = RecordingSpawnSink()
        director.spawnSink = sink
        director.beginGame(waves: [wave], fruits: [])

        var state = GameState()
        let world = StubEntityStore()

        // 初始 timer = 0.4
        XCTAssertEqual(director.runtime.spawnBatches[0][0].timer, 0.4, accuracy: 1e-6)

        director.tick(dt: 0.25, state: &state, world: world)
        XCTAssertEqual(sink.fruits.count, 0)
        XCTAssertEqual(director.runtime.spawnBatches[0][0].timer, 0.15, accuracy: 1e-5)

        director.tick(dt: 0.25, state: &state, world: world)
        XCTAssertEqual(sink.fruits.count, 1, "0.15-0.25 <= 0 → 生成一个")
        XCTAssertEqual(director.runtime.spawnBatches[0][0].timer, 0.3, accuracy: 1e-5,
                       "生成后 timer += max(0, delay+delayInc*spInc)")
        XCTAssertEqual(director.runtime.spawnBatches[0][0].remaining, 1)
    }

    // MARK: - 5) 候选 until / forever / 重复编号

    func testWaveSelectionCandidatesUntilAndForever() {
        // chanceRegrowth=0 → 权重全 0 → 多候选取文档顺序首个
        let a = makeWave(waveNo: 0, until: 1, chanceRegrowth: 0,
                         spawners: [makeSpawner(name: "a")])
        let b = makeWave(waveNo: 1, until: 1, chanceRegrowth: 0,
                         spawners: [makeSpawner(name: "b")])
        let c = makeWave(waveNo: 1, until: -2, chanceRegrowth: 0,
                         spawners: [makeSpawner(name: "c")])

        let director = WaveDirector(playerCount: 1, rng: SeededRandomSource(seed: 8))
        director.beginGame(waves: [a, b, c], fruits: [])

        // FUN_000547ec 将计数重置为 -1；首次选波递增到 0，仅 a 候选。
        XCTAssertEqual(director.runtime.waveActivationCount, 0)
        XCTAssertEqual(director.runtime.currentWaveIndex, 0)

        // count=1：a、b、c 均候选；全零权重按文档顺序仍选 a。
        director.selectNextWave()
        XCTAssertEqual(director.runtime.waveActivationCount, 1)
        XCTAssertEqual(director.runtime.currentWaveIndex, 0)

        // count=2：a、b 超出 until；c(forever) 单候选。
        director.selectNextWave()
        XCTAssertEqual(director.runtime.waveActivationCount, 2)
        XCTAssertEqual(director.runtime.currentWaveIndex, 2)
    }

    func testDuplicateWaveNumbersAreNotIndices() {
        // 两波同 waveNo=0；重复编号合法，按数组下标区分。
        let first = makeWave(waveNo: 0, until: -2, chanceRegrowth: 0,
                             spawners: [makeSpawner(name: "first")])
        let second = makeWave(waveNo: 0, until: -2, chanceRegrowth: 0,
                              spawners: [makeSpawner(name: "second")])
        let director = WaveDirector(playerCount: 1, rng: SeededRandomSource(seed: 4))
        director.beginGame(waves: [first, second], fruits: [])

        XCTAssertEqual(director.runtime.waveActivationCount, 0)
        XCTAssertEqual(director.runtime.currentWaveIndex, 0)
        XCTAssertEqual(director.runtime.spawnBatches[0][0].kinds, [1])
    }

    // MARK: - 6) currentChance 增长与选中清零

    func testChanceGrowthAndResetOnSelection() {
        var a = makeWave(waveNo: 0, until: -2, chanceRegrowth: 0.5,
                         spawners: [makeSpawner(name: "a")])
        a.chance = 100
        var b = makeWave(waveNo: 0, until: -2, chanceRegrowth: 0.5,
                         spawners: [makeSpawner(name: "b")])
        b.chance = 100

        let director = WaveDirector(playerCount: 1, rng: SeededRandomSource(seed: 13))
        director.beginGame(waves: [a, b], fruits: [])

        // FUN_00054dd8：0 + trunc(0.5 * 100) = 50；选中者清零。
        let chances = director.runtime.currentChances
        XCTAssertEqual(chances.count, 2)
        XCTAssertEqual(chances.filter { $0 == 0 }.count, 1, "选中波 currentChance 清零")
        XCTAssertEqual(chances.filter { $0 == 50 }.count, 1,
                       "未选中波按 regrowth × maxChance 恢复整数权重")

        director.selectNextWave()
        XCTAssertTrue(director.runtime.currentChances.contains(0))
    }

    func testChanceGrowthAlsoAppliesToInactiveWave() {
        var active = makeWave(waveNo: 0, until: -2, chanceRegrowth: 0.25,
                              spawners: [makeSpawner(name: "active")])
        active.chance = 90
        var inactive = makeWave(waveNo: 5, until: -2, chanceRegrowth: 0.5,
                                spawners: [makeSpawner(name: "inactive")])
        inactive.chance = 100

        let director = WaveDirector(playerCount: 1, rng: SeededRandomSource(seed: 13))
        director.beginGame(waves: [active, inactive], fruits: [])
        XCTAssertEqual(director.runtime.currentChances, [0, 50],
                       "权重恢复发生在候选过滤之前，未激活波也恢复")
    }

    func testChanceCapsAtWaveChance() {
        var wave = makeWave(waveNo: 0, until: -2, chanceRegrowth: 200,
                            spawners: [makeSpawner(name: "w")])
        wave.chance = 90

        let director = WaveDirector(playerCount: 1, rng: SeededRandomSource(seed: 17))
        director.beginGame(waves: [wave], fruits: [])
        director.selectNextWave()
        XCTAssertEqual(director.runtime.currentChances[0], 0, "单候选每次选中后清零")

        var a = makeWave(waveNo: 0, until: -2, chanceRegrowth: 200,
                         spawners: [makeSpawner(name: "a")])
        a.chance = 90
        var b = makeWave(waveNo: 0, until: -2, chanceRegrowth: 200,
                         spawners: [makeSpawner(name: "b")])
        b.chance = 90
        let d2 = WaveDirector(playerCount: 1, rng: SeededRandomSource(seed: 19))
        d2.beginGame(waves: [a, b], fruits: [])
        for value in d2.runtime.currentChances where value > 0 {
            XCTAssertLessThanOrEqual(value, 90, "currentChance 不得超过 maxChance")
        }
    }

    // MARK: - 7) freeze 结束选择下一波

    func testFreezeEndSelectsNextWave() {
        let wave0 = makeWave(waveNo: 0, until: 0, chanceRegrowth: 0,
                             nextWait: 0.5, spawners: [makeSpawner(name: "w0")])
        let wave1 = makeWave(waveNo: 1, until: -2, chanceRegrowth: 0,
                             nextWait: 0.5, spawners: [makeSpawner(name: "w1")])

        let director = WaveDirector(playerCount: 1, rng: SeededRandomSource(seed: 3))
        let events = MockWaveEventSink()
        director.events = events
        director.beginGame(waves: [wave0, wave1], fruits: [])

        XCTAssertEqual(director.runtime.currentWaveIndex, 0)
        XCTAssertEqual(director.runtime.waveActivationCount, 0)

        var state = GameState()
        let world = StubEntityStore()
        // 两次精确的 0.25，避免 Float 累加五次 0.1 后留下微小正余量。
        director.tick(dt: 0.25, state: &state, world: world)
        director.tick(dt: 0.25, state: &state, world: world)

        XCTAssertEqual(events.freezeCount, 1)
        XCTAssertEqual(director.runtime.currentWaveIndex, 1, "freeze 结束调用 selectNextWave")
        XCTAssertEqual(director.runtime.waveActivationCount, 1)
    }

    // MARK: - 8) 真实内容开局

    func testRealContentOpensWithWave0Watermelon() throws {
        let content = try OriginalContentLoader.load(
            fruitsData: contentData("fruitList.json"),
            wavesData: contentData("originalWaveList.json"),
            bonusAwardsData: contentData("bonusAwards.json"),
            originalModeData: contentData("originalModeInfo.json"))

        XCTAssertEqual(content.waves.waves.count, 38)
        XCTAssertEqual(content.fruits.fruits.count, 24)

        let director = WaveDirector(playerCount: 1, rng: SeededRandomSource(seed: 2024))
        let sink = RecordingSpawnSink()
        director.spawnSink = sink
        director.beginGame(waves: content.waves.waves, fruits: content.fruits.fruits)
        XCTAssertEqual(director.runtime.currentWaveIndex, 0)
        let openingBatch = try XCTUnwrap(director.runtime.spawnBatches.first?.first)
        XCTAssertEqual(openingBatch.kinds, [3])
        XCTAssertEqual(openingBatch.total, 1, "真实 wave0 watermelon 数量必须为 1")
        XCTAssertEqual(openingBatch.remaining, 1)
        XCTAssertEqual(director.runtime.spawnFlag, [0], "尚未生成时不能置 spawnFlag")

        var state = GameState()
        let world = StubEntityStore()
        for _ in 0..<1800 {   // 30s @60Hz，足够覆盖真实 nextDelay
            director.tick(dt: 1.0 / 60.0, state: &state, world: world)
            if !sink.fruits.isEmpty { break }
        }

        XCTAssertFalse(sink.fruits.isEmpty, "真实波次开局必须生成水果")
        if let first = sink.fruits.first {
            XCTAssertEqual(first.kind, 3,
                           "wave0 首个生成应为 watermelon（typeID 3），而不是占位水果")
        }
    }

    // MARK: - 辅助

    private func makeSpawner(name: String = "s",
                             min: Float = 1,
                             max: Float = 1,
                             minInc: Float = 0,
                             delay: Float = 0,
                             delayInc: Float = 0,
                             types: [SpawnKind] = [.fruit(1)]) -> Spawner {
        var spawner = Spawner()
        spawner.name = name
        spawner.min = min
        spawner.max = max
        spawner.minInc = minInc
        spawner.delay = delay
        spawner.delayInc = delayInc
        spawner.types = types
        return spawner
    }

    private func makeWave(waveNo: Int32,
                          until: Int32,
                          chanceRegrowth: Float = 0,
                          nextDelay: Float = 0,
                          nextWait: Float = 60,
                          spawners: [Spawner]) -> WaveInfo {
        var wave = WaveInfo()
        wave.waveNo = waveNo
        wave.until = until
        wave.chanceRegrowth = chanceRegrowth
        wave.nextDelay = nextDelay
        wave.nextWait = nextWait
        wave.spawners = spawners
        return wave
    }

    private var repositoryRoot: URL {
        URL(fileURLWithPath: #filePath)
            .deletingLastPathComponent()
            .deletingLastPathComponent()
            .deletingLastPathComponent()
    }

    private func contentData(_ name: String) throws -> Data {
        try Data(contentsOf: repositoryRoot.appendingPathComponent("Content/\(name)"))
    }
}

// MARK: - 测试替身：记录生成的 sink

final class RecordingSpawnSink: WaveSpawnSink {
    struct Spawn: Equatable {
        let kind: Int32
        let spawnerName: String
    }

    private(set) var fruits: [Spawn] = []
    private(set) var bombs: [Spawn] = []

    func spawnFruit(kind: Int32, from spawner: Spawner, wave: WaveInfo) {
        fruits.append(Spawn(kind: kind, spawnerName: spawner.name))
    }

    func spawnBomb(from spawner: Spawner, wave: WaveInfo) {
        bombs.append(Spawn(kind: Constants.EntityPool.bombSlot, spawnerName: spawner.name))
    }
}

// MARK: - 测试替身：统计随机调用次数

final class CountingRandomSource: RandomSource {
    private var inner: SeededRandomSource
    private(set) var nextIntCalls = 0
    private(set) var nextIntUpperBounds: [Int32] = []
    private(set) var nextFloatCalls = 0

    init(seed: UInt64) {
        self.inner = SeededRandomSource(seed: seed)
    }

    func nextFloat() -> Float {
        nextFloatCalls += 1
        return inner.nextFloat()
    }

    func nextInt(_ upperBound: Int32) -> Int32 {
        nextIntCalls += 1
        nextIntUpperBounds.append(upperBound)
        return inner.nextInt(upperBound)
    }

    func snapshot() -> UInt64 { inner.snapshot() }
    func restore(_ s: UInt64) { inner.restore(s) }
}

/// 只规定 nextInt 的返回序列，用于锁定 FUN_00056098 的类型表索引抽取。
final class QueuedIndexRandomSource: RandomSource {
    private var indices: [Int32]
    private(set) var nextIntUpperBounds: [Int32] = []

    init(indices: [Int32]) { self.indices = indices }
    func nextFloat() -> Float { 0.5 }
    func nextInt(_ upperBound: Int32) -> Int32 {
        nextIntUpperBounds.append(upperBound)
        guard upperBound > 0, !indices.isEmpty else { return 0 }
        return min(max(indices.removeFirst(), 0), upperBound - 1)
    }
    func snapshot() -> UInt64 { 0 }
    func restore(_ s: UInt64) {}
}