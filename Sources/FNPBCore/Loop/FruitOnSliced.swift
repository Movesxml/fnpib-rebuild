import Foundation

/// 发售版水果 `vtable+0x24`（Mach-O `FUN_00010bec`）的计分/统计子链。
///
/// 已直接对齐的路径：普通分取 `FruitInfo.score`（原 +0x314），暴击加全局
/// `critical.score`，杨桃跳过普通计分调用，`noScore` 水果不进入该计分支。
/// 本类型不负责猜测暴击概率、模式委托、碎块或特效；实体 +0x1ba 由上游
/// 暴击判定写入，本类型只消费该真实状态。
public struct FruitOnSliced: Sendable {
    /// 原 `DAT_0052bf64`，由 fruitList.xml 的 `critical/score` 注入。
    private let criticalScore: Int32?
    /// 原主循环 `PTR_DAT_004d90b4 -> DAT_005d4cd0`：水果类型总数。
    private let specialSliceBonus: Int32
    /// 原 `FUN_0000aae0("starfruit")`；没有该水果时 nil 不会匹配任何有效类型。
    private let starfruitTypeID: Int32?

    public init(critical: CriticalConfig? = nil,
                fruitTypeCount: Int = 0,
                starfruitTypeID: Int32? = nil) {
        criticalScore = critical?.score
        specialSliceBonus = Int32(clamping: fruitTypeCount)
        self.starfruitTypeID = starfruitTypeID
    }

    /// 主循环顺序：先执行实体 OnSliced，再处理实体 +0x1ba 对 game 的修正。
    /// 单果计分独立于 combo 是否递增；stateSlot0==2 或重复实体也不能漏掉本次得分。
    func apply(entity: inout Entity, state: inout GameState, services: GameServices) {
        guard let fruit = entity.fruit else { return }
        // 原水果 +0x1bc 在 OnSliced 完成后置位；noScore 早退也不能漏掉该状态。
        defer { entity.hasBeenSliced = true }

        // 标准路径中 noScore 会使 OnSliced 清 +0x1ba 并跳过计分/水果统计。
        if fruit.noScore {
            entity.isCriticalHit = false
            return
        }

        var points = fruit.score
        if entity.isCriticalHit, let criticalScore {
            points = points &+ criticalScore
        }

        // Mach-O FUN_00010bec: 非 starfruit 才调用 FUN_0001cb08(score, ..., 1, 0)。
        if starfruitTypeID != fruit.typeID {
            services.score.dispatch(score: points,
                                    comboType: 0,
                                    isScoring: true,
                                    mode: 0)
        }
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
}
