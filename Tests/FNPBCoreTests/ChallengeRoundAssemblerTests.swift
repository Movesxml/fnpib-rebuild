import XCTest
@testable import FNPBCore

final class ChallengeRoundAssemblerTests: XCTestCase {
    /// 计划随机值与水果 bound==0 调用分开计数，完整实现 RandomSource。
    private final class AssemblerRandom: RandomSource {
        private let planValues: [Int32]
        private var cursor = 0
        private(set) var zeroBoundCalls = 0

        init(planValues: [Int32] = []) {
            self.planValues = planValues
        }

        func nextInt(_ bound: Int32) -> Int32 {
            guard bound > 0 else {
                zeroBoundCalls += 1
                return 0
            }
            defer { cursor += 1 }
            let raw = cursor < planValues.count ? planValues[cursor] : 0
            let positive = raw >= 0 ? raw : -raw
            return positive % bound
        }

        func nextFloat() -> Float { 0 }
        func snapshot() -> UInt64 { UInt64(cursor) }
        func restore(_ state: UInt64) { cursor = Int(state) }
    }

    private func makeFruit(id: Int32, name: String, chance: Int32 = 100) -> FruitInfo {
        var info = FruitInfo()
        info.typeID = id
        info.name = name
        info.chance = chance
        info.noCritical = false
        return info
    }

    private func makeFruits() -> [FruitInfo] {
        [
            makeFruit(id: 0, name: "banana"),
            makeFruit(id: 1, name: "apple"),
            makeFruit(id: 2, name: "strawberry"),
            makeFruit(id: 3, name: "kiwifruit"),
            makeFruit(id: 4, name: "lime"),
        ]
    }

    private func makeChallenge(name: String,
                               size: ChallengeFruitSize,
                               conditions: [String] = []) -> ChallengeDefinition {
        ChallengeDefinition(
            name: name,
            challengeFruitSize: size,
            conditionNames: conditions,
            numWaves: 1)
    }

    private func makeCatalog(challenges: [ChallengeDefinition],
                             numRounds: Int32) -> ChallengeCatalog {
        let group = ChallengeGroupDefinition(name: "g", challenges: challenges)
        let tier = ChallengeTierDefinition(
            name: "t", numRounds: numRounds, groups: [group])
        return ChallengeCatalog(tiers: [tier])
    }

    private func makeAssembler(catalog: ChallengeCatalog,
                               fruits: [FruitInfo],
                               random: AssemblerRandom,
                               conditions: [ChallengeConditionDefinition] = [],
                               tierIndex: Int32 = 0) throws -> ChallengeRoundAssembler {
        try ChallengeRoundAssembler(
            catalog: catalog,
            fruits: fruits,
            conditionDefinitions: conditions,
            persistence: ChallengeSelectionMemoryStore(),
            random: random,
            tierIndex: tierIndex,
            difficulty: 0,
            predicateP: 0)
    }

    private func assertAssemblerError<T>(
        _ expression: @autoclosure () throws -> T,
        _ expected: ChallengeRoundAssemblerError,
        file: StaticString = #filePath,
        line: UInt = #line
    ) {
        XCTAssertThrowsError(try expression(), file: file, line: line) { error in
            guard let actual = error as? ChallengeRoundAssemblerError else {
                return XCTFail("unexpected error: \(error)", file: file, line: line)
            }
            XCTAssertEqual(actual, expected, file: file, line: line)
        }
    }

    func testFirstRoundNormalConsumesOneFruitSelectionWithoutRepeatOnRead() throws {
        let catalog = makeCatalog(
            challenges: [makeChallenge(name: "c1", size: .normal)], numRounds: 1)
        let random = AssemblerRandom()
        let assembler = try makeAssembler(
            catalog: catalog, fruits: makeFruits(), random: random)

        XCTAssertEqual(random.zeroBoundCalls, 1)
        let first = try assembler.startFirstRound()
        let secondRead = try assembler.startFirstRound()
        XCTAssertEqual(first, secondRead)
        XCTAssertEqual(random.zeroBoundCalls, 1)
        XCTAssertEqual(first.fruitID, 1)
        XCTAssertEqual(first.fruitName, "apple")
        XCTAssertEqual(first.runtime.selectedFruitName, "apple")
    }

