import XCTest
import FNPBCore

final class OriginalContentTests: XCTestCase {
    private let inlineFruitListJSON = """
    {
      "source": "inline", "bytes": 0, "encoding": "bxml",
      "root": {"tag": "fruitInfoFile", "attrs": {}, "children": [
        {"tag": "FruitInfo", "attrs": {"name": "apple", "chance": "100", "score": "1", "scale": "25", "collision": "1", "hitInfluence": "0.75", "onSide": "true", "onlySprinkle": "false", "noCritical": "true"}, "children": []},
        {"tag": "FruitInfo", "attrs": {"name": "watermelon", "score": "0", "onside": "false", "onSide": "true", "noCritical": "false"}, "children": []},
        {"tag": "critical", "attrs": {"new_life_at": "10", "score": "10", "chance": "5", "chance_inc": "1", "splats": "3", "colour": "0,140,245,170", "scale": "30", "spread": "2.5", "disappear_speed": "0.5"}, "children": []},
        {"tag": "bomb", "attrs": {"size": "12", "collision": "2"}, "children": []}
      ]}
    }
    """

    private let inlineWaveListJSON = """
    {
      "source": "inline", "bytes": 0, "encoding": "bxml",
      "root": {"tag": "waveManagerFile", "attrs": {}, "children": [
        {"tag": "defaults", "attrs": {"waveChance": "90", "waveChanceGrowth": "0.5", "waveChanceRegrowth": "0.4", "criticalChance": "0.25"}, "children": []},
        {"tag": "WaveInfo", "attrs": {"waveNo": "1", "until": "3", "chance": "100"}, "children": [
          {"tag": "Wave_dt", "attrs": {"dt": "0.7", "inc": "0.1", "spinc": "0.01"}, "children": []},
          {"tag": "NextWaveDelay", "attrs": {"delay": "1.5", "inc": "0.2", "wait": "2.5", "waitSpinc": "0.3", "speedLoss": "0.4", "waitForEntities": "true", "waitForProcessing": "false"}, "children": []},
          {"tag": "Spawn", "attrs": {"min": "1", "max": "2", "mininc": "2", "maxinc": "5", "delay": "0.5", "delayinc": "0.1", "velX": "5", "velY": "-6", "velscale": "2", "velXscale": "3", "gravity": "0, 1, 0", "type": "apple, bomb, random ,watermelon"}, "children": []}
        ]},
        {"tag": "WaveInfo", "attrs": {"waveNo": "1", "until": ""}, "children": []},
        {"tag": "WaveInfo", "attrs": {"waveNo": "3", "until": "1", "chanceRegrowth": "0.7"}, "children": []}
      ]}
    }
    """

    private var fruitIndex: [String: Int32] { ["apple": 0, "watermelon": 1] }

    func testInlineFruitListParsesFieldsAndKeepsCriticalSeparate() throws {
        let list = try OriginalContentLoader.loadFruits(from: Data(inlineFruitListJSON.utf8))
        XCTAssertEqual(list.fruits.count, 2)
        let apple = list.fruits[0]
        XCTAssertEqual(apple.name, "apple")
        XCTAssertEqual(apple.typeID, 0)
        XCTAssertEqual(apple.chance, 100)
        XCTAssertEqual(apple.score, 1)
        XCTAssertFalse(apple.noScore)
        XCTAssertEqual(apple.scale, 25, accuracy: 1e-5)
        XCTAssertEqual(apple.collision, 1, accuracy: 1e-5)
        XCTAssertEqual(apple.hitInfluence, 0.75, accuracy: 1e-5)
        XCTAssertTrue(apple.onside)
        XCTAssertFalse(apple.onlySprinkle)
        XCTAssertFalse(apple.noCritical, "原版 noCritical=true 的 strcmp 分支会清除标记")

        let watermelon = list.fruits[1]
        XCTAssertEqual(watermelon.typeID, 1)
        XCTAssertNil(watermelon.chance)
        XCTAssertTrue(watermelon.noScore)
        XCTAssertFalse(watermelon.onside, "小写 onside 必须先于 onSide")
        XCTAssertTrue(watermelon.noCritical, "原版 noCritical=false 的 strcmp 分支会置位")

        let critical = try XCTUnwrap(list.critical)
        XCTAssertEqual(critical.newLifeAt, 10)
        XCTAssertEqual(critical.score, 10)
        XCTAssertEqual(critical.chance, 5)
        XCTAssertEqual(critical.chanceInc, 1)
        XCTAssertEqual(critical.splats, 3)
        XCTAssertEqual(critical.colour, "0,140,245,170")
        XCTAssertEqual(critical.scale, 30)
        XCTAssertEqual(critical.spread, 2.5)
        XCTAssertEqual(critical.disappearSpeed, 0.5)
        XCTAssertEqual(apple.chance, 100)
        XCTAssertNil(watermelon.chance)
        XCTAssertNil(watermelon.chanceInc)
        XCTAssertNil(watermelon.spread)
        XCTAssertEqual(list.bomb.size, 12, accuracy: 1e-5)
        XCTAssertEqual(list.bomb.collision, 2, accuracy: 1e-5)
    }

