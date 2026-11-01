import Foundation
import XCTest
@testable import FNPBRender

final class FruitModelContentTests: XCTestCase {
    private struct Spec {
        var magic = "FNPM"
        var version: UInt32 = 1
        var headerBytes: UInt32 = 32
        var vertexStride: UInt32 = 64
        var indexType: UInt32 = 1
        var vertexOffset = 32
        var vertexCount = 3
        var vertexLength = 192
        var indexOffset = 224
        var indexCount = 3
        var indexLength = 12
        var indices: [UInt32] = [0, 1, 2]
    }

    private func le32(_ value: UInt32) -> [UInt8] {
        withUnsafeBytes(of: value.littleEndian, Array.init)
    }

    private func makeBinary(spec: Spec) -> Data {
        var data = Data()
        data.append(contentsOf: Array(spec.magic.utf8))
        for value in [spec.version, spec.headerBytes, 2, spec.vertexStride, spec.indexType] {
            data.append(contentsOf: le32(value))
        }
        data.append(contentsOf: [UInt8](repeating: 0, count: 8))
        data.append(contentsOf: [UInt8](repeating: 0, count: 192))
        for index in spec.indices {
            data.append(contentsOf: le32(index))
        }
        return data
    }

    private func makeManifest(spec: Spec, binaryCount: Int? = nil) -> Data {
        // 生产格式要求 bomb 非空。水果与 bomb 可以引用同一段只读网格数据，
        // 因此合成测试复用同一合法描述，同时验证两个顶层条目均会被解码。
        let mesh = """
        {
          "name": "mesh0", "vertexCount": \(spec.vertexCount),
          "triangleIndexCount": \(spec.indexCount),
          "diffuseTex": "models/fruit/textures/fruit_atlas.tex",
          "diffuseTextures": ["models/fruit/textures/fruit_atlas.tex"],
          "bin": {
            "vertices": {
              "offset": \(spec.vertexOffset), "lengthBytes": \(spec.vertexLength),
              "count": \(spec.vertexCount), "stride": \(spec.vertexStride)
            },
            "triangleIndices": {
              "offset": \(spec.indexOffset), "lengthBytes": \(spec.indexLength),
              "count": \(spec.indexCount)
            }
          }
        }
        """
        let json = """
        {
          "binary": {
            "file": "fruitMeshes.bin", "version": \(spec.version),
            "headerBytes": \(spec.headerBytes), "meshCount": 2,
            "vertexStride": \(spec.vertexStride),
            "indexType": "\(spec.indexType == 1 ? "u32" : "u16")",
            "bytes": \(binaryCount ?? (224 + spec.indices.count * 4))
          },
          "fruits": [{
            "typeID": 7, "name": "synthetic", "meshCount": 1,
            "meshes": [\(mesh)]
          }],
          "bomb": {"typeID": null, "name": "bomb", "meshCount": 1, "meshes": [\(mesh)]}
        }
        """
        return Data(json.utf8)
    }

    private func load(spec: Spec) throws -> DecodedFruitContent {
        let binary = makeBinary(spec: spec)
        return try FruitModelLoader.load(manifestJSON: makeManifest(spec: spec), binary: binary)
    }

    func testLoadsActualSchemaSyntheticContent() throws {
        let content = try load(spec: Spec())
        XCTAssertEqual(content.meshes.count, 2)
        XCTAssertEqual(content.fruitTypeCount, 1)
        XCTAssertEqual(content.bombMeshes.count, 1)
        let meshes = content.fruitMeshes(forTypeID: 7)
        XCTAssertEqual(meshes.count, 1)
        let mesh = try XCTUnwrap(meshes.first)
        XCTAssertEqual(mesh.vertexBytes.count, 192)
        XCTAssertEqual(mesh.indexBytes.count, 12)
        XCTAssertEqual(mesh.indices, [0, 1, 2])
        XCTAssertEqual(mesh.triangleCount, 1)
    }

    func testRejectsBadMagic() {
        var spec = Spec()
        spec.magic = "BAD!"
        XCTAssertThrowsError(try load(spec: spec))
    }

    func testRejectsBadStride() {
        var spec = Spec()
        spec.vertexStride = 32
        XCTAssertThrowsError(try load(spec: spec))
    }

