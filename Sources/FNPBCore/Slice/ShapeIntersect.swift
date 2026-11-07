//
//  ShapeIntersect.swift
//  FNPBCore
//
//  引擎通用形状相交（原 vtable+0x0C 多态分发）的现代重建（T-012）。
//
//  【锚点】findings/deep_slash_macho.md FUN_00017d74：
//      uVar2 = (**(code **)(**(int **)(param_1 + 0x38) + 0xc))
//                    (gameShape, entityShape, &local_3c);
//  即：切割判定第一段 = 通过虚表 +0x0C 调用「形状 × 形状」相交，并由第三参数
//  输出接触点（12 字节 = vec3）。
//
//  【contact 语义】⚠️ [待验证]
//  引擎原始输出落在 local_3c/38/34，随后被当作「相对实体球心的局部偏移」使用
//  （二次确认中计算 |contact|² 并与 r² 比较）。若 contact 是球面上的交点，
//  则 |contact| ≡ r，`|contact|² < r²` 恒假、截面圆分支永不成立。
//  故本实现把约定定为：**contact = 刀形状上最接近被切球心的点（世界坐标）**，
//  使 `|contact − sphereCenter|² < r²` 在粗判相交后通常成立。
//  该约定替换了引擎原输出，属重建偏差，需 Mach-O 运行期核对（T-012 风险点）。
//
//  【覆盖范围】按任务卡：线-球 / 线-三角 / 球-球 为必需；AABB 参与的组合
//  与球-三角为补全 switch 穷尽性所需，三角-三角与三角-AABB 未实现（返回 false）。
//

import Foundation
#if canImport(simd)
import simd  // 仅 Apple 平台提供；Windows 上用标准库 SIMD 类型即可
#endif
// MARK: - ShapeRef

/// 形状引用（原引擎形状对象的类型擦除）。
///
/// 锚点：`DECISIONS.md [T-006]`「引擎通用形状相交（vtable+0x0C，多态分发线/球/三角）」。
public enum ShapeRef: Sendable, Equatable {

    /// 球：球心 + 半径（原实体形状 `+0x4/+0x8/+0xC` = 位置，`+0x14` = 半径）
    case sphere(center: SIMD3<Float>, radius: Float)

    /// 线段（刀光轨迹；原 slash 轨迹点对）
    case line(a: SIMD3<Float>, b: SIMD3<Float>)

    /// 三角形（网格/多边形切刀）
    case triangle(a: SIMD3<Float>, b: SIMD3<Float>, c: SIMD3<Float>)

    /// 轴对齐包围盒
    case aabb(min: SIMD3<Float>, max: SIMD3<Float>)

    /// 代表中心点。用于球体二次确认的球心距离判定。
    public var center: SIMD3<Float> {
        switch self {
        case let .sphere(c, _):        return c
        case let .line(a, b):          return (a + b) * 0.5
        case let .triangle(a, b, c):   return (a + b + c) / 3
        case let .aabb(mn, mx):        return (mn + mx) * 0.5
        }
    }

    /// 是否球体（对应原 `entityShape->vtable+8()` 返回 1 的语义）。
    /// [待验证]：vtable+8 的确切语义未经运行期确认，仅由 T-006「球体二次确认」推断。
    public var isSpherical: Bool {
        if case .sphere = self { return true }
        return false
    }

    /// 球半径（非球返回 nil）
    public var sphericalRadius: Float? {
        if case let .sphere(_, r) = self { return r }
        return nil
    }
}

// MARK: - ShapeIntersecting

/// 通用形状相交（原 vtable+0x0C 多态分发的协议化）。
public protocol ShapeIntersecting: AnyObject {
    /// 判断两形状是否相交，并输出接触点（世界坐标）。
    ///
    /// - Parameters:
    ///   - a: 形状 A（切割判定中为**刀**形状，原 `game+0x38`）
    ///   - b: 形状 B（切割判定中为**被切实体**形状，原 `entity+0x38`）
    ///   - contact: 输出 = 形状 A 上最接近形状 B 中心（球时）的点
    /// - Returns: 是否相交
    func intersect(_ a: ShapeRef, _ b: ShapeRef, contact: inout SIMD3<Float>) -> Bool
}

// MARK: - 默认实现

/// 无状态实现，可由任意线程持有。
public final class DefaultShapeIntersector: ShapeIntersecting {

    private let epsilon: Float = 1e-8

    public init() {}

