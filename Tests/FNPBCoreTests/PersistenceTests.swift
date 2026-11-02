import XCTest
import FNPBCore
import FNPBPlatform

final class PersistenceTests: XCTestCase {
    func testCriticalChanceUsesOriginalIntegerDefault() throws {
        XCTAssertEqual(SaveData.default.criticalChance, 70)
        let encoded = try JSONEncoder().encode(SaveData.default)
        let json = try JSONSerialization.jsonObject(with: encoded)
        let object = try XCTUnwrap(json as? [String: Any])
        XCTAssertEqual(object["critical_chance"] as? Int, 70)
    }

    func testLegacyCriticalChanceMigratesAsInteger() {
        let numeric = SaveStore.migrate(legacyValues: ["critical_chance": NSNumber(value: 42)])
        let textual = SaveStore.migrate(legacyValues: ["critical_chance": "43"])
        XCTAssertEqual(numeric.criticalChance, 42)
        XCTAssertEqual(textual.criticalChance, 43)
    }

    func testCriticalChanceRoundTripsWithoutFloatConversion() throws {
        let directory = FileManager.default.temporaryDirectory
            .appendingPathComponent(UUID().uuidString, isDirectory: true)
        defer { try? FileManager.default.removeItem(at: directory) }
        let store = SaveStore(directory: directory)
        var save = SaveData.default
        save.criticalChance = 37
        XCTAssertTrue(store.save(save))
        XCTAssertEqual(store.load().criticalChance, 37)
        let text = try String(contentsOf: store.fileURL, encoding: .utf8)
        XCTAssertTrue(text.contains("\"critical_chance\" : 37"))
    }

    func testLegacyJSONWithoutPersistentChallengeKeepsExistingValues() throws {
        let directory = FileManager.default.temporaryDirectory
            .appendingPathComponent(UUID().uuidString, isDirectory: true)
        defer { try? FileManager.default.removeItem(at: directory) }
        let store = SaveStore(directory: directory)
        try FileManager.default.createDirectory(at: directory, withIntermediateDirectories: true)
        let json = """
        {
          "version": 1,
          "highscore": { "default": 123 },
          "critical_chance": 42,
          "rated": true,
          "stats": { "slashes": 9 }
        }
        """
        try json.write(to: store.fileURL, atomically: true, encoding: .utf8)

        let loaded = store.load()
        XCTAssertEqual(loaded.highscores["default"], 123)
        XCTAssertEqual(loaded.criticalChance, 42)
        XCTAssertTrue(loaded.rated)
        XCTAssertEqual(loaded.stats["slashes"], 9)
        XCTAssertEqual(loaded.challengeDataPersistent, .empty)
    }

    func testLegacyPersistentRawStringAndDataArePreserved() throws {
        let rawData = Data([0x01, 0x02, 0x03])
        let migratedData = SaveStore.migrate(
            legacyValues: [SaveKeys.challengeDataPersistent: rawData])
        XCTAssertEqual(migratedData.challengeDataPersistent.legacyRaw,
                       rawData.base64EncodedString())

        let migratedString = SaveStore.migrate(
            legacyValues: [SaveKeys.challengeDataPersistent: "raw-string"])
        XCTAssertEqual(migratedString.challengeDataPersistent.legacyRaw, "raw-string")

        let encoded = try JSONEncoder().encode(migratedString)
        let decoded = try JSONDecoder().decode(SaveData.self, from: encoded)
        XCTAssertEqual(decoded.challengeDataPersistent.legacyRaw, "raw-string")
    }

    func testLegacyRawJSONStringSurvivesLoadAndRoundTrip() throws {
        let directory = FileManager.default.temporaryDirectory
            .appendingPathComponent(UUID().uuidString, isDirectory: true)
        defer { try? FileManager.default.removeItem(at: directory) }
        let store = SaveStore(directory: directory)
        try FileManager.default.createDirectory(at: directory, withIntermediateDirectories: true)
        try #"{"version":1,"challengeDataPersistent":"legacy-raw-blob"}"#.write(
            to: store.fileURL, atomically: true, encoding: .utf8)

