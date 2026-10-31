import Foundation

// ============================================================================
// WaveDirector — WaveDirecting 实现（T-014 初版 / T-029 按完整反编译重写）
//
// 本卡依据（任务卡 T-029 指定导出）：
//   - FUN_00054dd8（波次选择）/ FUN_00056098（生成主循环）[macho]
//   - FUN_00057af0（批次数量公式）[macho]
//   - FUN_00057b84 / FUN_00055670（random 类型仅在初始化阶段解析一次）[macho]
//   - FUN_000568f4（炸弹实体创建 → spawnBomb）[macho]
//
// 与 T-014 的差异：
//   1) 不再每帧无条件抽一次；改为「选波 → 批次初始化 → 按 timer 出果」。
//   2) 删除 forceSpawn（原版没有「立即出果」语义，freeze 结束是选下一波）。
//   3) 删除 Spawner.bombTriggerRemaining / fruitSpawnRemaining 的错误映射。
//   4) spawnFlag 只在真正生成实体时置 1（原版语义），不再每帧置 1。
//
// [待验证] 明确未闭合项（不臆造计数/接口）：
//   - waitForEntities / waitForProcessing 的「实体处理中」门控：EntityStore 现有接口
//     不足以表达处理中计数，本卡只保留有证据的等待计时本身。
//   - overridePoolID / overrideChance 的 override 池抽取（本卡只实现普通模式）。
//   - 多玩家 freeze 归零与全局选波的交互（本卡单玩家驱动 selectNextWave）。
// ============================================================================

// MARK: - SpawnBatch

/// 单玩家、单 spawner 的生成批次（T-029）。
///
/// `kinds` 在选波初始化阶段一次性解析完成：显式 `fruit`/`bomb` 保序，
/// `.random` 已按 `FruitInfo.chance` 累计权重展开为具体水果 ID。
/// 生成阶段按 FUN_00056098 从该表随机取索引，不会重新执行水果权重抽取。
public struct SpawnBatch: Sendable, Equatable {

    /// 初始化阶段解析后的类型序列：`-2` = 炸弹、`>= 0` = 水果 ID、`-1` = 空槽。
    public var kinds: [Int32]

    /// 本批次剩余生成数（原版 `remaining`）。
    public var remaining: Int32

    /// 本批次总数（原版 `total`，初始化时与 `remaining` 相同）。
    public var total: Int32

    /// 下一次生成的等待计时（秒）。
    public var timer: Float

    public init(kinds: [Int32] = [],
                remaining: Int32 = 0,
                total: Int32 = 0,
                timer: Float = 0) {
        self.kinds = kinds
        self.remaining = remaining
        self.total = total
        self.timer = timer
    }
}

// MARK: - WaveRuntime

/// 波次系统运行时状态。
///
/// 字段来源：
///  - `+0x170..+0x17c` 每玩家冻结 / 生成状态 → §5.3 FUN_00056098
///  - `+0x248..+0x2a0` WaveManager 计数 / 计时 → §4.3 FUN_00027f24（13 键双源确认）
///  - `+0x208` 冻结触发计数 → §5.3 步骤 4
///
/// T-029 新增：激活计数、每波 currentChance、批次表、当前波 spInc。
public struct WaveRuntime: Sendable {

    // -- WaveManager 计数（§4.3，13 键双源确认）---------------------------------
    public var waveCount: Int32 = 0                 // +0x248
    public var numberOfWavesSpawned: Int32 = 0      // +0x24c
    public var numberOfWavesSinceReset: Int32 = 0   // +0x250
    public var waveDelay: Float = 0                 // +0x254
    public var waveWait: Float = 0                  // +0x258
    public var blitzSpawnedThisGame: Int32 = 0      // +0x298
    public var blitzForceSpawnedCounter: Int32 = 0  // +0x29c
    public var blitzSpawnTime: Float = 0            // +0x2a0

    // -- freeze / 生成状态（§5.3）----------------------------------------------
    /// 每玩家 spawn 冻结计时（原 `+0x170 + i*4`）。`<= 0` 时允许生成，`> 0` 倒计时。
    public var spawnFreeze: [Float] = []
    /// 每玩家 freeze 剩余计时（原 `+0x174 + i*4`）。归零触发 OnFreeze + `+0x208`。
    public var freezeRemaining: [Float] = []
    /// 每玩家生成标记（原 `+0x178 + i`，1 byte；仅生成时置 1）。
    public var spawnFlag: [UInt8] = []

