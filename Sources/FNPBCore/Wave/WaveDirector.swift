import Foundation

// ============================================================================
// WaveDirector — WaveDirecting 实现（T-014）
//
// 分支链对应 core_logic_notes §5.3（macho FUN_00056098）：
//   步骤 3  spawnFreeze 门控 → 生成循环（遍历 spawner；+0x18<2 走概率池；
//           ID==-2 触发爆炸；条目计时 max(0, x + speed*dt) [部分待验证]）
//   步骤 4  freezeRemaining 倒计时 → 归零触发 OnFreeze + +0x208 += 1
//   步骤 5  炸弹状态机 0→1（bombArmTimer=rand*10+10）→ 2（bombArmFlag==1）
//   步骤 6  每玩家生成标记 spawnFlag[i] = 1
//
// ⚠️ 运行时状态归入 `WaveRuntime`（持有于 WaveDirector）而非 `GameState`：
//    原始二进制中 +0x170/+0x174/+0x178/+0x179/+0x17a/+0x17b/+0x17c/+0x208 挂在 game
//    对象上；但本任务卡未注入 GameState 字段定义，强行写 `state.freezeTimer` 会臆造
//    API。按 §4.3 的归属判断将 freeze 运行态暂存于此。
//    **T-01x ECS / GameState 任务卡落盘时必须评估是否迁回 GameState。**
//
// ⚠️ 世界生成走 `WaveSpawnSink` 协议而非扩展 EntityStore：
//    EntityStore 当前仅 forEach + entity(_:)；扩展它会破坏 T-011 的过渡协议边界。
// ============================================================================

// MARK: - WaveRuntime

/// 波次系统运行时状态。
///
/// 字段来源：
///  - `+0x170..+0x17c` 每玩家冻结 / 生成状态 → §5.3 FUN_00056098
///  - `+0x248..+0x2a0` WaveManager 计数 / 计时 → §4.3 FUN_00027f24（13 键双源确认）
///  - `+0x208` 冻结触发计数 → §5.3 步骤 4
///
/// 类型映射说明：反编译笔记中 `param_1[0x17a]` 等写法为 byte 偏移访问
/// （param_1 为 char*/byte* 指针），故对应字段采用 UInt8。
/// `+0x170 + i*4` / `+0x174 + i*4` 按每玩家 4 字节（Float）扩展为数组。
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
    /// 每玩家生成标记（原 `+0x178 + i`，1 byte）。
    public var spawnFlag: [UInt8] = []

    /// 炸弹 arm 标志（原 `+0x179`，byte）。`== 1` 时状态机 1→2。
    public var bombArmFlag: UInt8 = 0
    /// 炸弹状态机（原 `+0x17a`，byte）：0 → 1 → 2。
    public var bombState: UInt8 = 0
    /// 每帧清零标志（原 `+0x17b`，byte）。
    public var frameFlag: UInt8 = 0
    /// 炸弹 arm 计时（原 `+0x17c`，float；`rand*10+10`）。
    /// ⚠️ [待验证] §0 表记 +0x17c 为「slash 轨迹计时」，与 §5.3 冲突 → 见风险 4。
    public var bombArmTimer: Float = 0

    /// 冻结触发计数（原 `+0x208`，int；每次 freezeRemaining 归零 +1）。
    public var freezeOnTriggerCount: Int32 = 0

    /// 当前帧炸弹生成计数（[待验证] 统计用途，原 `bombCount++`）。
    public var bombCount: Int32 = 0

    // -- 波次调度 --------------------------------------------------------------
    /// 当前活动波索引（在 `WaveDirector.waves` 数组中的位置）。
    public var currentWaveIndex: Int = 0

    public init() {}
}

// MARK: - 回调协议

/// 波次事件（对应 §5.3 步骤 3/4 的单例 vtable +0x38/+0x3c 回调）。
public protocol WaveEventSink: AnyObject {
    /// 冻结归零触发（原单例 vtable+0x38 OnFreeze）[macho H]。
    func onFreeze(playerIndex: Int)
    /// 波次开始（用于 UI / 音乐）；可选，非原函数直接证据 [设计]。
    func onWaveStart(waveIndex: Int, wave: WaveInfo)
}

/// 生成 / 爆炸回调（解耦 ECS 任务卡）。
public protocol WaveSpawnSink: AnyObject {
    /// 普通水果创建（对应 FUN_00057000）[macho M]。
    func spawnFruit(kind: Int32, from spawner: Spawner, wave: WaveInfo)
    /// 炸弹触发爆炸（对应 FUN_000568f4）[macho M]。
    func triggerExplosion(from spawner: Spawner, wave: WaveInfo)
}

