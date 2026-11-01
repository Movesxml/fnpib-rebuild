import XCTest
@testable import FNPBCore

final class ChallengeFruitSelectionTests: XCTestCase {
    private func entry(_ chance: Int32,
                       noCritical: Bool = true,
                       coinsMax: Int32 = 0) -> ChallengeFruitWeightEntry {
        ChallengeFruitWeightEntry(chance: chance, noCritical: noCritical, coinsMax: coinsMax)
    }

    private func fruit(_ name: String, _ id: Int32) -> FruitInfo {
        var fruit = FruitInfo()
        fruit.name = name
        fruit.typeID = id
        return fruit
    }

    func testMathRollSignedComparisonAndFallbackVectors() {
        XCTAssertEqual(ChallengeFruitSelectionMath.roll(high: .max, total: 10), 9)
        XCTAssertEqual(ChallengeFruitSelectionMath.roll(high: 0x4000_0000, total: 10), 2)
        XCTAssertEqual(ChallengeFruitSelectionMath.roll(high: .max, total: 0), .max)
        XCTAssertEqual(ChallengeFruitSelectionMath.roll(high: .max, total: .max), .max)
        XCTAssertEqual(ChallengeFruitSelectionMath.mulHi32(.max, .max), 0xffff_fffe)
        XCTAssertTrue(ChallengeFruitSelectionMath.isSignedStrictlyLess(2, 3))
        XCTAssertFalse(ChallengeFruitSelectionMath.isSignedStrictlyLess(3, 3))
        XCTAssertTrue(ChallengeFruitSelectionMath.isSignedStrictlyLess(.max, 0))
        XCTAssertEqual(ChallengeFruitSelectionMath.fallbackIndex(high: .max, count: 3), 1)
        XCTAssertEqual(ChallengeFruitSelectionMath.fallbackIndex(high: .max, count: 2), 0)
        XCTAssertEqual(ChallengeFruitSelectionMath.fallbackIndex(high: 0x1234, count: 1), 0x1234)
    }

    func testRebuildOrderAndCacheBoundary() throws {
        var state = ChallengeFruitWeightState(totalAll: 0, totalFree: 5,
                                              totalFlag: 7, totalFlagFree: 9)
        let weights = [
            0: entry(100),
            1: entry(50, noCritical: false, coinsMax: 5),
            2: entry(25, coinsMax: -1),
        ]
        try ChallengeFruitSelector.rebuildIfNeeded(state: &state, candidates: [0, 1, 2],
                                                   weights: weights)
        XCTAssertEqual(state.totalAll, 175)
        XCTAssertEqual(state.totalFree, 130)
        XCTAssertEqual(state.totalFlag, 132)
        XCTAssertEqual(state.totalFlagFree, 134)
        XCTAssertEqual(state.cumulativeAll, [0: 100, 1: 150, 2: 175])
        XCTAssertEqual(state.cumulativeFlag, [0: 107, 1: 107, 2: 132])

        let snapshot = state
        try ChallengeFruitSelector.rebuildIfNeeded(state: &state, candidates: [0],
                                                   weights: [0: entry(999)])
        XCTAssertEqual(state, snapshot, "T_all>0 时必须完整复用旧缓存")
    }

    func testAccumulationUsesUInt32Wrapping() throws {
        var state = ChallengeFruitWeightState()
        try ChallengeFruitSelector.rebuildIfNeeded(
            state: &state, candidates: [0, 1, 2],
            weights: [0: entry(.max), 1: entry(.max), 2: entry(2)])
        XCTAssertEqual(state.totalAll, 0)
        XCTAssertEqual(state.cumulativeAll[1], 0xffff_fffe)
    }

    func testResolvePathTruthTable() {
        XCTAssertEqual(ChallengeFruitSelector.resolvePath(predicateP: 1, param1: 1), .flag)
        XCTAssertEqual(ChallengeFruitSelector.resolvePath(predicateP: 1, param1: 0), .flagFree)
        XCTAssertEqual(ChallengeFruitSelector.resolvePath(predicateP: 1, param1: 2), .flagFree)
        XCTAssertEqual(ChallengeFruitSelector.resolvePath(predicateP: 0, param1: 0), .free)
        XCTAssertEqual(ChallengeFruitSelector.resolvePath(predicateP: 0, param1: 1), .all)
        XCTAssertEqual(ChallengeFruitSelector.resolvePath(predicateP: 2, param1: 0), .free)
    }

    func testFreeScanStrictLessZeroAndNegativeWeights() throws {
        let state = ChallengeFruitWeightState()
        let candidates: [Int32] = [10, 11]
        let normal = [10: entry(3), 11: entry(7)]
        XCTAssertEqual(try ChallengeFruitSelector.scanWeighted(
            path: .free, roll: 2, candidates: candidates, weights: normal, state: state), 10)
        XCTAssertEqual(try ChallengeFruitSelector.scanWeighted(
            path: .free, roll: 3, candidates: candidates, weights: normal, state: state), 11)
        XCTAssertNil(try ChallengeFruitSelector.scanWeighted(
            path: .free, roll: 10, candidates: candidates, weights: normal, state: state))

        let zero = [10: entry(0), 11: entry(0)]
        XCTAssertNil(try ChallengeFruitSelector.scanWeighted(
            path: .free, roll: 0, candidates: candidates, weights: zero, state: state))
        XCTAssertEqual(try ChallengeFruitSelector.scanWeighted(
            path: .free, roll: .max, candidates: candidates, weights: zero, state: state), 10)

        let negative = [10: entry(-1), 11: entry(2)]
        XCTAssertEqual(try ChallengeFruitSelector.scanWeighted(
            path: .free, roll: 0, candidates: candidates, weights: negative, state: state), 11)
    }

