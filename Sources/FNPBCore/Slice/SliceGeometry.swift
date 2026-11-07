//
//  SliceGeometry.swift
//  FNPBCore
//
//  Slice 模块基础类型（T-012）：slash 轨迹环形缓冲 + 切割查询上下文 + 命中门控。
//
//  【锚点说明】任务卡要求逐函数锚定 `findings/slash_geometry.md §x`，但该文件本轮
//  注入缺失（shared_context 中显示 [缺失]）。故锚点降级为以下三处一手证据：
//    ① findings/core_logic_notes.md §1.2 步骤 3 / 步骤 6.2 / 步骤 7
//    ② DECISIONS.md [2026-10-30T22:14:19] T-006（两段式、近失 1.5×）
//    ③ findings/deep_slash_macho.md → FUN_00017d74 全量反编译
//  待 slash_geometry.md 补回后须做一次锚点回填（见 T-012 审查风险点）。
//
//  【取数口径】binary_equivalence.md：数值/行为以 Mach-O 发售版为准。
//
//  【T-023 变更】`SlashTrail` 补 `Equatable`（`GameState` 为 `Equatable`，
//  新增 `slashTrail` 字段后必须满足合成条件）。
//

import Foundation
#if canImport(simd)
import simd  // 仅 Apple 平台提供；Windows 上用标准库 SIMD 类型即可
#endif
// MARK: - SlashTrail

/// slash 轨迹环形缓冲。
///
/// 锚点：`core_logic_notes.md §1.2 步骤 3`（[both]）
/// 原逻辑（macho `FUN_00016214` / exe `FUN_00bda510`）：
/// ```
/// if (+0xa5 == 0) { +0x17c = 0 }                 // 未激活 → 计时归零
/// else {
///     +0x17c += dt
///     if (+0x17c > trailTimeout) {               // 0.05s（Constants.Slash.trailTimeout）
///         slot = (slot + 1) % 8                  // 0x8 槽（Constants.Slash.slotCount）
///         write(&DAT_00557468 + slot*4, ...)
///         +0xa5 = 0; +0x17c = 0
///     }
/// }
/// ```
///
/// 字段映射：
/// - `isActive` ↔ `+0xa5`（slash 轨迹计时活跃）
/// - `elapsed`  ↔ `+0x17c`（slash 轨迹持续计时）
/// - `slot`     ↔ `DAT_005573b4`（全局槽位指针）
///
/// ⚠️ 现代 120Hz 提示：`dt≈8.3ms` 时 0.05s 内最多 6 次采样，超出才写槽；
///    与原 30/60Hz 环境的采样密度不同，渲染侧刀光长度需另行评估（T-012 风险点）。
///
/// 【T-023】Equatable 合成：`GameState` 是 `Equatable`，本类型收入其字段后必须可比较
/// （存储属性均为 Equatable：`[SIMD3<Float>]` / `Int` / `Bool` / `Float`）。
public struct SlashTrail: Sendable, Equatable {

    /// 环形缓冲槽（原 `DAT_00557468 + slot*4`，8 槽 vec3）
    public private(set) var samples: [SIMD3<Float>]

    /// 最近写入的槽位（原 `DAT_005573b4`）
    public private(set) var slot: Int

    /// 累计写入次数（诊断/测试用，原逻辑无此字段）
    public private(set) var writeCount: Int

    /// 轨迹计时是否活跃（原 `+0xa5`）
    public private(set) var isActive: Bool

    /// 轨迹持续计时（原 `+0x17c`）
    public private(set) var elapsed: Float

    public init() {
        self.samples = Array(repeating: SIMD3<Float>.zero,
                             count: Constants.Slash.slotCount)
        self.slot = 0
        self.writeCount = 0
        self.isActive = false
        self.elapsed = 0
    }

    /// 槽位容量（原 `% 8`）
    public var capacity: Int { Constants.Slash.slotCount }

    /// 已写入的采样点（按槽序，未写入槽为零向量）
    public var points: [SIMD3<Float>] { samples }

    // MARK: 状态迁移

    /// 开启轨迹计时。锚点：`core_logic_notes.md §1.2 步骤 6.3.a`（`DAT_005d4d80!=0 → +0xa5=1`）
    public mutating func begin() {
        isActive = true
    }

    /// 关闭轨迹计时并归零计时器（原 `+0xa5=0; +0x17c=0`）。
    public mutating func clear() {
        isActive = false
        elapsed = 0
    }

    /// 全量复位（含槽位与采样点）。用于关卡切换/炸弹爆炸后的轨迹丢弃。
    public mutating func reset() {
        isActive = false
        elapsed = 0
        slot = 0
        writeCount = 0
        for i in samples.indices { samples[i] = .zero }
    }

    // MARK: 推进

