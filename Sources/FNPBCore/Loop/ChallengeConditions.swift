import Foundation

// 发售版挑战条件系统。
// 配置：challengeConditions.xml；行为：FUN_0005e924 / FUN_0005efb4 /
// FUN_0005ec7c / FUN_0005edc8 / FUN_0005ed54 及 0x538828、0x52ca80、
// 0x52cae0、0x538880、0x5388e0、0x538940 虚表。
// 注意保留原版槽位分工：STATS_COMPARE 覆盖标准 updateResult，TIME 另在 +0x28 消耗倒计时。

public enum ChallengeOutcome: Int32, Sendable, Equatable {
    case pending = 0
    case pass = 1
    case fail = 2
}

public enum ChallengeConditionKind: Int32, Sendable, Equatable {
    case base = 0
    case score = 1
    case stats = 2
    case consecutive = 3
    case statsCompare = 4
    case time = 5
}

public enum ChallengeComparison: Int32, Sendable, Equatable {
    case equal = 0
    case notEqual = 1
    case greater = 2
    /// FUN_00039bd4 对未知字符串返回 3；FUN_00039c74 对该值恒返回 false。
    case unsupported = 3

    public func evaluate(_ lhs: Int32, _ rhs: Int32) -> Bool {
        switch self {
        case .equal: return lhs == rhs
        case .notEqual: return lhs != rhs
        case .greater: return lhs > rhs
        case .unsupported: return false
        }
    }
}

public struct ChallengeConditionDefinition: Sendable, Equatable {
    public var name: String
    public var kind: ChallengeConditionKind
    public var result: ChallengeOutcome
    public var total: Int32
    public var specificType: String?
    public var specificType2: String?
    public var evaluateOnEnd: Bool
    public var comparison: ChallengeComparison
    public var time: Float

    public init(name: String,
                kind: ChallengeConditionKind,
                result: ChallengeOutcome = .pass,
                total: Int32 = 0,
                specificType: String? = nil,
                specificType2: String? = nil,
                evaluateOnEnd: Bool = false,
                comparison: ChallengeComparison = .equal,
                time: Float = 10) {
        self.name = name
        self.kind = kind
        self.result = result
        self.total = total
        self.specificType = specificType
        self.specificType2 = specificType2
        self.evaluateOnEnd = evaluateOnEnd
        self.comparison = comparison
        self.time = time
    }
}

public struct ChallengeEvaluationContext: Sendable, Equatable {
    /// FUN_0001cd94(0) 返回的玩家 0 当前分数。
    public var score: Int32
    /// FUN_00027508 的只读统计视图；缺失键与原函数一样返回 0。
    public var stats: [String: Int32]
    /// TIME 到期时 FUN_00006a84(..., 1) == 0 的外部门控。
    public var timerCompletionAllowed: Bool

    public init(score: Int32 = 0,
                stats: [String: Int32] = [:],
                timerCompletionAllowed: Bool = true) {
        self.score = score
        self.stats = stats
        self.timerCompletionAllowed = timerCompletionAllowed
    }

    /// 生产入口直接读取当前 ScoreSystem / StatsRecorder，不维护挑战私有计数副本。
    public init(score: Int32,
                stats recorder: any StatsRecording,
                timerCompletionAllowed: Bool = true) {
        self.init(score: score,
                  stats: recorder.challengeValues(),
                  timerCompletionAllowed: timerCompletionAllowed)
    }

    public func statistic(_ key: String?) -> Int32 {
        stats[key ?? ""] ?? 0
    }
}

public struct ChallengeCondition: Sendable, Equatable {
    public var definition: ChallengeConditionDefinition
    public private(set) var current: ChallengeOutcome
    public private(set) var timeRemaining: Float
    /// condition+0x50 的值语义投影；只有 challengeFruit 占位符在激活时使用它。
    public private(set) var selectedFruitName: String?

    public init(_ definition: ChallengeConditionDefinition) {
        self.definition = definition
        current = .pending
        timeRemaining = definition.time
        selectedFruitName = nil
    }

