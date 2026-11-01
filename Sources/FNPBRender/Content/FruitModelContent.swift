import Foundation

/// T-031 Content 的严格、纯数据解码错误。
public enum FruitContentError: Error, CustomStringConvertible {
    case manifestDecodeFailed(String)
    case invalidBinaryHeader(String)
    case binarySummaryMismatch(String)
    case invalidMesh(String)
    case segmentOutOfBounds(String)
    case indexOutOfVertexRange(id: String, index: UInt32, vertexCount: Int)

    public var description: String {
        switch self {
        case .manifestDecodeFailed(let message): return "fruitModels.json 解码失败：\(message)"
        case .invalidBinaryHeader(let message): return "fruitMeshes.bin 头无效：\(message)"
        case .binarySummaryMismatch(let message): return "JSON/BIN 摘要不一致：\(message)"
        case .invalidMesh(let message): return "网格无效：\(message)"
        case .segmentOutOfBounds(let message): return "网格段越界：\(message)"
        case .indexOutOfVertexRange(let id, let index, let count):
            return "网格 \(id) 的索引 \(index) 超出 vertexCount=\(count)"
        }
    }
}

public enum FruitMeshBinaryLayout {
    public static let magic = "FNPM"
    public static let version = 1
    public static let headerBytes = 32
    public static let vertexStride = 64
    public static let indexTypeUInt32: UInt32 = 1
}

public enum MeshKind: Sendable, Equatable {
    case fruit(typeID: Int32)
    case bomb
}

/// 已校验的单个原始网格。字节内容保持 little-endian 原样，不做 UV 或颜色改写。
public struct DecodedMesh: Sendable, Equatable {
    public let id: String
    public let kind: MeshKind
    public let textureBaseName: String
    public let vertexBytes: Data
    public let indexBytes: Data
    public let vertexCount: Int
    public let indices: [UInt32]

    public var indexCount: Int { indices.count }
    public var triangleCount: Int { indices.count / 3 }
}

public struct DecodedFruitContent: Sendable {
    public let meshes: [DecodedMesh]
    private let fruitIndicesByType: [Int32: [Int]]
    private let bombIndices: [Int]

    public var fruitTypeCount: Int { fruitIndicesByType.count }
    public var fruitMeshes: [DecodedMesh] {
        meshes.filter {
            if case .fruit = $0.kind { return true }
            return false
        }
    }
    public var bombMeshes: [DecodedMesh] { bombIndices.map { meshes[$0] } }

    public func fruitMeshes(forTypeID typeID: Int32) -> [DecodedMesh] {
        (fruitIndicesByType[typeID] ?? []).map { meshes[$0] }
    }

    fileprivate init(meshes: [DecodedMesh], fruitIndicesByType: [Int32: [Int]], bombIndices: [Int]) {
        self.meshes = meshes
        self.fruitIndicesByType = fruitIndicesByType
        self.bombIndices = bombIndices
    }
}

private struct FruitManifest: Decodable {
    struct BinarySummary: Decodable {
        let version: Int
        let headerBytes: Int
        let meshCount: Int
        let vertexStride: Int
        let indexType: String
        let bytes: Int
    }
    struct Segment: Decodable {
        let offset: Int
        let lengthBytes: Int
        let count: Int
        let stride: Int?
    }
    struct MeshSegments: Decodable {
        let triangleIndices: Segment
        let vertices: Segment
    }
    struct Mesh: Decodable {
        let name: String
        let vertexCount: Int
        let triangleIndexCount: Int
        let diffuseTex: String?
        let diffuseTextures: [String]
        let bin: MeshSegments
    }
    struct Entry: Decodable {
        let typeID: Int?
        let name: String
        let meshCount: Int
        let meshes: [Mesh]
    }
    let binary: BinarySummary
    let fruits: [Entry]
    let bomb: Entry
}

public enum FruitModelLoader {
    public static func load(manifestURL: URL, binaryURL: URL) throws -> DecodedFruitContent {
        try load(
            manifestJSON: Data(contentsOf: manifestURL, options: .mappedIfSafe),
            binary: Data(contentsOf: binaryURL, options: .mappedIfSafe)
        )
    }

