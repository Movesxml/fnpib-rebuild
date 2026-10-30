import Foundation
import simd

// T-015：过渡占位类型节已删除，Entity / EntityID / EntityKind / EntityTransform /
// EntityPrototype 与 EntityStore 的正式定义迁至 ECS/（Entity.swift / EntityStore.swift）。
// FNPBCore 为单一 target，同 target 内互相引用无需 import；仅当未来把 ECS 拆成独立
// 模块时才需要 `import FNPBCoreECS`（任务卡「改为 import 引用 ECS 模块」的落地说明）。

// ============================================================================
// GameWorld — GameTicking 默认实现骨架（T-011）
//
// tick 内十步顺序严格对应 findings/core_logic_notes.md §1.2（**不可调换**）：
//   1  dt 兜底：dt==0 → 用上一帧缓存（初值 0.0）                  [both]
//   2  碰撞半径归一化：d=|v|; d/15<=1 → w=0.5*(d/15)+0.5 否则 1.0  [both]
//   3  slash 轨迹：+0xa5!=0 → +0x17c+=dt；超时写槽 (slot+1)%8      [both]
//   4  等级特效：+0xb4<4 → +0xf4=0 且跳过实体遍历                  [both]
//   5  遍历门控：爆炸/冻结计时、0x40 位掩码、单例 vtable+0x28      [macho]
//   6  循环A 水果：判定→+0xa5/+0x3c/+0xf8/~+0x104/+0x110/combo    [both]
//   7  循环B 炸弹：近失 = 同一判定、球半径 ×1.5（仅炸弹）          [macho]
//   8  循环C：§1.2 在 findings 中截断，语义 [待验证]（L3 状态槽）  [M]
//   9  combo 结算：+0x174 推进 → 到期结算 → clearComboTracking     [both]
//  10  子系统更新：波次/计分/统计/特效/音频                        [macho]
// ============================================================================

// MARK: - 依赖协议（骨架期集中声明）
// ⚠️ 迁移警告：最终归属 Sources/FNPBCore/{Slice,Combo,Score,Wave,Loop}/；
//    其中 SliceQuery / WaveState / WaveInfo / GameMode 等类型尚未落盘，
//    故此处只保留 tick 调用所需的最小签名（与蓝图 §3 的差异见 T-011 风险点）。

public enum ComboEvent: Equatable, Sendable {
    case started(fruitType: Int32)
    case incremented(count: Int32, visualTier: Int32, textTier: Int32)
    case settled(count: Int32, fruitTypes: [Int32])
    case specialBonusApplied(delta: Float)      // 原 +0x1ba 分支
}

public protocol SliceTesting: AnyObject {
    /// §1.2 步骤 6.2：两段式判定（形状相交 vtable+0x0C → 球体二次确认）
    /// 蓝图签名带 `query: SliceQuery`，该类型待 Slice 任务卡落盘后补齐
    func isSliced(game: GameState, entity: Entity) -> Bool
    /// 近失：同一判定、球半径 ×1.5（0x3FC00000）；**仅对炸弹调用**（L4）
    func isNearMiss(game: GameState, entity: Entity) -> Bool
}

public protocol ComboTracking: AnyObject {
    /// §1.2 步骤 6.4：非炸弹、非同一实体、非跳过窗口检查时调用
    func registerSlice(fruitType: Int32, entity: EntityID,
                       state: inout GameState, rng: any RandomSource) -> ComboEvent?
    /// §1.2 步骤 9：窗口推进 + 到期结算
    func tickWindow(dt: Float, state: inout GameState) -> [ComboEvent]
    func reset(state: inout GameState)
}

public protocol ScoreDispatching: AnyObject {
    /// 溢出保护：mode==4 不归零；其余 mode!=5 超 0x7fffffff 归零（L8）
    @discardableResult
    func dispatch(score: Int32, comboType: Int32, isScoring: Bool, mode: Int32) -> Int32
    var total: Int32 { get }
    func reset()
}

/// 统计键（蓝图 S5）
public enum StatsKey: String, CaseIterable, Sendable {
    case slashes, slashesScoring, totalfruit, all, bean
    case upsideDownPoints = "upside_down_points"
    case scoreWithoutBeans = "score_without_beans"
    case combos, nearMiss = "near_miss", bomb, freeze
}

public protocol StatsRecording: AnyObject {
    func add(_ key: StatsKey, _ value: Int32)
    /// 动态键（"%s_combos" / "strawberry_combo_total"）走字符串通道
    func report(_ dynamicKey: String, _ value: Int32)
}

public protocol WaveDirecting: AnyObject {
    /// §1.2 步骤 10；分支链：freeze 倒计时 → spawner 抽取 → -2 炸弹 / 普通水果 → 炸弹状态机 0→1→2
    /// 蓝图签名含 `waves: inout WaveState` / `players`，WaveState 待 Wave 任务卡落盘后补齐
    func tick(dt: Float, state: inout GameState, world: any EntityStore)
}

