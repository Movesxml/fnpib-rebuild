import Foundation

// T-026 转换器输出是带 source/bytes/encoding/root 的文档，不是裸 ContentNode。
// 字段映射依据 FUN_0001267c、FUN_00053cb8、FUN_000537ec；真实数据之外的
// 非官方别名不自动采纳，所有已识别字段的非法值都会带路径抛出。

public struct ContentNode: Codable, Equatable, Sendable {
    public var tag: String
    public var attrs: [String: String]
    public var text: String?
    public var tail: String?
    public var children: [ContentNode]

    public init(tag: String,
                attrs: [String: String] = [:],
                text: String? = nil,
                tail: String? = nil,
                children: [ContentNode] = []) {
        self.tag = tag
        self.attrs = attrs
        self.text = text
        self.tail = tail
        self.children = children
    }

    private enum CodingKeys: String, CodingKey {
        case tag, attrs, text, tail, children
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        tag = try container.decode(String.self, forKey: .tag)
        attrs = try container.decodeIfPresent([String: String].self, forKey: .attrs) ?? [:]
        text = try container.decodeIfPresent(String.self, forKey: .text)
        tail = try container.decodeIfPresent(String.self, forKey: .tail)
        children = try container.decodeIfPresent([ContentNode].self, forKey: .children) ?? []
    }
}

private struct ContentDocument: Decodable {
    let root: ContentNode
}

public enum OriginalContentError: Error, Equatable, Sendable {
    case invalidJSON(path: String, reason: String)
    case unexpectedRoot(expected: String, actual: String)
    case missingAttribute(node: String, attribute: String, path: String)
    case invalidNumber(node: String, attribute: String, raw: String, path: String)
    case invalidBoolean(node: String, attribute: String, raw: String, path: String)
    case duplicateFruit(name: String, path: String)
    case duplicateNode(tag: String, path: String)
    case emptySpawnTypeToken(index: Int, path: String)
    case unknownSpawnType(raw: String, path: String)
    case emptyComboBonuses(path: String)
}

extension OriginalContentError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case let .invalidJSON(path, reason):
            return "\(path): JSON 解码失败 — \(reason)"
        case let .unexpectedRoot(expected, actual):
            return "root 校验失败：期望 <\(expected)>，实际 <\(actual)>"
        case let .missingAttribute(node, attribute, path):
            return "\(path): <\(node)> 缺少必需属性 `\(attribute)`"
        case let .invalidNumber(node, attribute, raw, path):
            return "\(path): <\(node)> 属性 `\(attribute)` 不是合法数字：\"\(raw)\""
        case let .invalidBoolean(node, attribute, raw, path):
            return "\(path): <\(node)> 属性 `\(attribute)` 不是合法布尔值：\"\(raw)\""
        case let .duplicateFruit(name, path):
            return "\(path): 水果名重复 `\(name)`"
        case let .duplicateNode(tag, path):
            return "\(path): 节点 <\(tag)> 重复出现"
        case let .emptySpawnTypeToken(index, path):
            return "\(path): Spawn.type 第 \(index) 个 token 为空"
        case let .unknownSpawnType(raw, path):
            return "\(path): Spawn.type 未知水果名 `\(raw)`"
        case let .emptyComboBonuses(path):
            return "\(path): 缺少 combo 奖励档位，拒绝使用占位值"
        }
    }
}

public struct OriginalFruitList: Equatable, Sendable {
    public var fruits: [FruitInfo]
    public var bomb: BombInfo
    public var critical: CriticalConfig?

    public init(fruits: [FruitInfo], bomb: BombInfo, critical: CriticalConfig?) {
        self.fruits = fruits
        self.bomb = bomb
        self.critical = critical
    }
}

public struct OriginalWaveDefaults: Equatable, Sendable {
    /// waveManager 级默认值，不是单个 WaveInfo.chance。
    public var waveChance: Int32?
    /// 原解析器实际读取的 defaults 键。
    public var waveChanceRegrowth: Float?
    public var criticalChance: Float?
    /// 保留全部原始键；真实文件的 waveChanceGrowth 不会被冒充为 Regrowth。
    public var raw: [String: String]

