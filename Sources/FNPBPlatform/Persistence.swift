import Foundation

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

// MARK: - 存档数据

public struct SaveData: Codable, Equatable, Sendable {

    /// 原 "version"
    public var version: Int
    /// 原 "highscore" + "%shighscore"（模式前缀 → 分数）
    public var highscores: [String: Int32]
    /// 原 "critical_chance"：FUN_00028350 按整数读取、FUN_000292e0 按 %d 保存。
    /// 这是每局暴击动态分母初值，不是 WaveInfo.criticalChance 的浮点系数。
    public var criticalChance: Int32
    /// 原 "rated"
    public var rated: Bool
    /// 原 "challengeData"（原为 XML/二进制块，这里以 base64 保真携带）
    public var challengeData: String?
    /// 统计键（§3.4）：键名与原版一致
    public var stats: [String: Int32]

    public enum CodingKeys: String, CodingKey {
        case version
        case highscores       = "highscore"
        case criticalChance   = "critical_chance"
        case rated
        case challengeData
        case stats
    }

    public init(version: Int = SaveData.currentVersion,
                highscores: [String: Int32] = [:],
                criticalChance: Int32 = 70,       // FUN_00027c70：存档 +0x100 = 0x46
                rated: Bool = false,
                challengeData: String? = nil,
                stats: [String: Int32] = [:]) {
        self.version = version
        self.highscores = highscores
        self.criticalChance = criticalChance
        self.rated = rated
        self.challengeData = challengeData
        self.stats = stats
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
             SaveKeys.rated, SaveKeys.challengeData:
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