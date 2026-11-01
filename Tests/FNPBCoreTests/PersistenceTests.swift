import XCTest
import FNPBPlatform

final class PersistenceTests: XCTestCase {
    func testCriticalChanceUsesOriginalIntegerDefault() throws {
        XCTAssertEqual(SaveData.default.criticalChance, 70)
        let encoded = try JSONEncoder().encode(SaveData.default)
        let json = try JSONSerialization.jsonObject(with: encoded)
        let object = try XCTUnwrap(json as? [String: Any])
        XCTAssertEqual(object["critical_chance"] as? Int, 70)
    }

    func testLegacyCriticalChanceMigratesAsInteger() {
        let numeric = SaveStore.migrate(legacyValues: ["critical_chance": NSNumber(value: 42)])
        let textual = SaveStore.migrate(legacyValues: ["critical_chance": "43"])
        XCTAssertEqual(numeric.criticalChance, 42)
        XCTAssertEqual(textual.criticalChance, 43)
    }

    func testCriticalChanceRoundTripsWithoutFloatConversion() throws {
        let directory = FileManager.default.temporaryDirectory
            .appendingPathComponent(UUID().uuidString, isDirectory: true)
        defer { try? FileManager.default.removeItem(at: directory) }
        let store = SaveStore(directory: directory)
        var save = SaveData.default
        save.criticalChance = 37
        XCTAssertTrue(store.save(save))
        XCTAssertEqual(store.load().criticalChance, 37)
        let text = try String(contentsOf: store.fileURL, encoding: .utf8)
        XCTAssertTrue(text.contains("\"critical_chance\" : 37"))
    }
}
