import Foundation
import simd

// T-015：过渡占位类型节已删除，Entity / EntityID / EntityKind / EntityTransform /
// EntityPrototype 与 EntityStore 的正式定义迁至 ECS/（Entity.swift / EntityStore.swift）。
// FNPBCore 为单一 target，同 target 内互相引用无需 import；仅当未来把 ECS 拆成独立
// 模块时才需要 `import FNPBCoreECS`。

// ============================================================================
// GameWorld — GameTicking 默认实现（T-011 骨架 → T-023 十步实装）
//
// tick 内十步顺序严格对应 findings/core_logic_notes.md §1.2（**不可调换**）：
//   1  dt 兜底：dt==0 → 用上一帧缓存（初值 0.0）                  [both]  ✅ T-011
//   2  碰撞半径归一化：d=|v|; d/15<=1 → w=0.5*(d/15)+0.5 否则 1.0  [both]  ✅ T-023
//   3  slash 轨迹：+0xa5!=0 → +0x17c+=dt；超时写槽 (slot+1)%8      [both]  ✅ T-023
//   4  等级特效：+0xb4<4 → +0xf4=0 且跳过实体遍历                  [both]  ✅ T-023（判定）
//   5  遍历门控：爆炸/冻结计时、0x40 位掩码、单例 vtable+0x28      [macho] ✅ T-023（恒 true + 注释）
//   6  循环A 水果：判定→+0xa5/+0x3c/+0xf8/~+0x104/+0x110/combo    [both]  ✅ T-023/T-033
//   7  循环B 炸弹：先命中后近失；近失只统计，不写结束标志          [macho] ✅ T-033
//   8  循环C：type=0 实体的切割筛选与首发统计                      [macho] ✅ T-033
//   9  combo 结算：+0x174 推进 → 到期结算 → clearComboTracking     [both]  ✅ T-023
//  10  子系统更新：波次/计分/统计/特效/音频                        [macho] ✅ T-023（仅 waves，其余见注释）
//
// ── T-023 控制流修正 ────────────────────────────────────────────────────────
// 原骨架 `guard step4(...) else { return }` / `guard step5(...) else { return }`
// 会让等级门控或遍历门控**终止整帧**，与反编译结构不符：
//   exe FUN_00bda510:
//     if (levelTier < 4) { +0xf4 = 0 }
//     else if (爆炸/冻结计时门控 && (DAT_019514dc & 0x40) == 0) { ……实体遍历…… }
//     ……（同一函数体内继续）步骤 9 combo 结算、步骤 10 子系统更新……
// 即两级门控只包住「实体遍历」，**不包住**后续步骤。本卡改为：
//     let levelOK = step4(...); levelOK && step5(...) ? 执行 step6~8 : 跳过
//   然后 step9 / step10 无条件执行。
// 依据：[both]（macho FUN_00016214 同构）+ 任务卡 §3「step4 … 返回 false（跳过实体遍历）」措辞。
// ⚠️ 若 Kimi 判定骨架原意即为整帧中断，请回退此段并同步调整 step9/step10 的测试。
// ============================================================================

// MARK: - 依赖协议（骨架期集中声明）
// ⚠️ 迁移警告：最终归属 Sources/FNPBCore/{Slice,Combo,Score,Wave,Loop}/；
//    其中 SliceQuery / WaveState / WaveInfo / GameMode 等类型尚未落盘，
//    故此处只保留 tick 调用所需的最小签名（与蓝图 §3 的差异见 T-011 风险点）。

public enum ComboEvent: Equatable, Sendable {
    case started(fruitType: Int32)
    case incremented(count: Int32, visualTier: Int32, textTier: Int32)
    case settled(count: Int32, fruitTypes: [Int32], comboType: Int32)
}

public protocol SliceTesting: AnyObject {
    /// §1.2 步骤 6.2：两段式判定（形状相交 vtable+0x0C → 球体二次确认）
    /// 蓝图签名带 `query: SliceQuery`，该类型待 Slice 任务卡落盘后补齐
    func isSliced(game: GameState, entity: Entity) -> Bool
    /// 近失：同一判定、球半径 ×1.5（0x3FC00000）；**仅对炸弹调用**（L4）
    func isNearMiss(game: GameState, entity: Entity) -> Bool
}

