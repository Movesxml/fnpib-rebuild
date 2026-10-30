//
//  Constants.swift
//  FNPBCore
//
//  已闭合数值台账（T-009 产出）。
//
//  【取数口径】binary_equivalence.md：
//    - 类结构 / 命名        ← x86 Debug exe（MSVC RTTI，唯一类名来源）
//    - 数值 / 行为          ← iOS armv7 Mach-O（发售版，最终值）
//    - 双源冲突             → 一律信 Mach-O
//
//  【来源标签】
//    [core_logic_notes §x]   T-005 双源对比笔记
//    [pending_constants §x]  T-007 残余常量台账
//    [DECISIONS T-00x]       决策日志（slash_geometry.md 本轮注入缺失，切割几何结论经此转引）
//
//  【置信】H = 字面量直读 / M = 控制流结构推断 / L = 仅符号引用（不进本文件正文）
//
//  ⚠️ 本文件只允许出现已闭合常量。任何 [待验证] 项见文件末尾 Pending 区，
//     实现侧不得引用、不得赋值。
//

import Foundation

public enum Constants {

    // MARK: - 模拟 / 实体更新
    // 来源：core_logic_notes §1.1 常量表（macho 直读，H）

    public enum Simulation {

        /// 碰撞半径归一化除数。`w = 0.5 * (d / 15.0) + 0.5`（d/15 <= 1 时）。
        /// [both] H — core_logic_notes §1.1；exe 侧为 double(15.0f)（pending_constants §2）
        public static let collisionNormalizeDivisor: Float = 15.0

        /// 归一化权重系数。core_logic_notes §1.1 [both] H
        public static let collisionNormalizeWeight: Float = 0.5

        /// 归一化上限（d/15 > 1 → 权重 1.0）。core_logic_notes §1.1 [macho] H
        public static let collisionNormalizeClamp: Float = 1.0

        /// 实体速度模长 clamp 上限。core_logic_notes §1.1 [macho] H
        public static let entitySpeedClamp: Float = 8.0

        /// 爆炸弹飞速度系数：`position += 10.0 * velocity * dt`。
        /// core_logic_notes §1.2 步骤 7 / §5.1 [macho] H
        public static let blastPushSpeedFactor: Float = 10.0

        /// 关卡等级低于此值时清除等级特效参数（原 `game +0xb4 < 4 → +0xf4 = 0`）。
        /// core_logic_notes §1.2 步骤 4 [both] H
        public static let lowLevelEffectCutoff: Int32 = 4
    }

    // MARK: - 切割轨迹 / 近失
    // 来源：core_logic_notes §1.2 步骤 3、DECISIONS T-006、pending_constants §9

    public enum Slash {

        /// slash 轨迹环形缓冲存活时长（秒）。exe 侧为 double(0.05f)，须按 Float 使用。
        /// [both] H — pending_constants §2 / §9
        public static let trailTimeout: Float = 0.05

        /// 轨迹环形缓冲槽数（原 `slot = (slot + 1) % 8`）。
        /// core_logic_notes §1.2 步骤 3 [both] H
        public static let slotCount: Int = 8

        /// 近失判定半径倍数（球半径 × 1.5，原常量 0x3FC00000）。
        /// [macho] H — DECISIONS T-006；FUN_00017fdc 体内直读
        public static let nearMissRadiusMultiplier: Float = 1.5
    }

    // MARK: - 连击（combo）
    // 来源：core_logic_notes §1.2 步骤 9 / §2.1，DECISIONS T-004（M41 双源确认）

    public enum Combo {

        /// 窗口触发后的重置值 / 默认窗口基（秒）。core_logic_notes §1.1 [both] H
        public static let windowBase: Float = 0.1

        /// `combo > 9` 时窗口计时封顶值（秒）。core_logic_notes §1.1 [macho] H
        public static let windowCap: Float = 0.095