public protocol AudioPlaying: AnyObject {
    /// 原 AudioToolbox/OpenAL 调用点仅作音量/时序参考 [待验证]
    func play(_ key: String)
}

public protocol EffectEmitting: AnyObject {
    /// 原 FUN_00033ca0 / FUN_00035a08（命中特效）；kind 语义待特效任务卡定名
    func emit(_ kind: Int32, at position: SIMD3<Float>)
}

public protocol RandomSource: AnyObject {
    func nextFloat() -> Float           // [0,1)
    func nextInt(_ upperBound: Int32) -> Int32
    func snapshot() -> UInt64
    func restore(_ s: UInt64)
}

// MARK: - 依赖容器（蓝图 §3 S1）
/// 值类型，注入测试替身。
/// 非 Sendable：字段均为有状态 `AnyObject` 协议存在体（组合/计分/波次含可变状态），
/// 按设计由逻辑线程（MainActor）独占，禁止跨 actor 传递；若将来需要跨域，
/// 由实现类收口到 @MainActor 后再逐字段评估，**不要**用 @unchecked Sendable 绕过。
public struct GameServices {
    public var slice: any SliceTesting
    public var combo: any ComboTracking
    public var score: any ScoreDispatching
    public var stats: any StatsRecording
    public var waves: any WaveDirecting
    public var audio: any AudioPlaying
    public var effects: any EffectEmitting      // 原 FUN_00033ca0 / FUN_00035a08
    public var rng: any RandomSource

    public init(slice: any SliceTesting, combo: any ComboTracking, score: any ScoreDispatching,
                stats: any StatsRecording, waves: any WaveDirecting, audio: any AudioPlaying,
                effects: any EffectEmitting, rng: any RandomSource) {
        self.slice = slice;   self.combo = combo;   self.score = score;   self.stats = stats
        self.waves = waves;   self.audio = audio;   self.effects = effects; self.rng = rng
    }
}

// MARK: - 主循环协议（蓝图 §3 S1）
public protocol GameTicking {
    /// 十步顺序见文件头；`world` 用 `inout` 以便实现体转发给 forEach（蓝图写作 `inout EntityStore`，
    /// Swift 6 语言模式下协议作为类型必须写 `any`）
    func tick(dt: Float, state: inout GameState, world: inout any EntityStore, services: GameServices)
}

// MARK: - 默认实现骨架
/// 非 Sendable：持有 lastDelta，必须由 GameLoop（MainActor）独占持有。
public final class GameWorld: GameTicking {

    /// R7：原 lastDelta 初值 0.0 → 首帧零步进；`prime()` 显式吃一帧
    private var lastDelta: Float = 0

    /// dt==0 时的兜底步长（原 PTR_DAT_004d9048+0x44 / _DAT_0197f47c）
    /// [待验证] 具体数值未闭合（T-007 遗留），暂按逻辑帧 1/60
    private let fallbackDelta: Float = 1.0 / 60.0

    public init() {}

    /// R7：由 GameLoop 在 `FrameDriving.start()` 后调用一次，使首帧 dt==0 也能推进
    public func prime() {
        lastDelta = fallbackDelta
    }

    public func tick(dt: Float, state: inout GameState,
                     world: inout any EntityStore, services: GameServices) {
        let step = step1_resolveDelta(dt)
        guard step > 0 else { return }              // 首帧零步进（未 prime 时）
        step2_normalizeCollisionRadius(state: &state)
        step3_advanceSlashTrail(dt: step, state: &state)
        guard step4_applyLevelEffects(state: &state) else { return }
        guard step5_shouldTraverseEntities(world: world) else { return }
        step6_processFruits(dt: step, state: &state, world: &world, services: services)
        step7_processBombs(dt: step, state: &state, world: &world, services: services)
        step8_processSpecials(dt: step, state: &state, world: &world, services: services)
        step9_settleCombo(dt: step, state: &state, services: services)
        step10_updateSubsystems(dt: step, state: &state, world: &world, services: services)
    }

    // MARK: 1 — dt 兜底 [both]
    /// §1.2 步骤 1：`dt==0` → 用上一帧缓存值（exe `param_1!=0` 分支 / macho fVar29）。
    /// 缓存初值 0.0（exe 自证），故首帧未 prime 时返回 0 → tick 直接返回（R7）。
    private func step1_resolveDelta(_ dt: Float) -> Float {
        let resolved = (dt == 0) ? lastDelta : dt
        lastDelta = resolved
        return resolved
    }

