import Foundation

// ============================================================================
// LocalizedStrings.swift — 发售版字符串表全量（T-077 的延伸）
//
// 数据来源：Content/localizedStrings.json，由 reverse/dump_localized_strings.py 从
// assets_raw/StringTables 的 header + English_US 两份发布数据导出（879 条）。
// 与 challengeMapStrings.json 的分工：那份带屏/组件/字体信息，供排版；
// 这份只有 key→文本，供任意界面按原键取文案。
// ============================================================================

public enum LocalizedStringsError: Error, Equatable, Sendable {
    case unsupportedVersion(Int)
    case emptyLanguage
    case duplicateKey(String)
    case malformedEntry(index: Int)
}

public struct LocalizedStrings: Sendable, Equatable {
    public let language: String
    public let entries: [String: String]

    public init(language: String, entries: [String: String]) {
        self.language = language
        self.entries = entries
    }

    public func text(_ key: String) -> String? { entries[key] }

    /// 取不到时用备用文案（调用方给出原文，避免界面出现空串）。
    public func text(_ key: String, fallback: String) -> String { entries[key] ?? fallback }

    private struct Document: Decodable {
        struct Entry: Decodable {
            let key: String
            let text: String
        }
        let version: Int
        let language: String
        let entries: [Entry]
    }

    public static func load(from data: Data) throws -> LocalizedStrings {
        let document: Document
        do {
            document = try JSONDecoder().decode(Document.self, from: data)
        } catch {
            throw LocalizedStringsError.malformedEntry(index: -1)
        }
        guard document.version == 1 else {
            throw LocalizedStringsError.unsupportedVersion(document.version)
        }
        guard !document.language.isEmpty else {
            throw LocalizedStringsError.emptyLanguage
        }
        var table: [String: String] = [:]
        table.reserveCapacity(document.entries.count)
        for (index, entry) in document.entries.enumerated() {
            guard !entry.key.isEmpty else {
                throw LocalizedStringsError.malformedEntry(index: index)
            }
            guard table[entry.key] == nil else {
                throw LocalizedStringsError.duplicateKey(entry.key)
            }
            table[entry.key] = entry.text
        }
        return LocalizedStrings(language: document.language, entries: table)
    }
}
