import XCTest
import simd
@testable import FNPBCore

// ============================================================================
// T-015 测试
//   1) EntityStore 生成序 / id 稳定 / clear
//   2) FruitMotion 半隐式欧拉手算用例
//
// 说明：
//   - 本卡只输出 5 个文件，FruitMotion 的手算用例因此并入本文件（同类测试场景）；
//   - 全部为同步、无并发捕获，符合 Swift 6 严格并发约束下 XCTest 的常规用法。
// ============================================================================

// MARK: - 测试用 RNG（file-private，避免与其他测试文件的替身重名）

private final class T015FixedRandom: RandomSource {
    private var value: Float

    init(_ value: Float) { self.value = value }

    func nextFloat() -> Float { value }

    func nextInt(_ upperBound: Int32) -> Int32 {
        guard upperBound > 0 else { return 0 }
        return Int32(value * Float(upperBound))
    }

    func snapshot() -> UInt64 { 0 }

    func restore(_ s: UInt64) {}
}

// MARK: - EntityStore

final class EntityStoreTests: XCTestCase {

    func testForEachPreservesSpawnOrder() {
        let store = GenerationOrderStore()
        let a = store.spawn(EntityPrototype(kind: .fruit))
        let b = store.spawn(EntityPrototype(kind: .bomb))
        let c = store.spawn(EntityPrototype(kind: .fruit))

        var seen: [EntityID] = []
        store.forEach { (entity: inout Entity) -> Bool in
            seen.append(entity.id)
            return true
        }

        XCTAssertEqual(seen, [a, b, c], "遍历顺序必须等于生成顺序")
        XCTAssertEqual(store.aliveCount, 3)
    }

    func testForEachKindFiltersInGenerationOrder() {
        let store = GenerationOrderStore()
        let a = store.spawn(EntityPrototype(kind: .fruit))
        _ = store.spawn(EntityPrototype(kind: .bomb))
        let c = store.spawn(EntityPrototype(kind: .fruit))

        var fruits: [EntityID] = []
        store.forEach(kind: .fruit) { (entity: inout Entity) -> Bool in
            fruits.append(entity.id)
            return true
        }

        XCTAssertEqual(fruits, [a, c])

        var bombs = 0
        store.forEach(kind: .bomb) { _ in
            bombs += 1
            return true
        }
        XCTAssertEqual(bombs, 1)
    }

    func testDespawnKeepsRemainingIDsStable() {
        let store = GenerationOrderStore()
        let a = store.spawn(EntityPrototype(kind: .fruit))
        let b = store.spawn(EntityPrototype(kind: .fruit))
        let c = store.spawn(EntityPrototype(kind: .fruit))

        store.despawn(b)

        XCTAssertNil(store.entity(b))
        XCTAssertEqual(store.entity(a)?.id, a)
        XCTAssertEqual(store.entity(c)?.id, c)
        XCTAssertEqual(store.aliveCount, 2)

        let d = store.spawn(EntityPrototype(kind: .fruit))
        XCTAssertGreaterThan(d.rawValue, c.rawValue, "despawn 后 id 不得复用")
        XCTAssertNotEqual(d, b)

        var seen: [EntityID] = []
        store.forEach { (entity: inout Entity) -> Bool in
            seen.append(entity.id)
            return true
        }
        XCTAssertEqual(seen, [a, c, d])
    }

    func testClearRemovesEverythingAndKeepsIDMonotonic() {
        let store = GenerationOrderStore()
        let a = store.spawn(EntityPrototype(kind: .fruit))
        _ = store.spawn(EntityPrototype(kind: .bomb))

        store.clear()

        XCTAssertEqual(store.aliveCount, 0)
        XCTAssertNil(store.entity(a))
        XCTAssertFalse(store.contains(a))

        var visited = 0
        store.forEach { _ in
            visited += 1
            return true
        }
        XCTAssertEqual(visited, 0)

        let next = store.spawn(EntityPrototype(kind: .fruit))
        XCTAssertGreaterThan(next.rawValue, a.rawValue)
    }