    public static func load(manifestJSON: Data, binary: Data) throws -> DecodedFruitContent {
        let manifest: FruitManifest
        do {
            manifest = try JSONDecoder().decode(FruitManifest.self, from: manifestJSON)
        } catch {
            throw FruitContentError.manifestDecodeFailed(String(describing: error))
        }

        try validate(binaryHeader: binary, summary: manifest.binary)
        var meshes: [DecodedMesh] = []
        var fruitIndices: [Int32: [Int]] = [:]
        var bombIndices: [Int] = []

        for entry in manifest.fruits {
            guard let rawTypeID = entry.typeID, let typeID = Int32(exactly: rawTypeID) else {
                throw FruitContentError.invalidMesh("水果 \(entry.name) 缺少有效 Int32 typeID")
            }
            guard fruitIndices[typeID] == nil else {
                throw FruitContentError.invalidMesh("重复水果 typeID=\(typeID)")
            }
            let indices = try decodeEntry(
                entry,
                kind: .fruit(typeID: typeID),
                idPrefix: "fruit:\(typeID)",
                binary: binary,
                headerBytes: manifest.binary.headerBytes,
                output: &meshes
            )
            fruitIndices[typeID] = indices
        }

        bombIndices = try decodeEntry(
            manifest.bomb,
            kind: .bomb,
            idPrefix: "bomb",
            binary: binary,
            headerBytes: manifest.binary.headerBytes,
            output: &meshes
        )

        guard meshes.count == manifest.binary.meshCount else {
            throw FruitContentError.binarySummaryMismatch(
                "实际解码 \(meshes.count) 网格，binary.meshCount=\(manifest.binary.meshCount)"
            )
        }
        return DecodedFruitContent(
            meshes: meshes,
            fruitIndicesByType: fruitIndices,
            bombIndices: bombIndices
        )
    }

    private static func validate(binaryHeader data: Data, summary: FruitManifest.BinarySummary) throws {
        guard data.count >= FruitMeshBinaryLayout.headerBytes else {
            throw FruitContentError.invalidBinaryHeader("文件只有 \(data.count) 字节")
        }
        let magic = String(decoding: data.prefix(4), as: UTF8.self)
        let version = readUInt32LE(data, 4)
        let headerBytes = readUInt32LE(data, 8)
        let meshCount = readUInt32LE(data, 12)
        let stride = readUInt32LE(data, 16)
        let indexType = readUInt32LE(data, 20)
        guard magic == FruitMeshBinaryLayout.magic else {
            throw FruitContentError.invalidBinaryHeader("magic=\(magic)")
        }
        guard version == UInt32(FruitMeshBinaryLayout.version),
              headerBytes == UInt32(FruitMeshBinaryLayout.headerBytes),
              stride == UInt32(FruitMeshBinaryLayout.vertexStride),
              indexType == FruitMeshBinaryLayout.indexTypeUInt32 else {
            throw FruitContentError.invalidBinaryHeader(
                "version=\(version), header=\(headerBytes), stride=\(stride), indexType=\(indexType)"
            )
        }
        guard summary.version == Int(version),
              summary.headerBytes == Int(headerBytes),
              summary.meshCount == Int(meshCount),
              summary.vertexStride == Int(stride),
              summary.indexType.lowercased() == "u32",
              summary.bytes == data.count else {
            throw FruitContentError.binarySummaryMismatch("JSON binary 字段与真实头/文件长度不符")
        }
    }

