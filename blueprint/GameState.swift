//
//  GameState.swift
//  FNPBCore
//
//  原 Game 状态类（>= 0x1C0 字节）的 Swift 映射。
//
//  【双源性】core_logic_notes §0：
//    exe  FUN_00bda510 与 macho FUN_00016214 对同一状态对象的偏移使用**完全相同**，
//    故可当字段表直用：命名/职责 ← exe（MSVC RTTI），取值行为 ← macho（发售版）。
//
//  【字段计数说明】
//    core_logic_notes §0 表实际列出 21 个条目（其中 3 条为 vec2 / vec3 / int[11]）。
//    DECISIONS T-005 记为「22 个字段偏移逐字段一致」。
//    差值来源无法从本轮注入材料判定（向量拆分口径 / 是否另有 1 个未摘录字段），
//    因此本文件**严格按 21 条目落地，不臆造第 22 个字段**，差异留待 Kimi 与 T-005 原文核对。
//
//  【注意】原 mainloop 中形如 `piVar13[0x2b]` / `piVar13[0x30]` / `piVar13[0x6e]` 的偏移
//    属于**实体（Fruit/Entity）**，不属于本结构体，切勿混入。
//    见 REBUILD_BLUEPRINT §3.2 的 Entity 字段表。
//
//  【布局】Swift struct 不保证内存布局，重建后不再按字节偏移访问；
//    偏移仅作为对账注释保留（与 exe/macho 反编译逐条对齐用）。
//

import Foundation

// MARK: - 前置类型
// EntityID 不在此重复声明：blueprint 文件直接编入 FNPBCore（project.yml），
// 与 Sources/FNPBCore/ECS/Entity.swift 中的唯一权威定义同模块共享（T-020 修复，
// 首跑 #41094655636 报 invalid redeclaration / ambiguous type lookup）。

// MARK: - GameState

/// 原 `Game` 状态类。
///
/// 并发：逻辑帧单线程持有并修改（`@MainActor` 侧），跨线程仅以 `Sendable` 值拷贝传递
/// （如存档快照、统计上报队列）。
public struct GameState: Sendable, Equatable {

    // MARK: §0 表：与 exe / macho 逐字段一致（core_logic_notes §0）

    /// 原 `+0x3c` int
    /// 漏切 / 惩罚计数：非特殊切中时 `+= 2`（§1.2 步骤 6.3.2）。
    public var missPenaltyCount: Int32 = 0

    /// 原 `+0x40` / `+0x44` vec2
    /// 命中点缓存（切中时先清 0）。§1.2 步骤 6.3.3。
    public var hitPointCache: SIMD2<Float> = .zero

    /// 原 `+0x50` byte
    /// 碰撞半径生效标志（主线 §1.2 步骤 2 的归一化分支入口）。
    public var collisionRadiusActive: Bool = false

    /// 原 `+0x51` byte
    /// `slashesScoring` 统计首发标志（置 1 后不再重复上报）。§1.2 步骤 6.4。
    public var slashesScoringEmitted: Bool = false

    /// 原 `+0x54` float
    /// 节奏因子：combo 时按 combo 数递减，特殊果时加反向修正
    /// （`-= combo * (0.5*rand/8 + 0.75)` / `+= -3.0 * (...)`）。§1.2 步骤 6.4。
    /// ⚠️ 随机项除数 [待验证]：core_logic_notes §7 记为待读常量。
    public var rhythmFactor: Float = 0

    /// 原 `+0x60 + i*4` int[11]
    /// 本窗口内被切水果的类型 ID 数组；结算后清为 `0xff`（即 -1）。§1.2 步骤 9。
    /// 定长 11，语义见 Constants.Combo.fruitTypeSlotCount。
    public var comboFruitTypes: [Int32] = GameState.emptyComboSlots

    /// 原 `+0x8c` int
    /// combo 计数 = 本窗口内被切水果数（§2.3）。窗口结算后清零。
    public var comboCount: Int32 = 0

    /// 原 `+0x90` int
    /// combo 类型 / 难度标记：`(type != 0)` 写入（0 或 1）。§1.2 步骤 6.4。
    public var comboTypeFlag: Int32 = 0

    /// 原 `+0xa4` byte
    /// 失灵 / 结束标志：炸弹近失时置位（`+0x7e && piVar13[0x26]==0 → 1`）。§1.2 步骤 7。
    public var isFaulted: Bool = false

    /// 原 `+0xa5` byte
    /// slash 轨迹计时活跃标志（切中且 `DAT_005d4d80 != 0` 时置 1）。§1.2 步骤 6.3.1。
    /// T-023：为 `slashTrail.isActive` 的**镜像字段**，由 GameWorld 步骤 3 同步。
    public var slashTrailActive: Bool = false

    /// 原 `+0xb4` int
    /// 关卡等级；`< 4` 时关闭等级特效参数（`+0xf4 = 0`）。§1.2 步骤 4。
    public var levelTier: Int32 = 0

    /// 原 `+0xf4` float
    /// 等级相关特效 / 节奏参数。§0 表。
    public var levelEffectParam: Float = 0

    /// 原 `+0xf8` / `+0xfc` / `+0x100` vec3
    /// 上一 slash 位置（切中时由当前 slash 位置覆写）。§1.2 步骤 6.3.3。
    public var previousSlashPosition: SIMD3<Float> = .zero