    func testInlineFruitListRejectsInvalidNumberAndBoolean() {
        let badScore = """
        {"root":{"tag":"fruitInfoFile","children":[{"tag":"FruitInfo","attrs":{"name":"apple","score":"abc"}}]}}
        """
        XCTAssertThrowsError(try OriginalContentLoader.loadFruits(from: Data(badScore.utf8))) { error in
            guard case let OriginalContentError.invalidNumber(_, attribute, raw, path) = error else {
                return XCTFail("期望 invalidNumber，实际 \(error)")
            }
            XCTAssertEqual(attribute, "score")
            XCTAssertEqual(raw, "abc")
            XCTAssertTrue(path.contains("FruitInfo[0]"))
        }

        let badBool = """
        {"root":{"tag":"fruitInfoFile","children":[{"tag":"FruitInfo","attrs":{"name":"apple","onSide":"maybe"}}]}}
        """
        XCTAssertThrowsError(try OriginalContentLoader.loadFruits(from: Data(badBool.utf8))) { error in
            guard case let OriginalContentError.invalidBoolean(_, attribute, raw, _) = error else {
                return XCTFail("期望 invalidBoolean，实际 \(error)")
            }
            XCTAssertEqual(attribute, "onSide")
            XCTAssertEqual(raw, "maybe")
        }
    }

    func testInlineFruitListRejectsMissingNameAndWrongRoot() {
        let missingName = """
        {"root":{"tag":"fruitInfoFile","children":[{"tag":"FruitInfo","attrs":{"score":"1"}}]}}
        """
        XCTAssertThrowsError(try OriginalContentLoader.loadFruits(from: Data(missingName.utf8))) { error in
            guard case let OriginalContentError.missingAttribute(node, attribute, _) = error else {
                return XCTFail("期望 missingAttribute，实际 \(error)")
            }
            XCTAssertEqual(node, "FruitInfo")
            XCTAssertEqual(attribute, "name")
        }

        let wrongRoot = #"{"root":{"tag":"FruitList","children":[]}}"#
        XCTAssertThrowsError(try OriginalContentLoader.loadFruits(from: Data(wrongRoot.utf8))) { error in
            guard case let OriginalContentError.unexpectedRoot(expected, actual) = error else {
                return XCTFail("期望 unexpectedRoot，实际 \(error)")
            }
            XCTAssertEqual(expected, "fruitInfoFile")
            XCTAssertEqual(actual, "FruitList")
        }
    }

