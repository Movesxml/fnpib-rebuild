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
//
// T-027 变更：
//   - WaveInfo 新增原始 waveNo / chance 字段（禁用下标兜底；真实文件从 0 起且可重复）
//   - Spawner 新增原始 min/max/mininc/maxinc/delay/delayinc 字段
//   - WaveInfo.postProcessUntil 按 FUN_00053cb8 末尾循环精确复刻
//
// T-029 变更：
//   - 删除 Spawner.bombTriggerRemaining / fruitSpawnRemaining（错误映射）：
//     +0x68 已由 FUN_000537ec 证实为数量增量槽，+0x6c 为 delay。
//   - Spawner 的 min/max/minInc/maxInc/delay/delayInc 由 WaveDirector 直接消费。
// ============================================================================

// MARK: - WaveInfo

/// 单波配置（macho `param_1 + param_3*0x40` 块；元素大小 0xc4 [macho H]）。
///
/// ⚠️ 单点风险：本结构默认值**仅 macho 单源**（exe 是 Debug 构建、且此处是 XML 缺省值），
///    不可用 exe 交叉验证 —— 见 core_logic_notes §4.5 裁决。
public struct WaveInfo: Codable, Equatable, Sendable {

    // -- 原始标识（T-027 新增）------------------------------------------------
    /// 原始波次编号（XML `waveNo`；真实文件从 0 开始且**允许重复**）[macho]。
    /// - 用作 `until` 后处理的比较基准（见 `postProcessUntil`）
    /// - 严禁用数组下标或强制 1 基冒充
    /// - `-1` 表示尚未赋值；原版文件加载器会在缺省时填文档序号
    public var waveNo: Int32 = -1

    /// 原始波次权重（XML `chance` → 原 `+0x7c`，整数）[macho]。
    /// nil 表示 XML 未提供；它不是 `chanceRegrowth`（+0xb4）。
    public var chance: Int32? = nil

    // -- until（后处理语义见 `postProcessUntil`）--------------------------------
    /// 该波持续到第几波结束。
    /// - `-1`：解析占位（XML 空串 / 非法值 / 数值 0<waveNo 不采纳），解析末尾统一后处理
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

    /// NextWaveDelay.wait → 原 WaveInfo +0x68。[macho H]
    public var nextWait: Float = 0

    /// NextWaveDelay.waitSpinc → 原 WaveInfo +0x70。[macho H]
    public var nextWaitSpInc: Float = 0

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

    /// `until` 语义后处理（core_logic_notes §4.4 + T-027 精修；
    /// **[macho] 独有**，exe 未见；精确符合 `FUN_00053cb8` 末尾循环）。
    ///
    /// 规则（按序执行，顺序不可交换）：
    ///  1. 非空且精确等于小写 `"forever"` → `-2`；原版使用 `strcmp`，不忽略大小写。
    ///  2. 其他非空串按 C `atoi` 读取数字前缀；结果 `>= 0 && >= waveNo[i]` 才采纳。
    ///  3. 仅对**仍为 -1**（空串 / 未采纳）的条目：
    ///     a. 先设为 `-2`（forever 兜底）
    ///     b. 从**所有** `waveNo[j] > waveNo[i]` 中取最小 `waveNo - 1`
    ///     c. 若无严格更大的 waveNo（当前是最大 / 全部重复），保持 `-2`
    ///  4. **显式有效的 `until` 绝不做旧 step3 改写**。
    ///
    /// 注意：`atoi("garbage") == 0`。因此 waveNo=0 的非空非法串会采纳 0，
    /// 这与空串缺省不同；不能用 Swift 的严格 `Int32(token)` 替代。
    ///
    /// - Parameters:
    ///   - rawTokens: XML `until` 原始串数组（空串表示属性缺失）
    ///   - waveNos:   每波原始 `waveNo`（严格与 rawTokens 等长；可重复）
    /// - Returns: 与 `rawTokens` 等长的后处理结果
    static func postProcessUntil(rawTokens: [String], waveNos: [Int32]) -> [Int32] {
        let n = rawTokens.count
        guard n > 0 else { return [] }
        precondition(waveNos.count == n,
                     "postProcessUntil: waveNos 必须与 rawTokens 等长（禁止下标兜底）")

        var result = [Int32](repeating: Constants.WaveDefaults.untilUnparsed, count: n)
        for i in 0..<n {
            let token = rawTokens[i]
            guard !token.isEmpty else { continue }
            if token == "forever" {
                result[i] = Constants.WaveDefaults.untilForever
                continue
            }
            let parsed = cAtoi(token)
            if parsed >= 0 && parsed >= waveNos[i] {
                result[i] = parsed
            }
        }

        for i in 0..<n where result[i] == Constants.WaveDefaults.untilUnparsed {
            result[i] = Constants.WaveDefaults.untilForever
            let currentNo = waveNos[i]
            var minGreater: Int32?
            for otherNo in waveNos where otherNo > currentNo {
                if minGreater == nil || otherNo < minGreater! {
                    minGreater = otherNo
                }
            }
            if let g = minGreater {
                result[i] = g - 1
            }
        }
        return result
    }

