import Foundation

// ============================================================================
// ContentTypes — 波次 / 生成器 / 水果元数据 Codable 定义
//
// 来源：
//   - WaveInfo    ← core_logic_notes §4.1（macho FUN_00053cb8）[macho H]
//   - Spawner     ← core_logic_notes §4.2（macho FUN_00053388）[macho H]
//   - SpawnerFruit← §4.2 子节点 fruit
//   - FruitInfo   ← §4.5（macho FUN_0001267c）[macho H]（单源，无 exe 交叉验证）
//
// 取数协议：类结构/命名 ← exe；数值/行为 ← macho 为准（binary_equivalence.md）。
// 本文件所有默认值均来自 Constants.WaveDefaults / Constants.FruitDefaults，
// 不写散落的 float 字面量 —— 便于日后数据段常量二次闭合时集中修订。
// ============================================================================

// MARK: - WaveInfo

/// 单波配置（macho `param_1 + param_3*0x40` 块；元素大小 0xc4 [macho H]）。
///
/// ⚠️ 单点风险：本结构默认值**仅 macho 单源**（exe 是 Debug 构建、且此处是 XML 缺省值），
///    不可用 exe 交叉验证 —— 见 core_logic_notes §4.5 裁决。
public struct WaveInfo: Codable, Equatable, Sendable {

    // -- until（后处理语义见 `postProcessUntil`）--------------------------------
    /// 该波持续到第几波结束。
    /// - `-1`：解析占位（XML 空串 / 非法值），解析末尾统一推为 -2
    /// - `-2`：forever（持续到关卡结束）
    /// - `>= waveNo`：正常有效区间
    /// core_logic_notes §4.4 [macho 独有]
    public var until: Int32 = Constants.WaveDefaults.untilUnparsed

    // -- 波次概率 / 时间参数 --------------------------------------------------
    /// waveChanceRegrowth。默认 0.25。[macho H] §4.1 `+0xb4`
    public var chanceRegrowth: Float = Constants.WaveDefaults.regrowthChance

    /// criticalChance（**float 概率**，不是开关）。默认 1.0。[macho H] §4.1 `+0xb8`
    public var criticalChance: Float = Constants.WaveDefaults.criticalChance

    /// 基础 dt 缩放系数。默认 1.0。[macho H] §4.1 `+0xbc`
    public var dt: Float = Constants.WaveDefaults.dt
    public var dtInc: Float = Constants.WaveDefaults.dtInc
    public var dtSpInc: Float = Constants.WaveDefaults.dtSpInc

    /// 前置延时。默认 2.0。[macho H] §4.1 `+0xc8`
    public var beforeDelay: Float = Constants.WaveDefaults.beforeDelay
    public var beforeDelayInc: Float = Constants.WaveDefaults.beforeDelayInc

    /// 后续延时。默认 0。[macho H] §4.1 `+0xd0..+0xd8`
    public var nextDelay: Float = Constants.WaveDefaults.nextDelay
    public var nextDelayInc: Float = Constants.WaveDefaults.nextDelayInc
    public var nextDelaySpInc: Float = Constants.WaveDefaults.nextDelaySpInc

    /// 默认 true（byte 1）。[macho H] §4.1 `+0xdc` / `+0xdd`
    public var waitForEntities: Bool = Constants.WaveDefaults.waitForEntities
    public var waitForProcessing: Bool = Constants.WaveDefaults.waitForProcessing

    /// 速度衰减。默认 0。[macho H] §4.1 `+0xe0`
    public var speedLoss: Float = Constants.WaveDefaults.speedLoss

    // -- 概率池 ----------------------------------------------------------------
    /// 默认 override 概率池 ID = 10。[macho H] §4.1 `+0xb0`
    public var overridePoolID: Int32 = Constants.WaveDefaults.overridePoolID

    /// override 概率池默认值 = 100。[macho H] §4.1 `+0xe4`
    public var overrideChance: Int32 = Constants.WaveDefaults.overridePoolDefault

