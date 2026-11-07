//
//  SliceTesting.swift
//  FNPBCore
//
//  两段式切割判定实现（T-012）。
//
//  【锚点】
//    - findings/deep_slash_macho.md → FUN_00017d74（全量反编译，本文件逐段对译）
//    - findings/core_logic_notes.md §1.2 步骤 6.2 / 步骤 7（两处调用点）
//    - DECISIONS.md [2026-10-30T22:14:19] T-006（两段式、近失 1.5×、sqrtf/normalize）
//
//  【原逻辑骨架】（FUN_00017d74，已折算为 Swift 语义）
//  ```
//  if (game+0x38 != 0 && 0.0 < game+0xf0 && entity != 0
//      && entity+0x38 != 0 && PTR[0x18]==0 && PTR[10]==0) {
//      A = entityShape->vtable[8]()                 // 是否需球体二次确认
//      B = gameShape->vtable[0x0C](gameShape, entityShape, &contact)
//      if (A == 1) {
//          if (B == 0) return 0                     // 粗判不相交 → 直接否定
//          r2 = dot(entityShape+0x14, ...)          // 球半径²
//          dist2 = |gameShape.pos − entityShape.pos|²
//          if (dist2 < r2) return 1                 // 球心在球内 → 命中
//          pt = contact                              // 相对球心的接触偏移
//          if (|pt|² < r2) {                         // 截面圆分支
//              k = sqrtf(r2 − |pt|²)                 // FUN_00301044 = sqrtf
//              ... ± 极值点 vs game+0xf0（切割半径²）...
//          }
//      } else {
//          return B                                  // 非球形状：直接返回相交结果
//      }
//  }
//  ```
//
//  【[待验证] 清单】
//    1. ± 极值点的构造方向：反编译在 `k = sqrtf(...)` 之后截断，
//       `local_48/44/40`（DAT_0052bfe0/e4/e8）初值为零向量（T-007 已确认 12 字节全 0），
//       方向来源未见 → 本实现取「pt × cutDirection 的单位化法线」，退化时走正交兜底。
//    2. 极值点判定基准：本实现用「到刀中心距离² ≤ cutRadiusSquared」（原 `game+0xf0`），
//       是否应改为「到刀线距离」需 Frida 核对。
//    3. `contact` 语义：本文件依赖 ShapeIntersect.swift 中定义的
//       「刀面上最接近被切球心的点」，替换了引擎原局部偏移输出。
//

import Foundation
#if canImport(simd)
import simd  // 仅 Apple 平台提供；Windows 上用标准库 SIMD 类型即可
#endif
// MARK: - SliceEvaluation

/// 单次切割判定的完整中间结果。
///
/// 对外只暴露 `result`；其余字段供黄金值测试与调试断言使用，
/// 使测试可以直接验证「截面圆 + 极值点」两个分支，而不必从布尔值反推。
public struct SliceEvaluation: Sendable, Equatable {

    /// 门控结果（`.passed` 才进入判定）
    public var gate: HitTest.Gate = .noCutter

    /// 第一段：通用形状相交（原 vtable+0x0C）结果
    public var coarseHit = false

    /// 实体形状是否要求球体二次确认（原 `entityShape->vtable+8()` 返回 1）
    public var requiresSphereConfirm = false

    /// 球心距离² < 球半径²（原 `dist2 < r2` 分支）
    public var centerInsideSphere = false

    /// 截面圆半径 `k = sqrtf(r² − |pt|²)`（原 FUN_00301044 调用结果）
    public var sectionRadius: Float = 0

    /// 接触点（世界坐标，见 ShapeIntersect.swift 的 contact 约定）
    public var contact: SIMD3<Float> = .zero

    /// 是否产出极值点（`|pt|² < r²` 分支）
    public var hasExtremes = false

    /// 极值点 A/B（世界坐标）
    public var extremeA: SIMD3<Float> = .zero
    public var extremeB: SIMD3<Float> = .zero

    /// 极值点是否落在切割半径² 内
    public var extremeAHit = false
    public var extremeBHit = false

    /// 最终判定（`SliceTesting.isSliced` 的返回值）
    public var result = false

    /// 门控是否通过
    public var gatePassed: Bool { gate == .passed }

    public init() {}
}

// MARK: - SliceQueryTesting

/// 面向 `SliceQuery` 的判定接口。
///
/// 存在的理由：`SliceTesting`（GameWorld.swift 声明）签名带 `GameState`，
/// 而 `GameState` 字段名在本轮尚未闭合。本协议把判定与状态取数解耦，
/// 使测试可以完全脱离 `GameState` 实例运行；GameWorld 侧仍用 `SliceTesting`。
public protocol SliceQueryTesting: AnyObject {