    /// 本任务所需的 C `atoi` 语义：ASCII 空白、可选符号、数字前缀；无数字返回 0。
    /// 超出 Int32 时做饱和保护；原版 C 溢出属未定义行为，不把它宣称为官方规则。
    private static func cAtoi(_ token: String) -> Int32 {
        let bytes = Array(token.utf8)
        var index = 0
        while index < bytes.count {
            switch bytes[index] {
            case 9, 10, 11, 12, 13, 32: index += 1
            default: break
            }
            if index >= bytes.count || !(9...13).contains(bytes[index]) && bytes[index] != 32 {
                break
            }
        }

        var negative = false
        if index < bytes.count, bytes[index] == 45 || bytes[index] == 43 {
            negative = bytes[index] == 45
            index += 1
        }

        let limit = negative ? Int64(Int32.max) + 1 : Int64(Int32.max)
        var value: Int64 = 0
        while index < bytes.count, bytes[index] >= 48 && bytes[index] <= 57 {
            let digit = Int64(bytes[index] - 48)
            value = value > (limit - digit) / 10 ? limit : value * 10 + digit
            index += 1
        }
        if negative {
            return value >= Int64(Int32.max) + 1 ? .min : Int32(-value)
        }
        return Int32(value)
    }

    /// 就地应用后处理结果（辅助入口）。
    ///
    /// - Parameters:
    ///   - waves:     待后处理的 WaveInfo 数组（要求每项 `waveNo >= 0` 已由解析层填好）
    ///   - rawTokens: XML `until` 原始串数组（与 `waves` 顺序一致）
    ///
    /// ⚠️ 本 API 不再用 `String($0.until)` 反推 token —— Int32 → String 会丢失原始字面量
    ///    （如 `forever` / 前导空串），必须由调用方持有原始串。
    static func applyUntilPostProcess(to waves: inout [WaveInfo], rawTokens: [String]) {
        let waveNos = waves.map { $0.waveNo }
        let processed = postProcessUntil(rawTokens: rawTokens, waveNos: waveNos)
        for i in 0..<min(waves.count, processed.count) {
            waves[i].until = processed[i]
        }
    }
}

// MARK: - SpawnKind

/// Spawn.type 的显式类型；水果 ID 使用 FruitInfo 文档零基序号。
/// bomb/random 不使用水果 ID 或 EntityKindValue 冒充。
public enum SpawnKind: Equatable, Sendable {
    case fruit(Int32)
    case bomb
    case random
}

extension SpawnKind: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let raw = try container.decode(String.self)
        switch raw {
        case "bomb": self = .bomb
        case "random": self = .random
        default:
            let prefix = "fruit:"
            guard raw.hasPrefix(prefix), let id = Int32(raw.dropFirst(prefix.count)) else {
                throw DecodingError.dataCorruptedError(
                    in: container, debugDescription: "未知 SpawnKind 字面量: \(raw)")
            }
            self = .fruit(id)
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .fruit(let id): try container.encode("fruit:\(id)")
        case .bomb: try container.encode("bomb")
        case .random: try container.encode("random")
        }
    }
}

// MARK: - Spawner

/// 生成器（macho FUN_00053388 + Spawn 特化 FUN_000537ec；结构大小 0x90 字节）。
///
/// T-029：`bombTriggerRemaining` / `fruitSpawnRemaining` 两个错误映射已删除
/// （原 `+0x68` 是数量增量槽、`+0x6c` 是 delay，见 FUN_000537ec）。
public struct Spawner: Codable, Equatable, Sendable {

    /// name（原 `+0x14` 堆拷贝）。[macho H] §4.2
    public var name: String = ""

    /// mode（原 `+0x1c`，`FUN_00039714` 枚举）。[macho H] §4.2
    /// [待验证] §4.1 又记为默认 1.0；本结构按 §4.2 字段表处理，默认 0 由 XML 侧填充。
    public var mode: Int32 = 0

    // -- Spawn 数量与延迟（FUN_000537ec）---------------------------------------
    /// 每次生成的数量下限，XML `min` → 原 `+0x5c`；原版缺省 1。
    public var min: Float = 1

    /// 每次生成的数量上限，XML `max` → 原 `+0x64`。
    public var max: Float = 0

    /// XML `mininc` → 原 `+0x68`；**加载器会把 XML `maxinc` 覆盖进本槽**，
    /// 调度器运行时只使用本字段（T-029）。
    public var minInc: Float = 0