    // -- 玩家区间 --------------------------------------------------------------
    /// 默认单玩家：min=0, max=-1, upper=-1。[macho H] §4.1 `+0xe8/+0xec/+0xf0`
    /// `players == "1,2"` → (1, 2, -1)（双人共享波次）。
    public var playersMin: Int32 = Constants.WaveDefaults.playersMin
    public var playersMax: Int32 = Constants.WaveDefaults.playersMax
    public var playersUpper: Int32 = -1

    /// 该波的 spawner 列表（原 `WaveInfo[0x13]` = Spawn 子节点数）。[macho H] §4.1
    public var spawners: [Spawner] = []

    public init() {}

    public init(until: Int32,
                chanceRegrowth: Float = Constants.WaveDefaults.regrowthChance,
                criticalChance: Float = Constants.WaveDefaults.criticalChance,
                beforeDelay: Float = Constants.WaveDefaults.beforeDelay,
                overridePoolID: Int32 = Constants.WaveDefaults.overridePoolID,
                overrideChance: Int32 = Constants.WaveDefaults.overridePoolDefault,
                spawners: [Spawner] = []) {
        self.until = until
        self.chanceRegrowth = chanceRegrowth
        self.criticalChance = criticalChance
        self.beforeDelay = beforeDelay
        self.overridePoolID = overridePoolID
        self.overrideChance = overrideChance
        self.spawners = spawners
    }
}

// MARK: - until 后处理（macho 独有）

public extension WaveInfo {

    /// `until` 语义后处理（core_logic_notes §4.4，**[macho] 独有**，exe 未见）。
    ///
    /// 规则（按序执行，顺序不可交换）：
    ///  1. `"forever"`（大小写不敏感）→ `-2`（`Constants.WaveDefaults.untilForever`）
    ///  2. `atoi(token)` 得到数值 `v`，仅当 `v >= waveNo[i]` 时采纳；否则保留 `-1`
    ///  3. 对已采纳的 `until >= 0`：若严格小于某个后续 waveNo，则改写为「该后续 waveNo - 1」
    ///     用于保证当前波覆盖区间不越过下一个波的起点 [macho M —— 语义含字面含「小于」
    ///     但结合原句「until 小于后续 waveNo」实现为「保证不提前结束」，见风险 2]
    ///  4. 末尾残余 `-1`（未解析 / 未采纳）统一推为 `-2`
    ///
    /// - Parameters:
    ///   - rawTokens: XML `until` 原始串数组（顺序即波次顺序）
    ///   - waveNumbers: 每波从 1 起的编号（不足时按索引 +1 兜底）
    /// - Returns: 与 `rawTokens` 等长的后处理结果
    static func postProcessUntil(rawTokens: [String], waveNumbers: [Int32]) -> [Int32] {
        let n = rawTokens.count
        guard n > 0 else { return [] }

        // 步骤 1 / 2：forever + atoi 比较
        var result = [Int32](repeating: Constants.WaveDefaults.untilUnparsed, count: n)
        for i in 0..<n {
            let token = rawTokens[i].trimmingCharacters(in: .whitespaces)
            if token.lowercased() == "forever" {
                result[i] = Constants.WaveDefaults.untilForever
                continue
            }
            guard let parsed = Int32(token) else { continue }
            let waveNo = i < waveNumbers.count ? waveNumbers[i] : Int32(i + 1)
            if parsed >= waveNo {
                result[i] = parsed
            }
        }

        // 步骤 3：until 非负且小于后续 waveNo → 后续 waveNo - 1
        // 说明：字面读法 → "until 严格小于 nextNo 时取 nextNo - 1"（保底覆盖到下一波之前）
        for i in 0..<n where result[i] >= 0 {
            var j = i + 1
            while j < n {
                let nextNo = j < waveNumbers.count ? waveNumbers[j] : Int32(j + 1)
                if result[i] >= nextNo {
                    j += 1
                } else {
                    result[i] = nextNo - 1
                    break
                }
            }
            // j >= n：无后续波，保留原值
        }

        // 步骤 4：剩余 -1 → -2
        for i in 0..<n where result[i] == Constants.WaveDefaults.untilUnparsed {
            result[i] = Constants.WaveDefaults.untilForever
        }

        return result
    }