    private static func decodeEntry(
        _ entry: FruitManifest.Entry,
        kind: MeshKind,
        idPrefix: String,
        binary: Data,
        headerBytes: Int,
        output: inout [DecodedMesh]
    ) throws -> [Int] {
        guard !entry.meshes.isEmpty, entry.meshCount == entry.meshes.count else {
            throw FruitContentError.invalidMesh("\(idPrefix) meshCount 与 meshes 不一致")
        }
        var result: [Int] = []
        result.reserveCapacity(entry.meshes.count)

        for (meshIndex, mesh) in entry.meshes.enumerated() {
            let id = "\(idPrefix):\(meshIndex):\(mesh.name)"
            let vertexSegment = mesh.bin.vertices
            let indexSegment = mesh.bin.triangleIndices
            guard mesh.vertexCount > 0,
                  vertexSegment.count == mesh.vertexCount,
                  vertexSegment.stride == FruitMeshBinaryLayout.vertexStride else {
                throw FruitContentError.invalidMesh("\(id) vertexCount/stride 不一致")
            }
            guard mesh.triangleIndexCount > 0,
                  mesh.triangleIndexCount % 3 == 0,
                  indexSegment.count == mesh.triangleIndexCount else {
                throw FruitContentError.invalidMesh("\(id) triangleIndexCount 无效")
            }
            let vertexLength = try checkedMultiply(
                mesh.vertexCount,
                FruitMeshBinaryLayout.vertexStride,
                id: id,
                field: "vertex bytes"
            )
            let indexLength = try checkedMultiply(indexSegment.count, 4, id: id, field: "index bytes")
            guard vertexSegment.lengthBytes == vertexLength,
                  indexSegment.lengthBytes == indexLength else {
                throw FruitContentError.invalidMesh("\(id) lengthBytes 与 count 不一致")
            }
            try checkedSegment(
                id: id,
                field: "vertices",
                offset: vertexSegment.offset,
                length: vertexLength,
                headerBytes: headerBytes,
                fileSize: binary.count
            )
            try checkedSegment(
                id: id,
                field: "triangleIndices",
                offset: indexSegment.offset,
                length: indexLength,
                headerBytes: headerBytes,
                fileSize: binary.count
            )
            guard let texture = mesh.diffuseTex ?? mesh.diffuseTextures.first,
                  !texture.isEmpty else {
                throw FruitContentError.invalidMesh("\(id) 缺少 DiffuseTex")
            }

            var indices: [UInt32] = []
            indices.reserveCapacity(indexSegment.count)
            for i in 0..<indexSegment.count {
                let value = readUInt32LE(binary, indexSegment.offset + i * 4)
                guard value < UInt32(mesh.vertexCount) else {
                    throw FruitContentError.indexOutOfVertexRange(
                        id: id,
                        index: value,
                        vertexCount: mesh.vertexCount
                    )
                }
                indices.append(value)
            }

            result.append(output.count)
            output.append(DecodedMesh(
                id: id,
                kind: kind,
                textureBaseName: texture,
                vertexBytes: binary.subdata(in: vertexSegment.offset..<(vertexSegment.offset + vertexLength)),
                indexBytes: binary.subdata(in: indexSegment.offset..<(indexSegment.offset + indexLength)),
                vertexCount: mesh.vertexCount,
                indices: indices
            ))
        }
        return result
    }

    private static func checkedMultiply(_ lhs: Int, _ rhs: Int, id: String, field: String) throws -> Int {
        let result = lhs.multipliedReportingOverflow(by: rhs)
        guard !result.overflow, result.partialValue >= 0 else {
            throw FruitContentError.invalidMesh("\(id) \(field) 溢出")
        }
        return result.partialValue
    }

    private static func checkedSegment(
        id: String,
        field: String,
        offset: Int,
        length: Int,
        headerBytes: Int,
        fileSize: Int
    ) throws {
        guard offset >= headerBytes, offset <= fileSize, length >= 0, length <= fileSize - offset else {
            throw FruitContentError.segmentOutOfBounds(
                "\(id) \(field) [\(offset), \(offset + length))，header=\(headerBytes)，file=\(fileSize)"
            )
        }
    }

    private static func readUInt32LE(_ data: Data, _ offset: Int) -> UInt32 {
        data.withUnsafeBytes { raw in
            raw.loadUnaligned(fromByteOffset: offset, as: UInt32.self)
        }.littleEndian
    }
}