        /// 启用紧凑窗口的 combo 计数门限（原 `combo > 9`）。
        /// core_logic_notes §2.3 [macho] H
        public static let countThresholdForTightWindow: Int32 = 9

        /// 窗口随机基：`0.5 * rand / 8 + 0.75` 中的 0.75。core_logic_notes §1.1 [macho] H
        public static let randomBase: Float = 0.75

        /// 窗口随机除数（原 `DAT_00016618` 推测 8.0）。
        /// ⚠️ [待验证] — core_logic_notes §7 列为"待读数据段"，值本身尚未直读。
        /// 仅作占位，随机项实现须从注入配置取值（见 REBUILD_BLUEPRINT §3.5）。
        public static let randomDivisor: Float = 8.0

        /// 特殊果对节奏因子的反向修正项（原 `+0x54 += -3.0 * (0.5*rand/8 + 0.75)`）。
        /// core_logic_notes §1.1 / §1.2 步骤 6.4 [macho] H
        public static let rhythmPenalty: Float = -3.0

        /// 视觉档位：`clamp(combo - 3, 0, 2)`。DECISIONS T-004（M41 双源确认）+ §2.3 [both] H
        public static let visualTierOffset: Int32 = 3
        public static let visualTierMin: Int32 = 0
        public static let visualTierMax: Int32 = 2

        /// 文本档位：`clamp(combo - 2, 1, 5)`。§2.1 / §2.3 [both] H
        public static let textTierOffset: Int32 = 2
        public static let textTierMin: Int32 = 1
        public static let textTierMax: Int32 = 5

        /// 进入 combo 特效分支的门限（原 `combo > 2`）。§2.2 步骤 1 [both] H
        public static let tierEffectStartCount: Int32 = 3

        /// combo 水果类型槽位数（原 `int[11]`，清 0xff）。
        /// core_logic_notes §0 表 `+0x60 + i*4` [both] H
        public static let fruitTypeSlotCount: Int = 11
    }

    // MARK: - 计分 / 命中率
    // 来源：core_logic_notes §3.1 / §3.2，pending_constants §9

    public enum Scoring {

        /// 分数溢出保护阈值（32 位有符号上限）。core_logic_notes §3.1 [macho] H
        public static let intMax: Int32 = Int32.max

        /// 该模式下**跳过** 32 位溢出归零保护。core_logic_notes §3.2 步骤 4 [macho] H
        public static let overflowSkippedMode: Int32 = 4

        /// 溢出后**不归零**的模式。core_logic_notes §3.1 / §3.2 步骤 4 [macho] H
        public static let overflowKeepMode: Int32 = 5

        /// 命中率修正系数 K（负惩罚）。pending_constants §9 [macho] H
        public static let hitRateK: Float = -0.2

        /// 命中率结果缩放（原 SCALE）。pending_constants §9 [macho] H
        public static let hitRateScale: Float = 100.0
    }

    // MARK: - 炸弹 / 爆炸
    // 来源：core_logic_notes §5.1（本轮从 FUN_00020c38 直读，置信升 H）+ DECISIONS T-004 M32

    public enum Bomb {

        /// 爆炸计时 / 半径（写入单例 `+0x24`，主循环据此做爆炸门控）。[macho] H
        public static let explosionTimerSeconds: Float = 3.2

        /// 爆炸参数 1（`FUN_0000577c` 形参）。[macho] H
        public static let explodeParamA: Float = 1.6

        /// 爆炸参数 2。[macho] H
        public static let explodeParamB: Float = 2.0

        /// 爆炸参数 3。[macho] H
        public static let explodeParamC: Float = 9.0

        /// 爆炸音效增益 + 音效键名。[macho] H
        public static let explodeAudioGain: Float = 1.0
        public static let explodeAudioKey: String = "Bomb-explode"
    }

    // MARK: - 实体池哨兵值
    // 来源：core_logic_notes §5.1 / §5.4，DECISIONS T-004（M31）

