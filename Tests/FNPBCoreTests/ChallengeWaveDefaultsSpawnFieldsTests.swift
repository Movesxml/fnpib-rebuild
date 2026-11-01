import XCTest
import simd
@testable import FNPBCore

/// FUN_00058ee4 的 defaults 继承与 FUN_000537ec 的完整 Spawn 字段解析。
final class ChallengeWaveDefaultsSpawnFieldsTests: XCTestCase {
    private let fruitIndex: [String: Int32] = ["apple": 0, "watermelon": 1]

    private let challengeLikeJSON = """
    {"root":{"tag":"waveManagerFile","children":[
      {"tag":"defaults","attrs":{
        "waveChance":"10","waveChanceRegrowth":"0.25","criticalChance":"1",
        "dt":"0.9","dtInc":"0.01","dtSpInc":"0.009",
        "beforeDelay":"0.5","beforeDelayInc":"0.02",
        "nextDelay":"0.1","nextDelayInc":"0.03","nextDelaySpInc":"0.04",
        "speedLoss":"4","overideProbabiltyPool":"150",
        "waitForEntities":"false","waitForProcessing":"true",
        "players":"1,2","globalDtStart":"1","globalDtInc":"0.0001","globalDtMax":"1.5"
      },"children":[]},
      {"tag":"WaveInfo","attrs":{"waveNo":"0","until":"forever","overideProbabiltyPool":"200"},"children":[
        {"tag":"Wave_dt","attrs":{"dt":"0.7","inc":"0.1","spinc":"0.02"},"children":[]},
        {"tag":"NextWaveDelay","attrs":{
          "wait":"2.5","waitSpinc":"0.3","speedLoss":"0.4","delay":"1.5","inc":"0.2",
          "waitForEntities":"true","waitForProcessing":"false"
        },"children":[]},
        {"tag":"Spawn","attrs":{
          "min":"1","max":"2","mininc":"3","maxinc":"5","delay":"0.5","delayinc":"0.1",
          "horizmin":"-10","horizmax":"10","velscale":"2","velXscale":"3","velYscale":"4",
          "dt":"0.25","velX":"5","velY":"-6",
          "posX":"11","posY":"-12","sin":"13","cos":"-14","radius":"15",
          "gravity":"0, 1, 0","override":"override_any","placement":"top",
          "replaceWithChallengeFruit":"7","mirror":"true","type":"apple,bomb,random,watermelon"
        },"children":[]}
      ]},
      {"tag":"WaveInfo","attrs":{"waveNo":"1","until":"forever"},"children":[]}
    ]}}
    """

    func testDefaultsAreCopiedAndGlobalsStayOnWaveList() throws {
        let list = try loadChallengeLike()
        let defaults = list.defaults
        XCTAssertEqual(defaults.waveChance, 10)
        XCTAssertEqual(defaults.dt, 0.9)
        XCTAssertEqual(defaults.dtInc, 0.01)
        XCTAssertEqual(defaults.dtSpInc, 0.009)
        XCTAssertEqual(defaults.beforeDelay, 0.5)
        XCTAssertEqual(defaults.beforeDelayInc, 0.02)
        XCTAssertEqual(defaults.nextDelay, 0.1)
        XCTAssertEqual(defaults.nextDelayInc, 0.03)
        XCTAssertEqual(defaults.nextDelaySpInc, 0.04)
        XCTAssertEqual(defaults.speedLoss, 4)
        XCTAssertEqual(defaults.overrideProbabilityPool, 150)
        XCTAssertEqual(defaults.playersRaw, "1,2")
        XCTAssertEqual(defaults.globalDtStart, 1)
        XCTAssertEqual(defaults.globalDtInc, 0.0001)
        XCTAssertEqual(defaults.globalDtMax, 1.5)

        let inherited = list.waves[1]
        XCTAssertEqual(inherited.chance, 10)
        XCTAssertEqual(inherited.dt, 0.9)
        XCTAssertEqual(inherited.dtInc, 0.01)
        XCTAssertEqual(inherited.dtSpInc, 0.009)
        XCTAssertEqual(inherited.beforeDelay, 0.5)
        XCTAssertEqual(inherited.beforeDelayInc, 0.02)
        XCTAssertEqual(inherited.nextDelay, 0.1)
        XCTAssertEqual(inherited.nextDelayInc, 0.03)
        XCTAssertEqual(inherited.nextDelaySpInc, 0.04)
        XCTAssertEqual(inherited.speedLoss, 4)
        XCTAssertEqual(inherited.overrideProbabilityPool, 150)
        XCTAssertFalse(inherited.waitForEntities)
        XCTAssertTrue(inherited.waitForProcessing)
        XCTAssertNotEqual(inherited.dt, defaults.globalDtStart)
    }