// MARK: - WaveDirector

/// 波次调度器（`WaveDirecting` 实现）。
///
/// 非 Sendable：持有 `RandomSource` / `WaveEventSink` / `WaveSpawnSink` 等有状态
/// AnyObject，按设计由逻辑线程（MainActor）独占，禁止跨 actor 传递。
/// 与 `GameWorld` 一致：由 `GameLoop` 单线程驱动。
public final class WaveDirector: WaveDirecting {

    // MARK: Public state

    /// 当前关卡波次表（`beginGame(waves:)` 载入）。
    public private(set) var waves: [WaveInfo] = []

    /// 运行时状态。模块内可写（`@testable` 测试可注入），模块外只读。
    public internal(set) var runtime = WaveRuntime()

    /// 玩家数量（生成循环逐玩家执行）。
    public let playerCount: Int

    // MARK: Dependencies（弱引用，避免宿主 ↔ 波次互相强持有）

    /// 事件出口（OnFreeze / OnWaveStart）。可空。
    public weak var events: (any WaveEventSink)?

    /// 生成出口（建水果 / 触发爆炸）。可空。
    public weak var spawnSink: (any WaveSpawnSink)?

    // MARK: Private

    private let rng: any RandomSource
    /// [wave][spawner] 的预抽取表。`beginGame` 载入时构建。
    private var spawnTables: [[SpawnTable]] = []
    /// 每玩家 freeze 触发一次性保证（防止归零后每帧重复触发）。
    private var freezeTriggered: [Bool] = []

    // MARK: Init

    public init(playerCount: Int = 1, rng: any RandomSource) {
        let n = max(1, playerCount)
        self.playerCount = n
        self.rng = rng
        self.freezeTriggered = [Bool](repeating: false, count: n)

        var r = WaveRuntime()
        r.spawnFreeze = [Float](repeating: 0, count: n)
        r.freezeRemaining = [Float](repeating: 0, count: n)
        r.spawnFlag = [UInt8](repeating: 0, count: n)
        self.runtime = r
    }

    // MARK: Game lifecycle

    /// 载入波次表并重置运行时状态。
    public func beginGame(waves: [WaveInfo]) {
        self.waves = waves

        var r = WaveRuntime()
        r.spawnFreeze = [Float](repeating: 0, count: playerCount)
        r.freezeRemaining = [Float](repeating: 0, count: playerCount)
        r.spawnFlag = [UInt8](repeating: 0, count: playerCount)
        self.runtime = r
        self.freezeTriggered = [Bool](repeating: false, count: playerCount)

        self.spawnTables = waves.map { wave in
            wave.spawners.map { SpawnTable(entries: $0.fruits) }
        }

        if let first = waves.first {
            events?.onWaveStart(waveIndex: 0, wave: first)
        }
    }

    // MARK: WaveDirecting

    /// 每帧推进（§1.2 步骤 10 的子路径；分支链见 core_logic_notes §5.3）。
    ///
    /// ⚠️ `state` / `world` 参数保留签名一致性（见文件头注释）。
    ///    运行时字段暂由 `WaveDirector.runtime` 承担；世界生成走 `spawnSink`。
    public func tick(dt: Float, state: inout GameState, world: any EntityStore) {
        _ = state  // GameState 字段定义未在本卡注入；freeze 运行态暂存 WaveRuntime（见文件头）
        _ = world  // 世界生成走 spawnSink（避免扩展 EntityStore 过渡协议）

        guard dt > 0 else { return }
        guard runtime.spawnFreeze.count == playerCount else { return }

        // 步骤 1（步骤 3 的前置）：+0x17b = 0，本帧清零
        runtime.frameFlag = 0

        // 步骤 3：spawnFreeze 门控 → 生成循环
        for player in 0..<playerCount {
            if runtime.spawnFreeze[player] <= 0 {
                runtime.spawnFreeze[player] = 0
                runSpawnLoop(dt: dt, player: player)
            } else {
                runtime.spawnFreeze[player] = max(0, runtime.spawnFreeze[player] - dt)
                // [待验证] §5.3 步骤 3「归零且 FUN_00064000(...)==1 → FUN_00020698(1,0)
                //  + 取 vtable+0x3c」语义未定，此处不实现。
            }
        }

        // 步骤 4：freezeRemaining 递减，归零触发 OnFreeze + +0x208
        tickFreezeRemaining(dt: dt)

        // 步骤 5：炸弹状态机 0 → 1 → 2
        tickBombStateMachine()

        // 步骤 6：每玩家生成标记
        for i in 0..<playerCount {
            runtime.spawnFlag[i] = 1
        }
    }

