import Foundation

public struct ChallengeMapRoundState: Equatable, Sendable {
    public let challengeName: String
    public let challengeTypeName: String?
    public let outcome: ChallengeOutcome?

    public init(challengeName: String,
                challengeTypeName: String? = nil,
                outcome: ChallengeOutcome? = nil) {
        self.challengeName = challengeName
        self.challengeTypeName = challengeTypeName
        self.outcome = outcome
    }
}

public struct ChallengeMapInput: Equatable, Sendable {
    public let tierIndex: Int32
    public let isBonus: Bool
    public let currentRoundIndex: Int
    public let rounds: [ChallengeMapRoundState]
    public let actChange: Bool
    public let challengeTypes: [ChallengeTypeDefinition]
    public let isInitialPresentation: Bool
    public let playActChangeSound: Bool

    public init(tierIndex: Int32,
                isBonus: Bool,
                currentRoundIndex: Int,
                rounds: [ChallengeMapRoundState],
                actChange: Bool,
                challengeTypes: [ChallengeTypeDefinition] = [],
                isInitialPresentation: Bool = true,
                playActChangeSound: Bool = false) {
        self.tierIndex = tierIndex
        self.isBonus = isBonus
        self.currentRoundIndex = currentRoundIndex
        self.rounds = rounds
        self.actChange = actChange
        self.challengeTypes = challengeTypes
        self.isInitialPresentation = isInitialPresentation
        self.playActChangeSound = playActChangeSound
    }
}

public enum ChallengeMapCommand: Equatable, Sendable {
    case setVisible(component: String, visible: Bool)
    /// 8×8 图集的原始图标索引；UV 为 (index&7)/8, (index>>3)/8。
    case setIcon(component: String, iconIndex: Int32)
    case playSound(String)
    case fadeOutSound(String, duration: Float)
    case prepareRound(Int32)
    case startRound(Int32)
    /// FUN_00061090：state 1 的 act_change 完成后才允许晋升并重建计划。
    case advanceTier
    case clearActChangeSound
}

public struct ChallengeMapOutput: Equatable, Sendable {
    public var animations: [UIScreenAnimationOutput]
    public var commands: [ChallengeMapCommand]

    public init(animations: [UIScreenAnimationOutput],
                commands: [ChallengeMapCommand]) {
        self.animations = animations
        self.commands = commands
    }

    public static let empty = ChallengeMapOutput(animations: [], commands: [])
}

public enum ChallengeMapControllerError: Error, Equatable, Sendable {
    case alreadyBegan
    case notBegun
    case invalidRoundIndex(current: Int, count: Int)
    case invalidDelta(Float)
    case missingRoundSelection
}

extension ChallengeMapControllerError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .alreadyBegan:
            return "ChallengeMapController 已 begin"
        case .notBegun:
            return "ChallengeMapController 尚未 begin"
        case let .invalidRoundIndex(current, count):
            return "currentRoundIndex 越界：current=\(current), count=\(count)"
        case let .invalidDelta(delta):
            return "无效 deltaSeconds：\(delta)"
        case .missingRoundSelection:
            return "地图退场前没有选择回合"
        }
    }
}

/// Release Challenge map states 0/1/2/3/4/5/7/8/9.
/// `actChange` is a presentation property captured at begin. After promotion the
/// new plan has no outcomes, but state 2 must still enter the new tier's spinner.
public struct ChallengeMapController: Sendable, Equatable {
    public private(set) var state: Int32 = -1
    public private(set) var totalElapsed: Float = 0
    public private(set) var stateElapsed: Float = 0
    public private(set) var selectedRoundIndex: Int?
    public private(set) var snapshot: ChallengeMapInput?

    private var startRoundIssued = false
    private var isActChangePresentation = false
    private var actChangeSoundPlayed = false
    private var tierAdvanceIssued = false
    private var spinSoundActive = false

    public init() {}

