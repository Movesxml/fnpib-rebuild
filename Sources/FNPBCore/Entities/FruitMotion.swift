import Foundation
import simd

// ============================================================================
// FruitMotion — 水果抛物线运动积分器（T-015）
//
// 定位说明（诚实预期）：
//   - `FruitInfo`（core_logic_notes §4.5）只闭合了 `scale / collision / hitInfluence /
//     disappearSpeed` 等元数据键，**不含**重力、初速、发射角、离屏回收阈值；
//   - 这些真值尚未从 macho 数据段提取 → 本文件的默认参数**全部是占位值**，
//     逐条标 `[待验证]`；
//   - 因此所有可调参数收进 `FruitMotionTuning`（结构化注入），
//     待 Frida 打点 / 数据段读取闭合后**只改 `Constants.Physics` 与 tuning**，
//     不改积分逻辑本身。
//
// 积分方式：半隐式欧拉（symplectic Euler）
//     v' = v + g * dt
//     p' = p + v' * dt
//     r' = r + ω * dt
//   选它的理由：原点为两侧可手算，且能量行为比显式欧拉稳定；
//   ⚠️ [待验证] 原引擎积分顺序（先位置后速度 / 是否固定步长）未从反编译确认，
//      本实现与单元测试自洽，但不代表原版手感。
// ============================================================================

// MARK: - 常量占位

extension Constants {

    /// 水果抛物线运动参数（**全部为占位值 [待验证]**）。
    ///
    /// 本枚举暂时声明在 `FruitMotion.swift` 的 extension 中，目的是让 T-015 不改动
    /// `Constants.swift` 正文。**后续常量闭合任务应把本枚举整体迁入 `Constants.swift`
    /// 正文并删除此扩展**（否则重复声明会编译失败）。
    public enum Physics {

        /// 重力加速度（世界单位 / 秒²）。
        /// ⚠️ [待验证] 原版取值未知；-9.8 仅为量级占位（世界单位与屏幕像素的换算关系也未定）。
        public static let gravity: Float = -9.8

        /// 发射初速范围下限（世界单位 / 秒）。
        /// ⚠️ [待验证] 占位值，无任何反编译依据。
        public static let minLaunchSpeed: Float = 14.0

        /// 发射初速范围上限。[待验证] 占位值。
        public static let maxLaunchSpeed: Float = 22.0

        /// 发射角下限（弧度，相对 +X 轴，逆时针为正）。
        /// ⚠️ [待验证] 60° = 1.0471976 仅为「从下往上抛」的形状占位。
        public static let minLaunchAngleRadians: Float = 60.0 * Float.pi / 180.0

        /// 发射角上限（弧度）。[待验证] 120° = 2.0943951 占位。
        public static let maxLaunchAngleRadians: Float = 120.0 * Float.pi / 180.0

        /// 自转角速度下限（弧度/秒，绕 z 轴）。[待验证] 占位。
        public static let minSpinRadiansPerSecond: Float = -4.0

        /// 自转角速度上限（弧度/秒，绕 z 轴）。[待验证] 占位。
        public static let maxSpinRadiansPerSecond: Float = 4.0

        /// 离屏回收的下边界（position.y 低于此值即回收）。
        /// ⚠️ [待验证] 原引擎的离屏判定在渲染层/实体管理器里完成（未见常量直读）。
        public static let offscreenBottomMargin: Float = -2.0

        /// 离屏回收的水平边界（|position.x| 超过此值即回收）。[待验证]
        public static let offscreenHorizontalLimit: Float = 20.0

        /// 离屏回收的上边界（position.y 超过此值即回收，防高速穿屏残留）。[待验证]
        public static let offscreenTopLimit: Float = 40.0
    }
}

// MARK: - 参数注入

/// 抛物线运动参数集合。
///
/// 默认值来自 `Constants.Physics`（占位 [待验证]）；测试与运行时调试可整体替换，
/// 不需要改动 `FruitMotion` 的积分代码。
public struct FruitMotionTuning: Sendable, Equatable {

    /// 重力加速度（负值向下）。
    public var gravity: Float
    /// 初速范围（大小）。
    public var minLaunchSpeed: Float
    public var maxLaunchSpeed: Float
    /// 发射角范围（弧度，相对 +X 轴）。
    public var minLaunchAngle: Float
    public var maxLaunchAngle: Float
    /// 自转角速度范围（弧度/秒，绕 z 轴）。
    public var minSpin: Float
    public var maxSpin: Float
    /// 离屏回收阈值。
    public var offscreenBottomMargin: Float
    public var offscreenHorizontalLimit: Float
    public var offscreenTopLimit: Float

