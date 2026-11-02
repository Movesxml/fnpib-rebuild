import Foundation

public struct ChallengeMapRoundState: Equatable, Sendable {
    public let challengeName: String
    public let outcome: ChallengeOutcome?

    public init(challengeName: String, outcome: ChallengeOutcome? = nil) {
        self.challengeName = challengeName
        self.outcome = outcome
    }
}

public struct ChallengeMapInput: Equatable, Sendable {
    public let tierIndex: Int32
    public let isBonus: Bool
    public let currentRoundIndex: Int
    public let rounds: [ChallengeMapRoundState]
    public let actChange: Bool

    public init(tierIndex: Int32,
                isBonus: Bool,
                currentRoundIndex: Int,
                rounds: [ChallengeMapRoundState],
                actChange: Bool) {
        self.tierIndex = tierIndex
        self.isBonus = isBonus
        self.currentRoundIndex = currentRoundIndex
        self.rounds = rounds
        self.actChange = actChange
    }
}

public enum ChallengeMapCommand: Equatable, Sendable {
    case setVisible(component: String, visible: Bool)
    case playSound(String)
    case prepareRound(Int32)
    case startRound(Int32)
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
    case unsupportedActChange
    case unsupportedBonus
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
        case .unsupportedActChange:
            return "暂不支持 actChange Challenge 地图分支"
        case .unsupportedBonus:
            return "暂不支持 bonus Challenge 地图分支"
        case .missingRoundSelection:
            return "地图退场前没有选择回合"
        }
    }
}

/// Release normal Challenge map controller for the first closed path:
/// state 0 start_game -> state 2 animate_in -> state 7 result display/selection
/// -> state 8 animate_out -> state 9 startRound request.
public struct ChallengeMapController: Sendable, Equatable {
    public private(set) var state: Int32 = -1
    public private(set) var totalElapsed: Float = 0
    public private(set) var stateElapsed: Float = 0
    public private(set) var selectedRoundIndex: Int?
    public private(set) var snapshot: ChallengeMapInput?

    private var startRoundIssued = false

    public init() {}

    @discardableResult
    public mutating func begin(input: ChallengeMapInput,
                               player: inout UIScreenAnimationPlayer) throws -> ChallengeMapOutput {
        guard snapshot == nil, state == -1 else {
            throw ChallengeMapControllerError.alreadyBegan
        }
        try Self.validate(input)

        player.reset()
        let animations = try player.playRecursively(component: "", animation: "start_game")

        snapshot = input
        state = 0
        totalElapsed = 0
        stateElapsed = 0
        selectedRoundIndex = nil
        startRoundIssued = false

        return ChallengeMapOutput(animations: animations, commands: [])
    }

    @discardableResult
    public mutating func update(deltaSeconds: Float,
                                input: ChallengeMapInput,
                                player: inout UIScreenAnimationPlayer) throws -> ChallengeMapOutput {
        guard snapshot != nil, state >= 0 else {
            throw ChallengeMapControllerError.notBegun
        }
        try Self.validate(input)
        guard deltaSeconds.isFinite, deltaSeconds >= 0 else {
            throw ChallengeMapControllerError.invalidDelta(deltaSeconds)
        }

        snapshot = input
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
                        if input.actChange {
                            throw ChallengeMapControllerError.unsupportedActChange
                        }

                        totalElapsed = 0
                        let marked = try markResults(input: input, player: &player)
                        animations.append(contentsOf: marked.animations)
                        commands.append(contentsOf: marked.commands)
                        totalElapsed = 0
                        stateElapsed = 0
                        state = 7
                    }
                }
            }

        case 7:
            break

        case 8:
            if input.isBonus {
                throw ChallengeMapControllerError.unsupportedBonus
            }

            let outroPlaying = try player.isPlayingRecursively(
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
        guard let snapshot, state == 7 else {
            return .empty
        }
        guard index >= 0, index < snapshot.rounds.count else {
            return .empty
        }
        guard snapshot.rounds[index].outcome == nil else {
            return .empty
        }

        var commands: [ChallengeMapCommand] = [.playSound("button-press")]
        let animations = try player.playRecursively(component: "", animation: "animate_out")
        commands.append(.prepareRound(Int32(index)))

        selectedRoundIndex = index
        totalElapsed = 0
        stateElapsed = 0
        state = 8

        return ChallengeMapOutput(animations: animations, commands: commands)
    }

    private func markResults(input: ChallengeMapInput,
                             player: inout UIScreenAnimationPlayer) throws -> ChallengeMapOutput {
        let currentIndex = input.currentRoundIndex
        var animations: [UIScreenAnimationOutput] = []
        var commands: [ChallengeMapCommand] = []

        let currentNode = "challengeContainer.spinner.adventureNode_\(currentIndex + 1)"
        animations.append(contentsOf: try player.play(
            component: currentNode, animation: "animate_trigger"))

        if let outcome = input.rounds[currentIndex].outcome {
            if outcome == .pass || outcome == .fail {
                let isPass = outcome == .pass
                let sound = isPass ? "challenge-tick" : "gank"
                commands.append(.playSound(sound))

                let suffix = isPass ? "Pass" : "Fail"
                let resultNode = "challengeContainer.spinner.adventureNode\(suffix)_\(currentIndex + 1)"
                let resultTrigger = try playTriggerIfPresent(
                    component: resultNode, player: &player)
                if resultTrigger.exists {
                    commands.append(.setVisible(component: resultNode, visible: true))
                    animations.append(contentsOf: resultTrigger.animations)
                }

                let progressSuffix = isPass ? "pass" : "fail"
                let progressNode = "progressUIContainer.map.challenge_\(input.tierIndex + 1)_\(currentIndex + 1).\(progressSuffix)"
                let progressTrigger = try playTriggerIfPresent(
                    component: progressNode, player: &player)
                if progressTrigger.exists {
                    commands.append(.setVisible(component: progressNode, visible: true))
                    animations.append(contentsOf: progressTrigger.animations)
                }
            }
        }

        for (index, round) in input.rounds.enumerated() where round.outcome == nil {
            let node = "challengeContainer.spinner.adventureNode_\(index + 1)"
            commands.append(.setVisible(component: node, visible: true))
        }

        return ChallengeMapOutput(animations: animations, commands: commands)
    }

    private func playTriggerIfPresent(
        component: String,
        player: inout UIScreenAnimationPlayer
    ) throws -> (exists: Bool, animations: [UIScreenAnimationOutput]) {
        guard let definition = player.content.components.first(where: {
            $0.name == component
        }), definition.animations.contains(where: {
            $0.name == "animate_trigger"
        }) else {
            return (false, [])
        }
        return (true, try player.play(component: component, animation: "animate_trigger"))
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
