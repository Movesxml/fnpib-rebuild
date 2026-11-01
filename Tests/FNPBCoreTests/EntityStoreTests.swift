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

    /// h=dt/60=1/3600，p=(0,10,0)，v=(3,0,0)，a=(0,-60,0)。
    /// 第 1 步 v.y=-1/60，p.x=183h，p.y=10-1800h²-h/60。
    /// 第 2 步 v.y=-1/30，y 增量=-(31/30)h-1800h²。
    func testMachOIntegrationManualSteps() {
        var entity = Entity(id: EntityID(rawValue: 1), kind: .fruit)
        entity.transform.position = SIMD3<Float>(0, 10, 0)
        entity.transform.velocity = SIMD3<Float>(3, 0, 0)
        entity.transform.acceleration = SIMD3<Float>(0, -60, 0)

        let tuning = FruitMotionTuning()
        let dt: Float = 1.0 / 60.0
        let h = dt / 60

        XCTAssertTrue(FruitMotion.integrate(&entity, dt: dt, tuning: tuning))
        XCTAssertEqual(entity.transform.velocity.x, 3, accuracy: 1e-6)
        XCTAssertEqual(entity.transform.velocity.y, -1.0 / 60.0, accuracy: 1e-6)
        XCTAssertEqual(entity.transform.position.x, 183 * h, accuracy: 1e-6)
        XCTAssertEqual(entity.transform.position.y,
                       10 - 1800 * h * h - h / 60, accuracy: 1e-6)

        let firstY = entity.transform.position.y
        XCTAssertTrue(FruitMotion.integrate(&entity, dt: dt, tuning: tuning))
        XCTAssertEqual(entity.transform.velocity.y, -1.0 / 30.0, accuracy: 1e-6)
        XCTAssertEqual(entity.transform.position.x, 366 * h, accuracy: 1e-6)
        XCTAssertEqual(entity.transform.position.y,
                       firstY - (31.0 / 30.0) * h - 1800 * h * h, accuracy: 1e-6)
    }

    func testZeroAccelerationAndRotationIntegration() {
        var entity = Entity(id: EntityID(rawValue: 2), kind: .fruit)
        entity.transform.acceleration = .zero
        entity.transform.velocity = SIMD3<Float>(60, 0, 0)
        entity.transform.angularVelocity = SIMD3<Float>(0, 0, 1)
        let h: Float = 0.5 / 60

        XCTAssertTrue(FruitMotion.integrate(&entity, dt: 0.5, tuning: FruitMotionTuning()))
        XCTAssertEqual(entity.transform.position.x, 3660 * h, accuracy: 1e-5)
        XCTAssertEqual(entity.transform.position.y, 0, accuracy: 1e-6)
        XCTAssertEqual(entity.transform.rotation.z, 0.5, accuracy: 1e-6)
        XCTAssertEqual(entity.transform.velocity, SIMD3<Float>(60, 0, 0))
    }

    func testFourDirectionBoundsRequirePositionAccelerationAndVelocity() {
        let tuning = FruitMotionTuning()
        let halfWidth = tuning.logicalWidth / 2
        let cases: [(SIMD3<Float>, SIMD3<Float>, SIMD3<Float>)] = [
            (SIMD3<Float>(0, -160, 0), SIMD3<Float>(0, -1, 0), SIMD3<Float>(0, -1, 0)),
            (SIMD3<Float>(0, 160, 0), SIMD3<Float>(0, 1, 0), SIMD3<Float>(0, 1, 0)),
            (SIMD3<Float>(-halfWidth, 0, 0), SIMD3<Float>(-1, 0, 0), SIMD3<Float>(-1, 0, 0)),
            (SIMD3<Float>(halfWidth, 0, 0), SIMD3<Float>(1, 0, 0), SIMD3<Float>(1, 0, 0)),
        ]
        for (index, testCase) in cases.enumerated() {
            var entity = Entity(id: EntityID(rawValue: UInt32(index + 10)), kind: .fruit)
            entity.transform.scale = 0
            entity.transform.position = testCase.0
            entity.transform.velocity = testCase.1
            entity.transform.acceleration = testCase.2
            XCTAssertFalse(FruitMotion.isAlive(entity, tuning: tuning))

            entity.transform.acceleration = .zero
            XCTAssertFalse(FruitMotion.isAlive(entity, tuning: tuning),
                           "零加速度向量允许四方向检查")

            entity.transform.acceleration = testCase.2
            entity.transform.velocity = -testCase.1
            XCTAssertTrue(FruitMotion.isAlive(entity, tuning: tuning),
                          "越界但速度朝内时不得回收")

            entity.transform.velocity = testCase.1
            entity.transform.acceleration = -testCase.2
            XCTAssertTrue(FruitMotion.isAlive(entity, tuning: tuning),
                          "加速度符号不允许该方向时不得回收")
        }
    }

    func testFruitScaleChangesOffscreenMargin() {
        let tuning = FruitMotionTuning()
        var apple = Entity(id: EntityID(rawValue: 30), kind: .fruit)
        apple.transform.scale = 60
        apple.transform.position = SIMD3<Float>(0, -195, 0)
        apple.transform.velocity = SIMD3<Float>(0, -1, 0)
        apple.transform.acceleration = SIMD3<Float>(0, -1, 0)

        var watermelon = apple
        watermelon.id = EntityID(rawValue: 31)
        watermelon.transform.scale = 75

        XCTAssertFalse(FruitMotion.isAlive(apple, tuning: tuning),
                       "苹果边距 30，下限 -190")
        XCTAssertTrue(FruitMotion.isAlive(watermelon, tuning: tuning),
                      "西瓜边距 37.5，下限 -197.5")
    }

    func testViewportAspectRatioAndInvalidFallback() {
        XCTAssertEqual(FruitMotionTuning(actualSize: SIMD2<Float>(320, 480)).logicalWidth,
                       320.0 * 320.0 / 480.0, accuracy: 1e-5)
        XCTAssertEqual(FruitMotionTuning(actualSize: SIMD2<Float>(1024, 768)).logicalWidth,
                       320.0 * 1024.0 / 768.0, accuracy: 1e-5)
        XCTAssertEqual(FruitMotionTuning(actualSize: .zero).logicalWidth,
                       320.0 * (320.0 / 480.0), accuracy: 1e-5)
    }
}