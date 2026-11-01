import Foundation

// ============================================================================
// EntityStore — ECS 容器协议与生成序实现（T-015，蓝图 §3 S2）
//
// 顺序约束（不可违反）：
//   原主循环按「生成顺序」遍历实体（引擎迭代器 0x065c4/0x06ad0/0x06af0 的单向链表语义），
//   因此任何实现都必须提供**确定性的生成序遍历**。
//   ⚠️ 禁止用 Dictionary 直接遍历实现 forEach —— Swift Dictionary 无序，
//      会破坏 combo 计数、特效触发顺序与回放一致性。
//
// 遍历语义：
//   - `forEach(_:)`：按生成序遍历全部存活实体；body 返回 false 立即终止。
//   - `forEach(kind:_:)`：同一生成序中筛选指定 kind 的子序列（等价于原主循环
//     循环 A/B/C 各自按 type 过滤），默认实现为 O(n) 过滤，实体数在数量级 10~100，
//     暂不做按 kind 分桶（分桶会引入额外的顺序维护成本）。
// ============================================================================

// MARK: - 协议

public protocol EntityStore: AnyObject {

    /// 生成实体并返回其 id。id 单调递增、despawn 后不复用。
    @discardableResult
    func spawn(_ prototype: EntityPrototype) -> EntityID

    /// 回收实体。对不存在/已回收的 id 为空操作。
    func despawn(_ id: EntityID)

    /// 查询实体快照（值拷贝）。不存在或已回收返回 nil。
    func entity(_ id: EntityID) -> Entity?

    /// 按生成序遍历所有存活实体。
    /// - Parameter body: 返回 false 终止遍历；对实体字段的修改在遍历结束前写回。
    func forEach(_ body: (inout Entity) -> Bool)

    /// 按生成序遍历指定 kind 的存活实体（原主循环循环 A/B/C 的筛选语义）。
    func forEach(kind: EntityKind, _ body: (inout Entity) -> Bool)

    /// 存活实体数。
    var aliveCount: Int { get }

    /// 清空所有实体（不移位、不重置 id 分配器）。
    func clear()
}

public extension EntityStore {

    func contains(_ id: EntityID) -> Bool { entity(id) != nil }

    func forEach(kind: EntityKind, _ body: (inout Entity) -> Bool) {
        forEach { (entity: inout Entity) -> Bool in
            guard entity.kind == kind else { return true }
            return body(&entity)
        }
    }
}

// MARK: - 生成序实现

/// 数组槽位 + id 索引的确定性实体容器。
///
/// 实现要点：
/// 1. 存储主结构是 `slots` 数组，**数组下标顺序 = 生成顺序**；
/// 2. `indexByID` 只用于 O(1) 定位，**从不用于遍历**；
/// 3. despawn 打墓碑（`isAlive = false`），不搬移其他元素 → 存活实体的相对顺序恒定；
/// 4. 墓碑累积到阈值后压缩一次，压缩保留相对顺序并重建索引，id 不变；
/// 5. `nextRawValue` 单调递增且跳过 0，clear 后也不回收已用 id（保证测试/回放的
///    「id 稳定」语义）。
public final class GenerationOrderStore: EntityStore {

    private struct Slot {
        var entity: Entity
        var isAlive: Bool = true
    }

    /// 墓碑压缩阈值：dead 数达到该值且占比过半时压缩。
    /// 取 16 是「实体数 10~100」量级下的经验值，仅影响内存与遍历常数，不影响语义。
    private static let compactionDeadThreshold = 16

    private var slots: [Slot] = []
    private var indexByID: [EntityID: Int] = [:]
    private var nextRawValue: UInt32 = 1
    private var deadCount = 0

    public init() {}

    public var aliveCount: Int { slots.count - deadCount }

    // MARK: spawn / despawn

    @discardableResult
    public func spawn(_ prototype: EntityPrototype) -> EntityID {
        let id = EntityID(rawValue: nextRawValue)
        advanceRawValue()

        var entity = Entity(id: id, kind: prototype.kind)
        entity.transform = prototype.transform
        entity.fruit = prototype.fruit
        entity.flags = prototype.flags
        entity.stateSlot0 = prototype.stateSlot0
        entity.stateSlot1 = prototype.stateSlot1
        entity.stateSlot2 = prototype.stateSlot2
        entity.stateSlot0x32 = prototype.stateSlot0x32
        entity.isMarked = prototype.isMarked
        entity.isVisible = prototype.isVisible
        entity.fallDelay = prototype.fallDelay
        entity.dropState = prototype.dropState
        entity.specialOrBombMarked = prototype.specialOrBombMarked
        entity.bombState = prototype.bombState
        entity.isBombSliceEnabled = prototype.isBombSliceEnabled
        entity.isFaultingBomb = prototype.isFaultingBomb
        entity.isSpecialSliceEnabled = prototype.isSpecialSliceEnabled

        slots.append(Slot(entity: entity))
        indexByID[id] = slots.count - 1
        return id
    }

    public func despawn(_ id: EntityID) {
        guard let index = indexByID.removeValue(forKey: id), slots[index].isAlive else { return }
        slots[index].isAlive = false
        deadCount += 1
        compactIfNeeded()
    }

    // MARK: 查询

    public func entity(_ id: EntityID) -> Entity? {
        guard let index = indexByID[id], slots[index].isAlive else { return nil }
        return slots[index].entity
    }

    // MARK: 遍历

    public func forEach(_ body: (inout Entity) -> Bool) {
        // 先取 id 快照：body 内部允许 spawn/despawn（不改变已生成实体的相对顺序），
        // 用 id 重查槽位可避免压缩导致的下标错位。
        let snapshotIDs: [EntityID] = slots.compactMap { $0.isAlive ? $0.entity.id : nil }

        for id in snapshotIDs {
            guard let index = indexByID[id], slots[index].isAlive else { continue }

            var snapshot = slots[index].entity
            let shouldContinue = body(&snapshot)

            // 写回前重新定位：body 可能触发了压缩。
            if let currentIndex = indexByID[id],
               slots[currentIndex].isAlive,
               slots[currentIndex].entity.id == id {
                slots[currentIndex].entity = snapshot
            }

            if !shouldContinue { return }
        }
    }

    // MARK: clear

    public func clear() {
        slots.removeAll(keepingCapacity: false)
        indexByID.removeAll(keepingCapacity: false)
        deadCount = 0
        // nextRawValue 故意不重置：已分配 id 永不复用。
    }

    // MARK: 内部

    private func advanceRawValue() {
        if nextRawValue == UInt32.max {
            nextRawValue = 1    // 回绕并跳过 0（0 = invalid）
        } else {
            nextRawValue += 1
        }
    }

    private func compactIfNeeded() {
        guard deadCount >= Self.compactionDeadThreshold,
              deadCount * 2 >= slots.count else { return }
        slots.removeAll { !$0.isAlive }
        deadCount = 0
        rebuildIndex()
    }

    private func rebuildIndex() {
        indexByID.removeAll(keepingCapacity: true)
        for (index, slot) in slots.enumerated() where slot.isAlive {
            indexByID[slot.entity.id] = index
        }
    }
}