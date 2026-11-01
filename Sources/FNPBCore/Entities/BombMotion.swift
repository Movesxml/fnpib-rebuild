import Foundation
import simd

// 炸弹生成的 Mach-O 证据实现：FUN_000568f4。
// 不包含特殊 placement；角速度与缺省 gravity 不从未知内存状态中臆造。

extension Constants {
    public enum BombPhysics {
        public static let minimumLaunchSpeed: Float = 9.5
        public static let launchSpeedRange: Float = 1.5
        public static let horizontalAngleScale: Float = 20
        public static let horizontalPositionDivisor: Float = -300
        public static let minimumDirectionDegrees: Int32 = -20
        public static let directionDegreeRange: Float = 40
        public static let verticalVelocityScale: Float = 1.075
        public static let defaultSpawnY: Float = -160
        public static let defaultSpawnZ: Float = 32
    }
}

public enum BombMotion {

    /// 普通炸弹生成的三次核心 RNG：横向、速度、方向。
    /// 与水果不同，方向角由位置修正、-20° 偏置和 40° 整数随机范围组成。
    public static func spawnState(rng: any RandomSource, spawner: Spawner)
        -> (position: SIMD3<Float>, velocity: SIMD3<Float>, acceleration: SIMD3<Float>) {
        let horizontal = (-1 + 2 * rng.nextFloat()) * Constants.Physics.horizontalRandomScale
        let x = Float(FruitMotion.armUnsignedSaturate(horizontal))
        let speed = Constants.BombPhysics.minimumLaunchSpeed
            + Constants.BombPhysics.launchSpeedRange * rng.nextFloat()

        let velocity: SIMD3<Float>
        if spawner.velocityX != 0 || spawner.velocityY != 0 {
            velocity = SIMD3<Float>(spawner.velocityX * spawner.velocityScaleX,
                                    spawner.velocityY * spawner.velocityScaleY,
                                    0)
        } else {
            // 原函数先把 20*x/(-300) 向零截断，再加上 -20+floor(40*rng)。
            let positionAdjustment = Int32((Constants.BombPhysics.horizontalAngleScale * x
                / Constants.BombPhysics.horizontalPositionDivisor).rounded(.towardZero))
            let randomDegrees = Int32((Constants.BombPhysics.directionDegreeRange
                * rng.nextFloat()).rounded(.down))
            let degrees = positionAdjustment + Constants.BombPhysics.minimumDirectionDegrees
                + randomDegrees
            let radians = Float(degrees) * Float.pi / 180
            velocity = SIMD3<Float>(speed * sin(radians) * spawner.velocityScaleX,
                                    speed * cos(radians) * Constants.BombPhysics.verticalVelocityScale
                                        * spawner.velocityScaleY,
                                    0)
        }

        // 与水果构造器相同：acceleration = -(-12) * gravity。
        let gravity = spawner.gravity ?? Constants.Physics.missingGravityCompatibility
        let acceleration = -Constants.Physics.constructedAccelerationY * gravity
        return (SIMD3<Float>(x, Constants.BombPhysics.defaultSpawnY,
                             Constants.BombPhysics.defaultSpawnZ), velocity, acceleration)
    }
}