    func testForEachStopsWhenBodyReturnsFalse() {
        let store = GenerationOrderStore()
        _ = store.spawn(EntityPrototype(kind: .fruit))
        _ = store.spawn(EntityPrototype(kind: .fruit))
        _ = store.spawn(EntityPrototype(kind: .fruit))

        var visited = 0
        store.forEach { _ in
            visited += 1
            return visited < 2
        }
        XCTAssertEqual(visited, 2)
    }

    func testCompactionKeepsOrderAndLookup() {
        let store = GenerationOrderStore()
        var ids: [EntityID] = []
        for _ in 0..<40 {
            ids.append(store.spawn(EntityPrototype(kind: .fruit)))
        }
        for i in 0..<30 {
            store.despawn(ids[i])
        }

        XCTAssertEqual(store.aliveCount, 10)
        for i in 0..<30 {
            XCTAssertNil(store.entity(ids[i]))
        }
        for i in 30..<40 {
            XCTAssertNotNil(store.entity(ids[i]))
        }

        var seen: [EntityID] = []
        store.forEach { (entity: inout Entity) -> Bool in
            seen.append(entity.id)
            return true
        }
        XCTAssertEqual(seen, Array(ids[30...]), "压缩后生成序必须保持不变")
    }

    func testSpawnCopiesPrototypeFields() {
        let store = GenerationOrderStore()
        var transform = EntityTransform()
        transform.position = SIMD3<Float>(1, 2, 3)
        transform.velocity = SIMD3<Float>(0, 5, 0)

        var fruit = FruitInfo()
        fruit.name = "strawberry"
        fruit.typeID = 5

        let id = store.spawn(EntityPrototype(
            kind: .fruit,
            transform: transform,
            fruit: fruit,
            flags: 0x10,
            stateSlot0: 2,
            stateSlot1: 3,
            stateSlot2: 4,
            stateSlot0x32: 5,
            specialOrBombMarked: true,
            skipsNormalFruitPath: true,
            isCriticalHit: true,
            bombState: 6,
            isBombSliceEnabled: false,
            isFaultingBomb: false,
            isSpecialSliceEnabled: false
        ))
        let entity = store.entity(id)

        XCTAssertEqual(entity?.kind, .fruit)
        XCTAssertEqual(entity?.transform.position, SIMD3<Float>(1, 2, 3))
        XCTAssertEqual(entity?.transform.velocity, SIMD3<Float>(0, 5, 0))
        XCTAssertEqual(entity?.fruit?.name, "strawberry")
        XCTAssertEqual(entity?.fruit?.typeID, 5)
        XCTAssertEqual(entity?.flags, 0x10)
        XCTAssertEqual(entity?.stateSlot0, 2)
        XCTAssertEqual(entity?.stateSlot1, 3)
        XCTAssertEqual(entity?.stateSlot2, 4)
        XCTAssertEqual(entity?.stateSlot0x32, 5)
        XCTAssertEqual(entity?.specialOrBombMarked, true)
        XCTAssertEqual(entity?.skipsNormalFruitPath, true)
        XCTAssertEqual(entity?.isCriticalHit, true)
        XCTAssertEqual(entity?.bombState, 6)
        XCTAssertEqual(entity?.isBombSliceEnabled, false)
        XCTAssertEqual(entity?.isFaultingBomb, false)
        XCTAssertEqual(entity?.isSpecialSliceEnabled, false)
    }
}

// MARK: - FruitMotion

final class FruitMotionTests: XCTestCase {