    public init(waveChance: Int32? = nil,
                waveChanceRegrowth: Float? = nil,
                criticalChance: Float? = nil,
                raw: [String: String] = [:]) {
        self.waveChance = waveChance
        self.waveChanceRegrowth = waveChanceRegrowth
        self.criticalChance = criticalChance
        self.raw = raw
    }
}

public struct OriginalWaveList: Equatable, Sendable {
    public var waves: [WaveInfo]
    public var defaults: OriginalWaveDefaults

    public init(waves: [WaveInfo], defaults: OriginalWaveDefaults) {
        self.waves = waves
        self.defaults = defaults
    }
}

public struct OriginalClassicConfig: Equatable, Sendable {
    public struct MagicBean: Equatable, Sendable {
        public var baseInterval: Float
        public var intervalGrowth: Float
        public var intervalVariation: Float
        /// 保留原 XML 的 initalSpawn 拼写所对应的语义，不另造生成参数。
        public var initialSpawn: Float
        public var score: Int32
    }

    public struct Timing: Equatable, Sendable {
        public var dtStart: Float
        public var dtIncrease: Float
    }

    public var magicBean: MagicBean
    public var timing: Timing
}

public struct OriginalContent: Equatable, Sendable {
    public var fruits: OriginalFruitList
    public var waves: OriginalWaveList
    public var classic: OriginalClassicConfig
    /// bonusAwards.xml 中 combo 节点按文档顺序排列的 bonus 值。
    public var comboBonuses: [Int32]
    public var challengeCatalog: ChallengeCatalog
    public var challengeConditions: [ChallengeConditionDefinition]

    public init(fruits: OriginalFruitList,
                waves: OriginalWaveList,
                classic: OriginalClassicConfig,
                comboBonuses: [Int32],
                challengeCatalog: ChallengeCatalog,
                challengeConditions: [ChallengeConditionDefinition]) {
        self.fruits = fruits
        self.waves = waves
        self.classic = classic
        self.comboBonuses = comboBonuses
        self.challengeCatalog = challengeCatalog
        self.challengeConditions = challengeConditions
    }
}

public enum OriginalContentLoader {
    public static func load(fruitsData: Data,
                            wavesData: Data,
                            bonusAwardsData: Data,
                            originalModeData: Data,
                            challengeCatalogData: Data,
                            challengeConditionsData: Data) throws -> OriginalContent {
        let fruitList = try loadFruits(from: fruitsData)
        let waveList = try loadWaves(from: wavesData, fruits: fruitList.fruits)
        let comboBonuses = try loadComboBonuses(from: bonusAwardsData)
        let classic = try loadClassicConfig(from: originalModeData)
        let challengeCatalog = try ChallengeCatalogLoader.load(from: challengeCatalogData)
        let challengeConditions = try ChallengeConditionLoader.load(from: challengeConditionsData)
        return OriginalContent(fruits: fruitList,
                               waves: waveList,
                               classic: classic,
                               comboBonuses: comboBonuses,
                               challengeCatalog: challengeCatalog,
                               challengeConditions: challengeConditions)
    }

    /// FUN_0006fa3c：DAT_005f9610+0x14 即 DAT_005f9624，读取 magicBean.beanScore。
    /// 发售版配置字段齐全；缺失或重复节点直接报错，不用代码常量补造原始行为。
    public static func loadClassicConfig(from data: Data) throws -> OriginalClassicConfig {
        let root = try decodeRoot(from: data, expected: "originalMode", source: "originalModeInfo.json")
        let magicNodes = root.children.filter { $0.tag == "magicBean" }
        let timingNodes = root.children.filter { $0.tag == "timing" }
        guard magicNodes.count == 1, timingNodes.count == 1 else {
            let tag = magicNodes.count == 1 ? "timing" : "magicBean"
            throw OriginalContentError.missingAttribute(node: tag,
                                                        attribute: "uniqueNode",
                                                        path: root.tag)
        }
        let bean = magicNodes[0]
        let timing = timingNodes[0]
        let beanPath = "\(root.tag)/magicBean"
        let timingPath = "\(root.tag)/timing"
        return OriginalClassicConfig(
            magicBean: .init(
                baseInterval: try requiredFloat(bean, "baseInterval", beanPath),
                intervalGrowth: try requiredFloat(bean, "intervalGrowth", beanPath),
                intervalVariation: try requiredFloat(bean, "intervalVariation", beanPath),
                initialSpawn: try requiredFloat(bean, "initalSpawn", beanPath),
                score: try requiredInt32(bean, "beanScore", beanPath)),
            timing: .init(
                dtStart: try requiredFloat(timing, "dtStart", timingPath),
                dtIncrease: try requiredFloat(timing, "dtIncrease", timingPath)))
    }