    /// 完整评估（含中间量），供测试与调试
    func evaluate(query: SliceQuery, entity: Entity, radiusScale: Float) -> SliceEvaluation

    /// 是否被切中（球半径 × 1.0）
    func isSliced(query: SliceQuery, entity: Entity) -> Bool

    /// 是否近失（同一判定、球半径 × 1.5）
    /// 锚点：`core_logic_notes.md §1.2 步骤 7` + `Constants.Slash.nearMissRadiusMultiplier`
    /// ⚠️ L4：**仅对炸弹调用**，不可推广到水果（本实现内部以 `kind == .bomb` 硬保护）
    func isNearMiss(query: SliceQuery, entity: Entity) -> Bool
}

// MARK: - SliceTester

/// `SliceTesting` 的默认实现（两段式切割判定）。
///
/// ⚠️ 非 Sendable：持有 `queryProvider` 闭包与有状态 `intersector`，
///    必须由逻辑线程（MainActor / GameLoop）独占持有，禁止跨 actor 传递。
public final class SliceTester: SliceTesting, SliceQueryTesting {

    /// `GameState → SliceQuery` 的取数闭包。
    ///
    /// 为什么要闭包：`GameState.swift` 的字段名在 T-011 时尚未闭合，
    /// 本卡不得臆造。待 GameState 落盘后由装配层（GameServices 构造处）接线，例如：
    /// ```
    /// SliceTester { state in
    ///     SliceQuery(cutter: state.cutterShape,
    ///                cutDirection: state.slashDirection,
    ///                cutRadiusSquared: state.cutRadiusSquared,
    ///                globalSwitchA: state.suspendSliceTestA,
    ///                globalSwitchB: state.suspendSliceTestB)
    /// }
    /// ```
    public typealias QueryProvider = (GameState) -> SliceQuery

    private let intersector: any ShapeIntersecting
    private let queryProvider: QueryProvider

    public init(intersector: any ShapeIntersecting = DefaultShapeIntersector(),
                queryProvider: @escaping QueryProvider) {
        self.intersector = intersector
        self.queryProvider = queryProvider
    }

    // MARK: SliceTesting（GameWorld.swift 声明的协议）

    /// §1.2 步骤 6.2：水果循环中的两段式判定入口
    public func isSliced(game: GameState, entity: Entity) -> Bool {
        isSliced(query: queryProvider(game), entity: entity)
    }

    /// §1.2 步骤 7：炸弹循环中的近失判定入口（L4：仅炸弹）
    public func isNearMiss(game: GameState, entity: Entity) -> Bool {
        isNearMiss(query: queryProvider(game), entity: entity)
    }

    // MARK: SliceQueryTesting

    /// 是否被切中（球半径 × 1.0）
    public func isSliced(query: SliceQuery, entity: Entity) -> Bool {
        evaluate(query: query, entity: entity, radiusScale: 1).result
    }

    /// 近失：同一判定、球半径 × 1.5。
    ///
    /// 锚点：`core_logic_notes.md §1.2 步骤 7`（[macho]）
    /// 原常量 `0x3FC00000` = 1.5f（`Constants.Slash.nearMissRadiusMultiplier`）。
    ///
    /// ⚠️ L4：只允许在炸弹循环（GameWorld 步骤 7）调用。
    ///    本实现额外加了 `kind == .bomb` 硬保护，防止误用到水果遍历。
    /// ⚠️ 语义提醒：原逻辑**不取反**（不是「未切中才算近失」），
    ///    只是用放大半径再走一遍同一判定；「擦边且真实命中」是否要排除，
    ///    由 GameWorld 步骤 7 的调用点决定，本类型不做此假设。
    public func isNearMiss(query: SliceQuery, entity: Entity) -> Bool {
        guard entity.kind == .bomb else { return false }
        return evaluate(query: query,
                        entity: entity,
                        radiusScale: Constants.Slash.nearMissRadiusMultiplier).result
    }

    // MARK: 核心判定