    func testCachedAndFilteredScans() throws {
        var state = ChallengeFruitWeightState()
        state.cumulativeAll = [10: 5, 11: 15]
        state.cumulativeFlag = [10: 10, 11: 20]
        XCTAssertEqual(try ChallengeFruitSelector.scanWeighted(
            path: .all, roll: 5, candidates: [10, 11], weights: [:], state: state), 11)
        XCTAssertEqual(try ChallengeFruitSelector.scanWeighted(
            path: .flag, roll: 10, candidates: [10, 11], weights: [:], state: state), 11)

        let filtered = [
            10: entry(5),
            11: entry(7, coinsMax: 5),
            12: entry(9, noCritical: false),
        ]
        XCTAssertEqual(try ChallengeFruitSelector.scanWeighted(
            path: .flagFree, roll: 4, candidates: [10, 11, 12],
            weights: filtered, state: state), 10)
        XCTAssertNil(try ChallengeFruitSelector.scanWeighted(
            path: .flagFree, roll: 5, candidates: [10, 11, 12],
            weights: filtered, state: state))
    }

    func testWeightedHitConsumesOneRandomStep() throws {
        var selector = ChallengeFruitSelector()
        let random = OriginalLCGRandom(seed: 0)
        let selected = try selector.select(candidates: [0], weights: [0: entry(100)],
                                           param1: 0, predicateP: 0, random: random)
        XCTAssertEqual(selected, 0)
        let reference = OriginalLCGRandom(seed: 0)
        _ = reference.nextInt(0)
        XCTAssertEqual(random.snapshot(), reference.snapshot())
    }

    func testFallbackConsumesTwoStepsAndNeverSelectsLast() throws {
        for seed in UInt64(0)..<8 {
            var selector = ChallengeFruitSelector()
            let random = OriginalLCGRandom(seed: seed)
            let first = UInt32(bitPattern: OriginalLCGRandom(seed: seed).nextInt(0))
            guard Int32(bitPattern: first) >= 0 else { continue }
            let selected = try selector.select(
                candidates: [0, 1, 2], weights: [0: entry(0), 1: entry(0), 2: entry(0)],
                param1: 0, predicateP: 0, random: random)
            XCTAssertNotEqual(selected, 2)
            let reference = OriginalLCGRandom(seed: seed)
            _ = reference.nextInt(0)
            _ = reference.nextInt(0)
            XCTAssertEqual(random.snapshot(), reference.snapshot())
        }
    }

    func testUnsafeOriginalBoundsBecomeExplicitErrorsAfterTwoSteps() throws {
        for candidates in [[Int32](), [Int32(0)]] {
            var selector = ChallengeFruitSelector()
            let random = OriginalLCGRandom(seed: 0)
            let weights = candidates.isEmpty ? [:] : [0: entry(0)]
            XCTAssertThrowsError(try selector.select(
                candidates: candidates, weights: weights,
                param1: 0, predicateP: 0, random: random))
            let reference = OriginalLCGRandom(seed: 0)
            _ = reference.nextInt(0)
            _ = reference.nextInt(0)
            XCTAssertEqual(random.snapshot(), reference.snapshot())
        }
    }

    func testCandidateSetsUseCatalogOrderAndDynamicIDs() throws {
        let catalog = [
            fruit("apple", 42), fruit("banana", 99), fruit("strawberry", 4),
            fruit("lime", 11), fruit("kiwifruit", 5), fruit("watermelon", 3),
            fruit("pineapple", 6),
        ]
        XCTAssertEqual(ChallengeFruitCandidates.defaultCandidates(from: catalog),
                       [42, 4, 11, 5, 3, 6])
        XCTAssertEqual(ChallengeFruitCandidates.candidates(for: .small, from: catalog),
                       [4, 11, 5])
        XCTAssertEqual(ChallengeFruitCandidates.candidates(for: .big, from: catalog),
                       [99, 3, 6])
        XCTAssertNil(ChallengeFruitCandidates.candidates(for: .normal, from: catalog))
        XCTAssertEqual(ChallengeFruitCandidates.candidates(
            for: .small, from: [fruit("strawberry", 4)]), [4])
    }

    func testNewGameDefaultAndModeShareOriginalCache() throws {
        let catalog = [fruit("apple", 0), fruit("banana", 1),
                       fruit("strawberry", 4), fruit("lime", 11)]
        let weights = [0: entry(100), 1: entry(100), 4: entry(60), 11: entry(40)]
        var selector = ChallengeFruitSelector()
        let result = try selector.selectNewGameChallengeFruit(
            size: .small, catalog: catalog, weights: weights,
            predicateP: 0, random: OriginalLCGRandom(seed: 0))
        XCTAssertEqual(result.defaultSelection, 0)
        XCTAssertTrue([4, 11].contains(result.finalSelection))
        XCTAssertEqual(result.appliedMode, .small)
        XCTAssertEqual(selector.state.totalAll, 200)
        XCTAssertEqual(selector.state.totalFree, 200)
    }

    func testNormalNewGameOnlyConsumesDefaultSelection() throws {
        let catalog = [fruit("apple", 0), fruit("banana", 1)]
        let weights = [0: entry(100), 1: entry(100)]
        let random = OriginalLCGRandom(seed: 0)
        var selector = ChallengeFruitSelector()
        let result = try selector.selectNewGameChallengeFruit(
            size: .normal, catalog: catalog, weights: weights,
            predicateP: 0, random: random)
        XCTAssertEqual(result.defaultSelection, 0)
        XCTAssertEqual(result.finalSelection, 0)
        XCTAssertEqual(result.appliedMode, .normal)
        let reference = OriginalLCGRandom(seed: 0)
        _ = reference.nextInt(0)
        XCTAssertEqual(random.snapshot(), reference.snapshot())
    }
}