    func testFirstRoundSmallDoesDefaultThenOverride() throws {
        let catalog = makeCatalog(
            challenges: [makeChallenge(name: "small", size: .small)], numRounds: 1)
        let random = AssemblerRandom()
        let assembler = try makeAssembler(
            catalog: catalog, fruits: makeFruits(), random: random)

        XCTAssertEqual(random.zeroBoundCalls, 2)
        XCTAssertEqual(assembler.defaultFruitID, 1)
        let round = try assembler.startFirstRound()
        XCTAssertEqual(round.fruitID, 2)
        XCTAssertEqual(round.fruitName, "strawberry")
        XCTAssertEqual(round.runtime.selectedFruitName, "strawberry")
    }

    func testSubsequentNormalKeepsOriginalDefaultFruit() throws {
        // 计划：第一次选 small（19/40），洗牌保持顺序，第二次选 normal（23/24）。
        let catalog = makeCatalog(challenges: [
            makeChallenge(name: "small", size: .small),
            makeChallenge(name: "normal", size: .normal),
        ], numRounds: 2)
        let random = AssemblerRandom(planValues: [0, 0, 0, 19, 23])
        var assembler = try makeAssembler(
            catalog: catalog, fruits: makeFruits(), random: random)

        let first = try assembler.startFirstRound()
        XCTAssertEqual(first.challenge.name, "small")
        XCTAssertEqual(first.fruitID, 2)
        XCTAssertEqual(random.zeroBoundCalls, 2)

        let second = try assembler.advanceToNextRound()
        XCTAssertEqual(second.challenge.name, "normal")
        XCTAssertEqual(second.fruitID, assembler.defaultFruitID)
        XCTAssertEqual(second.fruitID, 1)
        XCTAssertEqual(second.runtime.selectedFruitName, "apple")
        XCTAssertEqual(random.zeroBoundCalls, 2, "后续 normal 不得重新执行默认或覆盖选择")
    }

    func testSubsequentSmallOverridesFruitWithoutNewDefaultSelection() throws {
        // 计划：第一次选 normal（0/40），洗牌保持顺序，第二次选 small（0/24）。
        let catalog = makeCatalog(challenges: [
            makeChallenge(name: "normal", size: .normal),
            makeChallenge(name: "small", size: .small),
        ], numRounds: 2)
        let random = AssemblerRandom(planValues: [0, 0, 0, 0, 0])
        var assembler = try makeAssembler(
            catalog: catalog, fruits: makeFruits(), random: random)

        let first = try assembler.startFirstRound()
        XCTAssertEqual(first.challenge.name, "normal")
        XCTAssertEqual(first.fruitID, 1)
        XCTAssertEqual(random.zeroBoundCalls, 1)

        let second = try assembler.advanceToNextRound()
        XCTAssertEqual(second.challenge.name, "small")
        XCTAssertEqual(second.fruitID, 2)
        XCTAssertEqual(second.runtime.selectedFruitName, "strawberry")
        XCTAssertEqual(assembler.defaultFruitID, 1)
        XCTAssertEqual(random.zeroBoundCalls, 2, "后续 small 只能新增一次覆盖选择")
    }

    func testSelectedFruitIsBoundBeforeConditionEvaluation() throws {
        let definition = ChallengeConditionDefinition(
            name: "useChallengeFruit", kind: .stats, total: 1,
            specificType: "challengeFruit", evaluateOnEnd: true)
        let catalog = makeCatalog(challenges: [
            makeChallenge(name: "small", size: .small, conditions: [definition.name]),
        ], numRounds: 1)
        let round = try makeAssembler(
            catalog: catalog,
            fruits: makeFruits(),
            random: AssemblerRandom(),
            conditions: [definition]).startFirstRound()
        var runtime = round.runtime

        runtime.evaluateImmediate(context: ChallengeEvaluationContext(
            stats: ["strawberry": 1, "apple": 0]))
        XCTAssertEqual(runtime.selectedFruitName, "strawberry")
        XCTAssertEqual(runtime.conditions.condition(named: definition.name)?.current, .pass)
    }

    func testRecordingOutcomeUpdatesPlanAndPersistentPlayCountOnce() throws {
        let challenge = makeChallenge(name: "played", size: .normal)
        let store = ChallengeSelectionMemoryStore()
        var assembler = try ChallengeRoundAssembler(
            catalog: makeCatalog(challenges: [challenge], numRounds: 1),
            fruits: makeFruits(),
            conditionDefinitions: [],
            persistence: store,
            random: AssemblerRandom(),
            tierIndex: 0)
        let key = ChallengeGroupSelector.challengeKey(challenge)

        assembler.recordCurrentRoundOutcome(.pending)
        XCTAssertEqual(store.playCount(forKey: key), 0)
        assembler.recordCurrentRoundOutcome(.pass)
        XCTAssertEqual(store.playCount(forKey: key), 1)
        XCTAssertEqual(assembler.plan.outcome(at: 0), .pass)
    }