    public func intersect(_ a: ShapeRef, _ b: ShapeRef, contact: inout SIMD3<Float>) -> Bool {
        switch (a, b) {

        // 球 × 球
        case let (.sphere(c1, r1), .sphere(c2, r2)):
            return sphereSphere(c1, r1, c2, r2, &contact)

        // 线 × 球
        case let (.line(p0, p1), .sphere(c, r)):
            return lineSphere(p0, p1, c, r, &contact)
        case let (.sphere(c, r), .line(p0, p1)):
            return lineSphere(p0, p1, c, r, &contact)

        // 线 × 三角
        case let (.line(p0, p1), .triangle(v0, v1, v2)):
            return lineTriangle(p0, p1, v0, v1, v2, &contact)
        case let (.triangle(v0, v1, v2), .line(p0, p1)):
            return lineTriangle(p0, p1, v0, v1, v2, &contact)

        // 线 × AABB
        case let (.line(p0, p1), .aabb(mn, mx)):
            return lineAABB(p0, p1, mn, mx, &contact)
        case let (.aabb(mn, mx), .line(p0, p1)):
            return lineAABB(p0, p1, mn, mx, &contact)

        // 球 × 三角
        case let (.sphere(c, r), .triangle(v0, v1, v2)):
            return sphereTriangle(c, r, v0, v1, v2, &contact)
        case let (.triangle(v0, v1, v2), .sphere(c, r)):
            return sphereTriangle(c, r, v0, v1, v2, &contact)

        // 球 × AABB
        case let (.sphere(c, r), .aabb(mn, mx)):
            return sphereAABB(c, r, mn, mx, &contact)
        case let (.aabb(mn, mx), .sphere(c, r)):
            return sphereAABB(c, r, mn, mx, &contact)

        // AABB × AABB
        case let (.aabb(a0, a1), .aabb(b0, b1)):
            return aabbAABB(a0, a1, b0, b1, &contact)

        // 未覆盖组合：[待验证] —— 当前切割判定调用路径（刀 vs 实体球）不涉及
        case (.line, .line), (.triangle, .triangle),
             (.triangle, .aabb), (.aabb, .triangle):
            return false
        }
    }

    // MARK: 球 × 球

    /// 球-球相交。
    /// contact = 被切球心 `c2` 朝刀球心方向、距离 `max(0, d − r1)` 的刀面点。
    private func sphereSphere(_ c1: SIMD3<Float>, _ r1: Float,
                              _ c2: SIMD3<Float>, _ r2: Float,
                              _ contact: inout SIMD3<Float>) -> Bool {
        let diff = c1 - c2
        let d2 = simd_length_squared(diff)
        let rr = r1 + r2
        guard d2 <= rr * rr else { return false }

        let d = d2.squareRoot()
        if d < epsilon {
            // 同心：接触点退化到被切球心
            contact = c2
            return true
        }
        let dir = diff / d
        contact = c2 + dir * Swift.max(0, d - r1)
        return true
    }

    // MARK: 线 × 球

    /// 线-球相交。
    /// contact = 线段上最接近球心的点（clamp 到 [a,b]）。
    private func lineSphere(_ p0: SIMD3<Float>, _ p1: SIMD3<Float>,
                            _ c: SIMD3<Float>, _ r: Float,
                            _ contact: inout SIMD3<Float>) -> Bool {
        let d = p1 - p0
        let dd = simd_length_squared(d)
        if dd < epsilon {
            let dist2 = simd_length_squared(p0 - c)
            guard dist2 <= r * r else { return false }
            contact = p0
            return true
        }
        var t = simd_dot(c - p0, d) / dd
        t = Swift.min(Swift.max(t, 0), 1)
        let closest = p0 + d * t
        guard simd_length_squared(closest - c) <= r * r else { return false }
        contact = closest
        return true
    }

    // MARK: 线 × 三角

    /// 线-三角相交（Möller–Trumbore）。
    /// contact = 线段与三角平面的交点世界坐标。
    private func lineTriangle(_ p0: SIMD3<Float>, _ p1: SIMD3<Float>,
                              _ v0: SIMD3<Float>, _ v1: SIMD3<Float>, _ v2: SIMD3<Float>,
                              _ contact: inout SIMD3<Float>) -> Bool {
        let d = p1 - p0
        let e1 = v1 - v0
        let e2 = v2 - v0
        let pvec = simd_cross(d, e2)
        let det = simd_dot(e1, pvec)
        if abs(det) < epsilon { return false }        // 平行
        let invDet = 1 / det
        let tvec = p0 - v0
        let u = simd_dot(tvec, pvec) * invDet
        guard u >= 0, u <= 1 else { return false }
        let qvec = simd_cross(tvec, e1)
        let v = simd_dot(d, qvec) * invDet
        guard v >= 0, u + v <= 1 else { return false }
        let t = simd_dot(e2, qvec) * invDet
        guard t >= 0, t <= 1 else { return false }
        contact = p0 + d * t
        return true
    }

    // MARK: 线 × AABB

