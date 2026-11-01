import XCTest
@testable import FNPBCore

/// FUN_00057c08 / FUN_000579c8 / FUN_00057c90 / FUN_00054dd8 的挑战选波分支。
final class ChallengeWaveConfigurationTests: XCTestCase {

    func testForceWaveLocksFirstAndConsecutiveSelections() {
        let normal = makeWave(name: "normal", waveNo: 0)
        let target = makeWave(name: "target", waveNo: 5)
        let director = WaveDirector(playerCount: 1, rng: SeededRandomSource(seed: 1))
        director.beginGame(waves: [normal, target], fruits: [])

        XCTAssertEqual(director.runtime.currentWaveIndex, 0)
        XCTAssertNil(director.runtime.forcedWaveIndex)
        XCTAssertTrue(director.configureChallengeWave(customWave: "target", forceWave: true))
        XCTAssertEqual(director.runtime.forcedWaveIndex, 1)
        XCTAssertEqual(director.runtime.currentWaveIndex, 1)
        XCTAssertEqual(director.runtime.waveActivationCount, 1)

        director.selectNextWave()
        XCTAssertEqual(director.runtime.currentWaveIndex, 1)
        XCTAssertEqual(director.runtime.waveActivationCount, 2)
        XCTAssertEqual(director.runtime.currentWaveSpInc, 2)
    }

    func testForceWaveSkipsOrdinaryRegrowAndWeightSelection() {
        let normal = makeWave(name: "normal", waveNo: 0)
        var target = makeWave(name: "target", waveNo: 5)
        target.chance = 100
        target.chanceRegrowth = 0.5
        var other = makeWave(name: "other", waveNo: 6)
        other.chance = 100
        other.chanceRegrowth = 0.5

        let rng = CountingRandomSource(seed: 2)
        let director = WaveDirector(playerCount: 1, rng: rng)
        director.beginGame(waves: [normal, target, other], fruits: [])
        XCTAssertEqual(director.runtime.currentChances[1], 50)
        XCTAssertEqual(director.runtime.currentChances[2], 50)

        let callsBefore = rng.nextIntCalls
        XCTAssertTrue(director.configureChallengeWave(customWave: "target", forceWave: true))
        XCTAssertEqual(rng.nextIntCalls, callsBefore)
        XCTAssertEqual(director.runtime.currentChances[1], 50,
                       "forced 分支绕过普通选中清零，不能误清 currentChance")
        XCTAssertEqual(director.runtime.currentChances[2], 50)

        director.selectNextWave()
        XCTAssertEqual(rng.nextIntCalls, callsBefore)
        XCTAssertEqual(director.runtime.currentChances, [0, 50, 50])
    }

    func testNonForceSetsWaveNoMinusOneThenUsesNormalSelection() {
        var first = makeWave(name: "first", waveNo: 0)
        first.chance = 100
        first.chanceRegrowth = 0.5
        var target = makeWave(name: "target", waveNo: 5)
        target.chance = 100
        target.chanceRegrowth = 0.5

        // 配置后的普通多候选权重抽取固定返回 0，应选 first 而非同名 target。
        let director = WaveDirector(playerCount: 1, rng: QueuedIndexRandomSource(indices: [0]))
        director.beginGame(waves: [first, target], fruits: [])
        XCTAssertTrue(director.configureChallengeWave(customWave: "target", forceWave: false))

        XCTAssertNil(director.runtime.forcedWaveIndex)
        XCTAssertEqual(director.runtime.waveActivationCount, 5)
        XCTAssertEqual(director.runtime.currentWaveIndex, 0)
        XCTAssertEqual(director.runtime.currentChances, [0, 75])
    }

