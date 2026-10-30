//
//  SliceGeometryTests.swift
//  FNPBCoreTests
//
//  T-012 黄金值对账测试：两段式切割判定 + 近失 + 门控 + 轨迹环形缓冲。
//
//  设计原则：
//    1. 只验证 `evaluate(query:entity:radiusScale:)` 的输出，**不构造 GameState**
//       （GameState 字段名尚未闭合，见 SliceTesting.swift 的 QueryProvider 说明）。
//    2. 所有用例的期望值均可由手算复核，注释中给出算式。
//    3. 覆盖任务卡验收：直接命中 / 截面 ± 极值两分支 / 近失 1.5× / 门控全假 / 轨迹 8 槽环绕。
//

import XCTest
import simd
@testable import FNPBCore

final class SliceGeometryTests: XCTestCase {

    // MARK: - 夹具

    private func makeTester() -> SliceTester {
        // 判定测试不走 GameState 路径，queryProvider 不会被调用
        SliceTester(queryProvider: { _ in SliceQuery() })
    }

    private func makeEntity(kind: EntityKind,
                            at position: SIMD3<Float>,
                            radius: Float) -> Entity {
        var e = Entity(id: EntityID(rawValue: 1), kind: kind)
        e.transform.position = position
        e.transform.radius = radius
        e.transform.scale = 1
        return e
    }

    private func makeFruit(at position: SIMD3<Float> = .zero, radius: Float = 1) -> Entity {
        makeEntity(kind: .fruit, at: position, radius: radius)
    }

    private func makeBomb(at position: SIMD3<Float> = .zero, radius: Float = 1) -> Entity {
        makeEntity(kind: .bomb, at: position, radius: radius)
    }

    // MARK: - 1. 直接命中（球心在切割半径内，原 dist2 < r2 分支）

    /// 锚点：FUN_00017d74 `if (-1 < (int)((uint)(dist2 < r2) << 31))` 的**不进入**
    /// 分支 —— 即 `dist2 < r2` 时不再做截面判定、直接命中。
    ///
    /// 手算：被切球 center=(0,0,0) r=1；刀球 center=(0.5,0,0) r=0.2
    ///   coarse: d=0.5 ≤ 1+0.2=1.2 → 相交 ✓
    ///   dist2 = 0.25 < r2 = 1 → 直接命中
    func testDirectHitWhenCutterCenterInsideSphere() {
        let tester = makeTester()
        let entity = makeFruit(at: .zero, radius: 1)
        let query = SliceQuery(cutter: .sphere(center: SIMD3<Float>(0.5, 0, 0), radius: 0.2),
                               cutDirection: SIMD3<Float>(0, 1, 0),
                               cutRadiusSquared: 1.0)

        let ev = tester.evaluate(query: query, entity: entity, radiusScale: 1)

        XCTAssertTrue(ev.gatePassed, "门控应通过")
        XCTAssertTrue(ev.coarseHit, "第一段：球-球应相交")
        XCTAssertTrue(ev.requiresSphereConfirm)
        XCTAssertTrue(ev.centerInsideSphere, "dist2=0.25 < r2=1")
        XCTAssertFalse(ev.hasExtremes, "球心在球内时不应进入截面分支")
        XCTAssertTrue(ev.result)
        XCTAssertTrue(tester.isSliced(query: query, entity: entity))
    }

    // MARK: - 2. 截面圆 + 极值点：命中分支