    /// 原 `+0x104` / `+0x108` / `+0x10c` vec3
    /// 命中点（切中时记录实体位置）。§1.2 步骤 6.3.3。
    /// T-023：GameWorld 步骤 2/3 把它当作本帧切割点（`|hitPoint|` 归一化 + 轨迹采样点）。
    public var hitPoint: SIMD3<Float> = .zero

    /// 原 `+0x110` int
    /// 本次切中得分（水果类型 ID / 加成后的分值）。§0 表 + §1.2 步骤 6.3.3。
    public var lastSliceScore: Int32 = 0

    /// 原 `+0x174` float
    /// combo 窗口计时（触发后重置 0.1；`combo > 9` 时封顶 0.095）。§1.2 步骤 9。
    public var comboWindowTimer: Float = 0

    /// 原 `+0x178` int
    /// 连锁 / 门限标记。§0 表（语义 [macho] M，未进一步确认）。
    public var chainGateFlag: Int32 = 0

    /// 原 `+0x17c` float
    /// slash 轨迹持续计时（`+= dt`，超过 0.05 触发环形缓冲写入并清活跃标志）。§1.2 步骤 3。
    /// T-023：为 `slashTrail.elapsed` 的**镜像字段**，由 GameWorld 步骤 3 同步。
    public var slashTrailTimer: Float = 0

    /// 原 `+0x180` ptr
    /// 上一个参与 combo 的实体（防同一实体重复计数）。§1.2 步骤 6.4。
    public var lastComboEntity: EntityID? = nil

    /// 原 `+0x1ba` byte
    /// 特殊果加成开关（为真时 `+0x110 += DAT_004d90b4`）。§1.2 步骤 6.4。
    public var specialFruitBonusEnabled: Bool = false

    /// 原 `+0xc1` byte
    /// 特殊果 / 炸弹标记（参与 `+0x3c += 2` 的条件判定）。§1.2 步骤 6.3.2。
    public var specialOrBombMarked: Bool = false

    // MARK: 补充字段（不属 §0 表，来自其它函数，单独列出以便对账）

    /// 原 `game + 0xf0` float
    /// 切割半径平方：`FUN_00017d74` 入口门控 `0.0 < *(float*)(game + 0xf0)`，
    /// 且作为二次确认的半径² 使用（DECISIONS T-006）。
    /// 来源：deep_slash_macho.md（FUN_00017d74 函数体）
    /// T-023：由 GameWorld 步骤 2 每帧写入（= `w²`）。
    public var sliceRadiusSquared: Float = 0

    /// slash 轨迹环形缓冲（T-023 新增）。
    ///
    /// 原版把 8 槽轨迹存在全局 `DAT_00557468 + slot*4`、槽位指针在 `DAT_005573b4`，
    /// 与 game 实例解耦；重建将其收入 `GameState`，使逻辑层可完全值语义化
    /// （存档/回放/单测不需要全局单例）。
    ///
    /// 与镜像字段的关系：`slashTrail.isActive` ↔ `slashTrailActive`(+0xa5)、
    /// `slashTrail.elapsed` ↔ `slashTrailTimer`(+0x17c)；由 GameWorld 步骤 3 单向同步
    /// （轨迹缓冲为真源，镜像字段仅供对账/历史调用点读取）。
    public var slashTrail: SlashTrail = SlashTrail()

    /// 本局未切且出界的水果数（T-025 重建辅助字段，默认 0，随 GameState 开局重置）。
    /// 原版映射 [待验证]；刻意不复用 +0x3c，因为该偏移在切中分支也会 += 2。
    public var missedFruitCount: Int32 = 0

    // MARK: - 生命周期

    public static let comboSlotCount: Int = Constants.Combo.fruitTypeSlotCount

    /// combo 数组的空值形态（原 `memset(+0x60, 0xff, 0x2c)` → 11 × -1）。
    public static let emptyComboSlots: [Int32] =
        [Int32](repeating: Constants.EntityPool.emptySlot,
                count: Constants.Combo.fruitTypeSlotCount)

    public init() {}

    // MARK: - 原 §1.2 步骤 9 的「统一清零」分支

    /// 窗口到期 / 结算完成后的统一清理：
    /// `combo = 0; +0x90 = 0; +0x180 = 0; +0x178 = 0; memset(+0x60, 0xff, 0x2c)`
    /// [macho] H — core_logic_notes §1.2 步骤 9 末段
    public mutating func clearComboTracking() {
        comboCount = 0
        comboTypeFlag = 0
        lastComboEntity = nil
        chainGateFlag = 0
        comboFruitTypes = Self.emptyComboSlots
    }

    /// 切中时的命中点记录（原 §1.2 步骤 6.3.3）。
    /// 顺序：清 `+0x44/+0x40` → 旧 slash 位置存入 `+0xf8..` →
    ///      `+0x110 = 水果类型` → `+0x104..0x10c = 实体位置`。
    public mutating func recordSliceHit(entityPosition: SIMD3<Float>,
                                        slashPosition: SIMD3<Float>,
                                        fruitType: Int32) {
        hitPointCache = .zero
        previousSlashPosition = slashPosition
        lastSliceScore = fruitType
        hitPoint = entityPosition
    }
}
