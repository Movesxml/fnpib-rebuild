import Foundation

// 发售版 ch1challengeList.xml 的值语义加载器。
// 行为来源：FUN_00060878 / FUN_00062618 / FUN_00062698 /
// FUN_0006ea38 / FUN_0006f178 / FUN_0006644c。
// 选择器所需的持久化权重和随机算法不在此 Loader 中猜测实现。

public enum ChallengeFruitSize: Int32, Sendable, Equatable {
    case normal = 0
    case small = 1
    case medium = 2
    case big = 3
}

public enum ChallengeScoreBonus: Int32, Sendable, Equatable {
    case none = 0
    case pinataHits = 1
}

public struct ChallengeSelectionWeight: Sendable, Equatable {
    public var chanceSelect: Int32
    public var chanceRegrowth: Float

    public init(chanceSelect: Int32 = 20, chanceRegrowth: Float = 0.2) {
        self.chanceSelect = chanceSelect
        self.chanceRegrowth = chanceRegrowth
    }
}

public struct ChallengeBonusModifiers: Sendable, Equatable {
    public var fruit: Float
    public var accuracy: Float
    public var finesse: Float

    /// DAT_004712e0 的三个 float 均为 1。
    public init(fruit: Float = 1, accuracy: Float = 1, finesse: Float = 1) {
        self.fruit = fruit
        self.accuracy = accuracy
        self.finesse = finesse
    }
}

public struct ChallengeDefinition: Sendable, Equatable {
    public var name: String
    public var customWave: String?
    public var timeLimit: Float
    public var challengeFruitSize: ChallengeFruitSize
    public var forceWave: Bool
    public var startActive: Bool
    public var prioritySelection: Bool
    public var hard: Bool
    public var instructions: String
    public var conditionNames: [String]
    public var modNames: [String]
    public var bonusMods: ChallengeBonusModifiers
    /// 发售版解析器的局部初值不清晰；没有 points 时保持 nil，不补造数值。
    public var points: Int32?
    public var numWaves: Int32
    public var type: String?
    /// 仅保留 challenge 节点上的原始属性。FUN_00062698 不读取它，
    /// 因而绝不能把它当作 ChallengeCondition.evaluateOnEnd 或波次结束门控。
    public var evaluateOnEndAttribute: Bool?
    public var selection: ChallengeSelectionWeight
    public var rawAttributes: [String: String]

    public init(name: String,
                customWave: String? = nil,
                timeLimit: Float = 0,
                challengeFruitSize: ChallengeFruitSize = .normal,
                forceWave: Bool? = nil,
                startActive: Bool = false,
                prioritySelection: Bool = false,
                hard: Bool = false,
                instructions: String = "No Instructions",
                conditionNames: [String] = [],
                modNames: [String] = [],
                bonusMods: ChallengeBonusModifiers = ChallengeBonusModifiers(),
                points: Int32? = nil,
                numWaves: Int32 = 1,
                type: String? = nil,
                evaluateOnEndAttribute: Bool? = nil,
                selection: ChallengeSelectionWeight = ChallengeSelectionWeight(),
                rawAttributes: [String: String] = [:]) {
        self.name = name
        self.customWave = customWave
        self.timeLimit = timeLimit
        self.challengeFruitSize = challengeFruitSize
        self.forceWave = forceWave ?? (numWaves == 1)
        self.startActive = startActive
        self.prioritySelection = prioritySelection
        self.hard = hard
        self.instructions = instructions
        self.conditionNames = conditionNames
        self.modNames = modNames
        self.bonusMods = bonusMods
        self.points = points
        self.numWaves = numWaves
        self.type = type
        self.evaluateOnEndAttribute = evaluateOnEndAttribute
        self.selection = selection
        self.rawAttributes = rawAttributes
    }
}

public struct ChallengeGroupDefinition: Sendable, Equatable {
    public var name: String
    public var mustSelect: Int32
    public var selection: ChallengeSelectionWeight
    public var challenges: [ChallengeDefinition]
    public var rawAttributes: [String: String]

    public init(name: String = "",
                mustSelect: Int32 = 0,
                selection: ChallengeSelectionWeight = ChallengeSelectionWeight(),
                challenges: [ChallengeDefinition] = [],
                rawAttributes: [String: String] = [:]) {
        self.name = name
        self.mustSelect = mustSelect
        self.selection = selection
        self.challenges = challenges
        self.rawAttributes = rawAttributes
    }
}