    private static func requiredFloat(_ node: ContentNode,
                                      _ key: String,
                                      _ path: String) throws -> Float {
        guard let value = try floatValue(node, key, path) else {
            throw OriginalContentError.missingAttribute(node: node.tag, attribute: key, path: path)
        }
        return value
    }

    private static func requiredInt32(_ node: ContentNode,
                                      _ key: String,
                                      _ path: String) throws -> Int32 {
        guard let value = try int32Value(node, key, path) else {
            throw OriginalContentError.missingAttribute(node: node.tag, attribute: key, path: path)
        }
        return value
    }

    /// FUN_0002c8f0 只读取根节点直接子级 combo 的 bonus，length 不参与数组索引。
    public static func loadComboBonuses(from data: Data) throws -> [Int32] {
        let root = try decodeRoot(from: data, expected: "bonusAwardsFile", source: "bonusAwards.json")
        var bonuses: [Int32] = []
        for (index, child) in root.children.enumerated() where child.tag == "combo" {
            let path = "\(root.tag)/\(child.tag)[\(index)]"
            guard let bonus = try int32Value(child, "bonus", path) else {
                throw OriginalContentError.missingAttribute(node: child.tag,
                                                            attribute: "bonus",
                                                            path: path)
            }
            bonuses.append(bonus)
        }
        guard !bonuses.isEmpty else {
            throw OriginalContentError.emptyComboBonuses(path: root.tag)
        }
        return bonuses
    }

    public static func loadFruits(from data: Data) throws -> OriginalFruitList {
        let root = try decodeRoot(from: data, expected: "fruitInfoFile", source: "fruitList.json")
        var fruits: [FruitInfo] = []
        var bomb: BombInfo?
        var critical: CriticalConfig?
        var seenNames = Set<String>()

        // FUN_0001267c 先加载全局 critical，再逐个加载水果；XML 文档顺序不影响规则。
        for (index, child) in root.children.enumerated() where child.tag == "critical" {
            let path = "\(root.tag)/\(child.tag)[\(index)]"
            guard critical == nil else {
                throw OriginalContentError.duplicateNode(tag: child.tag, path: path)
            }
            critical = try parseCritical(child, path: path)
        }
        let resolvedCritical = critical ?? CriticalConfig()

        for (index, child) in root.children.enumerated() {
            let path = "\(root.tag)/\(child.tag)[\(index)]"
            switch child.tag {
            case "FruitInfo":
                let info = try parseFruit(child,
                                          typeID: Int32(fruits.count),
                                          path: path,
                                          critical: resolvedCritical)
                guard !seenNames.contains(info.name) else {
                    throw OriginalContentError.duplicateFruit(name: info.name, path: path)
                }
                seenNames.insert(info.name)
                fruits.append(info)
            case "critical":
                continue // 已在水果加载前统一解析
            case "bomb":
                guard bomb == nil else {
                    throw OriginalContentError.duplicateNode(tag: child.tag, path: path)
                }
                bomb = try parseBomb(child, path: path)
            default:
                continue
            }
        }
        return OriginalFruitList(fruits: fruits, bomb: bomb ?? BombInfo(), critical: critical)
    }

    public static func loadWaves(from data: Data, fruits: [FruitInfo]) throws -> OriginalWaveList {
        var fruitIndex: [String: Int32] = [:]
        for fruit in fruits {
            guard fruitIndex[fruit.name] == nil else {
                throw OriginalContentError.duplicateFruit(name: fruit.name, path: "fruitInfoFile")
            }
            fruitIndex[fruit.name] = fruit.typeID
        }
        return try loadWaves(from: data, fruitIndex: fruitIndex)
    }