    /// 所有类型先清当前结果；TIME 的 0x5f624 另外恢复完整倒计时。
    public mutating func reset() {
        current = .pending
        if definition.kind == .time {
            timeRemaining = definition.time
        }
    }

    /// FUN_0005ed54 → 虚表+8：选定水果后激活；不改共享 definition，允许下回合重绑。
    public mutating func activate(selectedFruitName: String?) {
        reset()
        self.selectedFruitName = selectedFruitName?.lowercased()
    }

    /// 虚表 +0x44。SCORE / STATS 等只返回 target <= current；
    /// STATS_COMPARE 的 0x5f0b8 则在比较后自行更新 current 并返回是否变化。
    @discardableResult
    public mutating func check(context: ChallengeEvaluationContext) -> Bool {
        if definition.kind == .statsCompare {
            let old = current
            let lhs = context.statistic(resolvedStatisticKey(definition.specificType))
            // specific_type2 不做 challengeFruit 替换，但原加载器对两个键都做小写哈希；
            // 值语义入口因此也必须规范化大小写，不能让驼峰键意外读到 0。
            let rhs = context.statistic(definition.specificType2?.lowercased())
            current = definition.comparison.evaluate(lhs, rhs) ? definition.result : .pending
            return current != old
        }
        return currentValue(context: context) >= definition.total
    }

    /// 虚表 +0x48。基类、SCORE、STATS、CONSECUTIVE、TIME 使用 0x5f5c0；
    /// STATS_COMPARE 覆盖为 0x5f0b8，比较后同样更新 current。
    @discardableResult
    public mutating func updateResult(context: ChallengeEvaluationContext) -> Bool {
        if definition.kind == .statsCompare {
            return check(context: context)
        }
        let old = current
        current = check(context: context) ? definition.result : .pending
        return current != old
    }

    /// 虚表 +0x14：回合结束求值。
    @discardableResult
    public mutating func evaluateEnd(context: ChallengeEvaluationContext) -> Bool {
        switch definition.kind {
        case .base, .score, .stats:
            return updateResult(context: context)
        case .statsCompare:
            return definition.evaluateOnEnd ? updateResult(context: context) : false
        case .consecutive, .time:
            return false
        }
    }

    /// 虚表 +0x18：即时求值入口。
    @discardableResult
    public mutating func evaluateImmediate(context: ChallengeEvaluationContext) -> Bool {
        switch definition.kind {
        case .base, .score, .stats:
            return updateResult(context: context)
        case .statsCompare:
            return definition.evaluateOnEnd ? false : updateResult(context: context)
        case .consecutive, .time:
            return false
        }
    }

    /// CONSECUTIVE 的 0x5f21c：nil 过滤值是通配；占位符只在激活后解析。
    @discardableResult
    public mutating func recordConsecutive(count: Int32,
                                           specificType: String?) -> Bool {
        guard definition.kind == .consecutive else { return false }
        if let required = resolvedStatisticKey(definition.specificType),
           required != specificType?.lowercased() {
            return false
        }
        let old = current
        current = count >= definition.total ? definition.result : .pending
        return current != old
    }

    /// 虚表 +0x28；只有 TIME 的 0x5f1cc 消耗 dt。
    @discardableResult
    public mutating func update(dt: Float,
                                context: ChallengeEvaluationContext) -> Bool {
        guard definition.kind == .time else { return false }
        let old = current
        timeRemaining -= dt
        if timeRemaining <= 0, context.timerCompletionAllowed {
            current = definition.result
        } else {
            current = .pending
        }
        return current != old
    }

    private func resolvedStatisticKey(_ raw: String?) -> String? {
        guard let raw, !raw.isEmpty else { return nil }
        if raw.lowercased() == "challengefruit" {
            return selectedFruitName
        }
        return raw.lowercased()
    }

