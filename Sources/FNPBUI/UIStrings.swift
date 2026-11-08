import Foundation

// ============================================================================
// UIStrings.swift — 界面文案的注入点
//
// FNPBUI 不依赖 FNPBCore（分层约定），所以字符串表由 App 层在启动时注入：
// 表本身来自 Content/localizedStrings.json（发售版 StringTables 全量，879 条）。
// 视图用 UIStrings.text(key, fallback:) 取文案；注入失败时统一回落 fallback，
// 界面不会出现空串。
// ============================================================================

public enum UIStrings {

    /// 由 App 启动时设置：key → 文案；返回 nil 表示表里没有这个键。
    nonisolated(unsafe) public static var lookup: ((String) -> String?)?

    /// 取原文案；表缺失或键不存在时用 fallback。
    public static func text(_ key: String, fallback: String) -> String {
        guard let lookup, let value = lookup(key), !value.isEmpty else { return fallback }
        return value
    }

    /// 带一个整数占位（原版文案形如 "best: %d"）。
    public static func text(_ key: String, fallback: String, _ value: Int) -> String {
        text(key, fallback: fallback).replacingOccurrences(of: "%d", with: String(value))
    }
}