    // MARK: Public helpers

    /// 立即出果（对应 FUN_00054dd8 语义 [macho M]）。
    /// 供 freeze 触发路径与调试模式调用。
    public func forceSpawn() {
        guard !waves.isEmpty else { return }
        let idx = min(runtime.currentWaveIndex, waves.count - 1)
        let wave = waves[idx]
        let tables = idx < spawnTables.count ? spawnTables[idx] : []
        for (i, spawner) in wave.spawners.enumerated() {
            let table = i < tables.count
                ? tables[i]
                : SpawnTable(entries: spawner.fruits)
            let id = table.draw(using: rng)
            emitSpawn(kind: id, spawner: spawner, wave: wave)
        }
    }

    /// 由关卡逻辑触发冻结（外部设置 freezeRemaining）。
    /// 若该玩家已有冻结计时，则覆盖并重置「触发一次」标志。
    public func triggerFreeze(player: Int, duration: Float) {
        guard player >= 0, player < playerCount else { return }
        runtime.freezeRemaining[player] = max(0, duration)
        freezeTriggered[player] = false
    }

    // MARK: Private — step 3

    private func runSpawnLoop(dt: Float, player: Int) {
        guard !waves.isEmpty, runtime.currentWaveIndex < waves.count else { return }
        let idx = runtime.currentWaveIndex
        let wave = waves[idx]
        let tables = idx < spawnTables.count ? spawnTables[idx] : []

        for (i, spawner) in wave.spawners.enumerated() {
            // [待验证] §5.3 步骤 3「条目 +0x1c/+0x10 用 max(0, x + 速度*dt) 更新」
            //   字段 +0x1c(mode) 与 +0x10(未知) 语义不一致，暂不实现计时推进，
            //   待 T-01x 解码 exe 侧 UNK_01709c68 后补。此处分派只保证不会越界。
            let _ = dt

            // §5.3 步骤 3：条目 +0x18 < 2 → 从概率池抽 ID。
            // [待验证] §4.2 又记 +0x18 是 name hash（不可比较 <2），本实现按
            //   「mode 门控」语义归入 `spawner.mode < 2`（记为标记）。
            guard spawner.mode < 2 else { continue }

            let table = i < tables.count
                ? tables[i]
                : SpawnTable(entries: spawner.fruits)
            let id = table.draw(using: rng)

            if id == Constants.EntityPool.bombSlot {          // -2 炸弹
                runtime.bombCount += 1
                if spawner.bombTriggerRemaining > 0 {         // +0x68 > 0
                    spawnSink?.triggerExplosion(from: spawner, wave: wave)
                }
            } else if id >= 0 {                               // 正常水果
                spawnSink?.spawnFruit(kind: id, from: spawner, wave: wave)
            }
            // id == -1（空槽）→ 不生成
        }
        _ = player
    }

    // MARK: Private — step 4

    private func tickFreezeRemaining(dt: Float) {
        for player in 0..<playerCount {
            let before = runtime.freezeRemaining[player]
            guard before > 0 else { continue }
            let after = before - dt
            runtime.freezeRemaining[player] = max(0, after)

            guard after <= 0, !freezeTriggered[player] else { continue }

            // 归零触发一次
            freezeTriggered[player] = true
            runtime.freezeOnTriggerCount += 1                 // +0x208 += 1
            events?.onFreeze(playerIndex: player)             // vtable+0x38

            // §5.3 步骤 4 末尾：「立即出果 FUN_00054dd8」[macho M]
            forceSpawn()
        }
    }

    // MARK: Private — step 5

    private func tickBombStateMachine() {
        switch runtime.bombState {
        case 0:
            runtime.bombState = 1
            // 原「rand()*10 + 10」——rng.nextFloat() ∈ [0,1)
            // 结果区间 [10, 20)，与字面语义一致。
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
            spawnSink?.triggerExplosion(from: spawner, wave: wave)
        } else if kind >= 0 {
            spawnSink?.spawnFruit(kind: kind, from: spawner, wave: wave)
        }
        // -1：空槽跳过
    }
}