    public init(gravity: Float = Constants.Physics.gravity,
                minLaunchSpeed: Float = Constants.Physics.minLaunchSpeed,
                maxLaunchSpeed: Float = Constants.Physics.maxLaunchSpeed,
                minLaunchAngle: Float = Constants.Physics.minLaunchAngleRadians,
                maxLaunchAngle: Float = Constants.Physics.maxLaunchAngleRadians,
                minSpin: Float = Constants.Physics.minSpinRadiansPerSecond,
                maxSpin: Float = Constants.Physics.maxSpinRadiansPerSecond,
                offscreenBottomMargin: Float = Constants.Physics.offscreenBottomMargin,
                offscreenHorizontalLimit: Float = Constants.Physics.offscreenHorizontalLimit,
                offscreenTopLimit: Float = Constants.Physics.offscreenTopLimit) {
        self.gravity = gravity
        self.minLaunchSpeed = minLaunchSpeed
        self.maxLaunchSpeed = maxLaunchSpeed
        self.minLaunchAngle = minLaunchAngle
        self.maxLaunchAngle = maxLaunchAngle
        self.minSpin = minSpin
        self.maxSpin = maxSpin
        self.offscreenBottomMargin = offscreenBottomMargin
        self.offscreenHorizontalLimit = offscreenHorizontalLimit
        self.offscreenTopLimit = offscreenTopLimit
    }
}

// MARK: - 积分器

public enum FruitMotion {

    /// 推进一个逻辑步。
    ///
    /// - Parameters:
    ///   - entity: 被推进的实体（原地修改 position/velocity/rotation）。
    ///   - dt: 步长（秒）。`dt <= 0` 时只做存活判定，不推进。
    ///   - tuning: 参数集合。
    /// - Returns: `false` 表示实体已离屏、应被 `EntityStore.despawn` 回收。
    ///
    /// 注意：本函数**不**处理「被切中」后的形态切换（fruit → jiblet），
    /// 那属于切割/特效层（§1.2 步骤 6.3）；也不消费 `Entity.dropState`（原 +0x41 下落态
    /// 的语义仍为 [M] 级，未闭合，故不在积分器里使用）。
    @discardableResult
    public static func integrate(_ entity: inout Entity,
                                 dt: Float,
                                 tuning: FruitMotionTuning) -> Bool {
        guard dt > 0 else { return isAlive(entity, tuning: tuning) }

        // 半隐式欧拉：先速度、后位置。
        entity.transform.velocity.y += tuning.gravity * dt
        entity.transform.position += entity.transform.velocity * dt
        entity.transform.rotation += entity.transform.angularVelocity * dt

        return isAlive(entity, tuning: tuning)
    }

    /// 离屏判定（存活 = 仍在可交互区域）。
    public static func isAlive(_ entity: Entity, tuning: FruitMotionTuning) -> Bool {
        let p = entity.transform.position
        if p.y < tuning.offscreenBottomMargin { return false }
        if p.y > tuning.offscreenTopLimit { return false }
        if abs(p.x) > tuning.offscreenHorizontalLimit { return false }
        return true
    }

    /// 生成初速（xy 平面抛物线，z 恒为 0）。
    ///
    /// ⚠️ [待验证] 原版初速/角度的分布规律（是否均匀、是否依赖水果类型、
    ///    是否与 spawner 的 spread 字段相关）均未闭合，此处取「区间内均匀分布」占位。
    public static func launchVelocity(rng: any RandomSource,
                                      tuning: FruitMotionTuning) -> SIMD3<Float> {
        let speed = lerp(tuning.minLaunchSpeed, tuning.maxLaunchSpeed, rng.nextFloat())
        let angle = lerp(tuning.minLaunchAngle, tuning.maxLaunchAngle, rng.nextFloat())
        return SIMD3<Float>(cos(angle) * speed, sin(angle) * speed, 0)
    }

    /// 生成自转角速度。
    /// ⚠️ [待验证] 原版自转轴与分布未知；占位为绕 z 轴、区间均匀。
    public static func initialSpin(rng: any RandomSource,
                                   tuning: FruitMotionTuning) -> SIMD3<Float> {
        let z = lerp(tuning.minSpin, tuning.maxSpin, rng.nextFloat())
        return SIMD3<Float>(0, 0, z)
    }

    // MARK: 内部

    private static func lerp(_ a: Float, _ b: Float, _ t: Float) -> Float {
        a + (b - a) * t
    }
}