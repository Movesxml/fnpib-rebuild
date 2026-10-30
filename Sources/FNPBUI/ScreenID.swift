//
//  ScreenID.swift
//  FNPBUI — 界面层 v1（T-021）
//
//  锚点：IPA 解包产物 `assets_raw/xml/screens/` 下的 20 个 `.uiscreen` 文件
//  （任务卡逐字抄录，顺序保持与原资产目录一致，便于人工核对）。
//
//  `rawValue` 严格逐字等于文件名（去 `.uiscreen` 扩展名）：
//  - 用 `ScreenID.uncoveredAssetNames(_:)` 可与解包目录做集合比对；
//  - 任何改名前先确认 `rawValue` 与文件名仍然一致，否则会静默失去对应关系。
//
//  ⚠️ 本文件只锁定「屏幕 ID ↔ uiscreen 文件名」映射，**不臆造导航顺序与界面内容**：
//     v1 只实现 mainscreen / gamemode / inGameClassic / pause / results 五个，
//     其余 15 个仅作枚举占位（`ScreenImplementation.placeholder`）。
//

import Foundation

/// 屏幕分组（纯 UI 分类，供根视图 switch 与后续导航任务卡接线使用）。
public enum ScreenGroup: String, Sendable {
    /// 局外菜单类
    case menu
    /// 局内 HUD / 局内背景类
    case inGame
    /// 浮层（暂停、结算、局内计分板）
    case overlay
    /// 附加内容 / 关于 / 新闻 / 商店
    case meta
    /// 通用背景层（非独立界面）
    case legacy
}

/// v1 实现状态。
public enum ScreenImplementation: String, Sendable {
    /// v1 已有对应 SwiftUI 视图。
    case implemented
    /// v1 只在枚举里占位，无视图，也不接导航。
    case placeholder
}

/// 原版 20 个 `.uiscreen` 的一一映射。
public enum ScreenID: String, CaseIterable, Sendable, Hashable, Identifiable {

    // MARK: v1 已实现（5）

    /// `mainscreen.uiscreen` — 主菜单（v1 已实现）
    case mainScreen = "mainscreen"
    /// `gamemode.uiscreen` — 模式选择（v1 已实现）
    case gameMode = "gamemode"
    /// `inGameClassic.uiscreen` — Classic 模式 HUD（v1 已实现）
    case inGameClassic = "inGameClassic"
    /// `pause.uiscreen` — 暂停浮层（v1 已实现）
    case pause = "pause"
    /// `results.uiscreen` — 单局结算（v1 已实现）
    case results = "results"

    // MARK: v1 占位（15）

    /// `inGameAdventure.uiscreen` — Adventure 模式 HUD（占位）
    case inGameAdventure = "inGameAdventure"
    /// `inGameChallengeHud.uiscreen` — Challenge 模式 HUD（占位）
    case inGameChallengeHud = "inGameChallengeHud"
    /// `inGameChallengeBackground.uiscreen` — Challenge 局内背景层（占位）
    case inGameChallengeBackground = "inGameChallengeBackground"
    /// `inGameChallengeInstructionsScreen.uiscreen` — Challenge 玩法说明（占位）
    case inGameChallengeInstructions = "inGameChallengeInstructionsScreen"
    /// `inGameChallengeMapScreen.uiscreen` — Challenge 关卡地图（占位）
    case inGameChallengeMap = "inGameChallengeMapScreen"
    /// `inGameChallengeScoreScreen.uiscreen` — Challenge 局内计分板（占位）
    case inGameChallengeScore = "inGameChallengeScoreScreen"
    /// `inGameChallengeScoreScreenComplete.uiscreen` — Challenge 通关结算（占位）
    case inGameChallengeScoreComplete = "inGameChallengeScoreScreenComplete"
    /// `inGameChallengeScoreScreenCompleteFailure.uiscreen` — Challenge 失败结算（占位）
    case inGameChallengeScoreCompleteFailure = "inGameChallengeScoreScreenCompleteFailure"
    /// `extras.uiscreen` — 附加内容（对应 [exe] `ExtrasScreen` 类；占位）
    case extras = "extras"
    /// `about.uiscreen` — 关于（占位）
    case about = "about"
    /// `newsscreen.uiscreen` — 新闻列表（占位）
    case news = "newsscreen"
    /// `newsscreenFruitNinja.uiscreen` — Fruit Ninja 交叉推广新闻页（占位）
    case newsFruitNinja = "newsscreenFruitNinja"
    /// `newsscreenJetpack.uiscreen` — Jetpack Joyride 交叉推广新闻页（占位）
    case newsJetpack = "newsscreenJetpack"
    /// `shopScreen.uiscreen` — 商店（对应 [exe] `UpsellScreen` 类；占位）
    case shop = "shopScreen"
    /// `Background.uiscreen` — 通用背景层（原文件名首字母大写，逐字保留；占位）
    case background = "Background"

    // MARK: 派生信息

    public var id: String { rawValue }

    /// 对应解包目录里的文件名（含扩展名）。
    public var uiscreenFileName: String { rawValue + ".uiscreen" }

    public var group: ScreenGroup {
        switch self {
        case .mainScreen, .gameMode:
            .menu
        case .inGameClassic, .inGameAdventure, .inGameChallengeHud,
             .inGameChallengeBackground, .inGameChallengeInstructions, .inGameChallengeMap:
            .inGame
        case .pause, .results,
             .inGameChallengeScore, .inGameChallengeScoreComplete, .inGameChallengeScoreCompleteFailure:
            .overlay
        case .extras, .about, .news, .newsFruitNinja, .newsJetpack, .shop:
            .meta
        case .background:
            .legacy
        }
    }

    public var implementation: ScreenImplementation {
        switch self {
        case .mainScreen, .gameMode, .inGameClassic, .pause, .results:
            .implemented
        default:
            .placeholder
        }
    }

    /// v1 已实现的屏幕（供根视图 / 测试断言使用）。
    public static var implementedScreens: [ScreenID] {
        allCases.filter { $0.implementation == .implemented }
    }

    /// v1 仅占位的屏幕。
    public static var placeholderScreens: [ScreenID] {
        allCases.filter { $0.implementation == .placeholder }
    }

    /// 与资产解包产物做集合比对：返回 `assetNames`（不含 `.uiscreen` 后缀）中本枚举未覆盖的名字。
    /// 用于资产管线回归（防止清单漂移）。
    public static func uncoveredAssetNames(_ assetNames: [String]) -> [String] {
        let known = Set(allCases.map(\.rawValue))
        return assetNames.filter { !known.contains($0) }.sorted()
    }
}