    func testExplicitWaveAndSpawnFieldsOverrideDefaultsInOriginalOrder() throws {
        let list = try loadChallengeLike()
        let wave = list.waves[0]
        XCTAssertEqual(wave.dt, 0.7)
        XCTAssertEqual(wave.dtInc, 0.1)
        XCTAssertEqual(wave.dtSpInc, 0.02)
        XCTAssertEqual(wave.nextWait, 2.5)
        XCTAssertEqual(wave.nextWaitSpInc, 0.3)
        XCTAssertEqual(wave.speedLoss, 0.4)
        XCTAssertEqual(wave.nextDelay, 1.5)
        XCTAssertEqual(wave.nextDelayInc, 0.2)
        XCTAssertEqual(wave.overrideProbabilityPool, 200)
        XCTAssertTrue(wave.waitForEntities)
        XCTAssertFalse(wave.waitForProcessing)

        let spawn = try XCTUnwrap(wave.spawners.first)
        XCTAssertEqual(spawn.types, [.fruit(0), .bomb, .random, .fruit(1)])
        XCTAssertEqual(spawn.min, 1)
        XCTAssertEqual(spawn.max, 2)
        XCTAssertEqual(spawn.minInc, 5)
        XCTAssertEqual(spawn.maxInc, 5)
        XCTAssertEqual(spawn.delay, 0.5)
        XCTAssertEqual(spawn.delayInc, 0.1)
        XCTAssertEqual(spawn.horizMin, -10)
        XCTAssertEqual(spawn.horizMax, 10)
        XCTAssertEqual(spawn.dt, 0.25)
        XCTAssertEqual(spawn.velocityX, 5)
        XCTAssertEqual(spawn.velocityY, -6)
        XCTAssertEqual(spawn.velocityScaleX, 3)
        XCTAssertEqual(spawn.velocityScaleY, 4)
        XCTAssertEqual(spawn.gravity, SIMD3<Float>(0, 1, 0))
        XCTAssertEqual(spawn.posX, 11)
        XCTAssertEqual(spawn.posY, -12)
        XCTAssertEqual(spawn.sin, 13)
        XCTAssertEqual(spawn.cos, -14)
        XCTAssertEqual(spawn.radius, 15)
        XCTAssertEqual(spawn.overrideRaw, "override_any")
        XCTAssertEqual(spawn.overrideMode, 2)
        XCTAssertEqual(spawn.placementRaw, "top")
        XCTAssertEqual(spawn.placementCode, 1)
        XCTAssertEqual(spawn.replaceWithChallengeFruit, 7)
        XCTAssertTrue(spawn.mirror)
    }

    func testMissingDefaultsAndSpawnFieldsUseMachOConstructorValues() throws {
        let json = """
        {"root":{"tag":"waveManagerFile","children":[
          {"tag":"WaveInfo","attrs":{"waveNo":"0"},"children":[
            {"tag":"Spawn","attrs":{"type":"apple"},"children":[]}
          ]}
        ]}}
        """
        let list = try OriginalContentLoader.loadWaves(from: Data(json.utf8), fruitIndex: fruitIndex)
        XCTAssertEqual(list.waves[0].chance, 10)
        XCTAssertEqual(list.waves[0].overrideProbabilityPool, 100)
        let spawn = try XCTUnwrap(list.waves[0].spawners.first)
        XCTAssertEqual(spawn.horizMin, 1)
        XCTAssertEqual(spawn.horizMax, 1)
        XCTAssertEqual(spawn.velocityScaleX, 1)
        XCTAssertEqual(spawn.velocityScaleY, 1)
        XCTAssertEqual(spawn.dt, 0)
        XCTAssertNil(spawn.posX)
        XCTAssertNil(spawn.posY)
        XCTAssertNil(spawn.sin)
        XCTAssertNil(spawn.cos)
        XCTAssertNil(spawn.radius)
        XCTAssertNil(spawn.gravity)
        XCTAssertEqual(spawn.overrideMode, 1)
        XCTAssertNil(spawn.overrideRaw)
        XCTAssertEqual(spawn.placementCode, 0)
        XCTAssertNil(spawn.placementRaw)
        XCTAssertEqual(spawn.replaceWithChallengeFruit, 0)
        XCTAssertFalse(spawn.mirror)
    }