    func testUnknownNameClearsForcedAndDoesNotSelect() {
        let normal = makeWave(name: "normal", waveNo: 0)
        let target = makeWave(name: "target", waveNo: 1)
        let director = WaveDirector(playerCount: 1, rng: SeededRandomSource(seed: 4))
        director.beginGame(waves: [normal, target], fruits: [])
        XCTAssertTrue(director.configureChallengeWave(customWave: "target", forceWave: true))

        let activationBefore = director.runtime.waveActivationCount
        let indexBefore = director.runtime.currentWaveIndex
        XCTAssertFalse(director.configureChallengeWave(customWave: "missing", forceWave: true))
        XCTAssertNil(director.runtime.forcedWaveIndex)
        XCTAssertEqual(director.runtime.waveActivationCount, activationBefore)
        XCTAssertEqual(director.runtime.currentWaveIndex, indexBefore)

        XCTAssertFalse(director.configureChallengeWave(customWave: nil, forceWave: false))
        XCTAssertFalse(director.configureChallengeWave(customWave: "", forceWave: false))
    }

    func testDuplicateNameUsesFirstWave() {
        let normal = makeWave(name: "normal", waveNo: 0)
        let first = makeWave(name: "dup", waveNo: 10)
        let second = makeWave(name: "dup", waveNo: 20)
        let director = WaveDirector(playerCount: 1, rng: SeededRandomSource(seed: 5))
        director.beginGame(waves: [normal, first, second], fruits: [])

        XCTAssertTrue(director.configureChallengeWave(customWave: "dup", forceWave: true))
        XCTAssertEqual(director.runtime.forcedWaveIndex, 1)
        XCTAssertEqual(director.runtime.currentWaveIndex, 1)
    }

    func testOrdinaryBeginGameDoesNotForceNamedWave() {
        let first = makeWave(name: "a", waveNo: 0)
        let second = makeWave(name: "b", waveNo: 1)
        let director = WaveDirector(playerCount: 1, rng: SeededRandomSource(seed: 6))
        director.beginGame(waves: [first, second], fruits: [])

        XCTAssertNil(director.runtime.forcedWaveIndex)
        XCTAssertEqual(director.runtime.waveActivationCount, 0)
        XCTAssertEqual(director.runtime.currentWaveIndex, 0)
        XCTAssertEqual(director.runtime.currentWaveSpInc, 0)
    }

    func testLoaderPreservesExplicitWaveNameWithoutInventingMissingNames() throws {
        let json = #"""
        {"root":{"tag":"waveManagerFile","attrs":{},"children":[
          {"tag":"WaveInfo","attrs":{"name":"alpha","waveNo":"0","until":"forever"},"children":[]},
          {"tag":"WaveInfo","attrs":{"waveNo":"1","until":"forever"},"children":[]}
        ]}}
        """#
        let list = try OriginalContentLoader.loadWaves(from: Data(json.utf8), fruitIndex: [:])
        XCTAssertEqual(list.waves.map(\.name), ["alpha", nil])
    }

    func testWaveInfoNameCodableRemainsCompatibleWithOldData() throws {
        var wave = WaveInfo()
        wave.name = "codable-wave"
        let encoded = try JSONEncoder().encode(wave)
        XCTAssertEqual(try JSONDecoder().decode(WaveInfo.self, from: encoded).name, "codable-wave")

        var object = try XCTUnwrap(JSONSerialization.jsonObject(with: encoded) as? [String: Any])
        object.removeValue(forKey: "name")
        let oldData = try JSONSerialization.data(withJSONObject: object)
        XCTAssertNil(try JSONDecoder().decode(WaveInfo.self, from: oldData).name)
    }

    private func makeWave(name: String, waveNo: Int32) -> WaveInfo {
        var spawner = Spawner()
        spawner.name = "s-\(name)"
        spawner.min = 1
        spawner.max = 1
        spawner.types = [.fruit(1)]

        var wave = WaveInfo()
        wave.name = name
        wave.waveNo = waveNo
        wave.until = Constants.WaveDefaults.untilForever
        wave.chanceRegrowth = 0
        wave.nextWait = 60
        wave.spawners = [spawner]
        return wave
    }
}
