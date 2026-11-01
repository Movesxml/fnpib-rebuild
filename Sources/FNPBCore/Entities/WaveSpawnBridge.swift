import Foundation
import simd

// T-035：WaveDirector 的真实内容生成出口。
// 普通默认水果的位置、初速、加速度由 FUN_00057000 驱动，不再消费随机自旋。
// 特殊 placement 与炸弹 FUN_000568f4 的生成差异不在本卡扩张范围内。

extension Constants {
    /// Classic 三次漏切的重建辅助规则 [待验证 原版失败条件]。
    /// 刻意不复用 GameState.missPenaltyCount（原 +0x3c）：该字段在切中分支也会 +2。
    public enum MissPenalty {
        public static let perMissedFruit: Int32 = 1
        public static let threshold: Int32 = 3
    }
}

/// 将 WaveDirector 的抽取结果写入与 GameWorld 共用的实体容器。
/// 非 Sendable：与逻辑层一样，由 MainActor 独占驱动。
public final class WaveSpawnBridge: WaveSpawnSink {
    private let store: any EntityStore
    private let rng: any RandomSource
    private let fruitByTypeID: [Int32: FruitInfo]
    private let bomb: BombInfo
    public var tuning: FruitMotionTuning

    /// store 在构造期固定；重开局必须 clear() 原实例，不能换容器实例。
    public init(store: any EntityStore,
                rng: any RandomSource,
                fruits: [FruitInfo],
                bomb: BombInfo,
                tuning: FruitMotionTuning = FruitMotionTuning()) {
        self.store = store
        self.rng = rng
        self.bomb = bomb
        self.tuning = tuning

        var index: [Int32: FruitInfo] = [:]
        index.reserveCapacity(fruits.count)
        for fruit in fruits where index[fruit.typeID] == nil {
            index[fruit.typeID] = fruit
        }
        self.fruitByTypeID = index
    }

    public func spawnFruit(kind: Int32, from spawner: Spawner, wave: WaveInfo) {
        _ = wave
        guard let info = fruitByTypeID[kind] else { return }
        let state = FruitMotion.spawnState(rng: rng, spawner: spawner)
        let transform = EntityTransform(position: state.position,
                                        velocity: state.velocity,
                                        acceleration: state.acceleration,
                                        rotation: .zero,
                                        angularVelocity: .zero,
                                        scale: info.scale,
                                        radius: info.collision)
        store.spawn(EntityPrototype(kind: .fruit, transform: transform, fruit: info))
    }

    /// 对应 FUN_000568f4：只创建炸弹实体，不触发爆炸结算。
    public func spawnBomb(from spawner: Spawner, wave: WaveInfo) {
        _ = spawner
        _ = wave
        var info = FruitInfo()
        info.name = "bomb"
        info.typeID = Constants.EntityKindValue.bomb
        info.bomb = bomb
        info.scale = bomb.size
        info.collision = bomb.collision
        store.spawn(makeLegacyBombPrototype(fruit: info))
    }

    /// [兼容占位，官方生成未闭合]
    /// 保留 T-025 炸弹生成参数，严禁把 FUN_00057000 的水果角度算法套到
    /// FUN_000568f4。炸弹仍使用独立运动公式前，这些值不代表官方行为。
    private func makeLegacyBombPrototype(fruit info: FruitInfo) -> EntityPrototype {
        let spawnX = -4 + 8 * rng.nextFloat()
        let speed = 14 + 8 * rng.nextFloat()
        let degrees = 60 + 60 * rng.nextFloat()
        let radians = degrees * Float.pi / 180
        let spin = -4 + 8 * rng.nextFloat()
        let transform = EntityTransform(
            position: SIMD3<Float>(spawnX, -2, 0),
            velocity: SIMD3<Float>(speed * cos(radians), speed * sin(radians), 0),
            acceleration: SIMD3<Float>(0, -9.8, 0),
            rotation: .zero,
            angularVelocity: SIMD3<Float>(0, 0, spin),
            scale: info.scale,
            radius: info.collision)
        return EntityPrototype(kind: .bomb, transform: transform, fruit: info)
    }
}