    /// 锚点：FUN_00017d74 的 `|pt|² < r2 → k = sqrtf(r2 − |pt|²)` 之后
    /// `± 极值点 vs 切割半径²` 的通过分支。
    ///
    /// 手算：
    ///   被切球 center=(0,0,0) r=1；刀球 center=(1.5,0,0) r=1
    ///   coarse: d=1.5 ≤ 2 → 相交 ✓
    ///   dist2 = 2.25 ≥ r2 = 1 → 进入截面分支 ✓
    ///   contact = 被切球心朝刀方向、距离 d−r_cutter = 0.5 → (0.5, 0, 0)
    ///   |pt|² = 0.25 < 1 → k = sqrt(0.75) ≈ 0.8660
    ///   轴 = normalize(cross((0.5,0,0),(0,1,0))) = (0,0,1)
    ///   极值点 = (0.5, 0, ±0.8660)
    ///   到刀心 (1.5,0,0) 距离² = 1² + 0.75 = 1.75
    ///   cutRadius² = 2.0 → 1.75 ≤ 2 → 两个极值点均命中
    func testSectionCircleExtremesAccepted() {
        let tester = makeTester()
        let entity = makeFruit(at: .zero, radius: 1)
        let query = SliceQuery(cutter: .sphere(center: SIMD3<Float>(1.5, 0, 0), radius: 1),
                               cutDirection: SIMD3<Float>(0, 1, 0),
                               cutRadiusSquared: 2.0)

        let ev = tester.evaluate(query: query, entity: entity, radiusScale: 1)

        XCTAssertTrue(ev.gatePassed)
        XCTAssertTrue(ev.coarseHit)
        XCTAssertFalse(ev.centerInsideSphere, "dist2=2.25 ≥ r2=1")
        XCTAssertTrue(ev.hasExtremes)
        XCTAssertEqual(ev.sectionRadius, Float(0.75).squareRoot(), accuracy: 1e-4)
        XCTAssertEqual(ev.extremeA.x, 0.5, accuracy: 1e-4)
        XCTAssertEqual(abs(ev.extremeA.z), Float(0.75).squareRoot(), accuracy: 1e-4)
        XCTAssertTrue(ev.extremeAHit)
        XCTAssertTrue(ev.extremeBHit)
        XCTAssertTrue(ev.result)
    }

    // MARK: - 3. 截面圆 + 极值点：拒绝分支

    /// 同一几何，把 `cutRadiusSquared` 收紧到 1.0。
    /// 极值点到刀心距离² = 1.75 > 1.0，且球心在球外 → 二次确认把粗判的
    /// 「相交」覆盖为「未切中」。这正是 T-006「球体二次确认」的语义关键。
    func testSectionCircleExtremesRejected() {
        let tester = makeTester()
        let entity = makeFruit(at: .zero, radius: 1)
        let query = SliceQuery(cutter: .sphere(center: SIMD3<Float>(1.5, 0, 0), radius: 1),
                               cutDirection: SIMD3<Float>(0, 1, 0),
                               cutRadiusSquared: 1.0)

        let ev = tester.evaluate(query: query, entity: entity, radiusScale: 1)

        XCTAssertTrue(ev.coarseHit, "粗判仍相交")
        XCTAssertFalse(ev.centerInsideSphere)
        XCTAssertTrue(ev.hasExtremes)
        XCTAssertFalse(ev.extremeAHit, "1.75 > 1.0")
        XCTAssertFalse(ev.extremeBHit)
        XCTAssertFalse(ev.result, "二次确认应覆盖为未切中")
        XCTAssertFalse(tester.isSliced(query: query, entity: entity))
    }

    // MARK: - 4. 近失 = 同一判定 + 半径 × 1.5

