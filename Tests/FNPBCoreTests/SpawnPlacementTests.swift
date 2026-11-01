import XCTest
import simd
@testable import FNPBCore

/// FUN_00057000 / FUN_000568f4 的完整生成坐标与 placement 回归。
final class SpawnPlacementTests: XCTestCase {

    func testOriginalTrigUsesExactTableBitsAndWrappedAngleUnits() {
        XCTAssertEqual(OriginalSpawnTrigonometry.sin(degrees: 0).bitPattern, 0x00000000)
        XCTAssertEqual(OriginalSpawnTrigonometry.cos(degrees: 0).bitPattern, 0x3f800000)
        XCTAssertEqual(OriginalSpawnTrigonometry.sin(degrees: -90).bitPattern, 0xbf800000)
        XCTAssertEqual(OriginalSpawnTrigonometry.cos(degrees: -90).bitPattern, 0x00000000)
        XCTAssertEqual(OriginalSpawnTrigonometry.cos(degrees: -180).bitPattern, 0xbf800000)
    }

    func testExplicitPositionSkipsHorizontalRandomForFruitAndBomb() {
        for kind in [OriginalSpawnMotion.Kind.fruit, .bomb] {
            let rng = RecordingSpawnRandom(floats: [0.5])
            var spawner = explicitVelocitySpawner()
            spawner.posX = 30
            spawner.posY = 20

            let state = spawn(kind, rng: rng, spawner: spawner)
            let bottom = kind == .fruit ? Float(-235) : -280
            XCTAssertEqual(state.position, SIMD3<Float>(30, bottom, kind == .fruit ? 0 : 32))
            XCTAssertEqual(state.velocity, SIMD3<Float>(2, 4, 0))
            XCTAssertEqual(rng.floatCalls, 1, "显式 posX 只保留速度 RNG")
            XCTAssertEqual(rng.intCalls, 0)
        }
    }

    func testSinCosRadiusAdjustCoordinatesBeforeBottomOffset() {
        for kind in [OriginalSpawnMotion.Kind.fruit, .bomb] {
            let rng = RecordingSpawnRandom(floats: [0.5])
            var spawner = explicitVelocitySpawner()
            spawner.posX = 30
            spawner.posY = 20
            spawner.sin = 90
            spawner.cos = 0
            spawner.radius = 20

            let state = spawn(kind, rng: rng, spawner: spawner)
            // 初始 (30,-180)：原表 sin90≈0.9999993，乘 20 后截为 19；cos=0 按原版跳过余弦偏移。
            let bottom = kind == .fruit ? Float(-216) : -261
            XCTAssertEqual(state.position, SIMD3<Float>(30, bottom, kind == .fruit ? 0 : 32))
        }
    }

    func testMissingSinCosRetainMinusOneWhenRadiusIsPresent() {
        let rng = RecordingSpawnRandom(floats: [0.5])
        var spawner = explicitVelocitySpawner()
        spawner.posX = 30
        spawner.posY = 20
        spawner.radius = 1000

        let state = FruitMotion.spawnState(rng: rng, spawner: spawner)
        // 原表 sin(-1°)*1000 截为 -18，cos(-1°)*1000 截为 999；再应用 BOTTOM -55。
        XCTAssertEqual(state.position, SIMD3<Float>(1029, -253, 0))
        XCTAssertEqual(rng.floatCalls, 1)
    }

    func testTopFlipsPositionAndVelocityButNotGravity() {
        for kind in [OriginalSpawnMotion.Kind.fruit, .bomb] {
            let rng = RecordingSpawnRandom(floats: [0.5])
            var spawner = explicitVelocitySpawner()
            spawner.posX = 30
            spawner.posY = 20
            spawner.placementCode = 1

            let state = spawn(kind, rng: rng, spawner: spawner)
            let top = kind == .fruit ? Float(235) : 280
            XCTAssertEqual(state.position, SIMD3<Float>(-30, top, kind == .fruit ? 0 : 32))
            XCTAssertEqual(state.velocity, SIMD3<Float>(-2, -2, 0))
            XCTAssertEqual(state.acceleration, SIMD3<Float>(0, -12, 0))
        }
    }

    func testLeftAndRightShareCoordinateVelocityAndGravityRules() {
        let cases: [(OriginalSpawnMotion.Kind, Float, Float, Float)] = [
            (.fruit, 175, -175, 0),
            (.bomb, 220, -220, 32),
        ]
        for (kind, rightX, leftX, z) in cases {
            for placement in [Int32(2), 3] {
                let rng = RecordingSpawnRandom(floats: [0.5])
                var spawner = explicitVelocitySpawner()
                spawner.posX = 30
                spawner.posY = 20
                spawner.placementCode = placement

                let state = spawn(kind, rng: rng, spawner: spawner)
                let isLeft = placement == 2
                XCTAssertEqual(state.position,
                               SIMD3<Float>(isLeft ? leftX : rightX, 45, z))
                XCTAssertEqual(state.velocity.x, isLeft ? -8.6625 : 8.6625, accuracy: 1e-5)
                XCTAssertEqual(state.velocity.y, -3, accuracy: 1e-6)
                XCTAssertEqual(state.velocity.z, 0)
                XCTAssertEqual(state.acceleration.x, isLeft ? 0.01 : -0.01, accuracy: 1e-6)
                XCTAssertEqual(state.acceleration.y, -12, accuracy: 1e-6)
                XCTAssertEqual(state.acceleration.z, 0)
            }
        }
    }

