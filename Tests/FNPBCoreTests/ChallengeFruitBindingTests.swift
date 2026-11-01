import XCTest
@testable import FNPBCore

/// debugName、ASCII 名称哈希、challengeFruit 注入、挑战 random 排除及 fruit 空槽。
final class ChallengeFruitBindingTests: XCTestCase {

    func testDebugNameAndMissingNameUseDocumentIndex() throws {
        let json = #"""
        {"root":{"tag":"waveManagerFile","children":[
          {"tag":"WaveInfo","attrs":{"debugName":"FastFruit1","waveNo":"5","until":"forever"},"children":[]},
          {"tag":"WaveInfo","attrs":{"name":"ignored","waveNo":"6","until":"forever"},"children":[]}
        ]}}
        """#
        let list = try OriginalContentLoader.loadWaves(from: Data(json.utf8), fruitIndex: [:])
        XCTAssertEqual(list.waves.map(\.name), ["FastFruit1", "waveNo. 1"])
    }

    func testAsciiCaseInsensitiveChallengeNameLookup() {
        let wave = makeWave(name: "fastFruit1", waveNo: 0, types: [.fruit(0)])
        let director = WaveDirector(playerCount: 1, rng: QueueRandomSource())
        director.beginGame(waves: [wave], fruits: [])

        XCTAssertTrue(director.configureChallengeWave(customWave: "FastFruit1", forceWave: true))
        XCTAssertEqual(director.runtime.forcedWaveIndex, 0)
        XCTAssertTrue(director.configureChallengeWave(customWave: "FASTFRUIT1", forceWave: true))
        XCTAssertEqual(director.runtime.currentWaveIndex, 0)
    }

    func testChallengeRandomExcludesInjectedFruitFromFirstBatch() {
        let (challenged, other) = makeFruitPair()
        let wave = makeWave(name: "wave0", waveNo: 0, types: [.random])
        // 累计权重 [100, 200]：roll=0 选中 7 后排除，roll=100 选中 9。
        let rng = QueueRandomSource(ints: [0, 100])
        let director = WaveDirector(playerCount: 1, rng: rng)

        director.setChallengeFruit(7)
        director.beginGame(waves: [wave], fruits: [challenged, other])

        XCTAssertEqual(director.runtime.spawnBatches[0][0].kinds, [9])
        XCTAssertEqual(rng.nextIntCalls, 2)
    }

    func testNormalRandomDoesNotExcludeAnyFruit() {
        let (challenged, other) = makeFruitPair()
        let wave = makeWave(name: "wave0", waveNo: 0, types: [.random])
        let rng = QueueRandomSource(ints: [0])
        let director = WaveDirector(playerCount: 1, rng: rng)

        director.beginGame(waves: [wave], fruits: [challenged, other])

        XCTAssertEqual(director.runtime.spawnBatches[0][0].kinds, [7])
        XCTAssertEqual(rng.nextIntCalls, 1)
    }

    func testFruitTokenIsExplicitEmptySlot() throws {
        let list = try loadSingleSpawn(type: "fruit")
        XCTAssertEqual(list.waves[0].spawners[0].types, [.empty])

        let director = WaveDirector(playerCount: 1, rng: QueueRandomSource())
        director.beginGame(waves: list.waves, fruits: [])
        XCTAssertEqual(director.runtime.spawnBatches[0][0].kinds,
                       [Constants.EntityPool.emptySlot])
    }

    func testSpecialTokensUseAsciiCaseInsensitiveNames() throws {
        let list = try loadSingleSpawn(type: "ChAlLeNgEfRuIt,RaNdOm,BoMb")
        XCTAssertEqual(list.waves[0].spawners[0].types,
                       [.challengeFruit, .random, .bomb])
    }

    func testChallengeFruitTokenBindsOnlyInjectedID() throws {
        let list = try loadSingleSpawn(type: "challengeFruit")
        let director = WaveDirector(playerCount: 1, rng: QueueRandomSource())
        director.setChallengeFruit(11)
        director.beginGame(waves: list.waves, fruits: [])
        XCTAssertEqual(director.runtime.spawnBatches[0][0].kinds, [11])

        let ordinary = WaveDirector(playerCount: 1, rng: QueueRandomSource())
        ordinary.beginGame(waves: list.waves, fruits: [])
        XCTAssertEqual(ordinary.runtime.spawnBatches[0][0].kinds,
                       [Constants.EntityPool.emptySlot])
    }

    func testRealChallengeWaveListLoadsAllResourcesAndFindsFastFruit() throws {
        let fruitList = try OriginalContentLoader.loadFruits(from: contentData("fruitList.json"))
        let challengeWaves = try OriginalContentLoader.loadWaves(
            from: contentData("ch1challengeWaveList.json"), fruits: fruitList.fruits)

        XCTAssertEqual(challengeWaves.waves.count, 365)
        XCTAssertEqual(challengeWaves.waves.flatMap(\.spawners).count, 1714)
        XCTAssertTrue(challengeWaves.waves.allSatisfy { $0.name != nil && !$0.name!.isEmpty })

        let director = WaveDirector(playerCount: 1, rng: QueueRandomSource())
        // 固定测试随机源总返回 0；注入非首项水果，避免原版排除重抽在本测试永不收敛。
        director.setChallengeFruit(23)
        director.beginGame(waves: challengeWaves.waves, fruits: fruitList.fruits)
        XCTAssertTrue(director.configureChallengeWave(customWave: "FastFruit1", forceWave: true))

        let forcedIndex = try XCTUnwrap(director.runtime.forcedWaveIndex)
        XCTAssertEqual(challengeWaves.waves[forcedIndex].name, "fastFruit1")
    }

    private func loadSingleSpawn(type: String) throws -> OriginalWaveList {
        let json = """
        {"root":{"tag":"waveManagerFile","children":[
          {"tag":"WaveInfo","attrs":{"debugName":"w","waveNo":"0","until":"forever"},"children":[
            {"tag":"Spawn","attrs":{"type":"\(type)","min":"1","max":"1"},"children":[]}
          ]}
        ]}}
        """
        return try OriginalContentLoader.loadWaves(from: Data(json.utf8), fruitIndex: ["apple": 0])
    }

    private func makeFruitPair() -> (FruitInfo, FruitInfo) {
        var challenged = FruitInfo()
        challenged.name = "challenged"
        challenged.typeID = 7
        challenged.chance = 100
        var other = FruitInfo()
        other.name = "other"
        other.typeID = 9
        other.chance = 100
        return (challenged, other)
    }

    private func makeWave(name: String, waveNo: Int32, types: [SpawnKind]) -> WaveInfo {
        var spawner = Spawner()
        spawner.min = 1
        spawner.max = 1
        spawner.types = types
        var wave = WaveInfo()
        wave.name = name
        wave.waveNo = waveNo
        wave.until = Constants.WaveDefaults.untilForever
        wave.chanceRegrowth = 0
        wave.nextWait = 60
        wave.spawners = [spawner]
        return wave
    }

    private var repositoryRoot: URL {
        URL(fileURLWithPath: #filePath)
            .deletingLastPathComponent().deletingLastPathComponent().deletingLastPathComponent()
    }

    private func contentData(_ name: String) throws -> Data {
        try Data(contentsOf: repositoryRoot.appendingPathComponent("Content/\(name)"))
    }
}

private final class QueueRandomSource: RandomSource {
    private var ints: [Int32]
    private var state: UInt64 = 0
    private(set) var nextIntCalls = 0

    init(ints: [Int32] = []) { self.ints = ints }

    func nextInt(_ upperBound: Int32) -> Int32 {
        guard upperBound > 0 else { return 0 }
        nextIntCalls += 1
        state &+= 1
        guard !ints.isEmpty else { return 0 }
        let value = ints.removeFirst()
        return min(max(0, value), upperBound - 1)
    }

    func nextFloat() -> Float { 0 }
    func snapshot() -> UInt64 { state }
    func restore(_ s: UInt64) { state = s }
}