    /// 炸弹 arm 标志（原 `+0x179`，byte）。`== 1` 时状态机 1→2。
    public var bombArmFlag: UInt8 = 0
    /// 炸弹状态机（原 `+0x17a`，byte）：0 → 1 → 2。
    public var bombState: UInt8 = 0
    /// 每帧清零标志（原 `+0x17b`，byte）。
    public var frameFlag: UInt8 = 0
    /// 炸弹 arm 计时（原 `+0x17c`，float；`rand*10+10`）。
    public var bombArmTimer: Float = 0

    /// 冻结触发计数（原 `+0x208`，int；每次 freezeRemaining 归零 +1）。
    public var freezeOnTriggerCount: Int32 = 0

    /// 当前帧炸弹生成计数（[待验证] 统计用途）。
    public var bombCount: Int32 = 0

    // -- 波次调度 --------------------------------------------------------------
    /// 当前活动波在 `WaveDirector.waves` 数组中的位置（不是 waveNo）。
    public var currentWaveIndex: Int = 0

    // -- T-029 ----------------------------------------------------------------

    /// 激活计数：FUN_000547ec 开局重置为 -1；每次 `selectNextWave` 先 +1，
    /// 因而首轮用于候选条件的 count=0（`waveNo <= count`）。
    public var waveActivationCount: Int32 = -1

    /// 是否已经完成过至少一次选波（控制 spInc 的非首次递增语义）。
    public var hasSelectedWave: Bool = false

    /// 当前波 spInc：初值 0；每次非首次选波时 +1；用于数量/延迟的增量公式。
    public var currentWaveSpInc: Int32 = 0

    /// `[player][spawner]` 批次表（选波后初始化）。
    public var spawnBatches: [[SpawnBatch]] = []

    /// 每波 currentChance（原 `WaveInfo +0x80`，Int32；与 waves 对齐，初值 0）。
    public var currentChances: [Int32] = []

    public init() {}
}

// MARK: - 回调协议

/// 波次事件（对应 §5.3 步骤 3/4 的单例 vtable +0x38/+0x3c 回调）。
public protocol WaveEventSink: AnyObject {
    /// 冻结归零触发（原单例 vtable+0x38 OnFreeze）[macho H]。
    func onFreeze(playerIndex: Int)
    /// 波次开始（用于 UI / 音乐）。
    func onWaveStart(waveIndex: Int, wave: WaveInfo)
}

/// 生成 / 炸弹回调（解耦 ECS 任务卡）。
public protocol WaveSpawnSink: AnyObject {
    /// 普通水果创建（对应 FUN_00057000）[macho M]。
    func spawnFruit(kind: Int32, from spawner: Spawner, wave: WaveInfo)
    /// 炸弹实体创建（对应 FUN_000568f4；T-029 由 triggerExplosion 更名）[macho M]。
    func spawnBomb(from spawner: Spawner, wave: WaveInfo)
}

// MARK: - WaveDirector

/// 波次调度器（`WaveDirecting` 实现）。
///
/// 非 Sendable：持有 `RandomSource` / `WaveEventSink` / `WaveSpawnSink` 等有状态
/// AnyObject，按设计由逻辑线程（MainActor）独占，禁止跨 actor 传递。
public final class WaveDirector: WaveDirecting {

    // MARK: Public state

    /// 当前关卡波次表（`beginGame(waves:fruits:)` 载入）。
    public private(set) var waves: [WaveInfo] = []

    /// 运行时状态。模块内可写（`@testable` 测试可注入），模块外只读。
    public internal(set) var runtime = WaveRuntime()

    /// 玩家数量（生成循环逐玩家执行）。
    public let playerCount: Int

    // MARK: Dependencies（弱引用，避免宿主 ↔ 波次互相强持有）

    public weak var events: (any WaveEventSink)?
    public weak var spawnSink: (any WaveSpawnSink)?

    // MARK: Private

    private let rng: any RandomSource

    /// 真实水果池（`beginGame(waves:fruits:)` 注入；`.random` 抽取用）。
    private var fruits: [FruitInfo] = []

    /// 每玩家 freeze 触发一次性保证（防止归零后每帧重复触发）。
    private var freezeTriggered: [Bool] = []

    /// `WaveInfo.chance` 缺省兜底（加载器通常会继承 defaults.waveChance = 90）。
    private static let fallbackWaveChance: Int32 = 90

    // MARK: Init