    func testRejectsBadIndexType() {
        var spec = Spec()
        spec.indexType = 2
        XCTAssertThrowsError(try load(spec: spec))
    }

    func testRejectsVertexOffsetOutsideFile() {
        var spec = Spec()
        spec.vertexOffset = 1_000_000
        XCTAssertThrowsError(try load(spec: spec))
    }

    func testRejectsIndexOffsetOutsideFile() {
        var spec = Spec()
        spec.indexOffset = 1_000_000
        XCTAssertThrowsError(try load(spec: spec))
    }

    func testRejectsNonTriangleIndexCount() {
        var spec = Spec()
        spec.indexCount = 4
        spec.indexLength = 16
        spec.indices = [0, 1, 2, 0]
        XCTAssertThrowsError(try load(spec: spec))
    }

    func testRejectsIndexOutsideVertexRange() {
        var spec = Spec()
        spec.indices = [0, 1, 99]
        XCTAssertThrowsError(try load(spec: spec)) { error in
            guard case FruitContentError.indexOutOfVertexRange(_, let index, _) = error else {
                return XCTFail("错误类型不符：\(error)")
            }
            XCTAssertEqual(index, 99)
        }
    }

    func testRejectsTruncatedBinary() {
        let spec = Spec()
        let binary = makeBinary(spec: spec).prefix(232)
        XCTAssertThrowsError(try FruitModelLoader.load(
            manifestJSON: makeManifest(spec: spec, binaryCount: 232),
            binary: Data(binary)
        ))
    }

    func testVerifiedTextureCatalogNormalizesWindowsPaths() {
        XCTAssertEqual(
            VerifiedTextureCatalog.verifiedPNGName(for: #"models\fruit\textures\fruit_atlas.tex"#),
            "fruit_atlas.png"
        )
        XCTAssertEqual(VerifiedTextureCatalog.verifiedPNGName(for: "art/Pinata.TEX"), "pinata.png")
        XCTAssertNil(VerifiedTextureCatalog.verifiedPNGName(for: "models/fruit/textures/chest.tex"))
    }

    private func locateContentDirectory() -> URL? {
        var url = URL(fileURLWithPath: #filePath)
        for _ in 0..<6 {
            url.deleteLastPathComponent()
            if FileManager.default.fileExists(
                atPath: url.appendingPathComponent("Content/fruitModels.json").path
            ) {
                return url.appendingPathComponent("Content")
            }
        }
        return nil
    }

    func testRealContentDecodesAllFruitAndBombMeshes() throws {
        let directory = try XCTUnwrap(locateContentDirectory())
        let content = try FruitModelLoader.load(
            manifestURL: directory.appendingPathComponent("fruitModels.json"),
            binaryURL: directory.appendingPathComponent("fruitMeshes.bin")
        )
        XCTAssertEqual(content.fruitTypeCount, 24)
        XCTAssertEqual(content.meshes.count, 25)
        XCTAssertEqual(content.fruitMeshes.count, 24)
        XCTAssertEqual(content.bombMeshes.count, 1)

        for typeID in 0..<24 {
            XCTAssertFalse(content.fruitMeshes(forTypeID: Int32(typeID)).isEmpty)
        }
        for mesh in content.meshes {
            XCTAssertGreaterThan(mesh.triangleCount, 0)
            XCTAssertEqual(mesh.vertexBytes.count, mesh.vertexCount * 64)
            XCTAssertEqual(mesh.indexBytes.count, mesh.indexCount * 4)
            XCTAssertTrue(mesh.indices.allSatisfy { $0 < UInt32(mesh.vertexCount) })
        }

        let textures = Set(content.meshes.map {
            VerifiedTextureCatalog.baseName(of: $0.textureBaseName)
        })
        XCTAssertEqual(textures, ["fruit_atlas", "pinata", "chest"])
        let pinata = try XCTUnwrap(content.fruitMeshes(forTypeID: 17).first)
        XCTAssertEqual(VerifiedTextureCatalog.verifiedPNGName(for: pinata.textureBaseName), "pinata.png")
        let chest = try XCTUnwrap(content.fruitMeshes(forTypeID: 18).first)
        XCTAssertNil(VerifiedTextureCatalog.verifiedPNGName(for: chest.textureBaseName))
    }
}
