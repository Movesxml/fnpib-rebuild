import Foundation
import FNPBCore

// ============================================================================
// Persistence — 存档读写（macho M08 / M09）
//
// 键名策略：**JSON 键名与原版存档键名保持一致**，用 CodingKeys 显式固定，
// 不依赖 Swift 属性名自动映射（属性名与键名刻意不同，防止重命名破坏存档兼容）。
//
// ── 原 XML 键 → 新 JSON 键 迁移映射表 ────────────────────────────────────────
//  原存档键（NSUserDefaults / XML plist 扁平键）        新 JSON 键
//  --------------------------------------------------  -----------------------------
//  version                                             "version"            (Int)
//  highscore                                           "highscore"._default (Int32，见下)
//  %shighscore      ← sprintf("%shighscore", mode)      "highscore".<mode>   (Int32)
//                     例："classichighscore"  = 100  →  {"highscore":{"classic":100}}
//  critical_chance                                     "critical_chance"    (Int32)
//  rated                                               "rated"              (Bool)
//  challengeData                                       "challengeData"      (String, base64)
//  slashes / slashesScoring / totalfruit / all /        "stats"              ([String:Int32])
//  bean / upside_down_points / score_without_beans /
//  combos / near_miss / bomb / freeze
// ------------------------------------------------------------------------------
// 说明：
//  1) `%shighscore` 是 C 的 printf 模板，`%s` 由模式前缀直接拼接（**无下划线**，
//     与原版 sprintf 行为一致）；键名形如 "classichighscore"。
//     模式前缀的取值域（"classic"/"arcade"/"zen"/"puss"…）需从二进制字符串表闭合
//     [待验证]，本文件只保证映射算法正确。
//  2) 原版统计键是扁平键，新格式收敛到 "stats" 子字典；migrate(legacyValues:)
//     会把它们搬进去，键名保持不变（与 §3.4 统计键名一致）。
//  3) 存储位置由 NSUserDefaults 改到 Application Support 的文件，
//     原因：SaveData 体积（挑战数据/统计）远超 UserDefaults 的合理粒度，且文件可原子写。
//     原存档的容器路径未从二进制闭合 [待验证]，默认取标准 ApplicationSupport/<bundleID>/。
// ============================================================================

// MARK: - challengeDataPersistent

/// FUN_00028ffc / FUN_0002a6cc：组和挑战是两张独立表。
/// name 保存名称哈希的 Int32 位模式；只有挑战记录包含 plays。
public struct ChallengeDataPersistent: Codable, Equatable, Sendable {
    public struct GroupRecord: Codable, Equatable, Sendable {
        public var name: Int32
        public var chance: Int32
        public var death: Int32

        public init(name: Int32, chance: Int32, death: Int32) {
            self.name = name
            self.chance = chance
            self.death = death
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            name = try container.decodeIfPresent(Int32.self, forKey: .name) ?? 0
            chance = try container.decodeIfPresent(Int32.self, forKey: .chance) ?? 0
            death = try container.decodeIfPresent(Int32.self, forKey: .death) ?? 0
        }
    }

    public struct ChallengeRecord: Codable, Equatable, Sendable {
        public var name: Int32
        public var chance: Int32
        public var death: Int32
        public var plays: Int32

        public init(name: Int32, chance: Int32, death: Int32, plays: Int32 = 0) {
            self.name = name
            self.chance = chance
            self.death = death
            self.plays = plays
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            name = try container.decodeIfPresent(Int32.self, forKey: .name) ?? 0
            chance = try container.decodeIfPresent(Int32.self, forKey: .chance) ?? 0
            death = try container.decodeIfPresent(Int32.self, forKey: .death) ?? 0
            plays = try container.decodeIfPresent(Int32.self, forKey: .plays) ?? 0
        }
    }

    public var groups: [GroupRecord]
    public var challenges: [ChallengeRecord]
    /// 尚未解析的旧 plist Data 以 base64 保留；旧字符串保持原文。
    public var legacyRaw: String?

