import Foundation
import simd

// T-025：WaveDirector 的生成出口。此前 spawnSink 为 nil，波次不会创建任何实体。
// 本文件只负责把波次抽取结果转换为 ECS 实体；生成位置、初速和数量上限均为
// 重建占位参数 [待验证]，不能视为已闭合的原版行为。

extension Constants {
    /// Classic 三次漏切的重建辅助规则 [待验证 原版失败条件]。
    /// 刻意不复用 GameState.missPenaltyCount（原 +0x3c）：该字段在切中分支也会 +2。
    public enum MissPenalty {
        public static let perMissedFruit: Int32 = 1
        public static let threshold: Int32 = 3
    }

    /// 临时生成几何与防爆量护栏 [待验证]。
    public enum SpawnGeometry {
        public static let horizontalSpreadHalfWidth: Float = 4.0
        /// WaveDirector 的 spawner 计时尚未闭合；真实调度接入后应移除此护栏。
        public static let maxLiveFruitCount: Int = 24
    }

    /// 内容加载前的最小占位波次 [待验证]，不是原版 XML 数据。
    public enum PlaceholderWave {
        public static let minWait: Float = 0.5
        public static let maxWait: Float = 1.5
        public static let fruitKind: Int32 = Constants.EntityKindValue.fruit
        public static let chance: Int32 = Constants.FruitDefaults.spawnChance
    }
}

/// 将 WaveDirector 的抽取结果写入与 GameWorld 共用的实体容器。
/// 非 Sendable：与逻辑层一样，由 MainActor 独占驱动。
public final class WaveSpawnBridge: WaveSpawnSink {
    private let store: any EntityStore
    private let rng: any RandomSource
    public var tuning: FruitMotionTuning

    /// store 在构造期固定；调用方重开局必须 clear() 原实例，不能换容器实例。
    public init(store: any EntityStore,
                rng: any RandomSource,
                tuning: FruitMotionTuning = FruitMotionTuning()) {
        self.store = store
        self.rng = rng
        self.tuning = tuning
    }

    public func spawnFruit(kind: Int32, from spawner: Spawner, wave: WaveInfo) {
        // spawner 的生成位置/散布字段尚未闭合 [待验证]。
        _ = spawner
        _ = wave
        guard store.aliveCount < Constants.SpawnGeometry.maxLiveFruitCount else { return }
        store.spawn(makePrototype(kind: .fruit, typeID: kind))
    }

    /// 占位：原 FUN_000568f4 的语义疑为触发爆炸而非生成炸弹 [待验证]。
    public func triggerExplosion(from spawner: Spawner, wave: WaveInfo) {
        _ = spawner
        _ = wave
        guard store.aliveCount < Constants.SpawnGeometry.maxLiveFruitCount else { return }
        store.spawn(makePrototype(kind: .bomb, typeID: Constants.EntityKindValue.bomb))
    }

    private func makePrototype(kind: EntityKind, typeID: Int32) -> EntityPrototype {
        var fruit = FruitInfo()
        fruit.typeID = typeID
        // score 等其余字段由真实 fruitList 内容加载任务回填。

        let halfWidth = Constants.SpawnGeometry.horizontalSpreadHalfWidth
        let spawnX = -halfWidth + (2 * halfWidth) * rng.nextFloat()
        let position = SIMD3<Float>(spawnX, tuning.offscreenBottomMargin, 0)
        let velocity = FruitMotion.launchVelocity(rng: rng, tuning: tuning)
        let spin = FruitMotion.initialSpin(rng: rng, tuning: tuning)
        let transform = EntityTransform(position: position,
                                        velocity: velocity,
                                        rotation: .zero,
                                        angularVelocity: spin,
                                        scale: fruit.scale,
                                        radius: fruit.collision)
        return EntityPrototype(kind: kind, transform: transform, fruit: fruit)
    }
}
