import XCTest
@testable import FNPBCore

final class OriginalLCGRandomTests: XCTestCase {
    private struct Vector {
        let seed: UInt64
        let states: [UInt64]
        let int4: [Int32]
        let int10: [Int32]
        let floatBits: [UInt32]
    }

    private static let vectors = [
        Vector(seed: 0,
               states: [0x0000_0000_0026_9ec3, 0x7188_d00c_55ae_9cb2,
                        0x0af5_28d3_a0c3_b2fd],
               int4: [0, 1, 0], int10: [0, 4, 0],
               floatBits: [0x0000_0000, 0x3ee3_119c, 0x3d2f_5216]),
        Vector(seed: 1,
               states: [0x5d58_8b65_6c2e_2828, 0xe3b5_43e4_5af1_de8b,
                        0x3d7f_ca1a_0b78_ce9a],
               int4: [1, 3, 0], int10: [3, 8, 2],
               floatBits: [0x3eba_b0d7, 0x3f63_b53c, 0x3e75_ff1f]),
        Vector(seed: 0xdead_beef,
               states: [0x0457_f41a_e269_da0e, 0xa48f_2c2e_d7fd_2449,
                        0x2b33_2719_7970_0090],
               int4: [0, 2, 0], int10: [0, 6, 1],
               floatBits: [0x3c8a_fc11, 0x3f24_8f15, 0x3e2c_cc96])
    ]

    func testMachOStateIntegerAndFloatVectors() {
        for vector in Self.vectors {
            let states = OriginalLCGRandom(seed: vector.seed)
            let four = OriginalLCGRandom(seed: vector.seed)
            let ten = OriginalLCGRandom(seed: vector.seed)
            let floats = OriginalLCGRandom(seed: vector.seed)
            for index in vector.states.indices {
                _ = states.nextFloat()
                XCTAssertEqual(states.snapshot(), vector.states[index])
                XCTAssertEqual(four.nextInt(4), vector.int4[index])
                XCTAssertEqual(ten.nextInt(10), vector.int10[index])
                XCTAssertEqual(floats.nextFloat().bitPattern, vector.floatBits[index])
            }
        }
    }

    func testUnboundedIntReturnsExactHighBitsAndAdvancesOnce() {
        for bound: Int32 in [0, -1] {
            let rng = OriginalLCGRandom(seed: 0xdead_beef)
            _ = rng.nextFloat()
            XCTAssertEqual(rng.nextInt(bound), Int32(bitPattern: 0xa48f_2c2e))
            XCTAssertEqual(rng.snapshot(), 0xa48f_2c2e_d7fd_2449)
            XCTAssertEqual(rng.nextInt(bound), Int32(bitPattern: 0x2b33_2719))
            XCTAssertEqual(rng.snapshot(), 0x2b33_2719_7970_0090)
        }
    }

    func testBoundedIntStaysInRequestedRange() {
        let rng = OriginalLCGRandom(seed: 0xdead_beef)
        for bound: Int32 in 1...20 {
            let value = rng.nextInt(bound)
            XCTAssertGreaterThanOrEqual(value, 0)
            XCTAssertLessThan(value, bound)
        }
    }

    func testZeroSeedAndRestoreZeroArePreserved() {
        let rng = OriginalLCGRandom(seed: 0xdead_beef)
        _ = rng.nextFloat()
        rng.restore(0)
        XCTAssertEqual(rng.snapshot(), 0)
        XCTAssertEqual(rng.nextFloat().bitPattern, 0)
        XCTAssertEqual(rng.snapshot(), 0x269e_c3)
    }

    func testSnapshotRestoreReplaysExactSequence() {
        let rng = OriginalLCGRandom(seed: 1)
        let saved = rng.snapshot()
        let expected = (0..<8).map { _ in rng.nextInt(7) }
        rng.restore(saved)
        XCTAssertEqual((0..<8).map { _ in rng.nextInt(7) }, expected)

        rng.restore(0)
        let reference = OriginalLCGRandom()
        for _ in 0..<8 {
            XCTAssertEqual(rng.nextFloat().bitPattern, reference.nextFloat().bitPattern)
        }
    }
}
