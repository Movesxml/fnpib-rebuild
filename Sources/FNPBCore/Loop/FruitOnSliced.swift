import Foundation

/// 发售版水果 `vtable+0x24`（Mach-O `FUN_00010bec`）的计分/统计子链。
///
/// 已直接对齐的路径：暴击资格、动态整数分母、波次概率、普通分与暴击加分、
/// 杨桃跳过普通计分调用、`noScore` 水果不进入该计分支。
/// 原全局 +0x40 是本局整数槽，不是 GameState.hitPointCache，也不写回存档。
public final class FruitOnSliced {
    /// 原 `DAT_0052bf64`。
    private let criticalScore: Int32
    /// 原 `DAT_0052bf68`。
    private let criticalChance: Int32
    /// 原 `DAT_0052bf6c`。
    private let criticalChanceInc: Int32
    /// 原主循环 `PTR_DAT_004d90b4 -> DAT_005d4cd0`：水果类型总数。
    private let specialSliceBonus: Int32
    /// 原 `FUN_0000aae0("starfruit")`；没有该水果时 nil 不会匹配任何有效类型。
    private let starfruitTypeID: Int32?

    private var denominator: Int32 = 70
    private var isClassicMode = true

    public init(critical: CriticalConfig? = nil,
                fruitTypeCount: Int = 0,
                starfruitTypeID: Int32? = nil) {
        let defaults = CriticalConfig()
        criticalScore = critical?.score ?? defaults.score ?? 5
        criticalChance = critical?.chance ?? defaults.chance ?? 5
        criticalChanceInc = critical?.chanceInc ?? defaults.chanceInc ?? 30
        specialSliceBonus = Int32(clamping: fruitTypeCount)
        self.starfruitTypeID = starfruitTypeID
    }

    /// FUN_0002504c 每局从存档 +0x100 重读初值；动态变化仅保留到本局结束。
    func reset(isClassicMode: Bool, initialChance: Int32 = 70) {
        self.isClassicMode = isClassicMode
        denominator = initialChance
    }

    /// 主循环顺序：先执行实体 OnSliced，再处理实体 +0x1ba 对 game 的修正。
    /// 单果计分独立于 combo 是否递增；stateSlot0==2 或重复实体也不能漏掉本次得分。
    func apply(entity: inout Entity, state: inout GameState, services: GameServices,
               explosionTimeRemaining: Float = 0) {
        guard let fruit = entity.fruit else { return }
        // 原水果 +0x1bc 在 OnSliced 完成后置位；noScore 早退也不能漏掉该状态。
        defer { entity.hasBeenSliced = true }

        // 标准路径中 noScore 会使 OnSliced 清 +0x1ba 并跳过计分/水果统计。
        if fruit.noScore {
            entity.isCriticalHit = false
            return
        }

        resolveCritical(fruit: fruit, entity: &entity, services: services,
                        explosionTimeRemaining: explosionTimeRemaining)

        var points = fruit.score
        if entity.isCriticalHit {
            points = points &+ criticalScore
        }

        // Mach-O FUN_00010bec: 非 starfruit 才调用 FUN_0001cb08(score, ..., 1, 0)。
        if starfruitTypeID != fruit.typeID {
            services.score.dispatch(score: points,
                                    comboType: 0,
                                    isScoring: true,
                                    mode: 0)
        }
        // FUN_00010bec 在 totalfruit 之前按水果名上报；bean_game_consecutive_total
        // 随后读取的正是这份计数，不能另建一份经典模式私有计数。
        services.stats.report(fruit.name, 1)
        services.stats.add(.totalfruit, 1)

        if entity.isCriticalHit {
            services.stats.report("crit", 1)
            services.stats.report("crits_total", 1)
            services.stats.report("\(fruit.name)crit", 1)
        }

        // 回到 FUN_00016214：OnSliced 返回后才检查实体 +0x1ba。
        // +0x110 初值是水果 typeID；这里按原指针目标加水果类型总数。
        if entity.isCriticalHit {
            state.lastSliceScore = state.lastSliceScore &+ specialSliceBonus
            let random = services.rng.nextFloat()
            let term = 0.5 * random / Constants.Combo.randomDivisor + Constants.Combo.randomBase
            state.rhythmFactor += Constants.Combo.rhythmPenalty * term
        }
    }

    /// FUN_00010bec：具备资格的每次真实切割先递减分母，再消费当前波概率。
    private func resolveCritical(fruit: FruitInfo, entity: inout Entity,
                                 services: GameServices, explosionTimeRemaining: Float) {
        guard isClassicMode,
              services.score.total >= 2,
              !fruit.noCritical,
              explosionTimeRemaining <= 0 else {
            entity.isCriticalHit = false
            return
        }

        denominator = max(denominator - 1, 2)
        let waveChance = (services.waves as? any CriticalChanceProviding)?
            .criticalChanceForSlice ?? 1
        guard waveChance > 0 else {
            entity.isCriticalHit = false
            return
        }

        let boundFloat = Float(min(denominator, criticalChance)) / waveChance
        let bound: Int32
        if boundFloat <= 1 {
            bound = 1
        } else if boundFloat >= Float(Int32.max) {
            bound = .max
        } else {
            bound = Int32(boundFloat.rounded(.towardZero))
        }
        entity.isCriticalHit = services.rng.nextInt(bound) == 0

        // bean 最后无条件清暴击；也不能触发暴击后的分母重置。
        if fruit.name == "bean" {
            entity.isCriticalHit = false
        }
        if entity.isCriticalHit {
            denominator = criticalChance &+ criticalChanceInc
        }
    }
}
