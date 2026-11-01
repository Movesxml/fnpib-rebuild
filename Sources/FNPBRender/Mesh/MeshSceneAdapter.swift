import Foundation
import simd

public protocol MeshRenderableEntity {
    var renderEntityType: Int32 { get }
    var renderFruitTypeID: Int32 { get }
    var renderPosition: SIMD3<Float> { get }
    var renderEulerXYZ: SIMD3<Float> { get }
    var renderScale: Float { get }
    var renderIsVisible: Bool { get }
}

public enum MeshEntityType {
    public static let fruit: Int32 = 1
    public static let bomb: Int32 = 2
}

public enum MeshSceneAdapter {
    /// [待验证] 视觉重建换算，未宣称是官方缩放/旋转顺序。
    public static let legacyScaleDivisor: Float = 100

    public static func drawRequests<E: MeshRenderableEntity>(from entities: [E]) -> [MeshDrawRequest] {
        var requests: [MeshDrawRequest] = []
        requests.reserveCapacity(entities.count)
        for entity in entities where entity.renderIsVisible {
            let selection: MeshSelection
            switch entity.renderEntityType {
            case MeshEntityType.fruit:
                selection = .fruit(typeID: entity.renderFruitTypeID)
            case MeshEntityType.bomb:
                selection = .bomb
            default:
                continue
            }
            let angle = entity.renderEulerXYZ
            let model = MeshMatrix.translation(entity.renderPosition)
                * MeshMatrix.rotationZ(angle.z)
                * MeshMatrix.rotationY(angle.y)
                * MeshMatrix.rotationX(angle.x)
                * MeshMatrix.scale(entity.renderScale / legacyScaleDivisor)
            requests.append(MeshDrawRequest(selection: selection, modelMatrix: model))
        }
        return requests
    }

    /// 同一实体的全部子网格都会展开；未知 typeID 和未验证纹理不会产生占位绘制。
    @MainActor
    public static func batches(from requests: [MeshDrawRequest], library: MeshLibrary) -> [MeshBatch] {
        var order: [ObjectIdentifier] = []
        var grouped: [ObjectIdentifier: (mesh: GPUMesh, matrices: [MeshMatrix])] = [:]
        for request in requests {
            for mesh in library.meshes(for: request.selection) {
                let key = ObjectIdentifier(mesh)
                if var entry = grouped[key] {
                    entry.matrices.append(request.modelMatrix)
                    grouped[key] = entry
                } else {
                    order.append(key)
                    grouped[key] = (mesh, [request.modelMatrix])
                }
            }
        }
        return order.compactMap { key in
            guard let entry = grouped[key] else { return nil }
            return MeshBatch(mesh: entry.mesh, modelMatrices: entry.matrices)
        }
    }
}

@MainActor
public struct MeshBatch {
    public let mesh: GPUMesh
    public let modelMatrices: [MeshMatrix]

    public init(mesh: GPUMesh, modelMatrices: [MeshMatrix]) {
        self.mesh = mesh
        self.modelMatrices = modelMatrices
    }
}