    func testInlineWaveListMapsSpawnKindsAndMaxIncInOrder() throws {
        let list = try OriginalContentLoader.loadWaves(from: Data(inlineWaveListJSON.utf8),
                                                       fruitIndex: fruitIndex)
        XCTAssertEqual(list.waves.count, 3)
        let spawn = try XCTUnwrap(list.waves[0].spawners.first)
        XCTAssertEqual(spawn.types, [.fruit(0), .bomb, .random, .fruit(1)])
        XCTAssertEqual(spawn.min, 1, accuracy: 1e-5)
        XCTAssertEqual(spawn.max, 2, accuracy: 1e-5)
        XCTAssertEqual(spawn.minInc, 5, accuracy: 1e-5)
        XCTAssertEqual(spawn.maxInc, 5, accuracy: 1e-5)
        XCTAssertEqual(spawn.delay, 0.5, accuracy: 1e-5)
        XCTAssertEqual(spawn.delayInc, 0.1, accuracy: 1e-5)
        XCTAssertEqual(spawn.velocityX, 5, accuracy: 1e-5)
        XCTAssertEqual(spawn.velocityY, -6, accuracy: 1e-5)
        XCTAssertEqual(spawn.velocityScaleX, 3, accuracy: 1e-5,
                       "velXscale 必须覆盖 velscale")
        XCTAssertEqual(spawn.velocityScaleY, 2, accuracy: 1e-5,
                       "未提供 velYscale 时继承 velscale")
        XCTAssertEqual(spawn.gravity, SIMD3<Float>(0, 1, 0))
    }

    func testSpawnRejectsMalformedGravityWithContentPath() {
        let json = """
        {"root":{"tag":"waveManagerFile","children":[
          {"tag":"WaveInfo","attrs":{"waveNo":"0"},"children":[
            {"tag":"Spawn","attrs":{"type":"apple","gravity":"0,1"},"children":[]}
          ]}
        ]}}
        """
        XCTAssertThrowsError(try OriginalContentLoader.loadWaves(from: Data(json.utf8),
                                                                fruitIndex: fruitIndex)) { error in
            guard case let OriginalContentError.invalidNumber(_, attribute, raw, path) = error else {
                return XCTFail("期望 gravity invalidNumber，实际 \(error)")
            }
            XCTAssertEqual(attribute, "gravity")
            XCTAssertEqual(raw, "0,1")
            XCTAssertTrue(path.contains("Spawn["))
        }
    }

    func testInlineWaveListMapsDelaysDefaultsAndPerWaveOverrides() throws {
        let list = try OriginalContentLoader.loadWaves(from: Data(inlineWaveListJSON.utf8),
                                                       fruitIndex: fruitIndex)
        XCTAssertEqual(list.defaults.waveChance, 90)
        XCTAssertEqual(list.defaults.waveChanceRegrowth, 0.4)
        XCTAssertEqual(list.defaults.criticalChance, 0.25)
        XCTAssertEqual(list.defaults.raw["waveChanceGrowth"], "0.5")

        let first = list.waves[0]
        XCTAssertEqual(first.dt, 0.7, accuracy: 1e-5)
        XCTAssertEqual(first.dtInc, 0.1, accuracy: 1e-5)
        XCTAssertEqual(first.dtSpInc, 0.01, accuracy: 1e-5)
        XCTAssertEqual(first.nextWait, 2.5, accuracy: 1e-5)
        XCTAssertEqual(first.nextWaitSpInc, 0.3, accuracy: 1e-5)
        XCTAssertEqual(first.nextDelay, 1.5, accuracy: 1e-5)
        XCTAssertEqual(first.nextDelayInc, 0.2, accuracy: 1e-5)
        XCTAssertEqual(first.speedLoss, 0.4, accuracy: 1e-5)
        XCTAssertTrue(first.waitForEntities)
        XCTAssertFalse(first.waitForProcessing)
        XCTAssertEqual(first.chanceRegrowth, 0.4, accuracy: 1e-5)
        XCTAssertEqual(first.criticalChance, 0.25, accuracy: 1e-5)
        XCTAssertEqual(list.waves[2].chanceRegrowth, 0.7, accuracy: 1e-5)
    }

    func testPositiveWaitClearsDelayAndIncrementBeforeExplicitValues() throws {
        let json = """
        {"root":{"tag":"waveManagerFile","children":[
          {"tag":"WaveInfo","attrs":{"waveNo":"0"},"children":[
            {"tag":"NextWaveDelay","attrs":{"wait":"2"},"children":[]}
          ]}
        ]}}
        """
        let list = try OriginalContentLoader.loadWaves(from: Data(json.utf8), fruitIndex: fruitIndex)
        XCTAssertEqual(list.waves[0].nextWait, 2, accuracy: 1e-5)
        XCTAssertEqual(list.waves[0].nextDelay, 0, accuracy: 1e-5)
        XCTAssertEqual(list.waves[0].nextDelayInc, 0, accuracy: 1e-5)
    }