    public static let empty = ChallengeDataPersistent()

    public init(groups: [GroupRecord] = [],
                challenges: [ChallengeRecord] = [],
                legacyRaw: String? = nil) {
        self.groups = groups
        self.challenges = challenges
        self.legacyRaw = legacyRaw
    }

    public init(legacyRaw: String?) {
        groups = []
        challenges = []
        self.legacyRaw = legacyRaw
    }

    enum CodingKeys: String, CodingKey {
        case groups = "grp"
        case challenges = "chl"
        case legacyRaw
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        groups = try container.decodeIfPresent([GroupRecord].self, forKey: .groups) ?? []
        challenges = try container.decodeIfPresent([ChallengeRecord].self, forKey: .challenges) ?? []
        legacyRaw = try container.decodeIfPresent(String.self, forKey: .legacyRaw)
    }
}

// MARK: - 挑战会话进度

/// 新运行时使用的 challengeData 已解码视图。旧 challengeData 原始 Data 仍由
/// SaveData.challengeData 原样保留；在完整旧 plist 迁移完成前不把两者混为一谈。
public struct ChallengeSessionPersistent: Codable, Equatable, Sendable {
    public struct ChallengeRecord: Codable, Equatable, Sendable {
        public var name: String
        public var index: Int32
        public var challengeIndex: Int32
        public var result: Int32

        public init(name: String, index: Int32, challengeIndex: Int32, result: Int32) {
            self.name = name
            self.index = index
            self.challengeIndex = challengeIndex
            self.result = result
        }
    }

    /// 原 XML 键名是 currentChallenge；FUN_000619d0 把它作为难度读取。
    public var difficulty: Int32
    public var challenges: [ChallengeRecord]

    public static let empty = ChallengeSessionPersistent()

    public init(difficulty: Int32 = 0, challenges: [ChallengeRecord] = []) {
        self.difficulty = difficulty
        self.challenges = challenges
    }

    enum CodingKeys: String, CodingKey {
        case difficulty = "currentChallenge"
        case challenges = "challenge"
    }

    /// FUN_000619d0：忽略越界记录，使用有效记录中的最高 tier；空新存档为 0。
    public func initialTierIndex(validTierCount: Int) -> Int32 {
        let valid = challenges.map(\.index).filter {
            $0 >= 0 && Int($0) < validTierCount
        }
        return valid.max() ?? 0
    }

    /// FUN_000619d0 的原始比较是 UInt32：负存档值不会变成负难度，
    /// 而会按无符号大值钳到 roundCount-1；0 始终保持为 0。
    public func clampedDifficulty(roundCount: Int32) -> Int32 {
        guard roundCount > 0 else { return 0 }
        let saved = UInt32(bitPattern: difficulty)
        guard saved != 0 else { return 0 }
        let upper = UInt32(bitPattern: roundCount - 1)
        return Int32(bitPattern: min(saved, upper))
    }
}

// MARK: - 存档数据

public struct SaveData: Codable, Equatable, Sendable {
    public var version: Int
    public var highscores: [String: Int32]
    /// 每局暴击动态分母初值，不是 WaveInfo.criticalChance 的浮点系数。
    public var criticalChance: Int32
    public var rated: Bool
    public var challengeData: String?
    public var stats: [String: Int32]
    public var challengeDataPersistent: ChallengeDataPersistent
    public var challengeSession: ChallengeSessionPersistent

    public enum CodingKeys: String, CodingKey {
        case version
        case highscores = "highscore"
        case criticalChance = "critical_chance"
        case rated
        case challengeData
        case stats
        case challengeDataPersistent
        case challengeSession
    }