    /// 手算：g = -60，dt = 1/60，初速 (3, 0, 0)，位置 (0, 10, 0)
    ///   第 1 步：v.y = 0 + (-60)/60 = -1；p = (3/60, 10 - 1/60, 0)
    ///   第 2 步：v.y = -2；p = (6/60, 10 - 3/60, 0)
    func testSemiImplicitEulerManualSteps() {
        var entity = Entity(id: EntityID(rawValue: 1), kind: .fruit)
        entity.transform.position = SIMD3<Float>(0, 10, 0)
        entity.transform.velocity = SIMD3<Float>(3, 0, 0)

        let tuning = FruitMotionTuning(gravity: -60,
                                       offscreenBottomMargin: -1000,
                                       offscreenHorizontalLimit: 1000,
                                       offscreenTopLimit: 1000)
        let dt: Float = 1.0 / 60.0

        let alive1 = FruitMotion.integrate(&entity, dt: dt, tuning: tuning)
        XCTAssertTrue(alive1)
        XCTAssertEqual(entity.transform.velocity.y, -1.0, accuracy: 1e-4)
        XCTAssertEqual(entity.transform.velocity.x, 3.0, accuracy: 1e-6)
        XCTAssertEqual(entity.transform.position.x, 3.0 * dt, accuracy: 1e-4)
        XCTAssertEqual(entity.transform.position.y, 10.0 - dt, accuracy: 1e-4)

        let alive2 = FruitMotion.integrate(&entity, dt: dt, tuning: tuning)
        XCTAssertTrue(alive2)
        XCTAssertEqual(entity.transform.velocity.y, -2.0, accuracy: 1e-4)
        XCTAssertEqual(entity.transform.position.x, 6.0 * dt, accuracy: 1e-4)
        XCTAssertEqual(entity.transform.position.y, 10.0 - 3.0 * dt, accuracy: 1e-4)
    }

    func testRotationIntegratesAngularVelocity() {
        var entity = Entity(id: EntityID(rawValue: 2), kind: .fruit)
        entity.transform.angularVelocity = SIMD3<Float>(0, 0, 1)

        let tuning = FruitMotionTuning(gravity: 0,
                                       offscreenBottomMargin: -1000,
                                       offscreenHorizontalLimit: 1000,
                                       offscreenTopLimit: 1000)

        FruitMotion.integrate(&entity, dt: 0.5, tuning: tuning)

        XCTAssertEqual(entity.transform.rotation.z, 0.5, accuracy: 1e-6)
        XCTAssertEqual(entity.transform.rotation.x, 0.0, accuracy: 1e-6)
        XCTAssertEqual(entity.transform.position, .zero)
    }

    func testOffscreenRecycling() {
        let tuning = FruitMotionTuning(gravity: -60,
                                       offscreenBottomMargin: -2.0,
                                       offscreenHorizontalLimit: 100,
                                       offscreenTopLimit: 100)

        // 1) 已经在下边界之下：dt == 0 时只做存活判定
        var below = Entity(id: EntityID(rawValue: 3), kind: .fruit)
        below.transform.position = SIMD3<Float>(0, -3, 0)
        XCTAssertFalse(FruitMotion.integrate(&below, dt: 0, tuning: tuning))

        // 2) 本步推进后越界：v.y = -61，p.y = -1.9 - 61/60 ≈ -2.9167 < -2
        var crossing = Entity(id: EntityID(rawValue: 4), kind: .fruit)
        crossing.transform.position = SIMD3<Float>(0, -1.9, 0)
        crossing.transform.velocity = SIMD3<Float>(0, -60, 0)
        XCTAssertFalse(FruitMotion.integrate(&crossing, dt: 1.0 / 60.0, tuning: tuning))

        // 3) 水平越界
        var sideways = Entity(id: EntityID(rawValue: 5), kind: .fruit)
        sideways.transform.position = SIMD3<Float>(100.5, 0, 0)
        XCTAssertFalse(FruitMotion.integrate(&sideways, dt: 0, tuning: tuning))
    }

    /// 初速注入：rng 返回 0 → 取区间下限
    func testLaunchVelocityUsesTuningBounds() {
        let tuning = FruitMotionTuning(minLaunchSpeed: 10,
                                       maxLaunchSpeed: 20,
                                       minLaunchAngle: 0,
                                       maxLaunchAngle: .pi / 2)
        let velocity = FruitMotion.launchVelocity(rng: T015FixedRandom(0), tuning: tuning)

        XCTAssertEqual(velocity.x, 10.0, accuracy: 1e-6)
        XCTAssertEqual(velocity.y, 0.0, accuracy: 1e-6)
        XCTAssertEqual(velocity.z, 0.0, accuracy: 1e-6)
    }
}