    func testInlineWaveListDuplicatesAndUntilPostProcess() throws {
        let list = try OriginalContentLoader.loadWaves(from: Data(inlineWaveListJSON.utf8),
                                                       fruitIndex: fruitIndex)
        XCTAssertEqual(list.waves.map { $0.waveNo }, [1, 1, 3])
        XCTAssertEqual(list.waves.map { $0.until }, [3, 2, -2])
    }

    func testInlineWaveListRejectsUnknownMissingAndEmptyTypes() {
        let cases = ["apple,dragonfruit", nil, "apple,,bomb"]
        for type in cases {
            let typeAttribute = type.map { ",\"type\":\"\($0)\"" } ?? ""
            let json = """
            {"root":{"tag":"waveManagerFile","children":[
              {"tag":"WaveInfo","attrs":{"waveNo":"0"},"children":[
                {"tag":"Spawn","attrs":{"name":"x"\(typeAttribute)},"children":[]}
              ]}
            ]}}
            """
            XCTAssertThrowsError(try OriginalContentLoader.loadWaves(from: Data(json.utf8),
                                                                    fruitIndex: fruitIndex))
        }
    }

    func testComboBonusesFollowDocumentOrderAndRejectMissingData() throws {
        let json = """
        {"root":{"tag":"bonusAwardsFile","children":[
          {"tag":"combo","attrs":{"length":"3","bonus":"3"}},
          {"tag":"bonusType","attrs":{"total":"combo_bonus"},"children":[]},
          {"tag":"combo","attrs":{"length":"4","bonus":"7"}}
        ]}}
        """
        XCTAssertEqual(try OriginalContentLoader.loadComboBonuses(from: Data(json.utf8)), [3, 7],
                       "length 只是原始元数据，数组严格按 combo 文档顺序")

        let missingBonus = #"{"root":{"tag":"bonusAwardsFile","children":[{"tag":"combo","attrs":{"length":"3"}}]}}"#
        XCTAssertThrowsError(try OriginalContentLoader.loadComboBonuses(from: Data(missingBonus.utf8))) { error in
            guard case OriginalContentError.missingAttribute(_, let attribute, _) = error else {
                return XCTFail("缺少 bonus 必须报错，实际 \(error)")
            }
            XCTAssertEqual(attribute, "bonus")
        }

        let invalidBonus = #"{"root":{"tag":"bonusAwardsFile","children":[{"tag":"combo","attrs":{"bonus":"x"}}]}}"#
        XCTAssertThrowsError(try OriginalContentLoader.loadComboBonuses(from: Data(invalidBonus.utf8)))

        let empty = #"{"root":{"tag":"bonusAwardsFile","children":[]}}"#
        XCTAssertThrowsError(try OriginalContentLoader.loadComboBonuses(from: Data(empty.utf8))) { error in
            guard case OriginalContentError.emptyComboBonuses = error else {
                return XCTFail("空奖励表必须报错，实际 \(error)")
            }
        }
    }

