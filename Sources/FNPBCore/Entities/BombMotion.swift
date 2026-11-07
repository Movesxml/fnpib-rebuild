import Foundation
#if canImport(simd)
import simd  // 仅 Apple 平台提供；Windows 上用标准库 SIMD 类型即可
#endif
// 炸弹生成的 Mach-O 证据实现：FUN_000568f4。
// 缺省 gravity 使用 FUN_00053cb8 的原版构造值；角速度不从未知状态臆造。

extension Constants {
    public enum BombPhysics {
        public static let minimumLaunchSpeed: Float = 9.5
        public static let launchSpeedRange: Float = 1.5
        public static let horizontalAngleScale: Int32 = 10
        public static let horizontalPositionDivisor: Float = -300
        public static let verticalVelocityScale: Float = 1.075
        public static let defaultSpawnY: Float = -260
        public static let defaultSpawnZ: Float = 32
    }
}

public enum BombMotion {

    /// FUN_000568f4 的完整 Spawn 分支，与水果共享坐标和 placement 顺序。
    public static func spawnState(rng: any RandomSource,
                                  spawner: Spawner,
                                  tuning: FruitMotionTuning = FruitMotionTuning())
        -> (position: SIMD3<Float>, velocity: SIMD3<Float>, acceleration: SIMD3<Float>) {
        OriginalSpawnMotion.spawnState(rng: rng, spawner: spawner, tuning: tuning, kind: .bomb)
    }
}
