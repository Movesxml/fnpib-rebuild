import XCTest
@testable import FNPBCore

/// 常量由 reverse/verify_original_hash.py 与 reverse/verify_original_hash.js
/// 按 ARM 指令独立转写交叉生成；不在测试内复制生产算法或自生成预期。
final class OriginalStringHashTests: XCTestCase {
    func testEmptyAndLeadingNULReturnZero() {
        XCTAssertEqual(OriginalStringHash.hash(""), 0)
        XCTAssertEqual(OriginalStringHash.hash("\0not-read"), 0)
    }

    func testLengthBoundariesOneThroughThirteen() {
        let vectors: [(String, UInt32)] = [
            ("a", 0x25ab_5c50),
            ("ab", 0xc04f_e20f),
            ("abc", 0x4135_6ec8),
            ("abcd", 0x3088_2150),
            ("abcde", 0x13cb_68b5),
            ("abcdef", 0xbe04_a489),
            ("abcdefg", 0x5f57_92e0),
            ("abcdefgh", 0xb4ae_016a),
            ("abcdefghi", 0x348e_7980),
            ("abcdefghij", 0xc8e7_ce2a),
            ("abcdefghijk", 0x6169_0951),
            ("abcdefghijkl", 0xdc6b_0534),
            ("abcdefghijklm", 0x0660_5e01),
        ]
        for (input, expected) in vectors {
            XCTAssertEqual(OriginalStringHash.hash(input), expected, input)
        }
    }

    func testRealNamesAndASCIICaseFolding() {
        XCTAssertEqual(OriginalStringHash.hash("apple"), 0xaa39_7683)
        XCTAssertEqual(OriginalStringHash.hash("APPLE"), 0xaa39_7683)
        XCTAssertEqual(OriginalStringHash.hash("Apple"), 0xaa39_7683)
        XCTAssertEqual(OriginalStringHash.hash("FastFruit1"), 0x9309_b8a0)
        XCTAssertEqual(OriginalStringHash.hash("bombPairs1"), 0xc8f8_2107)
        XCTAssertEqual(OriginalStringHash.hash("LEFT_RIGHT"), 0xdb57_0e76)
    }

    func testUTF8HighBytesRetainOriginalSignedLoads() {
        let vectors: [(String, UInt32)] = [
            ("é", 0xd69f_c251),
            ("aé", 0xc91b_6a87),
            ("éa", 0x3fe2_d9a8),
            ("ééa", 0x6331_7174),
            ("aéé", 0xf900_3d43),
            ("你好", 0x9749_104e),
            // 14 个 UTF-8 字节：主循环的前三字节同样有符号加载。
            ("ééééééé", 0xe58e_c078),
        ]
        for (input, expected) in vectors {
            XCTAssertEqual(OriginalStringHash.hash(input), expected, input)
        }
    }
}