public struct ChallengeTierDefinition: Sendable, Equatable {
    public var name: String
    public var numRounds: Int32
    public var numRoundsMin: Int32
    public var numRoundsMax: Int32
    public var background: String?
    public var dtStart: Float
    public var dtRoundIncrement: Float
    /// 原机只接受一个已散列的 progression 值；这里保留原字符串，不发明枚举行为。
    public var progression: String?
    public var scoreBonus: ChallengeScoreBonus
    public var bossID: String?
    public var groups: [ChallengeGroupDefinition]
    public var rawAttributes: [String: String]

    public var isBonusRound: Bool {
        guard let bossID else { return false }
        return !bossID.isEmpty
    }

    public init(name: String = "",
                numRounds: Int32 = 3,
                numRoundsMin: Int32? = nil,
                numRoundsMax: Int32? = nil,
                background: String? = nil,
                dtStart: Float = 1,
                dtRoundIncrement: Float = 0,
                progression: String? = nil,
                scoreBonus: ChallengeScoreBonus = .none,
                bossID: String? = nil,
                groups: [ChallengeGroupDefinition] = [],
                rawAttributes: [String: String] = [:]) {
        self.name = name
        self.numRounds = numRounds
        self.numRoundsMin = numRoundsMin ?? numRounds
        self.numRoundsMax = numRoundsMax ?? numRounds
        self.background = background
        self.dtStart = dtStart
        self.dtRoundIncrement = dtRoundIncrement
        self.progression = progression
        self.scoreBonus = scoreBonus
        self.bossID = bossID
        self.groups = groups
        self.rawAttributes = rawAttributes
    }
}

public struct ChallengeCatalog: Sendable, Equatable {
    public var defaults: ChallengeSelectionWeight
    public var tiers: [ChallengeTierDefinition]

    public var allChallenges: [ChallengeDefinition] {
        tiers.flatMap { $0.groups.flatMap(\.challenges) }
    }

    public init(defaults: ChallengeSelectionWeight = ChallengeSelectionWeight(),
                tiers: [ChallengeTierDefinition] = []) {
        self.defaults = defaults
        self.tiers = tiers
    }
}

public enum ChallengeCatalogLoadError: Error, Sendable, Equatable {
    case invalidJSON(String)
    case unexpectedRoot(expected: String, actual: String)
    case missingAttribute(node: String, attribute: String, path: String)
    case invalidNumber(node: String, attribute: String, raw: String, path: String)
}

public enum ChallengeCatalogLoader {
    private struct Document: Decodable {
        let root: ContentNode
    }

    public static func load(from data: Data) throws -> ChallengeCatalog {
        let document: Document
        do {
            document = try JSONDecoder().decode(Document.self, from: data)
        } catch {
            throw ChallengeCatalogLoadError.invalidJSON(String(describing: error))
        }
        let root = document.root
        guard root.tag == "partyChallenges" else {
            throw ChallengeCatalogLoadError.unexpectedRoot(
                expected: "partyChallenges", actual: root.tag)
        }

        var defaults = ChallengeSelectionWeight()
        if let node = root.children.first(where: { $0.tag == "defaults" }) {
            defaults = try selection(node, fallback: defaults,
                                     path: "partyChallenges/defaults")
        }

        var tiers: [ChallengeTierDefinition] = []
        for (tierIndex, node) in root.children.enumerated() where node.tag == "challengeTier" {
            let tierPath = "partyChallenges/challengeTier[\(tierIndex)]"
            let rounds = try integer(node, "numRounds", path: tierPath) ?? 3
            var groups: [ChallengeGroupDefinition] = []
            for (groupIndex, groupNode) in node.children.enumerated()
            where groupNode.tag == "challengeGroup" {
                let groupPath = "\(tierPath)/challengeGroup[\(groupIndex)]"
                let mustSelect = try integer(groupNode, "mustSelect", path: groupPath) ?? 0
                var groupSelection = try selection(groupNode, fallback: defaults, path: groupPath)
                if mustSelect > 0 {
                    groupSelection = ChallengeSelectionWeight(chanceSelect: 0, chanceRegrowth: 0)
                }
                var challenges: [ChallengeDefinition] = []
                for (challengeIndex, challengeNode) in groupNode.children.enumerated()
                where challengeNode.tag == "challenge" {
                    let path = "\(groupPath)/challenge[\(challengeIndex)]"
                    challenges.append(try challenge(challengeNode,
                                                    hard: mustSelect > 0,
                                                    path: path))
                }
                groups.append(ChallengeGroupDefinition(
                    name: groupNode.attrs["name"] ?? "",
                    mustSelect: mustSelect,
                    selection: groupSelection,
                    challenges: challenges,
                    rawAttributes: groupNode.attrs))
            }
            tiers.append(ChallengeTierDefinition(
                name: node.attrs["name"] ?? "",
                numRounds: rounds,
                numRoundsMin: try integer(node, "numRoundsMin", path: tierPath),
                numRoundsMax: try integer(node, "numRoundsMax", path: tierPath),
                background: node.attrs["background"],
                dtStart: try float(node, "dtStart", path: tierPath) ?? 1,
                dtRoundIncrement: try float(node, "dtRoundIncrement", path: tierPath) ?? 0,
                progression: node.attrs["progression"],
                scoreBonus: node.attrs["scoreBonus"]?.uppercased() == "PINATA_HITS"
                    ? .pinataHits : .none,
                bossID: node.attrs["bossId"],
                groups: groups,
                rawAttributes: node.attrs))
        }
        return ChallengeCatalog(defaults: defaults, tiers: tiers)
    }

