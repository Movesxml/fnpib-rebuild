import XCTest
import simd
@testable import FNPBRender

final class MeshSceneAdapterTests: XCTestCase {
    private struct StubEntity: MeshRenderableEntity {
        var renderEntityType: Int32
        var renderFruitTypeID: Int32 = -1
        var renderPosition: SIMD3<Float> = .zero
        var renderEulerXYZ: SIMD3<Float> = .zero
        var renderScale: Float = 100
        var renderIsVisible: Bool = true
    }

    func testFiltersInvisibleAndUnsupportedEntitiesWithoutLosingBomb() {
        let entities = [
            StubEntity(renderEntityType: MeshEntityType.fruit, renderFruitTypeID: 3),
            StubEntity(renderEntityType: MeshEntityType.fruit, renderFruitTypeID: 4, renderIsVisible: false),
            StubEntity(renderEntityType: 99),
            StubEntity(renderEntityType: MeshEntityType.bomb),
        ]

        let requests = MeshSceneAdapter.drawRequests(from: entities)

        XCTAssertEqual(requests.count, 2)
        XCTAssertEqual(requests[0].selection, .fruit(typeID: 3))
        XCTAssertEqual(requests[1].selection, .bomb)
    }

    func testZeroRotationUsesTranslationAndLegacyScale() throws {
        let entity = StubEntity(
            renderEntityType: MeshEntityType.fruit,
            renderFruitTypeID: 7,
            renderPosition: SIMD3<Float>(12, -8, 3),
            renderScale: 25
        )

        let request = try XCTUnwrap(MeshSceneAdapter.drawRequests(from: [entity]).first)
        let e = request.modelMatrix.elements
        XCTAssertEqual(e[0], 0.25, accuracy: 0.000_001)
        XCTAssertEqual(e[5], 0.25, accuracy: 0.000_001)
        XCTAssertEqual(e[10], 0.25, accuracy: 0.000_001)
        XCTAssertEqual(e[12], 12, accuracy: 0.000_001)
        XCTAssertEqual(e[13], -8, accuracy: 0.000_001)
        XCTAssertEqual(e[14], 3, accuracy: 0.000_001)
        XCTAssertEqual(e[15], 1, accuracy: 0.000_001)
    }

    func testRotationUsesDeclaredZThenYThenXComposition() throws {
        let entity = StubEntity(
            renderEntityType: MeshEntityType.bomb,
            renderEulerXYZ: SIMD3<Float>(0.2, -0.3, 0.4)
        )

        let request = try XCTUnwrap(MeshSceneAdapter.drawRequests(from: [entity]).first)
        let expected = MeshMatrix.rotationZ(0.4)
            * MeshMatrix.rotationY(-0.3)
            * MeshMatrix.rotationX(0.2)
        for (actual, wanted) in zip(request.modelMatrix.elements, expected.elements) {
            XCTAssertEqual(actual, wanted, accuracy: 0.000_001)
        }
    }

    func testDoesNotCollapseRepeatedEntitiesIntoOneDrawRequest() {
        let entities = (0..<3).map { index in
            StubEntity(
                renderEntityType: MeshEntityType.fruit,
                renderFruitTypeID: 9,
                renderPosition: SIMD3<Float>(Float(index), 0, 0)
            )
        }

        let requests = MeshSceneAdapter.drawRequests(from: entities)

        // batches 随后按实体把每个 request 展开到对应 GPUMesh 的全部子网格；
        // 此测试守住上游不提前去重，避免同类型水果或子网格实例被静默吞掉。
        XCTAssertEqual(requests.count, 3)
        XCTAssertTrue(requests.allSatisfy { $0.selection == .fruit(typeID: 9) })
        XCTAssertEqual(requests.map { $0.modelMatrix.elements[12] }, [0, 1, 2])
    }

    func testOrthographicCameraMapsLogicalBoundsToMetalClipAndDepth() {
        let camera = VisualReconstructionCamera(
            logicalWidth: 400,
            logicalHeight: 200,
            nearZ: -10,
            farZ: 30
        )
        let matrix = camera.viewProjection().elements
        XCTAssertEqual(matrix[0], 2 / 400, accuracy: 0.000_001)
        XCTAssertEqual(matrix[5], 2 / 200, accuracy: 0.000_001)
        XCTAssertEqual(matrix[10], 1 / 40, accuracy: 0.000_001)
        XCTAssertEqual(matrix[14], 10 / 40, accuracy: 0.000_001)
    }
}
