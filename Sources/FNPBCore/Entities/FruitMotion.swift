import Foundation
import simd

// T-035：普通水果生成、积分与出界的 Mach-O 证据实现。
// 生成：FUN_00057000；积分：FUN_0000c1c0；普通出界：FUN_0000f6dc。
// 不包含切片后的实体、爆炸后续或其他实体状态机。

extension Constants {
    public enum Physics {
        public static let horizontalRandomScale: Float = 150
        public static let minimumLaunchSpeed: Float = 9.5
        public static let launchSpeedRange: Float = 1.5
        public static let directionAngleScale: Float = 20
        public static let verticalVelocityScale: Float = 1.075
        public static let defaultSpawnY: Float = -215
        public static let constructedAccelerationY: Float = -12

        /// FUN_00053cb8 在 Spawn 数组的 8 字节头之后构造 Spawner：
        /// 原始分配 +0x28/+0x2c/+0x30 对应元素 +0x20/+0x24/+0x28，写入 0/-1/0。
        /// FUN_000537ec 仅在 XML 存在非空 gravity 时覆盖这三个字段。
        public static let defaultGravity = SIMD3<Float>(0, -1, 0)
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

    /// FUN_00057000 的完整 Spawn 分支；缺省 gravity 来自 FUN_00053cb8 的原版构造器。
    public static func spawnState(rng: any RandomSource,
                                  spawner: Spawner,
                                  tuning: FruitMotionTuning = FruitMotionTuning())
        -> (position: SIMD3<Float>, velocity: SIMD3<Float>, acceleration: SIMD3<Float>) {
        OriginalSpawnMotion.spawnState(rng: rng, spawner: spawner, tuning: tuning, kind: .fruit)
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
