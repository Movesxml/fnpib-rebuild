import Foundation

// ============================================================================
// ChallengeMapStrings.swift — 挑战地图的本地化文案（T-077 产物）
//
// 数据来源：Content/challengeMapStrings.json，由 reverse/extract_string_table.py 从
// 发售版 StringTables 导出（findings/string_table_format_macho.md）。字段含义：
//   componentIndex  UISF 组件下标（inGameChallengeMapScreen）
//   name            组件名（actLabel / clickNowText / …）
//   key             字符串表键（FN_PUSS_…）
//   text            译文
//   fontName        字体文件相对路径（FontsTrueType/bronic.ttf 或 miserable.TTF）
//   fontSize        字号
// ============================================================================

public enum ChallengeMapStringsError: Error, Equatable, Sendable {
    case unsupportedVersion(Int)
    case emptyLanguage
    case duplicateComponentIndex(Int)
    case emptyEntries
    case invalidEntry(index: Int)
}

public struct ChallengeMapStringEntry: Sendable, Equatable {
    public var componentIndex: Int
    public var name: String
    public var key: String
    public var text: String
    public var fontName: String
    public var fontSize: Float

    public init(componentIndex: Int, name: String, key: String, text: String,
                fontName: String, fontSize: Float) {
        self.componentIndex = componentIndex
        self.name = name
        self.key = key
        self.text = text
        self.fontName = fontName
        self.fontSize = fontSize
    }
}

public struct ChallengeMapStrings: Sendable, Equatable {
    public var version: Int
    public var language: String
    public var entries: [ChallengeMapStringEntry]

    public init(version: Int, language: String, entries: [ChallengeMapStringEntry]) {
        self.version = version
        self.language = language
        self.entries = entries
    }

    /// 按组件下标查文案。
    public func entry(componentIndex: Int) -> ChallengeMapStringEntry? {
        entries.first { $0.componentIndex == componentIndex }
    }

    private struct Document: Decodable {
        struct Entry: Decodable {
            let componentIndex: Int
            let name: String
            let key: String
            let text: String
            let fontName: String
            let fontSize: Double
        }
        let version: Int
        let language: String
        let entries: [Entry]
    }

    public static func load(from data: Data) throws -> ChallengeMapStrings {
        let document: Document
        do {
            document = try JSONDecoder().decode(Document.self, from: data)
        } catch {
            throw ChallengeMapStringsError.invalidEntry(index: -1)
        }
        guard document.version == 1 else {
            throw ChallengeMapStringsError.unsupportedVersion(document.version)
        }
        guard !document.language.isEmpty else {
            throw ChallengeMapStringsError.emptyLanguage
        }
        guard !document.entries.isEmpty else {
            throw ChallengeMapStringsError.emptyEntries
        }
        var seen = Set<Int>()
        var entries: [ChallengeMapStringEntry] = []
        entries.reserveCapacity(document.entries.count)
        for (index, raw) in document.entries.enumerated() {
            guard raw.fontName.isEmpty == false,
                  raw.fontSize > 0,
                  raw.fontSize.isFinite,
                  raw.key.isEmpty == false else {
                throw ChallengeMapStringsError.invalidEntry(index: index)
            }
            guard seen.insert(raw.componentIndex).inserted else {
                throw ChallengeMapStringsError.duplicateComponentIndex(raw.componentIndex)
            }
            entries.append(ChallengeMapStringEntry(
                componentIndex: raw.componentIndex,
                name: raw.name,
                key: raw.key,
                text: raw.text,
                fontName: raw.fontName,
                fontSize: Float(raw.fontSize)))
        }
        return ChallengeMapStrings(version: document.version,
                                   language: document.language,
                                   entries: entries)
    }
}