public protocol ComboTracking: AnyObject {
    /// §1.2 步骤 6.4：stateSlot0 是实体 int 下标 0x21，决定跳过窗口与 +0x90。
    func registerSlice(fruitType: Int32, entity: EntityID, stateSlot0: Int32,
                       state: inout GameState, rng: any RandomSource) -> ComboEvent?
    /// §1.2 步骤 9：窗口推进 + 到期结算
    func tickWindow(dt: Float, state: inout GameState) -> [ComboEvent]
    func reset(state: inout GameState)
}

public extension ComboTracking {
    /// 保留纯逻辑测试/旧调用方的普通实体便捷入口；生产主循环必须传真实 stateSlot0。
    func registerSlice(fruitType: Int32, entity: EntityID,
                       state: inout GameState, rng: any RandomSource) -> ComboEvent? {
        registerSlice(fruitType: fruitType, entity: entity, stateSlot0: 0,
                      state: &state, rng: rng)
    }
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
    /// combo 快照必须包含水果类型；模式未闭合时 modePrefix 为 nil。
    func recordCombo(count: Int32, fruitTypes: [Int32], modePrefix: String?)
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

// MARK: - 默认实现
/// 非 Sendable：持有 lastDelta，必须由 GameLoop（MainActor）独占持有。
public final class GameWorld: GameTicking {

    /// R7：原 lastDelta 初值 0.0 → 首帧零步进；`prime()` 显式吃一帧
    private var lastDelta: Float = 0

    /// dt==0 时的兜底步长（原 PTR_DAT_004d9048+0x44 / _DAT_0197f47c）
    /// [待验证] 具体数值未闭合（T-007 遗留），暂按逻辑帧 1/60
    private let fallbackDelta: Float = 1.0 / 60.0

    /// T-025：实体运动参数。装配层须把同一份值同时传给 WaveSpawnBridge。
    public let motionTuning: FruitMotionTuning

    /// 发售版水果 OnSliced 的已闭合计分/统计子链。
    private let onSliced: FruitOnSliced

    /// 命中特效的 kind 占位（原 FUN_00033ca0 / FUN_00035a08 的类别参数）。
    /// [待验证] kind 语义待特效任务卡定名，0 为「普通命中」占位。
    private static let hitEffectKind: Int32 = 0

    public init(motionTuning: FruitMotionTuning = FruitMotionTuning(),
                onSliced: FruitOnSliced = FruitOnSliced()) {
        self.motionTuning = motionTuning
        self.onSliced = onSliced
    }

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

        // 步骤 4 / 5 只门控「实体遍历」，不终止整帧（见文件头 T-023 控制流修正）。
        let levelGateOK = step4_applyLevelEffects(state: &state)
        let traverseOK = levelGateOK ? step5_shouldTraverseEntities(world: world) : false
        if traverseOK {
            step6_processFruits(dt: step, state: &state, world: &world, services: services)
            step7_processBombs(dt: step, state: &state, world: &world, services: services)
            step8_processSpecials(dt: step, state: &state, world: &world, services: services)
        }

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
    /// §1.2 步骤 2：d=|(x,y,z)|；d/15.0<=1.0 → w=0.5*(d/15.0)+0.5，否则 1.0。
    ///
    /// 原式输出到**全局最大值** `DAT_005573b8 = max(全局, w)`（↔ exe `DAT_019514c0`）；
    /// 重建无全局单例，直接写入 `state.sliceRadiusSquared`（= w²，供
    /// `SliceTester` 的二次确认半径² 使用，见 GameState.swift `sliceRadiusSquared` 注释）。
    /// **差异：原版是跨帧单调不减的最大值，重建是每帧覆盖**——[待验证] 若原版确实单调
    /// 递增，切刀半径会随时间膨胀；从 `0.0 < game+0xf0` 的门控看，更可能是每帧重算。
    ///
    /// ⚠️ 原版本步受 `game +0x50`（`collisionRadiusActive`）门控，且该字段默认 false；
    ///    照抄门控会让 `sliceRadiusSquared` 恒为 0 → 切割门控 `0.0 < radius²` 永远失败
    ///    → 游戏锁死。本卡按任务卡字面**无条件计算**，门控留待字段默认值闭合后再引入。
    private func step2_normalizeCollisionRadius(state: inout GameState) {
        // 完整反编译步骤 2 读取 game+0xc0/+0xc4/+0xc8（当前触摸点），
        // 不是 +0x104 的最后命中实体位置。
        let distance = simd_length(state.slashPosition)
        let ratio = distance / Constants.Simulation.collisionNormalizeDivisor

        let weight: Float
        if ratio <= Constants.Simulation.collisionNormalizeClamp {
            // 原式两个 0.5 同值：0.5 * (d/15) + 0.5，复用 collisionNormalizeWeight
            weight = Constants.Simulation.collisionNormalizeWeight * ratio
                   + Constants.Simulation.collisionNormalizeWeight
        } else {
            weight = Constants.Simulation.collisionNormalizeClamp
        }

        state.sliceRadiusSquared = weight * weight
    }

