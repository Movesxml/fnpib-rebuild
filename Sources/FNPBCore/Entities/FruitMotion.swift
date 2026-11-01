import Foundation
import simd

// T-035：普通水果生成、积分与出界的 Mach-O 证据实现。
// 生成：FUN_00057000；积分：FUN_0000c1c0；普通出界：FUN_0000f6dc。
// 不包含特殊 placement、切片后的实体、爆炸后续或其他实体状态机。

extension Constants {
    public enum Physics {
        public static let horizontalRandomScale: Float = 150
        public static let minimumLaunchSpeed: Float = 9.5
        public static let launchSpeedRange: Float = 1.5
        public static let directionAngleScale: Float = 20
        public static let verticalVelocityScale: Float = 1.075
        public static let defaultSpawnY: Float = -215
        public static let constructedAccelerationY: Float = -12

        /// 原 Spawner 构造器不写 gravity X/Y，真实内容也未提供 gravity。
        /// 这只是确定性的重建兼容策略，不是原版缺省值；不得据此宣称官方行为已闭合。
        public static let missingGravityCompatibility = SIMD3<Float>(0, 1, 0)
    }
}

/// 出界计算只需要原 FUN_00025164 所使用的实际视口宽高比。
public struct FruitMotionTuning: Sendable, Equatable {
    public var actualSize: SIMD2<Float>

    /// 无 UI 的单元测试使用 320:480；App 每帧写入真实逻辑视口尺寸。
    public init(actualSize: SIMD2<Float> = SIMD2<Float>(320, 480)) {
        self.actualSize = actualSize
    }

    public var logicalWidth: Float {
        guard actualSize.x > 0, actualSize.y > 0,
              actualSize.x.isFinite, actualSize.y.isFinite else {
            return 320 * (320.0 / 480.0)
        }
        return 320 * actualSize.x / actualSize.y
    }
}

public enum FruitMotion {

    /// ARM `vcvt.u32.f32`：向零取整；负数/NaN 为 0，超上界饱和到 UInt32.max。
    /// 不能用 Swift 的普通 UInt32 转换代替，否则负横向随机会触发运行时陷阱。
    public static func armUnsignedSaturate(_ value: Float) -> UInt32 {
        if value.isNaN || value <= 0 { return 0 }
        if value >= Float(UInt32.max) { return UInt32.max }
        return UInt32(value.rounded(.towardZero))
    }

    /// 普通默认 Spawn 的三次核心 RNG 顺序：横向、速度、方向。
    /// 显式 velX/velY 非零时按原分支跳过第三次方向随机。
    public static func spawnState(rng: any RandomSource, spawner: Spawner)
        -> (position: SIMD3<Float>, velocity: SIMD3<Float>, acceleration: SIMD3<Float>) {
        let horizontal = (-1 + 2 * rng.nextFloat()) * Constants.Physics.horizontalRandomScale
        let x = Float(armUnsignedSaturate(horizontal))
        let speed = Constants.Physics.minimumLaunchSpeed
            + Constants.Physics.launchSpeedRange * rng.nextFloat()

        let velocity: SIMD3<Float>
        if spawner.velocityX != 0 || spawner.velocityY != 0 {
            velocity = SIMD3<Float>(spawner.velocityX * spawner.velocityScaleX,
                                    spawner.velocityY * spawner.velocityScaleY,
                                    0)
        } else {
            let direction = rng.nextFloat() - 0.5
            let curve = 0.5 - 2 * pow(0.5 - abs(direction), 2)
            let signedAngle = (direction < 0 ? -1 : 1) as Float
            let angle = -0.5 * x
                + signedAngle * Constants.Physics.directionAngleScale * curve
            // 原机器码先把角度向零截断为整数，再乘 182 查 sin/cos 表。
            let quantizedDegrees = Int32(angle.rounded(.towardZero))
            let radians = Float(quantizedDegrees) * Float.pi / 180
            velocity = SIMD3<Float>(speed * sin(radians) * spawner.velocityScaleX,
                                    speed * cos(radians) * Constants.Physics.verticalVelocityScale
                                        * spawner.velocityScaleY,
                                    0)
        }

        // 原式 acceleration = -(-12) * gravity。缺省 gravity 的兼容策略单列，
        // 真实 XML 中显式 gravity 则严格使用解析值。
        let gravity = spawner.gravity ?? Constants.Physics.missingGravityCompatibility
        let acceleration = -Constants.Physics.constructedAccelerationY * gravity
        return (SIMD3<Float>(x, Constants.Physics.defaultSpawnY, 0), velocity, acceleration)
    }

    /// FUN_0000c1c0 的普通积分顺序，不是旧实现的半隐式欧拉。
    /// h = dt/60；先求 newVelocity，再以旧速度、加速度和newVelocity共同更新位置。
    @discardableResult
    public static func integrate(_ entity: inout Entity,
                                 dt: Float,
                                 tuning: FruitMotionTuning) -> Bool {
        guard dt > 0 else { return isAlive(entity, tuning: tuning) }
        let h = dt / 60
        let oldVelocity = entity.transform.velocity
        let acceleration = entity.transform.acceleration
        let newVelocity = oldVelocity + acceleration * h
        entity.transform.velocity = newVelocity
        entity.transform.position += 60 * (oldVelocity * h + 0.5 * acceleration * h * h)
            + newVelocity * h
        entity.transform.rotation += entity.transform.angularVelocity * dt
        return isAlive(entity, tuning: tuning)
    }

    /// FUN_0000f6dc 的普通实体分支：边距随 FruitInfo.scale 变化，且越界方向
    /// 必须与速度一致。零加速度向量允许四个方向检查，不是统一固定矩形回收。
    public static func isAlive(_ entity: Entity, tuning: FruitMotionTuning) -> Bool {
        let p = entity.transform.position
        let v = entity.transform.velocity
        let a = entity.transform.acceleration
        let zeroAcceleration = a == .zero
        let margin = entity.transform.scale * 0.01 * 50
        let horizontalLimit = tuning.logicalWidth * 0.5 + margin
        let verticalLimit = 160 + margin

        if (a.y < 0 || zeroAcceleration), p.y <= -verticalLimit, v.y < 0 { return false }
        if (a.y > 0 || zeroAcceleration), p.y >= verticalLimit, v.y > 0 { return false }
        if (a.x < 0 || zeroAcceleration), p.x <= -horizontalLimit, v.x < 0 { return false }
        if (a.x > 0 || zeroAcceleration), p.x >= horizontalLimit, v.x > 0 { return false }
        return true
    }
}