    /// 保留 XML `maxinc` 原值。完整反编译显示原版也写入 `+0x68`（与 mininc 同槽），
    /// 并非独立运行时槽；调度器不得把本字段当作第二个增量。
    public var maxInc: Float = 0

    /// XML `delay` → 原 `+0x6c`，不是“剩余水果数”。
    public var delay: Float = 0

    /// XML `delayinc` → 原 `+0x70`。
    public var delayInc: Float = 0

    // -- Spawn 初速与重力（FUN_000537ec / FUN_00057000）-------------------------
    /// XML `velX/velY` → 原 `+0x40/+0x44`；构造缺省为 0。
    public var velocityX: Float = 0
    public var velocityY: Float = 0

    /// XML `velscale` 先同时写入两轴，再由 `velXscale/velYscale` 分别覆盖。
    /// 原 Spawn 构造缺省确实为 0，不得为了“让水果飞起来”改成 1。
    public var velocityScaleX: Float = 0
    public var velocityScaleY: Float = 0

    /// 非空 XML `gravity` 才覆盖原 `+0x20/+0x24/+0x28`。
    /// nil 表示原构造器未写全三分量，官方缺省向量没有唯一确定值。
    public var gravity: SIMD3<Float>? = nil

    // -- 旧字段（仅为本阶段编译兼容，不表示以下旧命名已获原版证实）---------------
    /// minWait / maxWait（原 `+0x20/+0x24`）。[macho H] §4.2
    public var minWait: Float = 0
    public var maxWait: Float = 0

    /// canSpawnWithPowers（原 `+0x28` byte，"true" 解析）。[macho H] §4.2
    public var canSpawnWithPowers: Bool = true

    /// dontSpawnBeforeWave（原 `+0x2c`）。[macho H] §4.2
    public var dontSpawnBeforeWave: Float = -1.0

    /// fruit 候选列表（原 `+0x8`）[macho H] §4.2
    public var fruits: [SpawnerFruit] = []

    /// Spawn.type 按逗号拆分并 trim 后的保序结果。
    public var types: [SpawnKind] = []

    public init() {}

    public init(name: String = "",
                mode: Int32 = 0,
                minWait: Float = 0,
                maxWait: Float = 0,
                canSpawnWithPowers: Bool = true,
                dontSpawnBeforeWave: Float = -1.0,
                fruits: [SpawnerFruit] = [],
                types: [SpawnKind] = [],
                velocityX: Float = 0,
                velocityY: Float = 0,
                velocityScaleX: Float = 0,
                velocityScaleY: Float = 0,
                gravity: SIMD3<Float>? = nil) {
        self.name = name
        self.mode = mode
        self.minWait = minWait
        self.maxWait = maxWait
        self.canSpawnWithPowers = canSpawnWithPowers
        self.dontSpawnBeforeWave = dontSpawnBeforeWave
        self.fruits = fruits
        self.types = types
        self.velocityX = velocityX
        self.velocityY = velocityY
        self.velocityScaleX = velocityScaleX
        self.velocityScaleY = velocityScaleY
        self.gravity = gravity
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

// MARK: - CriticalConfig

/// fruitList.xml 的全局 critical 配置；不得复制到每个 FruitInfo。
public struct CriticalConfig: Codable, Equatable, Sendable {
    public var newLifeAt: Int32? = nil
    public var score: Int32? = nil
    public var chance: Int32? = nil
    public var chanceInc: Int32? = nil
    public var splats: Int32? = nil
    public var scale: Float? = nil
    public var spread: Float? = nil
    public var disappearSpeed: Float? = nil
    /// 原版为四个 atoi 分量；此处保留原始字符串，颜色消费逻辑后续闭合。
    public var colour: String? = nil
    public var raw: [String: String] = [:]

    public init() {}
}

// MARK: - FruitInfo

/// 水果 / 炸弹条目元数据（macho FUN_0001267c）。
///
/// ⚠️ 单源风险：本结构默认值为 macho 单源（exe 侧 `fruitlist.xml` 无交叉验证）。
///    critical 全局参数由 CriticalConfig 单独保存，不填入每个水果。
public struct FruitInfo: Codable, Equatable, Sendable {

    /// 显示名 / XML 键。非二进制字段。
    public var name: String = ""

    /// 真实加载时为 FruitInfo 文档零基序号（apple 0 / watermelon 3 / pear_gold 23）。
    public var typeID: Int32 = 0

    // -- §4.5 已闭合字段（置信 H）-----------------------------------------------
    /// 基础分（原 `+0x314`）。默认 0；`score == 0` 时上层会置 `+0x330 = 1`（noScore）。
    public var score: Int32 = 0

    /// 无分标记（原 `+0x330`，由 score==0 派生）。[macho H]
    public var noScore: Bool = false

    /// noCritical（原 `+0x318`）。原版显式属性使用 strcmp("true") != 0，加载器保留该反向分支。
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