    public init(playerCount: Int = 1, rng: any RandomSource) {
        let n = max(1, playerCount)
        self.playerCount = n
        self.rng = rng
        // 初始不武装：未选波前 freeze 不触发
        self.freezeTriggered = [Bool](repeating: true, count: n)

        var r = WaveRuntime()
        r.spawnFreeze = [Float](repeating: 0, count: n)
        r.freezeRemaining = [Float](repeating: 0, count: n)
        r.spawnFlag = [UInt8](repeating: 0, count: n)
        self.runtime = r
    }

    // MARK: Game lifecycle

    /// 旧重载（无水果池；`.random` 将解析为空槽而不生成）[T-029 保留]。
    public func beginGame(waves: [WaveInfo]) {
        beginGame(waves: waves, fruits: [])
    }

    /// 载入波次表 + 真实水果池，重置运行时并立即选择第一波。
    public func beginGame(waves: [WaveInfo], fruits: [FruitInfo]) {
        self.waves = waves
        self.fruits = fruits

        var r = WaveRuntime()
        r.spawnFreeze = [Float](repeating: 0, count: playerCount)
        r.freezeRemaining = [Float](repeating: 0, count: playerCount)
        r.spawnFlag = [UInt8](repeating: 0, count: playerCount)
        r.currentChances = [Int32](repeating: 0, count: waves.count)
        self.runtime = r
        self.freezeTriggered = [Bool](repeating: true, count: playerCount)

        if !waves.isEmpty {
            selectNextWave()
        }
    }

    // MARK: WaveDirecting

    /// 每帧推进（§1.2 步骤 10 的子路径；分支链见 core_logic_notes §5.3）。
    public func tick(dt: Float, state: inout GameState, world: any EntityStore) {
        _ = state  // GameState 字段定义未在本卡注入；freeze 运行态暂存 WaveRuntime
        _ = world  // 世界生成走 spawnSink（避免扩展 EntityStore 过渡协议）

        guard dt > 0 else { return }
        guard runtime.spawnFreeze.count == playerCount else { return }

        // 步骤 1（步骤 3 的前置）：+0x17b = 0，本帧清零
        runtime.frameFlag = 0

        // 步骤 3：spawnFreeze 门控 → 生成循环
        for player in 0..<playerCount {
            if runtime.spawnFreeze[player] > 0 {
                runtime.spawnFreeze[player] = max(0, runtime.spawnFreeze[player] - dt)
                continue
            }
            runSpawnLoop(dt: dt, player: player)
        }

        // 步骤 4：freezeRemaining 递减，归零触发 OnFreeze → 选下一波
        tickFreezeRemaining(dt: dt)

        // 步骤 5：炸弹状态机 0 → 1 → 2
        tickBombStateMachine()
    }

    // MARK: Public helpers

    /// 由关卡逻辑触发冻结（外部设置 freezeRemaining）。
    /// 若该玩家已有冻结计时，则覆盖并重置「触发一次」标志。
    public func triggerFreeze(player: Int, duration: Float) {
        guard player >= 0, player < playerCount else { return }
        runtime.freezeRemaining[player] = max(0, duration)
        freezeTriggered[player] = false
    }

    /// 波次选择（FUN_00054dd8 重建）[macho]。
    ///
    ///  1. 激活计数 +1；非首次选择时旧波 spInc +1。
    ///  2. 所有波先执行权重恢复，再筛选候选；未到激活编号或已过 until 的波也恢复。
    ///  3. `currentChance` 是 Int32：增量为 `trunc(chanceRegrowth * maxChance)`，
    ///     不是把浮点 regrowth 直接加到权重；结果钳到 maxChance。
    ///  4. 候选：`waveNo <= count` 且（`count <= until` 或 `until == -2`）。
    ///  5. 多候选按 `currentChance * 10` 权重随机；选中波清零，重复 waveNo 合法。
    ///
    /// [待验证] 全零权重时取文档顺序候选（原版分支未在导出文本中直接体现）。
    public func selectNextWave() {
        guard !waves.isEmpty else { return }

        runtime.waveActivationCount += 1
        let count = runtime.waveActivationCount
        if runtime.hasSelectedWave {
            runtime.currentWaveSpInc += 1
        }
        runtime.hasSelectedWave = true
        ensureChanceArray()

        // 原函数在同一个完整 waves 遍历中先恢复权重，再判断候选资格。
        var candidates: [Int] = []
        for (index, wave) in waves.enumerated() {
            let maxChance = wave.chance ?? Self.fallbackWaveChance
            if wave.chanceRegrowth > 0 {
                let current = runtime.currentChances[index]
                if current < maxChance {
                    let increment = truncToInt32(Float(maxChance) * wave.chanceRegrowth)
                    runtime.currentChances[index] = min(maxChance, current &+ increment)
                } else {
                    runtime.currentChances[index] = maxChance
                }
            }

            guard wave.waveNo <= count else { continue }
            if wave.until == Constants.WaveDefaults.untilForever || count <= wave.until {
                candidates.append(index)
            }
        }
        guard !candidates.isEmpty else { return }

        let chosen = pickCandidate(candidates)
        runtime.currentChances[chosen] = 0
        runtime.currentWaveIndex = chosen

        let wave = waves[chosen]
        initializeBatches(wave: wave, spInc: runtime.currentWaveSpInc)
        applyFreezeTimers(wave: wave, spInc: runtime.currentWaveSpInc)
        events?.onWaveStart(waveIndex: chosen, wave: wave)
    }