    // MARK: 3 — slash 轨迹 [both]
    /// §1.2 步骤 3：+0xa5!=0 → +0x17c += dt；超轨迹时长 → 槽位 (slot+1)%8 写入采样点、
    /// 清 +0xa5、+0x17c=0。容量 8 / 采样间隔 0.05 [macho H]。
    ///
    /// 实现：轨迹环形缓冲已收进 `GameState.slashTrail`（T-023），本步只做推进 +
    /// 镜像字段同步（`slashTrailActive` ↔ +0xa5，`slashTrailTimer` ↔ +0x17c），
    /// 保持与原偏移语义的可对账性。
    private func step3_advanceSlashTrail(dt: Float, state: inout GameState) {
        // 原 FUN_00019f10 的输入是 +0xb8/+0xb4 关联的触摸采样，不是命中实体位置。
        let samplePoint = state.slashPosition
        state.slashTrail.advance(dt: dt, point: samplePoint)

        // 镜像字段同步（原 +0xa5 / +0x17c）
        state.slashTrailActive = state.slashTrail.isActive
        state.slashTrailTimer = state.slashTrail.elapsed
    }

    // MARK: 4 — 等级特效 [both]
    /// §1.2 步骤 4：`+0xb4 < 4` → `+0xf4 = 0` 并**跳过实体遍历**；返回 false 表示本帧不遍历。
    ///
    /// ⚠️ [待验证] `levelTier`(+0xb4) 默认 0 < 4 → 默认永远跳过遍历，会锁死游戏。
    ///    原版开局应把 +0xb4 写成 ≥4（或由关卡加载写入），但该写入点未从反编译定位。
    ///    本卡只实现判定本身，**不改 GameState 默认值**（避免掩盖未闭合事实）；
    ///    默认值问题列入 T-023 风险点交 Kimi 裁决。
    private func step4_applyLevelEffects(state: inout GameState) -> Bool {
        if state.levelTier < Constants.Simulation.lowLevelEffectCutoff {
            state.levelEffectParam = 0
            return false
        }
        return true
    }

    // MARK: 5 — 遍历门控 [macho]
    /// §1.2 步骤 5：爆炸/冻结计时 <=0，且全局位掩码 & 0x40 == 0，
    /// 且（单例 vtable+0x28 返回 1 或单例为空）。
    ///
    /// 三项门控来源均**未闭合**，本卡保持恒 true：
    ///  1. 爆炸/冻结计时：`PTR+0x24 <= 0.0` —— 对应单例（`BombBlast`？）的计时字段，
    ///     逻辑层经 `services` 无法访问 `WaveDirector.runtime`（协议无此入口）。
    ///  2. `DAT_005d4d74 & 0x40`：Debug 门控位域，exe 静态值 = 0（Constants Pending #7），
    ///     发售版正常路径恒关闭 → 重建**不迁移**（Constants 注释已注明仅保留 2 个 bool 位）。
    ///  3. 单例 `vtable + 0x28`：单例身份未定（疑 GameMode/暂停管理器），无协议入口。
    /// 结论：本步为纯守卫，不臆造字段；三项关闭条件待后续任务卡闭合。
    private func step5_shouldTraverseEntities(world: any EntityStore) -> Bool {
        _ = world
        return true
    }