    func testAsciiOverrideAndPlacementMappingKeepsUnknownRaw() {
        XCTAssertEqual(Spawner.parseOverrideMode(for: nil), 1)
        XCTAssertEqual(Spawner.parseOverrideMode(for: ""), 1)
        XCTAssertEqual(Spawner.parseOverrideMode(for: "other"), 1)
        XCTAssertEqual(Spawner.parseOverrideMode(for: "override_any"), 2)
        XCTAssertEqual(Spawner.parseOverrideMode(for: "dont_override"), 2)
        XCTAssertEqual(Spawner.parsePlacementCode(for: "bottom"), 0)
        XCTAssertEqual(Spawner.parsePlacementCode(for: "top"), 1)
        XCTAssertEqual(Spawner.parsePlacementCode(for: "left"), 2)
        XCTAssertEqual(Spawner.parsePlacementCode(for: "right"), 3)
        XCTAssertEqual(Spawner.parsePlacementCode(for: "left_right"), 4)
        XCTAssertEqual(Spawner.parsePlacementCode(for: "unknown"), 0)
    }

    func testWaveAndSpawnerCodableRoundTrip() throws {
        let list = try loadChallengeLike()
        let waveData = try JSONEncoder().encode(list.waves[0])
        XCTAssertEqual(try JSONDecoder().decode(WaveInfo.self, from: waveData), list.waves[0])
        let spawn = try XCTUnwrap(list.waves[0].spawners.first)
        let spawnData = try JSONEncoder().encode(spawn)
        XCTAssertEqual(try JSONDecoder().decode(Spawner.self, from: spawnData), spawn)
    }

    func testRealChallengeDefaultsAndSpawnInventory() throws {
        let fruits = try OriginalContentLoader.loadFruits(from: contentData("fruitList.json"))
        let list = try OriginalContentLoader.loadWaves(
            from: contentData("ch1challengeWaveList.json"), fruits: fruits.fruits)
        XCTAssertEqual(list.defaults.dt, 0.9)
        XCTAssertEqual(list.defaults.dtSpInc, 0.009)
        XCTAssertEqual(list.defaults.speedLoss, 4)
        XCTAssertEqual(list.defaults.beforeDelay, 0.5)
        XCTAssertEqual(list.defaults.overrideProbabilityPool, 150)
        XCTAssertEqual(list.defaults.globalDtStart, 1)
        XCTAssertEqual(list.defaults.globalDtInc, 0)
        XCTAssertEqual(list.defaults.globalDtMax, 1)

        let spawns = list.waves.flatMap(\.spawners)
        XCTAssertEqual(spawns.count, 1714)
        XCTAssertTrue(spawns.allSatisfy { !$0.types.isEmpty })
        // 原始资源的清单数字是 type 标记总数，不是“包含该标记的 Spawn 数”。
        // 一个 Spawn 可以包含多个 challengeFruit/bomb/random，两种口径必须分别验证。
        let spawnTypes = spawns.flatMap(\.types)
        XCTAssertEqual(spawnTypes.filter { $0 == .challengeFruit }.count, 1245)
        XCTAssertEqual(spawnTypes.filter { $0 == .bomb }.count, 599)
        XCTAssertEqual(spawnTypes.filter { $0 == .random }.count, 219)
        XCTAssertEqual(spawnTypes.filter { $0 == .empty }.count, 18)
        XCTAssertEqual(spawns.filter { $0.types.contains(.challengeFruit) }.count, 1045)
        XCTAssertEqual(spawns.filter { $0.types.contains(.bomb) }.count, 544)
        XCTAssertEqual(spawns.filter { $0.types.contains(.random) }.count, 205)
        XCTAssertEqual(spawns.filter { $0.types.contains(.empty) }.count, 18)
        XCTAssertTrue(list.waves.allSatisfy { $0.overrideProbabilityPool == 150 })
        XCTAssertEqual(list.waves[0].dtSpInc, 0.009, accuracy: 1e-6)
        XCTAssertEqual(list.waves[0].beforeDelay, 0.5, accuracy: 1e-6)
        XCTAssertEqual(list.waves[0].speedLoss, 4, accuracy: 1e-6)
    }

    private func loadChallengeLike() throws -> OriginalWaveList {
        try OriginalContentLoader.loadWaves(from: Data(challengeLikeJSON.utf8), fruitIndex: fruitIndex)
    }

    private var repositoryRoot: URL {
        URL(fileURLWithPath: #filePath)
            .deletingLastPathComponent().deletingLastPathComponent().deletingLastPathComponent()
    }

    private func contentData(_ name: String) throws -> Data {
        try Data(contentsOf: repositoryRoot.appendingPathComponent("Content/\(name)"))
    }
}
