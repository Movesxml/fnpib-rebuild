import XCTest
@testable import FNPBCore

/// ChallengeMapStrings：T-077 产物的严格加载。
final class ChallengeMapStringsTests: XCTestCase {

    private func json(_ body: String) -> Data { Data(body.utf8) }

    func testLoadsEntries() throws {
        let data = json("""
        {"version":1,"language":"English_US","entries":[
          {"componentIndex":8,"name":"actLabel","key":"FN_PUSS_CHALLENGE_MAP_TITLE",
           "text":"ACT %d","fontName":"FontsTrueType/miserable.TTF","fontSize":40.0}]}
        """)
        let strings = try ChallengeMapStrings.load(from: data)
        XCTAssertEqual(strings.language, "English_US")
        XCTAssertEqual(strings.entries.count, 1)
        XCTAssertEqual(strings.entries[0].text, "ACT %d")
        XCTAssertEqual(strings.entry(componentIndex: 8)?.name, "actLabel")
        XCTAssertNil(strings.entry(componentIndex: 99))
    }

    func testRejectsUnsupportedVersion() {
        let data = json("""
        {"version":2,"language":"English_US","entries":[]}
        """)
        XCTAssertThrowsError(try ChallengeMapStrings.load(from: data)) { error in
            XCTAssertEqual(error as? ChallengeMapStringsError, .unsupportedVersion(2))
        }
    }

    func testRejectsDuplicateComponentIndex() {
        let data = json("""
        {"version":1,"language":"English_US","entries":[
          {"componentIndex":8,"name":"a","key":"k1","text":"t","fontName":"f","fontSize":1},
          {"componentIndex":8,"name":"b","key":"k2","text":"t","fontName":"f","fontSize":1}]}
        """)
        XCTAssertThrowsError(try ChallengeMapStrings.load(from: data)) { error in
            XCTAssertEqual(error as? ChallengeMapStringsError, .duplicateComponentIndex(8))
        }
    }

    func testRejectsInvalidFields() {
        let badFont = json("""
        {"version":1,"language":"English_US","entries":[
          {"componentIndex":1,"name":"a","key":"k","text":"t","fontName":"","fontSize":1}]}
        """)
        XCTAssertThrowsError(try ChallengeMapStrings.load(from: badFont))

        let badSize = json("""
        {"version":1,"language":"English_US","entries":[
          {"componentIndex":1,"name":"a","key":"k","text":"t","fontName":"f","fontSize":0}]}
        """)
        XCTAssertThrowsError(try ChallengeMapStrings.load(from: badSize))
    }

    func testRejectsEmptyLanguageOrEntries() {
        XCTAssertThrowsError(try ChallengeMapStrings.load(from: json(
            "{\"version\":1,\"language\":\"\",\"entries\":[{\"componentIndex\":1,\"name\":\"a\",\"key\":\"k\",\"text\":\"t\",\"fontName\":\"f\",\"fontSize\":1}]}")))
        XCTAssertThrowsError(try ChallengeMapStrings.load(from: json(
            "{\"version\":1,\"language\":\"en\",\"entries\":[]}")))
    }
}
