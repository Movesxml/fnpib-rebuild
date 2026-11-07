import Foundation
#if canImport(simd)
import simd  // 仅 Apple 平台提供；Windows 上用标准库 SIMD 类型即可
#endif
// WaveDirector 的真实内容生成出口。
// 普通水果与炸弹分别由 FUN_00057000、FUN_000568f4 驱动，不消费随机自旋。
// 缺省 gravity 使用 FUN_00053cb8 的原版构造值 (0,-1,0)。

extension Constants {
    /// Classic 控制器 +0x14 每次合格漏切 +1，状态 1 在计数 >2 时结束。[macho H]
    /// 不复用 GameState.missPenaltyCount（原 game +0x3c）：该字段在切中分支也会 +2。
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
        let state = FruitMotion.spawnState(rng: rng, spawner: spawner, tuning: tuning)
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
        _ = wave
        var info = FruitInfo()
        info.name = "bomb"
        info.typeID = Constants.EntityKindValue.bomb
        info.bomb = bomb
        info.scale = bomb.size
        info.collision = bomb.collision
        let state = BombMotion.spawnState(rng: rng, spawner: spawner, tuning: tuning)
        let transform = EntityTransform(position: state.position,
                                        velocity: state.velocity,
                                        acceleration: state.acceleration,
                                        rotation: .zero,
                                        angularVelocity: .zero,
                                        scale: info.scale,
                                        radius: info.collision)
        store.spawn(EntityPrototype(kind: .bomb, transform: transform, fruit: info))
    }
}