    /// 推进一帧轨迹计时；超时则写入新采样点。
    ///
    /// 锚点：`core_logic_notes.md §1.2 步骤 3`（[both]）；常量见
    /// `Constants.Slash.trailTimeout`(0.05) / `Constants.Slash.slotCount`(8)。
    ///
    /// - Parameters:
    ///   - dt: 本帧步长（GameWorld 已做 `dt==0` 兜底，见 §1.2 步骤 1）
    ///   - point: 本帧采样点（原 `FUN_00019f10(..., +0xb8, +0xb4)` 的输入）
    /// - Returns: 是否写入了新槽
    @discardableResult
    public mutating func advance(dt: Float, point: SIMD3<Float>) -> Bool {
        // 原：if (+0xa5 == 0) { +0x17c = 0 }
        guard isActive else {
            elapsed = 0
            return false
        }

        elapsed += dt

        // 原：if (trailTimeout < +0x17c) —— 严格大于，边界值不写槽
        guard elapsed > Constants.Slash.trailTimeout else { return false }

        // 原：slot = (slot + 1) % 8
        slot = (slot + 1) % capacity
        samples[slot] = point
        writeCount += 1

        // 原：+0xa5 = 0; +0x17c = 0
        isActive = false
        elapsed = 0
        return true
    }
}

// MARK: - SliceQuery

/// 单帧切割查询上下文。
///
/// 字段与原 Game 状态对象的映射（`core_logic_notes.md §0`）：
/// - `cutter`           ↔ `game +0x38`（切割形状对象指针，可为空）
/// - `cutRadiusSquared` ↔ `game +0xf0`（切割半径²；原门控 `0.0 < +0xf0`）
/// - `globalSwitchA/B`  ↔ `PTR_DAT_004d9048[10]` / `PTR_DAT_004d9048[0x18]`
///   （`Constants.GlobalSwitch`；**两者均关**才进入正常切割判定）
/// - `cutDirection`     ↔ slash 轨迹切线方向（原极值点构造方向的来源，
///   反编译截断处未见 → `[待验证]`）
///
/// 设计说明：本类型刻意不持有 `GameState` 引用，`GameState → SliceQuery`
/// 的映射由 `SliceTester` 的 `queryProvider` 注入，避免本卡臆造 GameState 字段名。
public struct SliceQuery: Sendable {

    /// 切割形状（原 `game +0x38`）。nil ↔ 指针为空 → 门控失败。
    public var cutter: ShapeRef?

    /// 切线方向（单位向量；零向量时由 `SliceTester` 走兜底法线）。
    public var cutDirection: SIMD3<Float>

    /// 切割半径平方（原 `game +0xf0`）。
    public var cutRadiusSquared: Float

    /// 全局开关 A（原 `PTR_DAT_004d9048[10]`，偏移 0x28）。
    public var globalSwitchA: Bool

    /// 全局开关 B（原 `PTR_DAT_004d9048[0x18]`，偏移 0x60）。
    public var globalSwitchB: Bool

    public init(cutter: ShapeRef? = nil,
                cutDirection: SIMD3<Float> = SIMD3<Float>(0, 0, -1),
                cutRadiusSquared: Float = 0,
                globalSwitchA: Bool = false,
                globalSwitchB: Bool = false) {
        self.cutter = cutter
        self.cutDirection = cutDirection
        self.cutRadiusSquared = cutRadiusSquared
        self.globalSwitchA = globalSwitchA
        self.globalSwitchB = globalSwitchB
    }

    /// 刀形状的代表中心（球→球心；线→中点；三角→重心；AABB→中心）。
    /// 用于球体二次确认的球心距离判定。
    public var effectiveCutterCenter: SIMD3<Float> {
        cutter?.center ?? .zero
    }
}

// MARK: - HitTest

/// 切割判定门控。
///
/// 锚点：`findings/deep_slash_macho.md` FUN_00017d74 门控链（[macho] H）：
/// ```
/// if (game+0x38 != 0 && 0.0 < game+0xf0 && entity != 0
///     && entity+0x38 != 0
///     && PTR[0x18] == 0 && PTR[10] == 0) { ...判定... }
/// ```
/// 注：`core_logic_notes.md §1.2` 步骤 5 的「遍历门控」是另一层（爆炸/冻结计时），
/// 属 GameWorld 责任，**不在本类型内**。
public enum HitTest {

    /// 门控结果（枚举而非 Bool，便于测试定位失败点）
    public enum Gate: Sendable, Equatable {
        case passed
        /// `game +0x38 == 0`：切割形状缺失
        case noCutter
        /// `!(0.0 < game +0xf0)`：切割半径² 非正
        case nonPositiveCutRadius
        /// `entity +0x38 == 0`：实体形状缺失
        case noEntityShape
        /// `PTR[0x28] != 0 || PTR[0x60] != 0`：全局暂停开关开启
        case globalSwitchOn
    }

    /// 按反编译顺序逐项检查门控。
    ///
    /// - Parameters:
    ///   - query: 切割查询上下文
    ///   - entityShape: 实体形状（由调用方从 Entity 构造；nil 表示实体无形状）
    public static func gate(query: SliceQuery, entityShape: ShapeRef?) -> Gate {
        guard query.cutter != nil else { return .noCutter }
        guard query.cutRadiusSquared > 0 else { return .nonPositiveCutRadius }
        guard entityShape != nil else { return .noEntityShape }
        guard !query.globalSwitchA, !query.globalSwitchB else { return .globalSwitchOn }
        return .passed
    }

    /// 便捷布尔版
    public static func passes(query: SliceQuery, entityShape: ShapeRef?) -> Bool {
        gate(query: query, entityShape: entityShape) == .passed
    }
}
