import XCTest
@testable import FNPBCore

/// LocalizedStrings：全量字符串表加载。
final class LocalizedStringsTests: XCTestCase {

    func testLoadsAndLooksUp() throws {
        let data = Data(#"{"version":1,"language":"English_US","entries":[{"key":"A","text":"Act 1"},{"key":"B","text":"Lives"}]}"#.utf8)
        let strings = try LocalizedStrings.load(from: data)
        XCTAssertEqual(strings.language, "English_US")
        XCTAssertEqual(strings.text("A"), "Act 1")
        XCTAssertEqual(strings.text("B"), "Lives")
        XCTAssertNil(strings.text("missing"))
        XCTAssertEqual(strings.text("missing", fallback: "SCORE"), "SCORE")
    }

    func testRejectsUnsupportedVersion() {
        let data = Data(#"{"version":2,"language":"en","entries":[]}"#.utf8)
        XCTAssertThrowsError(try LocalizedStrings.load(from: data)) { error in
            XCTAssertEqual(error as? LocalizedStringsError, .unsupportedVersion(2))
        }
    }

    func testRejectsDuplicateKey() {
        let data = Data(#"{"version":1,"language":"en","entries":[{"key":"A","text":"1"},{"key":"A","text":"2"}]}"#.utf8)
        XCTAssertThrowsError(try LocalizedStrings.load(from: data)) { error in
            XCTAssertEqual(error as? LocalizedStringsError, .duplicateKey("A"))
        }
    }

    func testRejectsEmptyLanguage() {
        let data = Data(#"{"version":1,"language":"","entries":[]}"#.utf8)
        XCTAssertThrowsError(try LocalizedStrings.load(from: data)) { error in
            XCTAssertEqual(error as? LocalizedStringsError, .emptyLanguage)
        }
    }
}