    // MARK: Private — selection

    private func pickCandidate(_ candidates: [Int]) -> Int {
        guard candidates.count > 1 else { return candidates[0] }

        var weights: [Int32] = []
        var total: Int32 = 0
        for index in candidates {
            let weight = runtime.currentChances[index] &* 10
            weights.append(weight)
            total = total &+ weight
        }
        guard total > 0 else { return candidates[0] }

        let roll = rng.nextInt(total)
        var acc: Int32 = 0
        for (offset, weight) in weights.enumerated() {
            acc = acc &+ weight
            if roll < acc { return candidates[offset] }
        }
        return candidates[candidates.count - 1]
    }

    private func ensureChanceArray() {
        if runtime.currentChances.count != waves.count {
            var arr = runtime.currentChances
            if arr.count < waves.count {
                arr.append(contentsOf: [Int32](repeating: 0, count: waves.count - arr.count))
            } else {
                arr.removeLast(arr.count - waves.count)
            }
            runtime.currentChances = arr
        }
    }

    private func applyFreezeTimers(wave: WaveInfo, spInc: Int32) {
        let inc = Float(spInc)
        let freeze = max(0, wave.nextDelay + wave.nextDelayInc * inc)
        let wait = max(0, wave.nextWait + wave.nextWaitSpInc * inc)
        for player in 0..<playerCount {
            runtime.spawnFreeze[player] = freeze
            runtime.freezeRemaining[player] = wait
            freezeTriggered[player] = false
        }
    }

    // MARK: Private — batch init

    private func initializeBatches(wave: WaveInfo, spInc: Int32) {
        var perPlayer: [[SpawnBatch]] = []
        perPlayer.reserveCapacity(playerCount)
        for _ in 0..<playerCount {
            var batches: [SpawnBatch] = []
            batches.reserveCapacity(wave.spawners.count)
            for spawner in wave.spawners {
                batches.append(makeBatch(spawner: spawner, spInc: spInc))
            }
            perPlayer.append(batches)
        }
        runtime.spawnBatches = perPlayer
    }

    /// 批次数量（FUN_00057af0 重建）[macho]。
    ///
    /// `low = trunc(min + minInc*spInc)`、`high = trunc(max + minInc*spInc)`，各自钳到 >= 0；
    /// `high > low` → `rng.nextInt(high - low) + low`，否则 `low`。
    /// 注意：加载器已把 XML `maxinc` 覆盖进 `minInc` 槽，运行时不重复加 `maxInc`。
    private func makeBatch(spawner: Spawner, spInc: Int32) -> SpawnBatch {
        let inc = Float(spInc)
        let low = truncToInt32(spawner.min + spawner.minInc * inc)
        let high = truncToInt32(spawner.max + spawner.minInc * inc)

        let count: Int32
        if high > low {
            count = rng.nextInt(high - low) &+ low
        } else {
            count = low
        }

        var batch = SpawnBatch()
        batch.kinds = resolveTypeSequence(spawner: spawner)
        batch.remaining = count
        batch.total = count
        batch.timer = max(0, spawner.delay + spawner.delayInc * inc)
        return batch
    }

    /// 初始化阶段一次性解析类型序列：显式 fruit/bomb 保序，random 按权重抽一次。
    private func resolveTypeSequence(spawner: Spawner) -> [Int32] {
        var kinds: [Int32] = []
        kinds.reserveCapacity(spawner.types.count)
        for kind in spawner.types {
            switch kind {
            case .fruit(let id):
                kinds.append(id)
            case .bomb:
                kinds.append(Constants.EntityPool.bombSlot)
            case .random:
                kinds.append(drawRandomFruit())
            }
        }
        return kinds
    }