    @discardableResult
    public mutating func begin(input: ChallengeMapInput,
                               player: inout UIScreenAnimationPlayer) throws -> ChallengeMapOutput {
        guard snapshot == nil, state == -1 else {
            throw ChallengeMapControllerError.alreadyBegan
        }
        try Self.validate(input)

        player.reset()
        snapshot = input
        totalElapsed = 0
        stateElapsed = 0
        selectedRoundIndex = nil
        startRoundIssued = false
        isActChangePresentation = input.actChange
        actChangeSoundPlayed = false
        tierAdvanceIssued = false
        spinSoundActive = false

        var animations: [UIScreenAnimationOutput] = []
        var commands: [ChallengeMapCommand] = [
            .setVisible(component: "challengeContainer", visible: !input.isBonus),
            .setVisible(component: "bossChallengeContainer", visible: input.isBonus),
        ]
        if input.isInitialPresentation {
            state = 0
            animations.append(contentsOf: try player.playRecursively(
                component: "", animation: "start_game"))
        } else if input.actChange {
            state = 1
            // FUN_00069dbc：先重置旧章节，再播放 act_change；晋升在 state 1 完成。
            animations.append(contentsOf: try player.playRecursively(
                component: "progressUIContainer", animation: "animate_reset"))
            animations.append(contentsOf: try playIfPresent(
                component: "progressUIContainer.map.act\(input.tierIndex)",
                animation: "animate_disappear", recursively: true, player: &player))
            animations.append(contentsOf: try playIfPresent(
                component: "progressUIContainer.map.act\(input.tierIndex + 1)",
                animation: "animate_appear", recursively: true, player: &player))
            animations.append(contentsOf: try player.playRecursively(
                component: "", animation: "act_change"))
        } else {
            state = 2
            animations.append(contentsOf: try player.playRecursively(
                component: "", animation: "animate_in"))
            animations.append(contentsOf: try player.playRecursively(
                component: "", animation: "map_in"))
        }
        return ChallengeMapOutput(animations: animations, commands: commands)
    }