    private func currentValue(context: ChallengeEvaluationContext) -> Int32 {
        switch definition.kind {
        case .score:
            return context.score
        case .stats:
            return context.statistic(resolvedStatisticKey(definition.specificType))
        case .base, .consecutive, .statsCompare, .time:
            return 0
        }
    }
}

public enum ChallengeConditionLoadError: Error, Sendable, Equatable {
    case invalidJSON(String)
    case unexpectedRoot(expected: String, actual: String)
    case missingAttribute(condition: Int, attribute: String)
    case invalidNumber(condition: Int, attribute: String, raw: String)
}

public enum ChallengeConditionLoader {
    private struct Document: Decodable {
        let root: ContentNode
    }

    public static func load(from data: Data) throws -> [ChallengeConditionDefinition] {
        let document: Document
        do {
            document = try JSONDecoder().decode(Document.self, from: data)
        } catch {
            throw ChallengeConditionLoadError.invalidJSON(String(describing: error))
        }
        guard document.root.tag == "challengeConditions" else {
            throw ChallengeConditionLoadError.unexpectedRoot(
                expected: "challengeConditions", actual: document.root.tag)
        }
        return try document.root.children.enumerated().compactMap { index, node in
            guard node.tag == "condition" else { return nil }
            guard let name = node.attrs["name"] else {
                throw ChallengeConditionLoadError.missingAttribute(condition: index, attribute: "name")
            }
            let rawType = node.attrs["type"]?.uppercased()
            let kind: ChallengeConditionKind
            switch rawType {
            case "SCORE": kind = .score
            case "STATS": kind = .stats
            case "CONSECUTIVE": kind = .consecutive
            case "STATS_COMPARE": kind = .statsCompare
            case "TIME": kind = .time
            default: kind = .base // 原工厂 default，不以未知字符串 invent 新规则
            }
            let comparison: ChallengeComparison
            switch node.attrs["comparison"]?.uppercased() {
            case nil, "EQUAL": comparison = .equal
            case "NOT_EQUAL": comparison = .notEqual
            case "GREATER": comparison = .greater
            default: comparison = .unsupported
            }
            return ChallengeConditionDefinition(
                name: name,
                kind: kind,
                result: node.attrs["result"]?.uppercased() == "FAIL" ? .fail : .pass,
                total: try integer(node.attrs["total"], condition: index, attribute: "total") ?? 0,
                specificType: normalized(node.attrs["specific_type"]),
                // 0x5f118 在 comparison 缺失时会把第二统计键清零。
                specificType2: node.attrs["comparison"] == nil
                    ? nil : normalized(node.attrs["specific_type2"]),
                evaluateOnEnd: node.attrs["evaluateOnEnd"]?.uppercased() == "TRUE",
                comparison: comparison,
                time: try float(node.attrs["time"], condition: index, attribute: "time") ?? 10)
        }
    }

    private static func normalized(_ value: String?) -> String? {
        value?.lowercased()
    }

    private static func integer(_ raw: String?,
                                condition: Int,
                                attribute: String) throws -> Int32? {
        guard let raw else { return nil }
        guard let value = Int32(raw) else {
            throw ChallengeConditionLoadError.invalidNumber(
                condition: condition, attribute: attribute, raw: raw)
        }
        return value
    }

    private static func float(_ raw: String?,
                              condition: Int,
                              attribute: String) throws -> Float? {
        guard let raw else { return nil }
        guard let value = Float(raw) else {
            throw ChallengeConditionLoadError.invalidNumber(
                condition: condition, attribute: attribute, raw: raw)
        }
        return value
    }
}

/// DAT_005f94b4 的值语义重建：完整条件表 + 当前挑战的保序激活列表。
public struct ChallengeConditionsRuntime: Sendable, Equatable {
    private var conditions: [String: ChallengeCondition]
    private var activeNames: [String] = []

    public private(set) var result: ChallengeOutcome = .pending
    /// 原聚合器 +0x24；选择多个 TIME 时后项覆盖前项，缺省为 0。
    public private(set) var timerDuration: Float = 0