    public enum EntityPool {

        /// 空槽（无水果）。[macho] H
        public static let emptySlot: Int32 = -1

        /// 炸弹哨兵（水果池中以 -2 表示 bomb）。[both] H
        public static let bombSlot: Int32 = -2
    }

    // MARK: - 实体类型枚举
    // 来源：DECISIONS T-004（原 function_classification M20，本轮注入缺失）
    //       标签 [macho]，单源

    public enum EntityKindValue {
        public static let fruit: Int32 = 1
        public static let bomb: Int32 = 2
        public static let coin: Int32 = 3
        public static let slash: Int32 = 4
        public static let blast: Int32 = 5
        public static let jiblet: Int32 = 6
        public static let fruitRay: Int32 = 7
    }

    // MARK: - FruitInfo 默认值
    // 来源：core_logic_notes §4.5（macho FUN_0001267c）— ⚠️ 无 exe 交叉验证（单源）

    public enum FruitDefaults {

        /// 缩放默认值 25.0（原 `+0x244`）。[macho] H
        public static let scale: Float = 25.0

        /// 碰撞半径默认值 1.0（原 `+0x248`）。[macho] H
        public static let collision: Float = 1.0

        /// 命中影响系数默认值 0.75（原 `+0x24c`）。[macho] H
        public static let hitInfluence: Float = 0.75

        /// spawner `fruit` 子节点 `chance` 默认值。core_logic_notes §4.2 [macho] H
        public static let spawnChance: Int32 = 100
    }

    // MARK: - WaveInfo 默认值
    // 来源：core_logic_notes §4.1（macho FUN_00053cb8 直读，置信全 H）
    //       ⚠️ 仅 macho 单源，exe 侧为 Debug 构建，不可用于交叉验证

    public enum WaveDefaults {

        /// 默认 override 概率池 ID（原 `+0xb0`，int）
        public static let overridePoolID: Int32 = 10

        /// waveChanceRegrowth（原 `+0xb4`）
        public static let regrowthChance: Float = 0.25

        /// criticalChance（float 概率，非开关）
        public static let criticalChance: Float = 1.0

        /// 波次 dt 及其增量
        public static let dt: Float = 1.0
        public static let dtInc: Float = 0.0
        public static let dtSpInc: Float = 0.0

        /// 前置延时
        public static let beforeDelay: Float = 2.0
        public static let beforeDelayInc: Float = 0.0

        /// 后续延时
        public static let nextDelay: Float = 0.0
        public static let nextDelayInc: Float = 0.0
        public static let nextDelaySpInc: Float = 0.0

        /// 等待标志默认 true（原 `+0xdc` / `+0xdd` byte）
        public static let waitForEntities: Bool = true
        public static let waitForProcessing: Bool = true

        /// 速度衰减
        public static let speedLoss: Float = 0.0

        /// override 概率池默认值（原 `+0xe4`，int）
        public static let overridePoolDefault: Int32 = 100

        /// 玩家索引区间默认（原 `+0xe8` / `+0xec` / `+0xf0`）
        public static let playersMin: Int32 = 0
        public static let playersMax: Int32 = -1

        /// `until` 语义常量：
        /// - `"forever"` → -2
        /// - `atoi(until)` 且 `value >= waveNo` 才采纳
        /// - 解析末尾把残余 `until == -1` 全部推为 -2
        /// - `until` 小于后续 waveNo 的波次取 `后续waveNo - 1`
        /// core_logic_notes §4.4「until 语义修正」[macho] H
        public static let untilForever: Int32 = -2
        public static let untilUnparsed: Int32 = -1

        /// `players == "1,2"` → (+0xe8=1, +0xec=2, +0xf0=-1) 双人共享波次。
        /// core_logic_notes §4.1 [macho] H
        public static func players(from tag: String) -> (min: Int32, max: Int32) {
            switch tag {
            case "1,2": return (1, 2)
            default:    return (playersMin, playersMax)
            }
        }
    }

