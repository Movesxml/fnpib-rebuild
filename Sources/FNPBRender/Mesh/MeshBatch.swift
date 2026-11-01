import Foundation
import simd

/// 列主序 4×4 矩阵；布局与 simd_float4x4 / Metal float4x4 一致。
public struct MeshMatrix: Sendable, Equatable {
    public let elements: [Float]

    public init(elements: [Float]) {
        precondition(elements.count == 16, "MeshMatrix 必须是 16 元素列主序矩阵")
        self.elements = elements
    }

    public static let identity = MeshMatrix(elements: [
        1, 0, 0, 0,
        0, 1, 0, 0,
        0, 0, 1, 0,
        0, 0, 0, 1,
    ])

    public static func translation(_ t: SIMD3<Float>) -> MeshMatrix {
        MeshMatrix(elements: [
            1, 0, 0, 0,
            0, 1, 0, 0,
            0, 0, 1, 0,
            t.x, t.y, t.z, 1,
        ])
    }

    public static func scale(_ s: Float) -> MeshMatrix {
        MeshMatrix(elements: [
            s, 0, 0, 0,
            0, s, 0, 0,
            0, 0, s, 0,
            0, 0, 0, 1,
        ])
    }

    public static func rotationX(_ radians: Float) -> MeshMatrix {
        let c = cos(radians), s = sin(radians)
        return MeshMatrix(elements: [
            1, 0, 0, 0,
            0, c, s, 0,
            0, -s, c, 0,
            0, 0, 0, 1,
        ])
    }

    public static func rotationY(_ radians: Float) -> MeshMatrix {
        let c = cos(radians), s = sin(radians)
        return MeshMatrix(elements: [
            c, 0, -s, 0,
            0, 1, 0, 0,
            s, 0, c, 0,
            0, 0, 0, 1,
        ])
    }

    public static func rotationZ(_ radians: Float) -> MeshMatrix {
        let c = cos(radians), s = sin(radians)
        return MeshMatrix(elements: [
            c, s, 0, 0,
            -s, c, 0, 0,
            0, 0, 1, 0,
            0, 0, 0, 1,
        ])
    }

    public static func * (lhs: MeshMatrix, rhs: MeshMatrix) -> MeshMatrix {
        var out = [Float](repeating: 0, count: 16)
        for column in 0..<4 {
            for row in 0..<4 {
                var sum: Float = 0
                for k in 0..<4 {
                    sum += lhs.elements[k * 4 + row] * rhs.elements[column * 4 + k]
                }
                out[column * 4 + row] = sum
            }
        }
        return MeshMatrix(elements: out)
    }

    public var simdMatrix: simd_float4x4 {
        simd_float4x4(columns: (
            SIMD4<Float>(elements[0], elements[1], elements[2], elements[3]),
            SIMD4<Float>(elements[4], elements[5], elements[6], elements[7]),
            SIMD4<Float>(elements[8], elements[9], elements[10], elements[11]),
            SIMD4<Float>(elements[12], elements[13], elements[14], elements[15])
        ))
    }
}

public enum MeshSelection: Sendable, Equatable {
    case fruit(typeID: Int32)
    case bomb
}

public struct MeshDrawRequest: Sendable, Equatable {
    public let selection: MeshSelection
    public let modelMatrix: MeshMatrix

    public init(selection: MeshSelection, modelMatrix: MeshMatrix) {
        self.selection = selection
        self.modelMatrix = modelMatrix
    }
}

/// [待验证] 正交视觉重建相机，不宣称是官方 Mortar 相机。
/// 1 世界单位暂按 1 逻辑点；depth 仅提供确定性的 Metal [0,1] 遮挡顺序。
public struct VisualReconstructionCamera: Sendable {
    public var logicalWidth: Float
    public var logicalHeight: Float
    public var nearZ: Float
    public var farZ: Float

    public init(logicalWidth: Float, logicalHeight: Float, nearZ: Float = -512, farZ: Float = 512) {
        self.logicalWidth = max(logicalWidth, 1)
        self.logicalHeight = max(logicalHeight, 1)
        self.nearZ = nearZ
        self.farZ = farZ
    }

    public func viewProjection() -> MeshMatrix {
        let dz = farZ - nearZ
        let sz: Float = dz != 0 ? 1 / dz : 0
        let tz: Float = dz != 0 ? -nearZ / dz : 0
        return MeshMatrix(elements: [
            2 / logicalWidth, 0, 0, 0,
            0, 2 / logicalHeight, 0, 0,
            0, 0, sz, 0,
            0, 0, tz, 1,
        ])
    }
}