    public init(version: Int = SaveData.currentVersion,
                highscores: [String: Int32] = [:],
                criticalChance: Int32 = 70,
                rated: Bool = false,
                challengeData: String? = nil,
                stats: [String: Int32] = [:],
                challengeDataPersistent: ChallengeDataPersistent = .empty,
                challengeSession: ChallengeSessionPersistent = .empty) {
        self.version = version
        self.highscores = highscores
        self.criticalChance = criticalChance
        self.rated = rated
        self.challengeData = challengeData
        self.stats = stats
        self.challengeDataPersistent = challengeDataPersistent
        self.challengeSession = challengeSession
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        version = try container.decodeIfPresent(Int.self, forKey: .version) ?? SaveData.currentVersion
        highscores = try container.decodeIfPresent([String: Int32].self, forKey: .highscores) ?? [:]
        criticalChance = try container.decodeIfPresent(Int32.self, forKey: .criticalChance) ?? 70
        rated = try container.decodeIfPresent(Bool.self, forKey: .rated) ?? false
        challengeData = try container.decodeIfPresent(String.self, forKey: .challengeData)
        stats = try container.decodeIfPresent([String: Int32].self, forKey: .stats) ?? [:]
        challengeSession = try container.decodeIfPresent(
            ChallengeSessionPersistent.self, forKey: .challengeSession) ?? .empty

        // 旧 JSON 的扁平 Data 在 JSON 中也是 base64 字符串；新格式则是对象。
        // 两种表示必须分别尝试：decodeIfPresent(String) 遇到对象会抛 typeMismatch，
        // 不能因此让 load() 把整份有效新存档回退成默认值。
        if let raw = try? container.decode(String.self, forKey: .challengeDataPersistent) {
            challengeDataPersistent = ChallengeDataPersistent(legacyRaw: raw)
        } else {
            challengeDataPersistent = (try? container.decode(
                ChallengeDataPersistent.self, forKey: .challengeDataPersistent)) ?? .empty
        }
    }

    public static let currentVersion = 1
    public static let `default` = SaveData()
    public static let defaultHighscoreKey = "default"
}

// MARK: - 键名常量（与 macho 对齐）

public enum SaveKeys {
    public static let version        = "version"
    public static let highscore      = "highscore"
    /// 原版模板：sprintf("%shighscore", mode)
    public static let highscoreTemplate = "%shighscore"
    public static let criticalChance = "critical_chance"
    public static let rated          = "rated"
    public static let challengeData  = "challengeData"
    public static let challengeDataPersistent = "challengeDataPersistent"

    /// 复刻原版 sprintf("%shighscore", mode)：前缀直接拼接，无分隔符
    public static func highscoreKey(mode: String) -> String {
        mode + "highscore"
    }

    /// 已知统计键（§3.4）；动态键（"%s_combos"、"strawberry_combo_total"）走字符串通道
    public static let statsKeys: [String] = [
        "slashes", "slashesScoring", "totalfruit", "all", "bean",
        "upside_down_points", "score_without_beans", "combos",
        "near_miss", "bomb", "freeze"
    ]
}

// MARK: - 读写

public final class SaveStore {

    public static let defaultFileName = "save.json"

    public let directory: URL
    public let fileURL: URL

    /// 最近一次读/写失败原因（nil 表示成功）
    public private(set) var lastError: Error?

    private let encoder: JSONEncoder
    private let decoder: JSONDecoder

    public init(directory: URL? = nil, fileName: String = SaveStore.defaultFileName) {
        let dir = directory ?? SaveStore.defaultDirectory()
        try? FileManager.default.createDirectory(at: dir, withIntermediateDirectories: true)
        self.directory = dir
        self.fileURL = dir.appendingPathComponent(fileName)

        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        self.encoder = encoder
        self.decoder = JSONDecoder()
    }

    /// 读档；文件不存在或损坏时返回 .default（不抛错——原版读档失败也是回默认）
    public func load() -> SaveData {
        guard FileManager.default.fileExists(atPath: fileURL.path) else {
            return .default
        }
        do {
            let data = try Data(contentsOf: fileURL)
            let decoded = try decoder.decode(SaveData.self, from: data)
            lastError = nil
            return decoded
        } catch {
            lastError = error
            return .default
        }
    }

    /// 原子写；返回是否成功
    @discardableResult
    public func save(_ saveData: SaveData) -> Bool {
        do {
            let data = try encoder.encode(saveData)
            try data.write(to: fileURL, options: [.atomic])
            lastError = nil
            return true
        } catch {
            lastError = error
            return false
        }
    }