    // MARK: 6 — 循环A（type=1 水果）[both]
    /// §1.2 步骤 6，每实体：
    ///  6.1 全局锁 / +0x2b>0 → 跳过
    ///  6.2 门控：+0x6f==0 && +0x41<=-1.0 && +0x34<=0 && (flags&1)==0 && +0x30!=0
    ///  6.3 isSliced==true →（a）+0xa5=1 开轨迹（b）(+0x33==0 || +0x32>3) && +0xc1==0 → +0x3c+=2
    ///      （c）清 +0x40/+0x44，写 +0xf8~+0x100（旧 slash 位）、+0x110=type、+0x104~+0x10c=位置
    ///  6.4 非炸弹：entity[0x21]==2 或同实体 → 跳过窗口检查；否则 +0x180=entity、+0x174=0、
    ///      comboArr[+0x8c]=type、+0x90=(entity[0x21]!=0)、按首发分支上报统计、+0x51=1、combo++；
    ///      combo>9 → +0x174=0.095；+0x54 -= combo*(0.5*rand/8+0.75)；vtable+0x44 回调
    ///  6.5 +0x1ba!=0 → +0x110 += specialBonus；+0x54 += -3.0*(0.5*rand/8+0.75)
    ///
    /// ── 实现边界（逐条与任务卡对齐）────────────────────────────────────────
    /// • 6.1 全局锁 `DAT_00557390`：无协议入口 → 不实现 [待验证]。
    /// • 6.2 已实现 `+0x6f`、`+0x30`、`+0x2b` 与 `(flags&1)==0`；`+0x41` 和 `+0x34`
    ///   的生成初值仍未闭合，暂不引入会阻止默认实体参与判定的条件。
    /// • 6.4 的 `entity[0x21]==2` 与同实体门控由 ComboTracker 执行；生产调用必须传
    ///   真实 `Entity.stateSlot0`，不能用水果 typeID 代替。
    /// • 首发 `slashes` / `slashesScoring` 统计：**已由 ComboTracker 内部上报**
    ///   （其 `stats` 注入 = `services.stats`），本步不重复上报，避免双倍计数。
    /// • 单果得分由 `FruitOnSliced` 每次命中独立执行，不绑定 combo 事件；
    ///   杨桃、noScore 与暴击加分按发售版 OnSliced 的已闭合分支处理。
    /// • `state.lastSliceScore`(+0x110) 先写水果 typeID；实体 +0x1ba 后处理再加
    ///   `PTR_DAT_004d90b4 -> DAT_005d4cd0` 指向的水果类型总数，不是额外得分。
    private func step6_processFruits(dt: Float, state: inout GameState,
                                     world: inout any EntityStore, services: GameServices) {
        let tuning = motionTuning

        // 闭包内不访问 `world`（它是 inout，闭包内再访问会触发独占访问冲突），
        // 收集后统一 despawn。
        var pendingDespawn: [EntityID] = []
        var hitPositions: [SIMD3<Float>] = []
        var missedFruitCount: Int32 = 0

        world.forEach(kind: .fruit) { (entity: inout Entity) -> Bool in
            // T-025：先运动、后判定；出界水果不进入切割判定。
            guard FruitMotion.integrate(&entity, dt: dt, tuning: tuning) else {
                missedFruitCount &+= 1
                pendingDespawn.append(entity.id)
                return true
            }

            // 6.2 参与判定门控。dropState 与 +0x34 的生成初值仍未闭合，保持既有子集；
            // flags 默认 0，可以无锁死风险地恢复发售版 (flags&1)==0 条件。
            guard !entity.isMarked else { return true }       // +0x6f==0
            guard entity.isVisible else { return true }       // +0x30!=0
            guard entity.fallDelay <= 0 else { return true }  // +0x2b>0 → 跳过
            guard (entity.flags & 1) == 0 else { return true }

            // 6.3 两段式切割判定（SliceTesting 内部已做门控 + 形状相交 + 球体二次确认）
            guard services.slice.isSliced(game: state, entity: entity) else { return true }

            // 6.3.1 开轨迹（原 DAT_005d4d80 != 0 → +0xa5 = 1）
            state.slashTrail.begin()
            state.slashTrailActive = true

            let fruitType = entity.fruit?.typeID ?? Constants.EntityPool.emptySlot
            let entityPosition = entity.transform.position

            // 旧 slash 位置来自当前触摸输入；hitPoint 将在本调用中改写为实体位置。
            state.recordSliceHit(entityPosition: entityPosition,
                                 slashPosition: state.slashPosition,
                                 fruitType: fruitType)

            // (+0x33==0 || +0x32>3) && entity+0xc1==0 → +0x3c+=2。
            if (entity.stateSlot2 == 0 || entity.stateSlot0x32 > 3)
                && !entity.specialOrBombMarked {
                state.missPenaltyCount &+= 2
            }

            // +0x6e==0 才进入普通 combo / 主循环命中特效路径。
            if !entity.skipsNormalFruitPath {
                let previousVisualTier = ComboTier.visual(for: state.comboCount)
                let event = services.combo.registerSlice(fruitType: fruitType,
                                                         entity: entity.id,
                                                         stateSlot0: entity.stateSlot0,
                                                         state: &state,
                                                         rng: services.rng)

                if case let .incremented(_, visualTier, _)? = event {
                    if visualTier > previousVisualTier {
                        services.audio.play("combo_\(visualTier)")  // 音效 key [待验证]
                        services.effects.emit(visualTier, at: entityPosition)
                    }
                }
                hitPositions.append(entityPosition)
            }

            // 原顺序是先实体 vtable+0x24，再消费实体 +0x1ba。单果得分不依赖
            // combo 是否递增，也不依赖 stateSlot0 或 +0x6e 的普通路径门控。
            onSliced.apply(entity: &entity, state: &state, services: services)

            pendingDespawn.append(entity.id)
            return true
        }

        // 6.3.4 / 6.3.5 回收 + 命中特效 + 音效（原 FUN_00033ca0/FUN_00035a08）
        for id in pendingDespawn {
            world.despawn(id)
        }
        // 漏切使用独立的本局辅助字段，保留原 +0x3c 的切中分支语义。
        if missedFruitCount > 0 {
            state.missedFruitCount &+= missedFruitCount * Constants.MissPenalty.perMissedFruit
        }
        for position in hitPositions {
            services.effects.emit(Self.hitEffectKind, at: position)
            services.audio.play("splash")                            // 音效 key [待验证]
        }
    }