    public static func loadWaves(from data: Data,
                                 fruitIndex: [String: Int32]) throws -> OriginalWaveList {
        let root = try decodeRoot(from: data, expected: "waveManagerFile", source: "originalWaveList.json")
        var defaults = OriginalWaveDefaults()
        var sawDefaults = false
        for (index, child) in root.children.enumerated() where child.tag == "defaults" {
            let path = "\(root.tag)/\(child.tag)[\(index)]"
            guard !sawDefaults else {
                throw OriginalContentError.duplicateNode(tag: child.tag, path: path)
            }
            sawDefaults = true
            defaults = try parseDefaults(child, path: path)
        }

        var waves: [WaveInfo] = []
        var untilTokens: [String] = []
        for (index, child) in root.children.enumerated() where child.tag == "WaveInfo" {
            let path = "\(root.tag)/\(child.tag)[\(index)]"
            let parsed = try parseWave(child,
                                       documentIndex: Int32(waves.count),
                                       path: path,
                                       fruitIndex: fruitIndex,
                                       defaults: defaults)
            waves.append(parsed.wave)
            untilTokens.append(parsed.untilToken)
        }

        let processed = WaveInfo.postProcessUntil(rawTokens: untilTokens,
                                                  waveNos: waves.map { $0.waveNo })
        for index in waves.indices {
            waves[index].until = processed[index]
        }
        return OriginalWaveList(waves: waves, defaults: defaults)
    }

    private static func decodeRoot(from data: Data,
                                   expected: String,
                                   source: String) throws -> ContentNode {
        let document: ContentDocument
        do {
            document = try JSONDecoder().decode(ContentDocument.self, from: data)
        } catch {
            throw OriginalContentError.invalidJSON(path: source, reason: String(describing: error))
        }
        guard document.root.tag == expected else {
            throw OriginalContentError.unexpectedRoot(expected: expected, actual: document.root.tag)
        }
        return document.root
    }

    private static func parseFruit(_ node: ContentNode,
                                   typeID: Int32,
                                   path: String,
                                   critical: CriticalConfig) throws -> FruitInfo {
        guard let name = node.attrs["name"], !name.isEmpty else {
            throw OriginalContentError.missingAttribute(node: node.tag, attribute: "name", path: path)
        }
        var info = FruitInfo()
        info.name = name
        info.typeID = typeID
        info.chance = try int32Value(node, "chance", path)
        // FUN_00015404 的缺省 score=1；只有显式 score 才覆盖构造器初值。
        if let score = try int32Value(node, "score", path) { info.score = score }
        info.noScore = info.score == 0
        info.powers = try node.children.filter { $0.tag == "power" }.enumerated().map { index, power in
            var parsed = FruitPower()
            parsed.name = power.attrs["name"] ?? ""
            parsed.chance = try int32Value(power, "chance", "\(path).power[\(index)]") ?? 100
            return parsed
        }
        if let value = try floatValue(node, "scale", path) { info.scale = value }
        if let value = try floatValue(node, "collision", path) { info.collision = value }
        if let value = try floatValue(node, "hitInfluence", path) { info.hitInfluence = value }
        // FUN_0001267c 先读 onside，再读 onSide，且仅精确 true 置位。
        if let value = try boolValue(node, keys: ["onside", "onSide"], path: path) {
            info.onside = value
        }
        if let value = try boolValue(node, keys: ["onlySprinkle"], path: path) {
            info.onlySprinkle = value
        }

        // 自动规则严格按原版顺序：colours.alpha==0，再比较全局 critical.score。
        if let colours = node.children.first(where: { $0.tag == "colours" }),
           let raw = colours.attrs["colour"] {
            let components = raw.split(separator: ",", omittingEmptySubsequences: false)
            var values = [Int32](repeating: 255, count: 4)
            for index in 0..<min(components.count, values.count) {
                let component = components[index].trimmingCharacters(in: .whitespacesAndNewlines)
                guard let value = Int32(component) else {
                    throw OriginalContentError.invalidNumber(node: colours.tag, attribute: "colour",
                                                             raw: raw, path: path)
                }
                values[index] = value
            }
            if values[3] == 0 { info.noCritical = false }
        }
        if let threshold = critical.score, threshold <= info.score {
            info.noCritical = false
        }
        // 显式 noCritical 最后覆盖：true 清除，false 置位。
        if let value = try boolValue(node, keys: ["noCritical"], path: path) {
            info.noCritical = !value
        }
        return info
    }