    func testRealContentFilesLoadExactly() throws {
        let content = try OriginalContentLoader.load(
            fruitsData: contentData("fruitList.json"),
            wavesData: contentData("originalWaveList.json"),
            bonusAwardsData: contentData("bonusAwards.json"))

        XCTAssertEqual(content.comboBonuses, [3, 4, 5, 7, 9, 12, 14, 17])
        XCTAssertEqual(content.fruits.fruits.count, 24)
        XCTAssertEqual(content.fruits.fruits[0].name, "apple")
        XCTAssertEqual(content.fruits.fruits[0].typeID, 0)
        XCTAssertEqual(content.fruits.fruits[0].score, 1)
        XCTAssertFalse(content.fruits.fruits[0].noScore)
        let bean = try XCTUnwrap(content.fruits.fruits.first { $0.name == "bean" })
        XCTAssertEqual(bean.powers.count, 1)
        XCTAssertEqual(bean.powers[0].name, "extralife")
        XCTAssertEqual(bean.powers[0].chance, 100)
        XCTAssertEqual(bean.score, 1, "真实 bean 未写 score，同样保留构造器缺省 1")
        XCTAssertFalse(bean.noScore)
        XCTAssertEqual(content.fruits.fruits[3].name, "watermelon")
        XCTAssertEqual(content.fruits.fruits[3].typeID, 3)
        XCTAssertEqual(content.fruits.fruits[23].name, "pear_gold")
        XCTAssertEqual(content.fruits.fruits[23].typeID, 23)
        for (offset, fruit) in content.fruits.fruits.enumerated() {
            XCTAssertEqual(fruit.typeID, Int32(offset))
        }
        XCTAssertEqual(content.fruits.bomb.size, 55, accuracy: 1e-5)
        XCTAssertEqual(content.fruits.bomb.collision, 35, accuracy: 1e-5)
        XCTAssertEqual(content.fruits.critical?.score, 10)
        XCTAssertEqual(content.fruits.critical?.chance, 50)

        XCTAssertEqual(content.waves.waves.count, 38)
        XCTAssertEqual(content.waves.defaults.waveChance, 90)
        XCTAssertNil(content.waves.defaults.waveChanceRegrowth)
        XCTAssertEqual(content.waves.defaults.raw["waveChanceGrowth"], "0.33")
        let allSpawns = content.waves.waves.flatMap { $0.spawners }
        XCTAssertEqual(allSpawns.count, 42)
        XCTAssertTrue(allSpawns.allSatisfy { !$0.types.isEmpty })
        for spawn in allSpawns {
            XCTAssertEqual(spawn.velocityX, 0, accuracy: 1e-6)
            XCTAssertEqual(spawn.velocityY, 0, accuracy: 1e-6)
            XCTAssertEqual(spawn.velocityScaleX, 0, accuracy: 1e-6)
            XCTAssertEqual(spawn.velocityScaleY, 0, accuracy: 1e-6)
            XCTAssertNil(spawn.gravity, "真实 42 个 Spawn 均未提供 gravity")
        }
        let fruitCount = Int32(content.fruits.fruits.count)
        for kind in allSpawns.flatMap({ $0.types }) {
            if case let .fruit(typeID) = kind {
                XCTAssertTrue((0..<fruitCount).contains(typeID))
            }
        }
        let counts = Dictionary(grouping: content.waves.waves, by: { $0.waveNo }).mapValues { $0.count }
        XCTAssertTrue(counts.values.contains { $0 > 1 })
        for wave in content.waves.waves {
            XCTAssertTrue(wave.until == -2 || wave.until >= wave.waveNo)
        }
    }

    func testRealWave0ValuesAndRealDefaultsAreNotAliased() throws {
        let content = try OriginalContentLoader.load(
            fruitsData: contentData("fruitList.json"),
            wavesData: contentData("originalWaveList.json"),
            bonusAwardsData: contentData("bonusAwards.json"))
        let wave0 = content.waves.waves[0]
        XCTAssertEqual(wave0.waveNo, 0)
        XCTAssertEqual(wave0.chance, 90, "缺省波次权重继承 defaults.waveChance")
        XCTAssertEqual(wave0.dt, 0.7, accuracy: 1e-5)
        XCTAssertEqual(wave0.chanceRegrowth, 0.25, accuracy: 1e-5,
                       "真实 waveChanceGrowth 不是原解析器的 waveChanceRegrowth")
        XCTAssertEqual(wave0.criticalChance, 1.0, accuracy: 1e-5)
        let watermelonSpawns = wave0.spawners.filter { $0.types.contains(.fruit(3)) }
        XCTAssertEqual(watermelonSpawns.count, 1)
        XCTAssertEqual(watermelonSpawns[0].min, 1, accuracy: 1e-5)
        XCTAssertEqual(watermelonSpawns[0].max, 1, accuracy: 1e-5)
    }

    private var repositoryRoot: URL {
        URL(fileURLWithPath: #filePath)
            .deletingLastPathComponent()
            .deletingLastPathComponent()
            .deletingLastPathComponent()
    }

    private func contentData(_ name: String) throws -> Data {
        try Data(contentsOf: repositoryRoot.appendingPathComponent("Content/\(name)"))
    }
}