    public init(definitions: [ChallengeConditionDefinition]) {
        var conditions: [String: ChallengeCondition] = [:]
        for definition in definitions {
            // 原加载表按名称哈希索引；重复名称由后项替换，原始文档仍可由 Loader 全量审计。
            conditions[definition.name.lowercased()] = ChallengeCondition(definition)
        }
        self.conditions = conditions
    }

    public var activeConditions: [ChallengeCondition] {
        activeNames.compactMap { conditions[$0] }
    }

    public func condition(named name: String) -> ChallengeCondition? {
        conditions[name.lowercased()]
    }

    /// FUN_0005ed54：只重置并入列真实存在的条件，未知名称静默跳过。
    /// 选择器先提供本回合水果，再激活条件；共享 definition 保持不变。
    public mutating func select(conditionNames names: [String],
                                selectedFruitName: String? = nil) {
        result = .pending
        timerDuration = 0
        activeNames.removeAll(keepingCapacity: false)
        for name in names {
            let key = name.lowercased()
            guard var condition = conditions[key] else { continue }
            condition.activate(selectedFruitName: selectedFruitName)
            if condition.definition.kind == .time {
                timerDuration = condition.timeRemaining
            }
            conditions[key] = condition
            activeNames.append(key)
        }
    }

    public mutating func update(dt: Float, context: ChallengeEvaluationContext) {
        guard result == .pending else { return }
        for name in activeNames {
            conditions[name]?.update(dt: dt, context: context)
        }
        // 0x5ec34 随后以 end=false 调 0x5ec7c；有 PASS 条件时结果保持 pending，
        // 不在这里把即时 PASS 错当成回合完成。
    }

    public mutating func evaluateImmediate(context: ChallengeEvaluationContext) {
        guard result == .pending else { return }
        for name in activeNames {
            conditions[name]?.evaluateImmediate(context: context)
        }
    }

    public mutating func recordConsecutive(count: Int32, specificType: String?) {
        guard result == .pending else { return }
        for name in activeNames {
            conditions[name]?.recordConsecutive(count: count, specificType: specificType)
        }
    }

    /// FUN_0005ecf4 先筛 definition.result == PASS，再调虚表 +0x30；
    /// 只有 STATS_COMPARE 在该槽执行比较，FAIL 定义不会走这个分发入口。
    public mutating func checkComparisons(context: ChallengeEvaluationContext) {
        guard result == .pending else { return }
        for name in activeNames {
            guard let condition = conditions[name],
                  condition.definition.result == .pass,
                  condition.definition.kind == .statsCompare else { continue }
            conditions[name]?.check(context: context)
        }
    }

    /// FUN_0005edc8 + FUN_0005ec7c(end=true)：结束求值只执行一次。
    @discardableResult
    public mutating func finish(context: ChallengeEvaluationContext) -> ChallengeOutcome {
        guard result == .pending else { return result }
        for name in activeNames {
            conditions[name]?.evaluateEnd(context: context)
        }

        // 第一趟：结束型 FAIL 优先，顺序与原链表一致。
        for name in activeNames {
            guard let condition = conditions[name] else { continue }
            if condition.definition.evaluateOnEnd, condition.current == .fail {
                result = .fail
                return result
            }
        }

        // 第二趟：只有结束型 PASS 参与通过判定；即时 PASS 不直接结束回合。
        var aggregate: ChallengeOutcome = .pending
        for name in activeNames {
            guard let condition = conditions[name] else { continue }
            guard condition.definition.result == .pass else { continue }
            guard condition.definition.evaluateOnEnd, condition.current == .pass else {
                aggregate = .pending
                break
            }
            aggregate = .pass
        }

        // 0x5edc8 的空结果兜底：先置 PASS；存在任一 FAIL 定义则改置 FAIL。
        if aggregate == .pending {
            aggregate = .pass
            for name in activeNames {
                if conditions[name]?.definition.result == .fail {
                    aggregate = .fail
                    break
                }
            }
        }
        result = aggregate
        return result
    }
}