    @discardableResult
    public mutating func update(deltaSeconds: Float,
                                input: ChallengeMapInput,
                                random: any RandomSource,
                                player: inout UIScreenAnimationPlayer) throws -> ChallengeMapOutput {
        guard snapshot != nil, state >= 0 else {
            throw ChallengeMapControllerError.notBegun
        }
        try Self.validate(input)
        guard deltaSeconds.isFinite, deltaSeconds >= 0 else {
            throw ChallengeMapControllerError.invalidDelta(deltaSeconds)
        }

        snapshot = input
        let previousStateElapsed = stateElapsed
        totalElapsed += deltaSeconds
        stateElapsed += deltaSeconds

        var animations = try player.advance(deltaSeconds: deltaSeconds)
        var commands: [ChallengeMapCommand] = []

        switch state {
        case 0:
            if try !player.isPlayingRecursively(component: "", animation: "start_game") {
                stateElapsed = 0
                state = 2
                animations.append(contentsOf: try player.playRecursively(
                    component: "", animation: "animate_in"))
            }

        case 1:
            // FUN_00069ef0：阈值使用跨帧前后的 state clock，严格大于阈值触发一次。
            if previousStateElapsed < 0.8, stateElapsed > 0.8 {
                let marked = try markResults(input: input, player: &player)
                animations.append(contentsOf: marked.animations)
                commands.append(contentsOf: marked.commands)
            }
            if previousStateElapsed < 1.5, stateElapsed > 1.5,
               input.playActChangeSound, !input.isBonus, !actChangeSoundPlayed {
                actChangeSoundPlayed = true
                commands.append(.playSound("act-change"))
            }
            if try !player.isPlayingRecursively(component: "", animation: "act_change") {
                if !tierAdvanceIssued {
                    tierAdvanceIssued = true
                    commands.append(.advanceTier)
                    commands.append(.clearActChangeSound)
                }
                commands.append(contentsOf: hideResultNodes(player: player))
                stateElapsed = 0
                state = 2
                animations.append(contentsOf: try player.playRecursively(
                    component: "", animation: "animate_in"))
            }

        case 2:
            let animateInPlaying = try player.isPlayingRecursively(
                component: "", animation: "animate_in")
            if !animateInPlaying {
                let startGamePlaying = try player.isPlayingRecursively(
                    component: "", animation: "start_game")
                if !startGamePlaying {
                    let actChangePlaying = try player.isPlayingRecursively(
                        component: "", animation: "act_change")
                    if !actChangePlaying {
                        let presented = try enterResultPresentation(input: input, player: &player)
                        animations.append(contentsOf: presented.animations)
                        commands.append(contentsOf: presented.commands)
                    }
                }
            }

        case 3:
            let pussMap = "progressUIContainer.map.pussMap"
            guard componentExists(pussMap, player: player) else {
                enterSpinner(input: input)
                break
            }
            // state 2 用 tierIndex+1；state 3 查询的是 roundsPassed，二者不可混用。
            let roundsPassed = input.rounds.filter { $0.outcome == .pass }.count
            let trigger = "animate_trigger_\(roundsPassed)"
            if try !player.isPlayingRecursively(component: pussMap, animation: trigger) {
                enterSpinner(input: input)
            }

        case 4:
            let spinner = "challengeContainer.spinner"
            var slot = 1
            // 原版沿 adventureNode_1、2… 直到第一个不存在的节点，而非按 plan.count 截断。
            while componentExists("\(spinner).adventureNode_\(slot)", player: player) {
                let node = "\(spinner).adventureNode_\(slot)"
                let resetPlaying = player.isPlaying(component: node, animation: "animate_reset_in")
                let delayPlaying = player.isPlaying(component: node, animation: "animate_delay")
                let stopPlaying = player.isPlaying(component: node, animation: "animate_stop")
                if !resetPlaying, !delayPlaying, !stopPlaying {
                    if !spinSoundActive, totalElapsed < 0.6 {
                        spinSoundActive = true
                        commands.append(.playSound("slot_spin_lp"))
                    }
                    let icon = Self.randomIconIndex(types: input.challengeTypes, random: random)
                    commands.append(.setIcon(component: node, iconIndex: icon))
                    animations.append(contentsOf: try player.playRecursively(
                        component: node, animation: "animate_delay"))
                }
                slot += 1
            }
            if totalElapsed > 0.6 {
                if spinSoundActive {
                    spinSoundActive = false
                    commands.append(.fadeOutSound("slot_spin_lp", duration: 0.1))
                }
                let finalized = try writeActualIcons(input: input, spinner: spinner, player: &player)
                animations.append(contentsOf: finalized.animations)
                commands.append(contentsOf: finalized.commands)
                totalElapsed = 0
                stateElapsed = 0
                state = 7
            }

        case 5:
            // bonus 分支不执行普通转盘的随机滚动。
            if totalElapsed > 0.6 {
                if spinSoundActive {
                    spinSoundActive = false
                    commands.append(.fadeOutSound("slot_spin_lp", duration: 0.1))
                }
                let finalized = try writeActualIcons(
                    input: input, spinner: "bossChallengeContainer.spinner", player: &player)
                animations.append(contentsOf: finalized.animations)
                commands.append(contentsOf: finalized.commands)
                totalElapsed = 0
                stateElapsed = 0
                state = 7
            }

        case 7:
            break

        case 8:
            // 普通地图等待 progressUIContainer 退场；bonus 分支直接进 state 9。
            let outroPlaying = input.isBonus ? false : try player.isPlayingRecursively(
                component: "progressUIContainer", animation: "animate_out")
            if !outroPlaying {
                guard let selectedRoundIndex else {
                    throw ChallengeMapControllerError.missingRoundSelection
                }
                state = 9
                if !startRoundIssued {
                    startRoundIssued = true
                    commands.append(.startRound(Int32(selectedRoundIndex)))
                }
            }

        case 9:
            break

        default:
            break
        }

        return ChallengeMapOutput(animations: animations, commands: commands)
    }