    private static func parseCritical(_ node: ContentNode, path: String) throws -> CriticalConfig {
        var config = CriticalConfig()
        config.raw = node.attrs
        config.newLifeAt = try int32Value(node, "new_life_at", path)
        config.score = try int32Value(node, "score", path)
        config.chance = try int32Value(node, "chance", path)
        config.chanceInc = try int32Value(node, "chance_inc", path)
        config.splats = try int32Value(node, "splats", path)
        config.scale = try floatValue(node, "scale", path)
        config.spread = try floatValue(node, "spread", path)
        config.disappearSpeed = try floatValue(node, "disappear_speed", path)
        config.colour = node.attrs["colour"]
        return config
    }

    private static func parseBomb(_ node: ContentNode, path: String) throws -> BombInfo {
        var bomb = BombInfo()
        if let value = try floatValue(node, "size", path) { bomb.size = value }
        if let value = try floatValue(node, "collision", path) { bomb.collision = value }
        return bomb
    }

    private static func parseDefaults(_ node: ContentNode,
                                      path: String) throws -> OriginalWaveDefaults {
        var defaults = OriginalWaveDefaults(raw: node.attrs)
        defaults.waveChance = try int32Value(node, "waveChance", path)
        defaults.waveChanceRegrowth = try floatValue(node, "waveChanceRegrowth", path)
        defaults.criticalChance = try floatValue(node, "criticalChance", path)
        return defaults
    }

    private static func parseWave(_ node: ContentNode,
                                  documentIndex: Int32,
                                  path: String,
                                  fruitIndex: [String: Int32],
                                  defaults: OriginalWaveDefaults) throws
        -> (wave: WaveInfo, untilToken: String) {
        var wave = WaveInfo()
        wave.waveNo = try int32Value(node, "waveNo", path) ?? documentIndex
        // FUN_00058ee4：WaveInfo 的缺省权重来自 defaults.waveChance。
        wave.chance = try int32Value(node, "chance", path) ?? defaults.waveChance
        if let value = defaults.waveChanceRegrowth { wave.chanceRegrowth = value }
        if let value = defaults.criticalChance { wave.criticalChance = value }
        if let value = try floatValue(node, "criticalChance", path) { wave.criticalChance = value }
        if let value = try floatValue(node, "chanceRegrowth", path) { wave.chanceRegrowth = value }

        for (index, child) in node.children.enumerated() {
            let childPath = "\(path)/\(child.tag)[\(index)]"
            switch child.tag {
            case "Spawn":
                wave.spawners.append(try parseSpawn(child, path: childPath, fruitIndex: fruitIndex))
            case "Wave_dt":
                if let value = try floatValue(child, "dt", childPath) { wave.dt = value }
                if let value = try floatValue(child, "inc", childPath) { wave.dtInc = value }
                if let value = try floatValue(child, "spinc", childPath) { wave.dtSpInc = value }
            case "NextWaveDelay":
                // 保持 FUN_00053cb8 的写入顺序：wait > 0 先清零 delay/inc，
                // 随后显式 delay/inc 仍可覆盖清零结果。
                if let value = try floatValue(child, "wait", childPath) { wave.nextWait = value }
                if let value = try floatValue(child, "waitSpinc", childPath) { wave.nextWaitSpInc = value }
                if let value = try floatValue(child, "speedLoss", childPath) { wave.speedLoss = value }
                if wave.nextWait > 0 {
                    wave.nextDelay = 0
                    wave.nextDelayInc = 0
                }
                if let value = try floatValue(child, "delay", childPath) { wave.nextDelay = value }
                if let value = try floatValue(child, "inc", childPath) { wave.nextDelayInc = value }
                if let value = try boolValue(child, keys: ["waitForEntities"], path: childPath) {
                    wave.waitForEntities = value
                }
                if let value = try boolValue(child, keys: ["waitForProcessing"], path: childPath) {
                    wave.waitForProcessing = value
                }
            default:
                continue
            }
        }
        return (wave, node.attrs["until"] ?? "")
    }