    // MARK: 7 — 循环B（type=2 炸弹）[macho]
    /// 完整 FUN_00016214 的顺序是：先 FUN_00017d74 命中测试；命中时 OnSliced、
    /// 按 +0x7e && entity[0x26]==0 写 game+0xa4；只有未命中才做 FUN_00017fdc
    /// 近失并上报 near_miss。近失本身绝不写结束标志，也没有每帧去重门。
    private func step7_processBombs(dt: Float, state: inout GameState,
                                    world: inout any EntityStore, services: GameServices) {
        let tuning = motionTuning
        var pendingDespawn: [EntityID] = []
        world.forEach(kind: .bomb) { (entity: inout Entity) -> Bool in
            // 炸弹出界只回收，不计水果漏切。
            guard FruitMotion.integrate(&entity, dt: dt, tuning: tuning) else {
                pendingDespawn.append(entity.id)
                return true
            }
            guard entity.isBombSliceEnabled,
                  entity.bombState <= 0,
                  (entity.flags & 1) == 0 else { return true }

            if services.slice.isSliced(game: state, entity: entity) {
                pendingDespawn.append(entity.id)
                services.audio.play(Constants.Bomb.explodeAudioKey)
                if entity.isFaultingBomb && entity.stateSlot1 == 0 {
                    state.isFaulted = true
                }
                // 原 DAT_00557390 会让本帧停止后续炸弹遍历。3.2 秒爆炸门控
                // 尚未接入，不能把该全局锁永久写入 GameState。
                return false
            }

            if services.slice.isNearMiss(game: state, entity: entity) {
                services.stats.add(.nearMiss, 1)
            }
            return true
        }
        for id in pendingDespawn {
            world.despawn(id)
        }
    }