    @discardableResult
    public mutating func selectRound(index: Int,
                                     player: inout UIScreenAnimationPlayer) throws -> ChallengeMapOutput {
        guard let snapshot, state == 7 else { return .empty }
        guard index >= 0, index < snapshot.rounds.count else { return .empty }
        guard snapshot.rounds[index].outcome == nil else { return .empty }

        var commands: [ChallengeMapCommand] = [.playSound("button-press")]
        let animations = try player.playRecursively(component: "", animation: "animate_out")
        commands.append(.prepareRound(Int32(index)))

        selectedRoundIndex = index
        totalElapsed = 0
        stateElapsed = 0
        state = 8
        return ChallengeMapOutput(animations: animations, commands: commands)
    }

    private mutating func enterResultPresentation(
        input: ChallengeMapInput,
        player: inout UIScreenAnimationPlayer
    ) throws -> ChallengeMapOutput {
        var output = ChallengeMapOutput.empty
        output.commands = [
            .setVisible(component: "challengeContainer", visible: !input.isBonus),
            .setVisible(component: "bossChallengeContainer", visible: input.isBonus),
        ]
        totalElapsed = 0
        if isActChangePresentation {
            let pussMap = "progressUIContainer.map.pussMap"
            if componentExists(pussMap, player: player) {
                output.animations.append(contentsOf: try player.playRecursively(
                    component: "progressUIContainer", animation: "animate_reset"))
                output.animations.append(contentsOf: try player.playRecursively(
                    component: pussMap, animation: "animate_trigger_\(input.tierIndex + 1)"))
                stateElapsed = 0
                state = 3
                return output
            }
            enterSpinner(input: input)
            return output
        }

        let marked = try markResults(input: input, player: &player)
        output.animations.append(contentsOf: marked.animations)
        output.commands.append(contentsOf: marked.commands)
        totalElapsed = 0
        stateElapsed = 0
        state = 7
        return output
    }

    private mutating func enterSpinner(input: ChallengeMapInput) {
        totalElapsed = 0
        stateElapsed = 0
        spinSoundActive = false
        state = input.isBonus ? 5 : 4
    }

    private func markResults(input: ChallengeMapInput,
                             player: inout UIScreenAnimationPlayer) throws -> ChallengeMapOutput {
        let currentIndex = input.currentRoundIndex
        var animations: [UIScreenAnimationOutput] = []
        var commands: [ChallengeMapCommand] = []
        let spinner = input.isBonus
            ? "bossChallengeContainer.spinner" : "challengeContainer.spinner"

        let currentNode = "\(spinner).adventureNode_\(currentIndex + 1)"
        animations.append(contentsOf: try playIfPresent(
            component: currentNode, animation: "animate_trigger", recursively: false, player: &player))

        if let outcome = input.rounds[currentIndex].outcome {
            if outcome == .pass || outcome == .fail {
                let isPass = outcome == .pass
                commands.append(.playSound(isPass ? "challenge-tick" : "gank"))
                let suffix = isPass ? "Pass" : "Fail"
                let resultNode = "\(spinner).adventureNode\(suffix)_\(currentIndex + 1)"
                let resultTrigger = try playTriggerIfPresent(component: resultNode, player: &player)
                if resultTrigger.exists {
                    commands.append(.setVisible(component: resultNode, visible: true))
                    animations.append(contentsOf: resultTrigger.animations)
                }

                let progressSuffix = isPass ? "pass" : "fail"
                let progressNode = "progressUIContainer.map.challenge_\(input.tierIndex + 1)_\(currentIndex + 1).\(progressSuffix)"
                let progressTrigger = try playTriggerIfPresent(component: progressNode, player: &player)
                if progressTrigger.exists {
                    commands.append(.setVisible(component: progressNode, visible: true))
                    animations.append(contentsOf: progressTrigger.animations)
                }
            }
        }

        for (index, round) in input.rounds.enumerated() where round.outcome == nil {
            let node = "\(spinner).adventureNode_\(index + 1)"
            if componentExists(node, player: player) {
                commands.append(.setVisible(component: node, visible: true))
            }
        }
        return ChallengeMapOutput(animations: animations, commands: commands)
    }