    /// GameHost 的旧快照负责高分等宿主字段，挑战选择器则直接写当前磁盘。
    /// 保存宿主快照前合并最新挑战表，避免暂停或结算把权重、冷却和 plays 覆盖回旧值。
    @discardableResult
    public func saveMergingChallengeData(_ saveData: SaveData) -> Bool {
        var merged = saveData
        merged.challengeDataPersistent = load().challengeDataPersistent
        return save(merged)
    }

    // MARK: 目录

    /// iOS 上 Application Support 目录默认不存在，必须显式创建。
    /// 子目录用 bundle id 隔离（与原版容器结构无关，纯工程规范）。
    public static func defaultDirectory(
        bundleIdentifier: String? = Bundle.main.bundleIdentifier
    ) -> URL {
        let fm = FileManager.default
        let base = fm.urls(for: .applicationSupportDirectory, in: .userDomainMask).first
            ?? fm.temporaryDirectory
        let identifier = bundleIdentifier ?? "com.halfbrick.fnpib"
        let dir = base.appendingPathComponent(identifier, isDirectory: true)
        try? fm.createDirectory(at: dir, withIntermediateDirectories: true)
        return dir
    }
}

// MARK: - 旧版 XML → 新版 JSON 迁移

extension SaveStore {

    /// 把已解析的原版扁平键值对转换为 SaveData（纯函数，便于单测）。
    ///
    /// 输入示例（原 XML 反序列化后）：
    /// ```swift
    /// [
    ///   "version": 3,
    ///   "classichighscore": 1024,      // 原 "%shighscore" 展开
    ///   "highscore": 999,              // 原扁平兜底键
    ///   "critical_chance": 70,
    ///   "rated": true,
    ///   "challengeData": <Data>,
    ///   "slashes": 1200
    /// ]
    /// ```
    public static func migrate(legacyValues: [String: Any]) -> SaveData {
        var save = SaveData.default

        if let version = intValue(legacyValues[SaveKeys.version]) {
            save.version = version
        }
        if let chance = int32Value(legacyValues[SaveKeys.criticalChance]) {
            save.criticalChance = chance
        }
        if let rated = boolValue(legacyValues[SaveKeys.rated]) {
            save.rated = rated
        }
        if let challenge = legacyValues[SaveKeys.challengeData],
           let encoded = stringValue(challenge) {
            save.challengeData = encoded
        }
        if let persistent = legacyValues[SaveKeys.challengeDataPersistent],
           let encoded = stringValue(persistent) {
            save.challengeDataPersistent = ChallengeDataPersistent(legacyRaw: encoded)
        }

        // "%shighscore"：凡是 "highscore" 结尾的扁平键都搬进 highscores 子字典
        // 注意遍历顺序：先处理具名模式，再让 "highscore" 本身落到 default
        let suffix = "highscore"
        var modes: [(prefix: String, score: Int32)] = []
        for (key, value) in legacyValues where key.hasSuffix(suffix) && key != SaveKeys.highscore {
            let prefix = String(key.dropLast(suffix.count))
            if let score = int32Value(value) {
                modes.append((prefix.isEmpty ? SaveData.defaultHighscoreKey : prefix, score))
            }
        }
        for entry in modes {
            save.highscores[entry.prefix] = entry.score
        }
        if let flat = int32Value(legacyValues[SaveKeys.highscore]) {
            // 扁平 "highscore" 与模式键并存时：仅当没有更具体的记录才采纳
            save.highscores[SaveData.defaultHighscoreKey] =
                save.highscores[SaveData.defaultHighscoreKey] ?? flat
        }

        // 统计键：已知键直搬；动态键（"%s_combos" 等）也按原样保留
        for (key, value) in legacyValues {
            guard !isReservedKey(key) else { continue }
            if let number = int32Value(value) {
                save.stats[key] = number
            }
        }

        return save
    }