    private static func challenge(_ node: ContentNode,
                                  hard: Bool,
                                  path: String) throws -> ChallengeDefinition {
        guard let name = node.attrs["name"] else {
            throw ChallengeCatalogLoadError.missingAttribute(
                node: node.tag, attribute: "name", path: path)
        }
        let waves = try integer(node, "numWaves", path: path) ?? 1
        let size: ChallengeFruitSize
        switch node.attrs["challengeFruitSize"] {
        case "small": size = .small
        case "medium": size = .medium
        case "big": size = .big
        default: size = .normal
        }
        var bonus = ChallengeBonusModifiers()
        if let bonusNode = node.children.first(where: { $0.tag == "bonusMods" }) {
            bonus.fruit = try float(bonusNode, "bonusFruit", path: path) ?? 1
            bonus.accuracy = try float(bonusNode, "bonusAccuracy", path: path) ?? 1
            bonus.finesse = try float(bonusNode, "bonusFinesse", path: path) ?? 1
        }
        return ChallengeDefinition(
            name: name,
            customWave: node.attrs["customWave"],
            timeLimit: try float(node, "timeLimit", path: path) ?? 0,
            challengeFruitSize: size,
            forceWave: node.attrs["forceWave"].map { $0 == "true" },
            startActive: node.attrs["startActive"] == "true",
            prioritySelection: node.attrs["prioritySelection"] != nil,
            hard: hard,
            instructions: node.attrs["instructions"] ?? "No Instructions",
            conditionNames: node.children.filter { $0.tag == "condition" }
                .compactMap { $0.attrs["name"] },
            modNames: node.children.filter { $0.tag == "mod" }
                .compactMap { $0.attrs["name"] },
            bonusMods: bonus,
            points: try integer(node, "points", path: path),
            numWaves: waves,
            type: node.attrs["type"],
            evaluateOnEndAttribute: node.attrs["evaluateOnEnd"].map { $0 == "true" },
            selection: try selection(node,
                                     fallback: ChallengeSelectionWeight(),
                                     path: path),
            rawAttributes: node.attrs)
    }

    private static func selection(_ node: ContentNode,
                                  fallback: ChallengeSelectionWeight,
                                  path: String) throws -> ChallengeSelectionWeight {
        ChallengeSelectionWeight(
            chanceSelect: try integer(node, "chanceSelect", path: path)
                ?? fallback.chanceSelect,
            chanceRegrowth: try float(node, "chanceRegrowth", path: path)
                ?? fallback.chanceRegrowth)
    }

    private static func integer(_ node: ContentNode,
                                _ key: String,
                                path: String) throws -> Int32? {
        guard let raw = node.attrs[key] else { return nil }
        let trimmed = raw.trimmingCharacters(in: .whitespacesAndNewlines)
        guard let value = Int32(trimmed) else {
            throw ChallengeCatalogLoadError.invalidNumber(
                node: node.tag, attribute: key, raw: raw, path: path)
        }
        return value
    }

    private static func float(_ node: ContentNode,
                              _ key: String,
                              path: String) throws -> Float? {
        guard let raw = node.attrs[key] else { return nil }
        var trimmed = raw.trimmingCharacters(in: .whitespacesAndNewlines)
        // 原 XML 使用 1.0f；其数值解析等价于 strtod 的前缀形式，发售配置中 f 仅为后缀。
        if trimmed.last == "f" || trimmed.last == "F" {
            trimmed.removeLast()
        }
        guard let value = Float(trimmed) else {
            throw ChallengeCatalogLoadError.invalidNumber(
                node: node.tag, attribute: key, raw: raw, path: path)
        }
        return value
    }
}