    private func writeActualIcons(
        input: ChallengeMapInput,
        spinner: String,
        player: inout UIScreenAnimationPlayer
    ) throws -> ChallengeMapOutput {
        var output = ChallengeMapOutput.empty
        for (index, round) in input.rounds.enumerated() {
            let node = "\(spinner).adventureNode_\(index + 1)"
            guard componentExists(node, player: player) else { continue }
            let icon = Self.actualIconIndex(typeName: round.challengeTypeName,
                                            types: input.challengeTypes)
            output.commands.append(.setIcon(component: node, iconIndex: icon))
            output.commands.append(.setVisible(component: node, visible: true))

            let progress = "progressUIContainer.map.challenge_\(input.tierIndex + 1)_\(index + 1).challenge"
            if componentExists(progress, player: player) {
                output.commands.append(.setIcon(component: progress, iconIndex: icon))
                output.animations.append(contentsOf: try playIfPresent(
                    component: progress, animation: "animate_appear", recursively: false, player: &player))
            }
        }
        return output
    }

    private static func actualIconIndex(typeName: String?,
                                        types: [ChallengeTypeDefinition]) -> Int32 {
        guard let typeName, !types.isEmpty else { return 0 }
        // FUN_000607f8：未知名称和空表都回退到文档第一项。
        return (types.first { $0.name == typeName } ?? types[0]).iconIndex
    }

    private static func randomIconIndex(types: [ChallengeTypeDefinition],
                                        random: any RandomSource) -> Int32 {
        guard !types.isEmpty else { return 0 }
        var selected: ChallengeTypeDefinition
        repeat {
            // FUN_00060da0：隐藏项也消耗一次原版 LCG 抽取，然后继续重抽。
            selected = types[Int(random.nextInt(Int32(types.count)))]
        } while !selected.showInRandom
        return selected.iconIndex
    }

    private func hideResultNodes(player: UIScreenAnimationPlayer) -> [ChallengeMapCommand] {
        var commands: [ChallengeMapCommand] = []
        for slot in 1...4 {
            for suffix in ["Pass", "Fail"] {
                let node = "challengeContainer.spinner.adventureNode\(suffix)_\(slot)"
                if componentExists(node, player: player) {
                    commands.append(.setVisible(component: node, visible: false))
                }
            }
        }
        return commands
    }

    private func playTriggerIfPresent(
        component: String,
        player: inout UIScreenAnimationPlayer
    ) throws -> (exists: Bool, animations: [UIScreenAnimationOutput]) {
        guard let definition = player.content.components.first(where: { $0.name == component }) else {
            return (false, [])
        }
        guard definition.animations.contains(where: { $0.name == "animate_trigger" }) else {
            return (true, [])
        }
        return (true, try player.play(component: component, animation: "animate_trigger"))
    }

    private func playIfPresent(component: String,
                               animation: String,
                               recursively: Bool,
                               player: inout UIScreenAnimationPlayer) throws -> [UIScreenAnimationOutput] {
        guard componentExists(component, player: player) else { return [] }
        if recursively {
            return try player.playRecursively(component: component, animation: animation)
        }
        guard player.content.components.first(where: { $0.name == component })?.animations.contains(
            where: { $0.name == animation }) == true else { return [] }
        return try player.play(component: component, animation: animation)
    }

    private func componentExists(_ name: String, player: UIScreenAnimationPlayer) -> Bool {
        player.content.components.contains { $0.name == name }
    }

    private static func validate(_ input: ChallengeMapInput) throws {
        guard !input.rounds.isEmpty,
              input.currentRoundIndex >= 0,
              input.currentRoundIndex < input.rounds.count else {
            throw ChallengeMapControllerError.invalidRoundIndex(
                current: input.currentRoundIndex,
                count: input.rounds.count)
        }
    }
}