    private static func isReservedKey(_ key: String) -> Bool {
        switch key {
        case SaveKeys.version, SaveKeys.highscore, SaveKeys.criticalChance,
             SaveKeys.rated, SaveKeys.challengeData, SaveKeys.challengeDataPersistent:
            return true
        default:
            return key.hasSuffix("highscore")
        }
    }

    // MARK: 类型擦除辅助（plist 解码结果是 Any）

    private static func intValue(_ value: Any?) -> Int? {
        if let number = value as? NSNumber { return number.intValue }
        if let text = value as? String { return Int(text) }
        return nil
    }

    private static func int32Value(_ value: Any?) -> Int32? {
        if let number = value as? NSNumber { return number.int32Value }
        if let text = value as? String { return Int32(text) }
        return nil
    }

    private static func floatValue(_ value: Any?) -> Float? {
        if let number = value as? NSNumber { return number.floatValue }
        if let text = value as? String { return Float(text) }
        return nil
    }

    private static func boolValue(_ value: Any?) -> Bool? {
        if let number = value as? NSNumber { return number.boolValue }
        if let text = value as? String { return (text as NSString).boolValue }
        return nil
    }

    private static func stringValue(_ value: Any) -> String? {
        if let text = value as? String { return text }
        if let data = value as? Data { return data.base64EncodedString() }
        if let number = value as? NSNumber { return number.stringValue }
        return nil
    }
}

// MARK: - ChallengeSelectionPersisting 的真实磁盘适配

extension SaveStore: ChallengeSelectionPersisting {
    public func snapshot(forKey key: ChallengeSelectionKey) -> ChallengeSelectionSnapshot? {
        let persistent = load().challengeDataPersistent
        switch key {
        case .group(let hash):
            let record = persistent.groups.first { UInt32(bitPattern: $0.name) == hash }
            return record.map { ChallengeSelectionSnapshot(current: $0.chance, cooldown: $0.death) }
        case .challenge(let hash):
            let record = persistent.challenges.first { UInt32(bitPattern: $0.name) == hash }
            return record.map { ChallengeSelectionSnapshot(current: $0.chance, cooldown: $0.death) }
        }
    }

    public func setSnapshot(_ snapshot: ChallengeSelectionSnapshot,
                            forKey key: ChallengeSelectionKey) {
        var data = load()
        var persistent = data.challengeDataPersistent
        switch key {
        case .group(let hash):
            if let index = persistent.groups.firstIndex(where: {
                UInt32(bitPattern: $0.name) == hash
            }) {
                persistent.groups[index].chance = snapshot.current
                persistent.groups[index].death = snapshot.cooldown
            } else {
                persistent.groups.append(.init(name: Int32(bitPattern: hash),
                                               chance: snapshot.current,
                                               death: snapshot.cooldown))
            }
        case .challenge(let hash):
            if let index = persistent.challenges.firstIndex(where: {
                UInt32(bitPattern: $0.name) == hash
            }) {
                persistent.challenges[index].chance = snapshot.current
                persistent.challenges[index].death = snapshot.cooldown
            } else {
                persistent.challenges.append(.init(name: Int32(bitPattern: hash),
                                                   chance: snapshot.current,
                                                   death: snapshot.cooldown,
                                                   plays: 0))
            }
        }
        data.challengeDataPersistent = persistent
        _ = save(data)
    }

    public func playCount(forKey key: ChallengeSelectionKey) -> Int32 {
        guard case .challenge(let hash) = key else { return 0 }
        return load().challengeDataPersistent.challenges.first {
            UInt32(bitPattern: $0.name) == hash
        }?.plays ?? 0
    }

    public func incrementPlayCount(forKey key: ChallengeSelectionKey) {
        guard case .challenge(let hash) = key else { return }
        var data = load()
        guard let index = data.challengeDataPersistent.challenges.firstIndex(where: {
            UInt32(bitPattern: $0.name) == hash
        }) else { return }
        data.challengeDataPersistent.challenges[index].plays &+= 1
        _ = save(data)
    }
}