    private static func parseSpawn(_ node: ContentNode,
                                   path: String,
                                   fruitIndex: [String: Int32]) throws -> Spawner {
        var spawner = Spawner()
        if let value = try floatValue(node, "min", path) { spawner.min = value }
        if let value = try floatValue(node, "max", path) { spawner.max = value }
        let minInc = try floatValue(node, "mininc", path)
        let maxInc = try floatValue(node, "maxinc", path)
        spawner.minInc = maxInc ?? minInc ?? 0
        spawner.maxInc = maxInc ?? 0
        if let value = try floatValue(node, "delay", path) { spawner.delay = value }
        if let value = try floatValue(node, "delayinc", path) { spawner.delayInc = value }

        // FUN_000537ec：velscale 先同时写两轴，显式单轴缩放随后覆盖。
        if let value = try floatValue(node, "velX", path) { spawner.velocityX = value }
        if let value = try floatValue(node, "velY", path) { spawner.velocityY = value }
        if let value = try floatValue(node, "velscale", path) {
            spawner.velocityScaleX = value
            spawner.velocityScaleY = value
        } else {
            spawner.velocityScaleY = spawner.velocityScaleX
        }
        if let value = try floatValue(node, "velXscale", path) { spawner.velocityScaleX = value }
        if let value = try floatValue(node, "velYscale", path) { spawner.velocityScaleY = value }

        // 原版只采纳非空 gravity；这里要求与 FUN_000394a0 对应的三分量逗号格式。
        if let raw = node.attrs["gravity"], !raw.isEmpty {
            let components = raw.split(separator: ",", omittingEmptySubsequences: false)
            guard components.count == 3 else {
                throw OriginalContentError.invalidNumber(node: node.tag, attribute: "gravity",
                                                         raw: raw, path: path)
            }
            var values: [Float] = []
            values.reserveCapacity(3)
            for component in components {
                let trimmed = component.trimmingCharacters(in: .whitespacesAndNewlines)
                guard let value = Float(trimmed) else {
                    throw OriginalContentError.invalidNumber(node: node.tag, attribute: "gravity",
                                                             raw: raw, path: path)
                }
                values.append(value)
            }
            spawner.gravity = SIMD3<Float>(values[0], values[1], values[2])
        }

        guard let rawType = node.attrs["type"] else {
            throw OriginalContentError.missingAttribute(node: node.tag, attribute: "type", path: path)
        }
        let tokens = rawType.split(separator: ",", omittingEmptySubsequences: false)
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
        for (index, token) in tokens.enumerated() {
            guard !token.isEmpty else {
                throw OriginalContentError.emptySpawnTypeToken(index: index, path: path)
            }
            switch token {
            case "bomb": spawner.types.append(.bomb)
            case "random": spawner.types.append(.random)
            default:
                guard let typeID = fruitIndex[token] else {
                    throw OriginalContentError.unknownSpawnType(raw: token, path: path)
                }
                spawner.types.append(.fruit(typeID))
            }
        }
        return spawner
    }

    private static func int32Value(_ node: ContentNode,
                                   _ key: String,
                                   _ path: String) throws -> Int32? {
        guard let raw = node.attrs[key] else { return nil }
        let trimmed = raw.trimmingCharacters(in: .whitespacesAndNewlines)
        guard let value = Int32(trimmed) else {
            throw OriginalContentError.invalidNumber(node: node.tag, attribute: key, raw: raw, path: path)
        }
        return value
    }

    private static func floatValue(_ node: ContentNode,
                                   _ key: String,
                                   _ path: String) throws -> Float? {
        guard let raw = node.attrs[key] else { return nil }
        let trimmed = raw.trimmingCharacters(in: .whitespacesAndNewlines)
        guard let value = Float(trimmed) else {
            throw OriginalContentError.invalidNumber(node: node.tag, attribute: key, raw: raw, path: path)
        }
        return value
    }

    private static func boolValue(_ node: ContentNode,
                                  keys: [String],
                                  path: String) throws -> Bool? {
        for key in keys {
            guard let raw = node.attrs[key] else { continue }
            switch raw.trimmingCharacters(in: .whitespacesAndNewlines) {
            case "true": return true
            case "false": return false
            default:
                throw OriginalContentError.invalidBoolean(node: node.tag, attribute: key, raw: raw, path: path)
            }
        }
        return nil
    }
}
