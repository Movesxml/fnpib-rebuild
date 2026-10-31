import Foundation
import simd

// T-030：WaveDirector 的真实内容生成出口。
// 水果元数据与炸弹尺寸来自 OriginalContentLoader；未知 typeID 不生成、不以水果 0 兜底。
// [待验证] 位置、初速、自旋与重力仍是 T-025 的重建参数，本卡不做猜测性改动。

extension Constants {
    /// Classic 三次漏切的重建辅助规则 [待验证 原版失败条件]。
    /// 刻意不复用 GameState.missPenaltyCount（原 +0x3c）：该字段在切中分支也会 +2。
    public enum MissPenalty {
        public static let perMissedFruit: Int32 = 1
        public static let threshold: Int32 = 3
    }

    public enum SpawnGeometry {
        /// 生成点横向散布半宽 [待验证]；真实 spawner 几何尚未闭合。
        public static let horizontalSpreadHalfWidth: Float = 4.0
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
        _ = spawner  // [待验证] 原版的生成位置 / 散布字段尚未接入。
        _ = wave
        guard let info = fruitByTypeID[kind] else { return }
        store.spawn(makePrototype(kind: .fruit, fruit: info))
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
        store.spawn(makePrototype(kind: .bomb, fruit: info))
    }

    private func makePrototype(kind: EntityKind, fruit info: FruitInfo) -> EntityPrototype {
        // [待验证] 以下位置、初速和自旋仍是重建参数，不宣称与原版一致。
        let halfWidth = Constants.SpawnGeometry.horizontalSpreadHalfWidth
        let spawnX = -halfWidth + (2 * halfWidth) * rng.nextFloat()
        let position = SIMD3<Float>(spawnX, tuning.offscreenBottomMargin, 0)
        let velocity = FruitMotion.launchVelocity(rng: rng, tuning: tuning)
        let spin = FruitMotion.initialSpin(rng: rng, tuning: tuning)
        let transform = EntityTransform(position: position,
                                        velocity: velocity,
                                        rotation: .zero,
                                        angularVelocity: spin,
                                        scale: info.scale,
                                        radius: info.collision)
        return EntityPrototype(kind: kind, transform: transform, fruit: info)
    }
}