    // MARK: - 全局开关（原 PTR_DAT_004d9048 索引访问）
    // 来源：pending_constants §5.2 —— 懒绑定桩，静态值不可解，偏移可用
    //       PTR[0x18] → +0x60；PTR[10] → +0x28；两开关均为 0 才进入正常切割判定

    public enum GlobalSwitch {
        public static let suspendSliceTestA_Offset0x28: Int = 0x28
        public static let suspendSliceTestB_Offset0x60: Int = 0x60
    }

    // MARK: - 统计键名（macho 发售版原文）
    // 来源：core_logic_notes §3.4 / §1.2 / §5.3

    public enum StatKey {
        public static let slashes        = "slashes"
        public static let slashesScoring = "slashesScoring"
        public static let totalFruit     = "totalfruit"
        public static let all            = "all"
        public static let bean           = "bean"
        public static let upsideDown     = "upside_down_points"
        public static let scoreWithoutBeans = "score_without_beans"
        public static let combos         = "combos"
        public static let comboPrefix    = "%s_combos"
        public static let strawberryComboTotal = "strawberry_combo_total"
        public static let nearMiss       = "near_miss"
        public static let freeze         = "freeze"
        public static let bomb           = "bomb"
    }

    // ─────────────────────────────────────────────────────────────
    // MARK: - Pending：未闭合 / 静态不可解 / 语义未定位
    //
    // ⚠️ 以下一律不得在实现中写成字面量，必须走配置注入或运行时测量。
    // ─────────────────────────────────────────────────────────────

    //
    // 1) dt 兜底槽（原 PTR_DAT_004d9048 + 0x44 / exe _DAT_0197f47c）
    //    - 静态初值 = 0.0f（pending_constants C-04，**不是 double**）
    //    - 运行期由主循环写入上一帧 dt → 实现为「缓存上一帧 dt」字段，非硬编码步长
    //    - 触发条件存在双份反编译与笔记的语义分歧，见 REBUILD_BLUEPRINT §3.1.1
    //
    // 2) combo 窗口上下限（macho DAT_00017024 / DAT_00017028）
    //    - 推测区间 0.3~1.0s，尚未从数据段读出（core_logic_notes §7）
    //    - 接口：ComboWindowBounds 注入（REBUILD_BLUEPRINT §3.5）
    //
    // 3) 特殊果得分加成量（macho DAT_004d90b4）
    //    - ARM __stubs 懒绑定桩，静态镜像中不可解（pending_constants §5.1/§5.2）
    //    - 接口：ScoringConfig.specialFruitScoreBonus（默认 nil → 运行时实测后填）
    //
    // 4) exe double(0.2f) @0x16f2038（pending_constants §4，语义未定位）
    //    - 候选：combo 窗口随机基另一分支 / 命中率衰减步长 / 生成概率增量，均未证实
    //
    // 5) exe 0.4f @0x16f4094（pending_constants §9 末注，语义未定位）
    //
    // 6) Spawner 元素结构 0x90 字节内的默认值簇（macho FUN_00053cb8）：
    //    +0x1c=1.0, +0x2c=-1.0, +0x50=1.0, +0x54=1.0, +0x58=-1.0, +0x5c=1.0
    //    值已直读（H），但**偏移→字段名映射未导出**（exe 对应键名为 UNK_），
    //    故不进入正文常量，待 T-01x 解码 exe 字符串表 UNK_01709c68 后补。
    //
    // 7) `DAT_005d4d74` 位掩码语义（1/2/4/8/0x10/0x40）：Debug 门控位域，
    //    exe 静态值 = 0（pending_constants §8），发售版正常路径全部关闭 →
    //    重建**不迁移**，仅保留 GlobalSwitches 两个 bool 位。
    //
}