    /// 就地应用后处理结果（辅助入口：读取 `until` 值时可批处理）。
    static func applyUntilPostProcess(to waves: inout [WaveInfo], waveNumbers: [Int32]) {
        let tokens = waves.map { String($0.until) }
        let processed = postProcessUntil(rawTokens: tokens, waveNumbers: waveNumbers)
        for i in 0..<min(waves.count, processed.count) {
            waves[i].until = processed[i]
        }
    }
}

// MARK: - Spawner

/// 生成器（macho FUN_00053388；结构大小 0x90 字节）。
///
/// ⚠️ 部分偏移→字段映射未导出（`Constants.Pending` 第 6 条）：
///    `+0x50/+0x54=1.0、+0x58=-1.0、+0x5c=1.0` 值已直读，但字段名未定，
///    本结构暂不收录（不臆造），待 T-01x 解码 exe 字符串表 `UNK_01709c68` 后补。
public struct Spawner: Codable, Equatable, Sendable {

    /// name（原 `+0x14` 堆拷贝）。[macho H] §4.2
    public var name: String = ""

    /// mode（原 `+0x1c`，`FUN_00039714` 枚举）。[macho H] §4.2
    /// [待验证] §4.1 又记为默认 1.0；本结构按 §4.2 字段表处理，默认 0 由 XML 侧填充。
    public var mode: Int32 = 0

    /// minWait / maxWait（原 `+0x20/+0x24`）。[macho H] §4.2
    public var minWait: Float = 0
    public var maxWait: Float = 0

    /// canSpawnWithPowers（原 `+0x28` byte，"true" 解析）。[macho H] §4.2
    public var canSpawnWithPowers: Bool = true

    /// dontSpawnBeforeWave（原 `+0x2c`）。[macho H] §4.2
    public var dontSpawnBeforeWave: Float = -1.0

    /// fruit 候选列表（原 `+0x8`）[macho H] §4.2
    public var fruits: [SpawnerFruit] = []

    /// 炸弹触发剩余次数（原 `+0x68`）。[待验证] §5.3「+0x68 > 0 → FUN_000568f4 触发爆炸」
    /// ⚠️ 语义由分支结构反推，未见字段名；命名沿用候选语义。
    public var bombTriggerRemaining: Int32 = 0

    /// 普通水果触发剩余次数（原 `+0x6c`）。[待验证] §5.3「+0x6c > 0 → FUN_00057000 建水果」
    public var fruitSpawnRemaining: Int32 = 0

    public init() {}

    public init(name: String = "",
                mode: Int32 = 0,
                minWait: Float = 0,
                maxWait: Float = 0,
                canSpawnWithPowers: Bool = true,
                dontSpawnBeforeWave: Float = -1.0,
                fruits: [SpawnerFruit] = []) {
        self.name = name
        self.mode = mode
        self.minWait = minWait
        self.maxWait = maxWait
        self.canSpawnWithPowers = canSpawnWithPowers
        self.dontSpawnBeforeWave = dontSpawnBeforeWave
        self.fruits = fruits
    }
}

// MARK: - SpawnerFruit

/// spawner 的 fruit 子节点（M19 权重抽取候选）。
///
/// 语义：
///  - `kind >= 0`：正常水果类型 ID（Constants.EntityKindValue）
///  - `kind == -1`：空槽（Constants.EntityPool.emptySlot）[macho H]
///  - `kind == -2`：炸弹（Constants.EntityPool.bombSlot）[both H]
public struct SpawnerFruit: Codable, Equatable, Sendable {