    /// 锚点：`core_logic_notes.md §1.2 步骤 7`（仅炸弹）+ T-006（0x3FC00000 = 1.5f）。
    ///
    /// 手算：
    ///   被切球 center=(0,0,0)，radius=1；刀球 center=(2.4,0,0) r=1
    ///   【1.0×】d=2.4 > 1+1 = 2 → 不相交 → false
    ///   【1.5×】r=1.5，d=2.4 ≤ 2.5 → 相交；dist2=5.76 ≥ r2=2.25 → 截面分支
    ///          contact = 朝刀方向、距离 d−r_cutter = 1.4 → (1.4, 0, 0)
    ///          |pt|² = 1.96 < 2.25 → k = sqrt(0.29) ≈ 0.5385
    ///          极值点到刀心距离² = 1² + 0.29 = 1.29
    ///          cutRadius² = 1.5 → 1.29 ≤ 1.5 → true
    func testNearMissExpandsRadiusByOnePointFive() {
        let tester = makeTester()
        let bomb = makeBomb(at: .zero, radius: 1)
        let query = SliceQuery(cutter: .sphere(center: SIMD3<Float>(2.4, 0, 0), radius: 1),
                               cutDirection: SIMD3<Float>(0, 1, 0),
                               cutRadiusSquared: 1.5)

        XCTAssertFalse(tester.isSliced(query: query, entity: bomb), "1.0× 半径不相交")
        XCTAssertTrue(tester.isNearMiss(query: query, entity: bomb), "1.5× 半径命中（擦边）")

        // 中间量对账
        let ev = tester.evaluate(query: query, entity: bomb,
                                 radiusScale: Constants.Slash.nearMissRadiusMultiplier)
        XCTAssertEqual(ev.sectionRadius, Float(0.29).squareRoot(), accuracy: 1e-4)
        XCTAssertTrue(ev.result)
    }

    /// L4 保护：近失判定只对炸弹生效（防止误推广到水果遍历）。
    func testNearMissRejectsNonBombEntity() {
        let tester = makeTester()
        let fruit = makeFruit(at: .zero, radius: 1)
        let query = SliceQuery(cutter: .sphere(center: SIMD3<Float>(2.4, 0, 0), radius: 1),
                               cutDirection: SIMD3<Float>(0, 1, 0),
                               cutRadiusSquared: 1.5)
        XCTAssertFalse(tester.isNearMiss(query: query, entity: fruit))
    }

    // MARK: - 5. 门控全假

    /// 锚点：FUN_00017d74 入口 if 链 —— 任一失败即返回 0。
    func testGateRejectsAllFailureModes() {
        let tester = makeTester()
        let entity = makeFruit(at: .zero, radius: 1)
        let cutter = ShapeRef.sphere(center: SIMD3<Float>(0.5, 0, 0), radius: 0.2)
        let sphere = ShapeRef.sphere(center: entity.transform.position,
                                     radius: entity.transform.radius)

        // ① game+0x38 == 0（无刀形状）
        var q = SliceQuery(cutter: nil, cutRadiusSquared: 1)
        XCTAssertEqual(HitTest.gate(query: q, entityShape: sphere), .noCutter)
        XCTAssertFalse(tester.evaluate(query: q, entity: entity, radiusScale: 1).gatePassed)
        XCTAssertFalse(tester.isSliced(query: q, entity: entity))

        // ② 0.0 < game+0xf0 不成立
        q = SliceQuery(cutter: cutter, cutRadiusSquared: 0)
        XCTAssertEqual(HitTest.gate(query: q, entityShape: sphere), .nonPositiveCutRadius)
        XCTAssertFalse(tester.isSliced(query: q, entity: entity))

        q = SliceQuery(cutter: cutter, cutRadiusSquared: -1)
        XCTAssertEqual(HitTest.gate(query: q, entityShape: sphere), .nonPositiveCutRadius)

        // ③ entity+0x38 == 0（实体无形状）
        q = SliceQuery(cutter: cutter, cutRadiusSquared: 1)
        XCTAssertEqual(HitTest.gate(query: q, entityShape: nil), .noEntityShape)

        // ④ 全局开关 A（PTR[0x28]）
        q = SliceQuery(cutter: cutter, cutRadiusSquared: 1, globalSwitchA: true)
        XCTAssertEqual(HitTest.gate(query: q, entityShape: sphere), .globalSwitchOn)
        XCTAssertFalse(tester.isSliced(query: q, entity: entity))

        // ⑤ 全局开关 B（PTR[0x60]）
        q = SliceQuery(cutter: cutter, cutRadiusSquared: 1, globalSwitchB: true)
        XCTAssertEqual(HitTest.gate(query: q, entityShape: sphere), .globalSwitchOn)

        // ⑥ 全通
        q = SliceQuery(cutter: cutter, cutRadiusSquared: 1)
        XCTAssertEqual(HitTest.gate(query: q, entityShape: sphere), .passed)
        XCTAssertTrue(tester.isSliced(query: q, entity: entity))
    }