    /// 普通模式权重抽取：按 `FruitInfo.chance` 累计和、保持文档顺序。
    /// 无正权重候选 → 空槽（-1），**不以水果 0 兜底** [macho]。
    private func drawRandomFruit() -> Int32 {
        var cumulative: [Int64] = []
        var total: Int64 = 0
        for fruit in fruits {
            total += max(0, Int64(fruit.chance ?? 0))
            cumulative.append(total)
        }
        guard total > 0 else { return Constants.EntityPool.emptySlot }

        let bound = total >= Int64(Int32.max) ? Int32.max : Int32(total)
        let roll = Int64(rng.nextInt(bound))
        for (index, boundary) in cumulative.enumerated() where roll < boundary {
            return fruits[index].typeID
        }
        return Constants.EntityPool.emptySlot
    }

    // MARK: Private — step 3

    private func runSpawnLoop(dt: Float, player: Int) {
        guard !waves.isEmpty,
              runtime.currentWaveIndex >= 0,
              runtime.currentWaveIndex < waves.count else { return }
        let wave = waves[runtime.currentWaveIndex]
        guard player >= 0, player < runtime.spawnBatches.count else { return }
        guard runtime.spawnBatches[player].count == wave.spawners.count else { return }

        let inc = Float(runtime.currentWaveSpInc)
        var batches = runtime.spawnBatches[player]

        for index in batches.indices {
            guard batches[index].remaining > 0 else { continue }
            batches[index].timer -= dt

            while batches[index].remaining > 0 && batches[index].timer <= 0 {
                let kind = takeKind(from: batches[index])
                emitSpawn(kind: kind, spawner: wave.spawners[index], wave: wave)
                batches[index].remaining -= 1
                runtime.spawnFlag[player] = 1

                if batches[index].remaining > 0 {
                    let spawner = wave.spawners[index]
                    let interval = spawner.delay + spawner.delayInc * inc
                    batches[index].timer += max(0, interval)
                }
            }
        }

        runtime.spawnBatches[player] = batches
    }

    /// FUN_00056098：每实体从已解析的类型表随机取一个索引；表本身不在此重建。
    private func takeKind(from batch: SpawnBatch) -> Int32 {
        guard !batch.kinds.isEmpty else { return Constants.EntityPool.emptySlot }
        let index = Int(rng.nextInt(Int32(batch.kinds.count)))
        return batch.kinds[index]
    }

    // MARK: Private — step 4

    private func tickFreezeRemaining(dt: Float) {
        // [待验证] 多玩家时只让第一个归零的玩家驱动全局选波；原版 per-player 语义未闭合。
        for player in 0..<playerCount where !freezeTriggered[player] {
            if runtime.freezeRemaining[player] > 0 {
                runtime.freezeRemaining[player] = max(0, runtime.freezeRemaining[player] - dt)
            }
            guard runtime.freezeRemaining[player] <= 0 else { continue }

            freezeTriggered[player] = true
            runtime.freezeOnTriggerCount += 1                 // +0x208 += 1
            events?.onFreeze(playerIndex: player)             // vtable+0x38

            // §5.3 步骤 4 末尾：freeze 结束 → 选下一波（不再用 forceSpawn）
            selectNextWave()
            break
        }
    }

    // MARK: Private — step 5

    private func tickBombStateMachine() {
        switch runtime.bombState {
        case 0:
            runtime.bombState = 1
            // 原「rand()*10 + 10」——rng.nextFloat() ∈ [0,1)，结果区间 [10, 20)。
            runtime.bombArmTimer = rng.nextFloat() * 10.0 + 10.0
        case 1:
            if runtime.bombArmFlag == 1 {
                runtime.bombState = 2
            }
        default:
            break
        }
    }

    // MARK: Private — shared

    private func emitSpawn(kind: Int32, spawner: Spawner, wave: WaveInfo) {
        if kind == Constants.EntityPool.bombSlot {
            runtime.bombCount += 1
            spawnSink?.spawnBomb(from: spawner, wave: wave)
        } else if kind >= 0 {
            spawnSink?.spawnFruit(kind: kind, from: spawner, wave: wave)
        }
        // -1：空槽跳过（不生成）
    }

    /// 向零取整并钳到 >= 0 的 Float → Int32（NaN / 无穷 / 越界都安全）。
    private func truncToInt32(_ value: Float) -> Int32 {
        guard value.isFinite else { return value > 0 ? Int32.max : 0 }
        if value <= 0 { return 0 }
        if value >= 2_147_483_520 { return Int32.max }
        return Int32(value.rounded(.towardZero))
    }
}