    func testLeftRightConsumesSignedHighWordAndResolvesBothDirections() {
        for (raw, expectedX) in [(Int32(1), Float(-175)), (-1, Float(175))] {
            let rng = RecordingSpawnRandom(floats: [0.5], ints: [raw])
            var spawner = explicitVelocitySpawner()
            spawner.posX = 30
            spawner.posY = 20
            spawner.placementCode = 4

            let state = FruitMotion.spawnState(rng: rng, spawner: spawner)
            XCTAssertEqual(state.position, SIMD3<Float>(expectedX, 45, 0))
            XCTAssertEqual(rng.floatCalls, 1)
            XCTAssertEqual(rng.intUpperBounds, [0])
        }
    }

    func testBombDirectionUsesOriginalIntegerRangesForBottomAndSide() {
        for (placement, upperBound) in [(Int32(0), Int32(20)), (3, 12)] {
            let rng = RecordingSpawnRandom(floats: [0.5], ints: [0])
            var spawner = Spawner()
            spawner.posX = 0
            spawner.placementCode = placement

            _ = BombMotion.spawnState(rng: rng, spawner: spawner)
            XCTAssertEqual(rng.floatCalls, 1, "方向随机不得经过 nextFloat")
            XCTAssertEqual(rng.intUpperBounds, [upperBound])
        }
    }

    func testFruitDirectionStillUsesFloatAfterSpeedRandom() {
        let rng = RecordingSpawnRandom(floats: [0.5, 0.5])
        var spawner = Spawner()
        spawner.posX = 0

        _ = FruitMotion.spawnState(rng: rng, spawner: spawner)
        XCTAssertEqual(rng.floatCalls, 2)
        XCTAssertEqual(rng.intCalls, 0)
    }

    func testSidePlacementUsesActualLogicalViewport() {
        let rng = RecordingSpawnRandom(floats: [0.5])
        var spawner = explicitVelocitySpawner()
        spawner.posX = 30
        spawner.posY = 20
        spawner.placementCode = 3
        let tuning = FruitMotionTuning(actualSize: SIMD2<Float>(640, 480))

        let state = FruitMotion.spawnState(rng: rng, spawner: spawner, tuning: tuning)
        // logicalWidth=426.666…，transformedX=22，transformedY=240。
        XCTAssertEqual(state.position, SIMD3<Float>(295, 22, 0))
    }

    private func explicitVelocitySpawner() -> Spawner {
        var spawner = Spawner()
        spawner.velocityX = 2
        spawner.velocityY = 4
        spawner.gravity = SIMD3<Float>(0, -1, 0)
        return spawner
    }

    private func spawn(_ kind: OriginalSpawnMotion.Kind,
                       rng: any RandomSource,
                       spawner: Spawner,
                       tuning: FruitMotionTuning = FruitMotionTuning())
        -> (position: SIMD3<Float>, velocity: SIMD3<Float>, acceleration: SIMD3<Float>) {
        switch kind {
        case .fruit:
            return FruitMotion.spawnState(rng: rng, spawner: spawner, tuning: tuning)
        case .bomb:
            return BombMotion.spawnState(rng: rng, spawner: spawner, tuning: tuning)
        }
    }
}

private final class RecordingSpawnRandom: RandomSource {
    private var floats: [Float]
    private var ints: [Int32]
    private(set) var floatCalls = 0
    private(set) var intCalls = 0
    private(set) var intUpperBounds: [Int32] = []

    init(floats: [Float] = [], ints: [Int32] = []) {
        self.floats = floats
        self.ints = ints
    }

    func nextFloat() -> Float {
        precondition(!floats.isEmpty, "nextFloat 调用次数或顺序超出测试序列")
        floatCalls += 1
        return floats.removeFirst()
    }

    func nextInt(_ upperBound: Int32) -> Int32 {
        precondition(!ints.isEmpty, "nextInt 调用次数或顺序超出测试序列")
        intCalls += 1
        intUpperBounds.append(upperBound)
        return ints.removeFirst()
    }

    func snapshot() -> UInt64 { UInt64(floatCalls) << 32 | UInt64(intCalls) }
    func restore(_ s: UInt64) { }
}