    /// 线-AABB 相交（slab 法，t ∈ [0,1]）。
    private func lineAABB(_ p0: SIMD3<Float>, _ p1: SIMD3<Float>,
                          _ mn: SIMD3<Float>, _ mx: SIMD3<Float>,
                          _ contact: inout SIMD3<Float>) -> Bool {
        let d = p1 - p0
        var tMin: Float = 0
        var tMax: Float = 1

        for axis in 0..<3 {
            let o = p0[axis]
            let dir = d[axis]
            if abs(dir) < epsilon {
                if o < mn[axis] || o > mx[axis] { return false }
            } else {
                var t1 = (mn[axis] - o) / dir
                var t2 = (mx[axis] - o) / dir
                if t1 > t2 { swap(&t1, &t2) }
                tMin = Swift.max(tMin, t1)
                tMax = Swift.min(tMax, t2)
                if tMin > tMax { return false }
            }
        }
        contact = p0 + d * tMin
        return true
    }

    // MARK: 球 × 三角

    /// 球-三角相交：球心到三角最近点距离 ≤ 半径。
    private func sphereTriangle(_ c: SIMD3<Float>, _ r: Float,
                                _ v0: SIMD3<Float>, _ v1: SIMD3<Float>, _ v2: SIMD3<Float>,
                                _ contact: inout SIMD3<Float>) -> Bool {
        let closest = closestPointOnTriangle(c, v0, v1, v2)
        guard simd_length_squared(closest - c) <= r * r else { return false }
        contact = closest
        return true
    }

    /// 点到三角形最近点（Ericson, Real-Time Collision Detection §5.1.5）。
    private func closestPointOnTriangle(_ p: SIMD3<Float>,
                                        _ a: SIMD3<Float>, _ b: SIMD3<Float>, _ c: SIMD3<Float>) -> SIMD3<Float> {
        let ab = b - a
        let ac = c - a
        let ap = p - a
        let d1 = simd_dot(ab, ap)
        let d2 = simd_dot(ac, ap)
        if d1 <= 0 && d2 <= 0 { return a }

        let bp = p - b
        let d3 = simd_dot(ab, bp)
        let d4 = simd_dot(ac, bp)
        if d3 >= 0 && d4 <= d3 { return b }

        let vc = d1 * d4 - d3 * d2
        if vc <= 0 && d1 >= 0 && d3 <= 0 {
            let denom = d1 - d3
            return abs(denom) < epsilon ? a : a + ab * (d1 / denom)
        }

        let cp = p - c
        let d5 = simd_dot(ab, cp)
        let d6 = simd_dot(ac, cp)
        if d6 >= 0 && d5 <= d6 { return c }

        let vb = d5 * d2 - d1 * d6
        if vb <= 0 && d2 >= 0 && d6 <= 0 {
            let denom = d2 - d6
            return abs(denom) < epsilon ? a : a + ac * (d2 / denom)
        }

        let va = d3 * d6 - d5 * d4
        if va <= 0 && (d4 - d3) >= 0 && (d5 - d6) >= 0 {
            let denom = (d4 - d3) + (d5 - d6)
            return abs(denom) < epsilon ? b : b + (c - b) * ((d4 - d3) / denom)
        }

        let sum = va + vb + vc
        if abs(sum) < epsilon { return a }
        let denom = 1 / sum
        let v = vb * denom
        let w = vc * denom
        return a + ab * v + ac * w
    }

    // MARK: 球 × AABB

    /// 球-AABB 相交：AABB 上最接近球心的点（clamp）。
    private func sphereAABB(_ c: SIMD3<Float>, _ r: Float,
                            _ mn: SIMD3<Float>, _ mx: SIMD3<Float>,
                            _ contact: inout SIMD3<Float>) -> Bool {
        let closest = SIMD3<Float>(
            Swift.min(Swift.max(c.x, mn.x), mx.x),
            Swift.min(Swift.max(c.y, mn.y), mx.y),
            Swift.min(Swift.max(c.z, mn.z), mx.z)
        )
        guard simd_length_squared(closest - c) <= r * r else { return false }
        contact = closest
        return true
    }

    // MARK: AABB × AABB

    /// AABB-AABB 重叠测试。
    private func aabbAABB(_ a0: SIMD3<Float>, _ a1: SIMD3<Float>,
                          _ b0: SIMD3<Float>, _ b1: SIMD3<Float>,
                          _ contact: inout SIMD3<Float>) -> Bool {
        for axis in 0..<3 {
            if a1[axis] < b0[axis] || b1[axis] < a0[axis] { return false }
        }
        // 接触点取重叠区域中心
        let lo = SIMD3<Float>(Swift.max(a0.x, b0.x), Swift.max(a0.y, b0.y), Swift.max(a0.z, b0.z))
        let hi = SIMD3<Float>(Swift.min(a1.x, b1.x), Swift.min(a1.y, b1.y), Swift.min(a1.z, b1.z))
        contact = (lo + hi) * 0.5
        return true
    }
}