    // MARK: 2 — 碰撞半径归一化 [both]
    /// §1.2 步骤 2：d=|(x,y,z)|；d/15.0<=1.0 → w=0.5*(d/15.0)+0.5，否则 1.0；
    /// 全局最大值 max(...)（↔ exe DAT_019514c0 / macho DAT_005573b8）。
    /// 注意：现代分辨率下半径换算走 RenderSurface.logicalSize，此处不得写死像素值。
    private func step2_normalizeCollisionRadius(state: inout GameState) {
        // [待实现] 常量见 Constants.swift（15.0 / 0.5 / 1.0）
    }

    // MARK: 3 — slash 轨迹 [both]
    /// §1.2 步骤 3：+0xa5!=0 → +0x17c += dt；超轨迹时长 → 槽位 (slot+1)%8 写入采样点、
    /// 清 +0xa5、+0x17c=0。容量 8 / 采样间隔 0.05 [macho H]。
    private func step3_advanceSlashTrail(dt: Float, state: inout GameState) {
        // [待实现] 环形缓冲写入 FUN_00019f10
    }

    // MARK: 4 — 等级特效 [both]
    /// §1.2 步骤 4：+0xb4<4 → +0xf4=0 并**跳过实体遍历**；返回 false 表示本帧不遍历。
    private func step4_applyLevelEffects(state: inout GameState) -> Bool {
        // [待实现]
        return true
    }

    // MARK: 5 — 遍历门控 [macho]
    /// §1.2 步骤 5：爆炸/冻结计时 <=0，且全局位掩码 & 0x40 == 0，
    /// 且（单例 vtable+0x28 返回 1 或单例为空）。
    private func step5_shouldTraverseEntities(world: any EntityStore) -> Bool {
        // [待实现]
        return true
    }

    // MARK: 6 — 循环A（type=1 水果）[both]
    /// §1.2 步骤 6，每实体：
    ///  6.1 全局锁 / +0x2b>0 → 跳过
    ///  6.2 门控：+0x6f==0 && +0x41<=-1.0 && +0x34<=0 && (flags&1)==0 && +0x30!=0
    ///  6.3 isSliced==true →（a）+0xa5=1 开轨迹（b）(+0x33==0 || +0x32>3) && +0xc1==0 → +0x3c+=2
    ///      （c）清 +0x40/+0x44，写 +0xf8~+0x100（旧 slash 位）、+0x110=type、+0x104~+0x10c=位置
    ///  6.4 非炸弹：+0x21==2 或同实体 → 跳过窗口检查；否则 +0x180=entity、+0x174=0、
    ///      comboArr[+0x8c]=type、+0x90=(type!=0)、首发发 slashes/slashesScoring、+0x51=1、combo++；
    ///      combo>9 → +0x174=0.095；+0x54 -= combo*(0.5*rand/8+0.75)；vtable+0x44 回调
    ///  6.5 +0x1ba!=0 → +0x110 += specialBonus；+0x54 += -3.0*(0.5*rand/8+0.75)
    private func step6_processFruits(dt: Float, state: inout GameState,
                                     world: inout any EntityStore, services: GameServices) {
        // [待实现] services.slice / services.combo / services.effects 调用点见上
    }

    // MARK: 7 — 循环B（type=2 炸弹）[macho]
    /// §1.2 循环B：炸弹遍历；近失 = isNearMiss（同一判定、球半径 ×1.5）仅在此循环调用，
    /// 结果写 +0xa4（isFaulted）并计入 near_miss 统计（L4：**不可**推广到水果）。
    private func step7_processBombs(dt: Float, state: inout GameState,
                                    world: inout any EntityStore, services: GameServices) {
        // [待实现] 循环 B 的其余层控逻辑属 §1.2 截断段 → [待验证]
    }

    // MARK: 8 — 循环C [待验证]
    /// §1.2 步骤 6 之后的循环C 在 findings 中截断，语义仅 [M] 级（L3 状态槽 0x21/0x26/0x33）。
    /// 本桩只占位，禁止在语义闭合前写入具体逻辑。
    private func step8_processSpecials(dt: Float, state: inout GameState,
                                       world: inout any EntityStore, services: GameServices) {
        // [待实现][待验证]
    }

    // MARK: 9 — combo 结算 [both]
    /// §1.2 步骤 9：+0x174 推进（触发重置 0.1；>9 封顶 0.095）→ 到期结算 →
    /// clearComboTracking（comboArr memset 0xff）→ 分发 ComboEvent 到计分/统计/特效。
    private func step9_settleCombo(dt: Float, state: inout GameState, services: GameServices) {
        // [待实现] services.combo.tickWindow(dt:state:)
    }

    // MARK: 10 — 子系统更新 [macho]
    /// §1.2 步骤 10：波次（services.waves.tick）→ 计分分发（services.score）→
    /// 统计（services.stats）→ 音效（services.audio）→ 特效（services.effects）。
    private func step10_updateSubsystems(dt: Float, state: inout GameState,
                                         world: inout any EntityStore, services: GameServices) {
        // [待实现] 各子系统顺序以原主循环调用链为准
    }
}