    // MARK: 8 — 循环C（type=0 其他）[macho]
    /// 完整反编译已闭合筛选：entity[0x17] 低字节非零、(flags&0x11)==0、
    /// FUN_00017d74==1 → OnSliced；若 +0x51==0 则首发 slashesScoring 并置位。
    /// 具体 coin/特殊果的 OnSliced 奖励仍属各自实体实现，不在此臆造。
    private func step8_processSpecials(dt: Float, state: inout GameState,
                                       world: inout any EntityStore, services: GameServices) {
        _ = dt // 运动由实体自身更新函数负责；主循环此处只做切割分发。
        var pendingDespawn: [EntityID] = []
        world.forEach(kind: .other) { (entity: inout Entity) -> Bool in
            guard entity.isSpecialSliceEnabled,
                  (entity.flags & 0x11) == 0,
                  services.slice.isSliced(game: state, entity: entity) else { return true }

            pendingDespawn.append(entity.id)
            if !state.slashesScoringEmitted {
                services.stats.add(.slashesScoring, 1)
            }
            state.slashesScoringEmitted = true
            return true
        }
        for id in pendingDespawn {
            world.despawn(id)
        }
    }

    // MARK: 9 — combo 结算 [both]
    /// §1.2 步骤 9：+0x174 推进（触发重置 0.1；>9 封顶 0.095）→ 到期结算 →
    /// clearComboTracking（comboArr memset 0xff）→ 分发 ComboEvent 到计分/统计/特效。
    ///
    /// 分工：ComboTracker 只保存清零前快照；本步消费完整快照，避免计分、统计
    /// 分别读取已清零的 GameState。2 连起更新最高连击，3 连起计分和上报 combos。
    private func step9_settleCombo(dt: Float, state: inout GameState, services: GameServices) {
        let events = services.combo.tickWindow(dt: dt, state: &state)

        for event in events {
            switch event {
            case let .settled(count, fruitTypes, comboType):
                if count >= 3 {
                    // 发售版 FUN_0001cd6c 完整函数体为 return 0，当前路径无模式阻断。
                    services.score.dispatch(score: count,
                                            comboType: comboType,
                                            isScoring: true,
                                            mode: 0)
                }
                if count >= 2 {
                    services.stats.recordCombo(count: count,
                                               fruitTypes: fruitTypes,
                                               modePrefix: state.comboStatsPrefix)
                }

                let tier = ComboTier.visual(for: count)
                services.audio.play("combo_settle_\(tier)")         // 音效 key [待验证]
                services.effects.emit(tier, at: state.hitPoint)
            case .started, .incremented:
                break
            }
        }
    }

    // MARK: 10 — 子系统更新 [macho]
    /// §1.2 步骤 10：波次（services.waves.tick）→ 计分分发（services.score）→
    /// 统计（services.stats）→ 音效（services.audio）→ 特效（services.effects）。
    ///
    /// ⚠️ [待验证] 后四个子系统**没有逐帧 API**：
    ///  - `ScoreSystem.dispatch` 是事件驱动（由 step6/step9 调用），无帧级入口
    ///  - `StatsRecorder` 只有计数写入，原逐帧上报点（如 `all` / `score_without_beans`）
    ///    未从反编译定位
    ///  - `AudioPlaying` / `EffectEmitting` 由命中与结算事件驱动
    /// 故本步仅调用 `waves.tick`；其余调用点待各自任务卡闭合后回填。
    private func step10_updateSubsystems(dt: Float, state: inout GameState,
                                         world: inout any EntityStore, services: GameServices) {
        services.waves.tick(dt: dt, state: &state, world: world)
    }
}