    func testDuplicateOutcomeKeepsFirstResultAndDoesNotIncrementPlaysAgain() throws {
        let challenge = makeChallenge(name: "dedupe", size: .normal)
        let store = ChallengeSelectionMemoryStore()
        var assembler = try ChallengeRoundAssembler(
            catalog: makeCatalog(challenges: [challenge], numRounds: 2),
            fruits: makeFruits(),
            conditionDefinitions: [],
            persistence: store,
            random: AssemblerRandom(),
            tierIndex: 0)
        let key = ChallengeGroupSelector.challengeKey(challenge)

        _ = try assembler.startFirstRound()
        assembler.recordCurrentRoundOutcome(.pass)
        assembler.recordCurrentRoundOutcome(.fail)
        assembler.recordCurrentRoundOutcome(.pass)
        XCTAssertEqual(assembler.plan.outcome(at: 0), .pass)
        XCTAssertEqual(store.playCount(forKey: key), 1)

        let next = try assembler.advanceToNextRound()
        XCTAssertEqual(next.roundIndex, 1)
        XCTAssertNil(assembler.plan.outcome(at: 1))
        assembler.recordCurrentRoundOutcome(.fail)
        XCTAssertEqual(assembler.plan.outcome(at: 0), .pass)
        XCTAssertEqual(assembler.plan.outcome(at: 1), .fail)
        XCTAssertEqual(store.playCount(forKey: key), 2)
    }

    func testPlanExhaustedThrowsWithoutChangingCurrentRound() throws {
        let catalog = makeCatalog(
            challenges: [makeChallenge(name: "c1", size: .normal)], numRounds: 1)
        let random = AssemblerRandom()
        var assembler = try makeAssembler(
            catalog: catalog, fruits: makeFruits(), random: random)
        let current = try assembler.startFirstRound()

        assertAssemblerError(
            try assembler.advanceToNextRound(),
            .planExhausted(currentIndex: 0, count: 1))
        XCTAssertEqual(assembler.currentRoundIndex, 0)
        XCTAssertEqual(assembler.currentFruitID, current.fruitID)
        XCTAssertEqual(assembler.runtime, current.runtime)
        XCTAssertEqual(random.zeroBoundCalls, 1)
    }

    func testMissingFruitNameThrows() throws {
        let catalog = makeCatalog(
            challenges: [makeChallenge(name: "c1", size: .normal)], numRounds: 1)
        let assembler = try makeAssembler(
            catalog: catalog, fruits: makeFruits(), random: AssemblerRandom())
        assertAssemblerError(try assembler.fruitName(for: 999), .missingFruitName(fruitID: 999))
    }

    func testEmptyPlanThrows() {
        let catalog = makeCatalog(challenges: [], numRounds: 0)
        assertAssemblerError(
            try makeAssembler(
                catalog: catalog, fruits: makeFruits(), random: AssemblerRandom()),
            .emptyPlan(tierIndex: 0))
    }

    func testMissingChallengeAtSlotThrows() {
        let catalog = makeCatalog(challenges: [], numRounds: 1)
        assertAssemblerError(
            try makeAssembler(
                catalog: catalog, fruits: makeFruits(), random: AssemblerRandom()),
            .missingChallengeAtSlot(index: 0))
    }

    func testTierIndexOutOfBoundsThrows() {
        assertAssemblerError(
            try makeAssembler(
                catalog: ChallengeCatalog(), fruits: makeFruits(), random: AssemblerRandom()),
            .tierIndexOutOfBounds(index: 0, count: 0))
    }

    func testDuplicateFruitTypeIDThrowsBeforePlanning() {
        let catalog = makeCatalog(
            challenges: [makeChallenge(name: "c1", size: .normal)], numRounds: 1)
        let fruits = [makeFruit(id: 1, name: "apple"), makeFruit(id: 1, name: "apple_red")]
        let random = AssemblerRandom()
        assertAssemblerError(
            try makeAssembler(catalog: catalog, fruits: fruits, random: random),
            .duplicateFruitTypeID(1))
        XCTAssertEqual(random.zeroBoundCalls, 0)
    }
}