    /// 两段式切割判定（FUN_00017d74 逐段对译）。
    ///
    /// - Parameters:
    ///   - query: 本帧切割上下文（刀形状 / 切割半径² / 全局开关）
    ///   - entity: 被切实体（球形状由 `transform.position` + `transform.radius` 构造）
    ///   - radiusScale: 球半径倍数（1.0 = 正常判定；1.5 = 近失判定）
    public func evaluate(query: SliceQuery,
                         entity: Entity,
                         radiusScale: Float) -> SliceEvaluation {
        var ev = SliceEvaluation()

        // 实体形状构造。
        // [待验证] transform.radius 是否需再乘 transform.scale（FruitInfo.collision=1.0 /
        //          scale=25.0，缩放语义待渲染任务卡闭合）。本卡按「radius 已是世界半径」处理，
        //          与 entityShape+0x14 直接参与 r² 的反编译结构一致。
        let sphereRadius = entity.transform.radius * radiusScale
        let sphere = ShapeRef.sphere(center: entity.transform.position, radius: sphereRadius)

        // ── 门控（原 FUN_00017d74 入口 if 链）────────────────────────────
        let gate = HitTest.gate(query: query, entityShape: sphere)
        ev.gate = gate
        guard gate == .passed, let cutter = query.cutter else { return ev }

        // ── 第一段：通用形状相交（vtable+0x0C）──────────────────────────
        var contact = SIMD3<Float>.zero
        let coarse = intersector.intersect(cutter, sphere, contact: &contact)
        ev.coarseHit = coarse
        ev.contact = contact

        // ── 第二段：球体二次确认（vtable+8 返回 1 的分支）────────────────
        // 当前所有被切实体形状均为球；A == 0 分支保留以便将来接入非球实体。
        ev.requiresSphereConfirm = sphere.isSpherical
        guard sphere.isSpherical else {
            // 原：if (iVar1 != 1) uVar5 = B
            ev.result = coarse
            return ev
        }

        // 原：if (iVar1 == 1 && uVar2 == 0) { ... } —— 粗判不相交直接否定
        guard coarse else { return ev }

        // 原：r² = dot(entityShape+0x14)；dist² = |gameShape.pos − entityShape.pos|²
        let r2 = sphereRadius * sphereRadius
        let centerDelta = cutter.center - sphere.center
        let dist2 = simd_length_squared(centerDelta)

        // 原：if (dist2 < r2) → uVar5 保持 1（球心在球内，不进入截面分支）
        if dist2 < r2 {
            ev.centerInsideSphere = true
            ev.result = true
            return ev
        }

        // 原：pt = contact；if (|pt|² < r2) { k = sqrtf(r2 − |pt|²) ... }
        let pt = contact - sphere.center
        let ptLen2 = simd_length_squared(pt)
        guard ptLen2 < r2 else { return ev }

        let k = (r2 - ptLen2).squareRoot()   // FUN_00301044 = sqrtf
        ev.sectionRadius = k

        // ± 极值点构造（[待验证]，见文件头 [待验证] 清单第 1 条）
        let axis = SliceTester.extremeAxis(pt: pt, direction: query.cutDirection)
        let pointA = sphere.center + pt + axis * k
        let pointB = sphere.center + pt - axis * k
        ev.hasExtremes = true
        ev.extremeA = pointA
        ev.extremeB = pointB

        // 极值点 vs 切割半径²（原 `game+0xf0`）
        ev.extremeAHit = simd_length_squared(pointA - cutter.center) <= query.cutRadiusSquared
        ev.extremeBHit = simd_length_squared(pointB - cutter.center) <= query.cutRadiusSquared
        ev.result = ev.extremeAHit || ev.extremeBHit
        return ev
    }

    // MARK: 几何辅助

    /// 极值点构造轴：`pt × cutDirection` 的单位化法线。
    ///
    /// 退化处理（normalize 零向量兜底，任务卡要求）：
    /// - `cutDirection` 为零或与 `pt` 平行 → 换一条与 `pt` 正交的轴
    /// - `pt` 自身为零（接触点恰在球心）→ 直接取 `cutDirection`
    static func extremeAxis(pt: SIMD3<Float>, direction: SIMD3<Float>) -> SIMD3<Float> {
        let dir = safeNormalize(direction, fallback: SIMD3<Float>(0, 0, -1))

        let cross1 = simd_cross(pt, dir)
        if simd_length_squared(cross1) > 1e-12 {
            return safeNormalize(cross1, fallback: SIMD3<Float>(1, 0, 0))
        }

        // 退化 1：pt 与 dir 平行（含任一为零向量）→ 取任一条与 pt 正交的轴
        var cross2 = simd_cross(pt, SIMD3<Float>(0, 1, 0))
        if simd_length_squared(cross2) < 1e-12 {
            cross2 = simd_cross(pt, SIMD3<Float>(1, 0, 0))
        }
        if simd_length_squared(cross2) < 1e-12 {
            // 退化 2：pt == 0 → 用 dir 本身（± 对称，方向符号不影响判定）
            return dir
        }
        return safeNormalize(cross2, fallback: dir)
    }

    /// 安全归一化：零向量/近零向量返回 fallback，避免 NaN 传播到判定结果。
    static func safeNormalize(_ v: SIMD3<Float>, fallback: SIMD3<Float>) -> SIMD3<Float> {
        let len2 = simd_length_squared(v)
        guard len2 > 1e-12 else { return fallback }
        return v / len2.squareRoot()
    }
}