        let loaded = store.load()
        XCTAssertEqual(loaded.challengeDataPersistent.legacyRaw, "legacy-raw-blob")
        let decoded = try JSONDecoder().decode(SaveData.self,
                                               from: try JSONEncoder().encode(loaded))
        XCTAssertEqual(decoded.challengeDataPersistent.legacyRaw, "legacy-raw-blob")
    }

    func testDiskAdapterPersistsSnapshotAndPreservesChallengePlays() throws {
        let directory = FileManager.default.temporaryDirectory
            .appendingPathComponent(UUID().uuidString, isDirectory: true)
        defer { try? FileManager.default.removeItem(at: directory) }
        let hash = OriginalStringHash.hash("disk-challenge")
        let key = ChallengeSelectionKey.challenge(hash)
        var save = SaveData.default
        save.challengeDataPersistent = ChallengeDataPersistent(challenges: [
            .init(name: Int32(bitPattern: hash), chance: 5, death: 1, plays: 9)
        ])
        XCTAssertTrue(SaveStore(directory: directory).save(save))

        let second = SaveStore(directory: directory)
        XCTAssertEqual(second.snapshot(forKey: key),
                       ChallengeSelectionSnapshot(current: 5, cooldown: 1))
        XCTAssertEqual(second.playCount(forKey: key), 9)
        second.setSnapshot(ChallengeSelectionSnapshot(current: 8, cooldown: 3), forKey: key)

        let third = SaveStore(directory: directory)
        XCTAssertEqual(third.snapshot(forKey: key),
                       ChallengeSelectionSnapshot(current: 8, cooldown: 3))
        XCTAssertEqual(third.playCount(forKey: key), 9)
    }

    func testDiskAdapterKeepsSameHashInIndependentTables() throws {
        let directory = FileManager.default.temporaryDirectory
            .appendingPathComponent(UUID().uuidString, isDirectory: true)
        defer { try? FileManager.default.removeItem(at: directory) }
        let hash = OriginalStringHash.hash("same-disk-name")
        let group = ChallengeSelectionKey.group(hash)
        let challenge = ChallengeSelectionKey.challenge(hash)
        let store = SaveStore(directory: directory)
        store.setSnapshot(ChallengeSelectionSnapshot(current: 4, cooldown: 2), forKey: group)
        store.setSnapshot(ChallengeSelectionSnapshot(current: 12, cooldown: 6), forKey: challenge)

        let reopened = SaveStore(directory: directory)
        XCTAssertEqual(reopened.snapshot(forKey: group),
                       ChallengeSelectionSnapshot(current: 4, cooldown: 2))
        XCTAssertEqual(reopened.snapshot(forKey: challenge),
                       ChallengeSelectionSnapshot(current: 12, cooldown: 6))
        XCTAssertEqual(reopened.playCount(forKey: group), 0)
        XCTAssertEqual(reopened.playCount(forKey: challenge), 0)
    }

    func testGroupRecordDoesNotInventOriginalPlaysField() throws {
        let persistent = ChallengeDataPersistent(groups: [
            .init(name: 7, chance: 20, death: 4)
        ])
        let data = try JSONEncoder().encode(persistent)
        let object = try XCTUnwrap(try JSONSerialization.jsonObject(with: data) as? [String: Any])
        let groups = try XCTUnwrap(object["grp"] as? [[String: Any]])
        XCTAssertEqual(groups.count, 1)
        XCTAssertNil(groups[0]["plays"])
    }

    func testSavingStaleHostSnapshotMergesLatestChallengeData() throws {
        let directory = FileManager.default.temporaryDirectory
            .appendingPathComponent(UUID().uuidString, isDirectory: true)
        defer { try? FileManager.default.removeItem(at: directory) }
        let store = SaveStore(directory: directory)
        var staleHostSnapshot = SaveData.default
        staleHostSnapshot.highscores["classic"] = 10
        XCTAssertTrue(store.save(staleHostSnapshot))

        let key = ChallengeSelectionKey.challenge(OriginalStringHash.hash("merge-challenge"))
        store.setSnapshot(ChallengeSelectionSnapshot(current: 17, cooldown: 4), forKey: key)
        staleHostSnapshot.highscores["classic"] = 99
        staleHostSnapshot.stats["slashes"] = 23

        XCTAssertTrue(store.saveMergingChallengeData(staleHostSnapshot))
        let reopened = SaveStore(directory: directory)
        let saved = reopened.load()
        XCTAssertEqual(saved.highscores["classic"], 99)
        XCTAssertEqual(saved.stats["slashes"], 23)
        XCTAssertEqual(reopened.snapshot(forKey: key),
                       ChallengeSelectionSnapshot(current: 17, cooldown: 4))
        reopened.incrementPlayCount(forKey: key)
        XCTAssertEqual(SaveStore(directory: directory).playCount(forKey: key), 1)
    }

    func testChallengeSessionDecodesMissingFieldsWithStableDefaults() throws {
        let json = #"{"currentChallenge":2,"challenge":[{"name":"partial"}]}"#
        let decoded = try JSONDecoder().decode(
            ChallengeSessionPersistent.self, from: Data(json.utf8))
        XCTAssertEqual(decoded.difficulty, 2)
        XCTAssertEqual(decoded.challenges, [
            .init(name: "partial", index: 0, challengeIndex: 0, result: 0)
        ])

        let empty = try JSONDecoder().decode(
            ChallengeSessionPersistent.self, from: Data(#"{}"#.utf8))
        XCTAssertEqual(empty, .empty)
    }

    func testChallengeSessionSelectsHighestValidTierAndClampsUnsignedDifficulty() throws {
        let session = ChallengeSessionPersistent(difficulty: 9, challenges: [
            .init(name: "a", index: 0, challengeIndex: 0, result: 1),
            .init(name: "b", index: 2, challengeIndex: 1, result: 1),
            .init(name: "invalid", index: 8, challengeIndex: 0, result: 1),
            .init(name: "negative", index: -1, challengeIndex: 0, result: 1),
        ])
        XCTAssertEqual(session.initialTierIndex(validTierCount: 3), 2)
        XCTAssertEqual(session.initialTierIndex(validTierCount: 0), 0)
        XCTAssertEqual(session.clampedDifficulty(roundCount: 4), 3)
        XCTAssertEqual(ChallengeSessionPersistent(difficulty: 0).clampedDifficulty(roundCount: 4), 0)
        XCTAssertEqual(ChallengeSessionPersistent(difficulty: -1).clampedDifficulty(roundCount: 4), 3)
        XCTAssertEqual(ChallengeSessionPersistent.empty.initialTierIndex(validTierCount: 3), 0)

        let encoded = try JSONEncoder().encode(session)
        let object = try XCTUnwrap(try JSONSerialization.jsonObject(with: encoded) as? [String: Any])
        XCTAssertNotNil(object["currentChallenge"])
        XCTAssertEqual(try JSONDecoder().decode(ChallengeSessionPersistent.self, from: encoded), session)
    }

    func testChallengeSessionRecordsTierAndRoundSlotWithoutConfusingIndices() {
        var session = ChallengeSessionPersistent.empty
        session.recordRound(challengeName: "fruitAcross1", tierIndex: 2,
                            roundIndex: 3, outcome: .pass)
        session.recordRound(challengeName: "bombField1", tierIndex: 2,
                            roundIndex: 4, outcome: .fail)
        session.recordRound(challengeName: "fruitAcross1", tierIndex: 2,
                            roundIndex: 3, outcome: .fail)
        session.recordRound(challengeName: "ignored", tierIndex: 2,
                            roundIndex: 0, outcome: .pending)

        XCTAssertEqual(session.challenges, [
            .init(name: "fruitAcross1", index: 2, challengeIndex: 3, result: 2),
            .init(name: "bombField1", index: 2, challengeIndex: 4, result: 2),
        ])
        XCTAssertEqual(session.initialTierIndex(validTierCount: 3), 2)
    }
}
