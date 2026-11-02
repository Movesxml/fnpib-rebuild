import XCTest
@testable import FNPBCore

/// 常量由 build/verify_original_hash.py 按 ARM 指令独立转写生成；
/// 不在测试内复制生产算法，也不调用生产实现生成预期。
final class OriginalStringHashTests: XCTestCase {
    func testEmptyAndLeadingNULReturnZero() {
        XCTAssertEqual(OriginalStringHash.hash(""), 0)
        XCTAssertEqual(OriginalStringHash.hash("\0not-read"), 0)
    }

    func testLengthBoundariesOneThroughThirteen() {
        let vectors: [(String, UInt32)] = [
            ("a", 0x25ab_5c50),
            ("ab", 0x19fd_290c),
            ("abc", 0x10bc_9c1d),
            ("abcd", 0x61fd_352b),
            ("abcde", 0x93e3_dea9),
            ("abcdef", 0x23da_8fa0),
            ("abcdefg", 0xf475_6a7b),
            ("abcdefgh", 0xbcd0_fc10),
            ("abcdefghi", 0xf503_1d14),
            ("abcdefghij", 0x71a7_2bd6),
            ("abcdefghijk", 0x7687_6f7b),
            ("abcdefghijkl", 0xdc6b_0534),
            ("abcdefghijklm", 0x0660_5e01),
        ]
        for (input, expected) in vectors {
            XCTAssertEqual(OriginalStringHash.hash(input), expected, input)
        }
    }

    func testRealNamesAndASCIICaseFolding() {
        XCTAssertEqual(OriginalStringHash.hash("apple"), 0xdc0b_024b)
        XCTAssertEqual(OriginalStringHash.hash("APPLE"), 0xdc0b_024b)
        XCTAssertEqual(OriginalStringHash.hash("Apple"), 0xdc0b_024b)
        XCTAssertEqual(OriginalStringHash.hash("FastFruit1"), 0xc9f6_5984)
        XCTAssertEqual(OriginalStringHash.hash("bombPairs1"), 0xb646_d4eb)
        XCTAssertEqual(OriginalStringHash.hash("LEFT_RIGHT"), 0x8147_e43a)
    }

    func testUTF8HighBytesRetainOriginalSignedTailLoads() {
        let vectors: [(String, UInt32)] = [
            ("é", 0xf399_49b6),
            ("aé", 0xb1ef_5ace),
            ("éa", 0x8a6a_de4a),
            ("ééa", 0x241f_ce19),
            ("aéé", 0xe6b4_a11f),
            ("你好", 0x20bc_09a2),
            // 14 个 UTF-8 字节：先走 12 字节主循环，再走 2 字节尾部。
            ("ééééééé", 0xd666_fc68),
        ]
        for (input, expected) in vectors {
            XCTAssertEqual(OriginalStringHash.hash(input), expected, input)
        }
    }
}