    // MARK: - 6. 轨迹环形缓冲

    /// 锚点：`core_logic_notes.md §1.2 步骤 3`（`slot = (slot+1)%8`，0.05s 超时写槽）。
    func testTrailWritesOnlyAfterTimeout() {
        var trail = SlashTrail()
        XCTAssertEqual(trail.capacity, 8)
        XCTAssertFalse(trail.isActive)

        // 未激活：计时归零，不写槽（原 `+0xa5 == 0 → +0x17c = 0`）
        XCTAssertFalse(trail.advance(dt: 0.1, point: SIMD3<Float>(9, 9, 9)))
        XCTAssertEqual(trail.elapsed, 0)
        XCTAssertEqual(trail.writeCount, 0)

        // 激活但未超时：不写槽
        trail.begin()
        XCTAssertFalse(trail.advance(dt: 0.01, point: SIMD3<Float>(1, 0, 0)))
        XCTAssertEqual(trail.writeCount, 0)
        XCTAssertEqual(trail.slot, 0)
        XCTAssertTrue(trail.isActive, "未超时不应清活跃位")

        // 累加跨过 0.05s：写槽一次并清活跃位
        XCTAssertTrue(trail.advance(dt: 0.05, point: SIMD3<Float>(2, 0, 0)))
        XCTAssertEqual(trail.writeCount, 1)
        XCTAssertEqual(trail.slot, 1, "(0+1)%8")
        XCTAssertFalse(trail.isActive)
        XCTAssertEqual(trail.elapsed, 0)
        XCTAssertEqual(trail.samples[1], SIMD3<Float>(2, 0, 0))
    }

    /// 8 槽环绕：连续 10 次写入后 slot = 10 % 8 = 2，最新点覆盖槽 2。
    func testTrailWrapsEveryEightSamples() {
        var trail = SlashTrail()
        for i in 0..<10 {
            trail.begin()
            XCTAssertTrue(trail.advance(dt: 0.06, point: SIMD3<Float>(Float(i), 0, 0)))
        }
        XCTAssertEqual(trail.writeCount, 10)
        XCTAssertEqual(trail.slot, 2)
        XCTAssertEqual(trail.samples[2], SIMD3<Float>(9, 0, 0), "第 10 次写入落在槽 2")
        XCTAssertEqual(trail.samples.count, Constants.Slash.slotCount)
    }

    // MARK: - 7. 兜底：normalize 零向量 / 退化几何

    /// 任务卡要求「normalize 处理零向量兜底」：零 direction、零 pt 均不得产生 NaN。
    func testExtremeAxisHandlesDegenerateInput() {
        let zeroPt = SIMD3<Float>.zero
        let zeroDir = SIMD3<Float>.zero

        let axis1 = SliceTester.extremeAxis(pt: zeroPt, direction: zeroDir)
        XCTAssertFalse(axis1.x.isNaN || axis1.y.isNaN || axis1.z.isNaN)
        XCTAssertEqual(simd_length(axis1), 1, accuracy: 1e-5, "应归一化为单位向量")

        // pt 与 direction 平行 → 走正交兜底
        let axis2 = SliceTester.extremeAxis(pt: SIMD3<Float>(0, 2, 0),
                                            direction: SIMD3<Float>(0, 1, 0))
        XCTAssertFalse(axis2.x.isNaN || axis2.y.isNaN || axis2.z.isNaN)
        XCTAssertEqual(simd_length(axis2), 1, accuracy: 1e-5)
        XCTAssertEqual(simd_dot(axis2, SIMD3<Float>(0, 1, 0)), 0, accuracy: 1e-5)

        // 零向量安全归一化
        XCTAssertEqual(SliceTester.safeNormalize(.zero, fallback: SIMD3<Float>(1, 0, 0)),
                       SIMD3<Float>(1, 0, 0))
    }
}