    /// 水果类型 / 哨兵。默认 -1（空槽）。[macho H] §5.1
    public var kind: Int32 = Constants.EntityPool.emptySlot

    /// 权重（原 `chance` 字段）。默认 100。[macho H] §4.2 子节点默认
    public var chance: Int32 = Constants.FruitDefaults.spawnChance

    public init() {}

    public init(kind: Int32, chance: Int32 = Constants.FruitDefaults.spawnChance) {
        self.kind = kind
        self.chance = chance
    }
}

// MARK: - BombInfo

/// 炸弹特有尺寸（原 `bomb.size → PTR+0x94`、`bomb.collision → PTR+0x98`）。
///
/// ⚠️ [待验证]（[macho L]）：§4.5 只给出映射关系，**未直读数值**。
///    本结构暂沿用 `FruitDefaults.scale / collision` 作为占位默认值，
///    待后续任务卡闭合 `PTR+0x94 / PTR+0x98` 后订正。
public struct BombInfo: Codable, Equatable, Sendable {

    /// 炸弹尺寸。默认沿用 25.0。[待验证]
    public var size: Float = Constants.FruitDefaults.scale

    /// 炸弹碰撞半径。默认沿用 1.0。[待验证]
    public var collision: Float = Constants.FruitDefaults.collision

    public init() {}

    public init(size: Float, collision: Float) {
        self.size = size
        self.collision = collision
    }
}

// MARK: - FruitInfo

/// 水果 / 炸弹条目元数据（macho FUN_0001267c）。
///
/// ⚠️ 单源风险：本结构默认值为 macho 单源（exe 侧 `fruitlist.xml` 无交叉验证）。
///    critical 全局参数（new_life_at / chance / chance_inc / splats / scale / spread /
///    disappear_speed）在 §4.5 只列名不列值 → 本结构保留为 Optional，由内容加载侧填值，
///    **禁止**在此写死 [macho L] 尚未直读的数值。
public struct FruitInfo: Codable, Equatable, Sendable {

    /// 显示名 / XML 键。非二进制字段。
    public var name: String = ""

    /// 类型 ID（对应 Constants.EntityKindValue）。非二进制字段。
    public var typeID: Int32 = 0

    // -- §4.5 已闭合字段（置信 H）-----------------------------------------------
    /// 基础分（原 `+0x314`）。默认 0；`score == 0` 时上层会置 `+0x330 = 1`（noScore）。
    public var score: Int32 = 0

    /// 无分标记（原 `+0x330`，由 score==0 派生）。[macho H]
    public var noScore: Bool = false

    /// noCritical（原 `+0x318`）。[macho H]
    public var noCritical: Bool = false

    /// onside（原 `+0x26c`）。[macho H]
    public var onside: Bool = false

    /// onlySprinkle（原 `+0x2fc`）。[macho H]
    public var onlySprinkle: Bool = false

    /// 缩放。默认 25.0（原 `+0x244`）。[macho H]
    public var scale: Float = Constants.FruitDefaults.scale

    /// 碰撞半径。默认 1.0（原 `+0x248`）。[macho H]
    public var collision: Float = Constants.FruitDefaults.collision

    /// 命中影响系数。默认 0.75（原 `+0x24c`）。[macho H]
    public var hitInfluence: Float = Constants.FruitDefaults.hitInfluence

    /// 若该条目是炸弹项，此处的 size/collision 映射到 `PTR+0x94 / PTR+0x98`。
    /// ⚠️ [待验证] 见 BombInfo。
    public var bomb: BombInfo? = nil

    // -- §4.5 未直读数值字段（[macho L] 单源）---------------------------------
    //    ↓ 保留 Optional，由内容加载层填充，禁止在代码中臆造默认值
    public var newLifeAt: Int32? = nil
    public var chance: Int32? = nil
    public var chanceInc: Int32? = nil
    public var splats: Int32? = nil
    public var spread: Float? = nil
    public var disappearSpeed: Float? = nil

    public init() {}
}