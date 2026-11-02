import Foundation

public enum ChallengeBonusSettlementHostError: Error, Equatable, Sendable {
    case alreadyBegun
    case notBegun
}

public struct ChallengeBonusSettlementHostOutput: Sendable, Equatable {
    public var animations: [UIScreenAnimationOutput]
    public var achievements: [ChallengeBonusAchievementUpdate]
    public var roundCommand: ChallengeBonusRoundCommand?
    public var didFinish: Bool

    public init(animations: [UIScreenAnimationOutput] = [],
                achievements: [ChallengeBonusAchievementUpdate] = [],
                roundCommand: ChallengeBonusRoundCommand? = nil,
                didFinish: Bool = false) {
        self.animations = animations
        self.achievements = achievements
        self.roundCommand = roundCommand
        self.didFinish = didFinish
    }
}

/// Coordinates the independent release bonus-result machine with the background
/// exit player. It never substitutes timers for UISF playback queries and never
/// writes achievements or round state outside the returned per-frame output.
public struct ChallengeBonusSettlementHost: Sendable {
    private var controller: ChallengeBonusSettlementController?
    private var scorePlayer: UIScreenAnimationPlayer
    private var backgroundPlayer: UIScreenAnimationPlayer
    private var backgroundExitStarted = false
    private var didFinishSent = false

    public init(scorePlayer: UIScreenAnimationPlayer,
                backgroundPlayer: UIScreenAnimationPlayer) {
        self.scorePlayer = scorePlayer
        self.backgroundPlayer = backgroundPlayer
    }

    public init(scoreAnimationData: Data,
                backgroundAnimationData: Data) throws {
        let scorePlayer = try UIScreenAnimationPlayer(data: scoreAnimationData)
        let backgroundPlayer = try UIScreenAnimationPlayer(data: backgroundAnimationData)
        self.init(scorePlayer: scorePlayer, backgroundPlayer: backgroundPlayer)
    }

    public var hasBegun: Bool { controller != nil }
    public var resultVisible: Bool { controller?.resultVisible ?? false }
    public var scoreCounterValue: Int32 { controller?.scoreCounterValue ?? 0 }
    public var isBonusFinished: Bool { controller?.isFinished ?? false }
    public var isFinished: Bool { didFinishSent }

    public func isLifeScoreVisible(index: Int32) -> Bool {
        controller?.isLifeScoreVisible(index: index) ?? false
    }

    public func isCrossVisible(index: Int32) -> Bool {
        controller?.isCrossVisible(index: index) ?? false
    }

    /// Starts only the independent bonus-result controller. The background is
    /// already displayed by its external host, so no background `animate_in` is
    /// played here and its active playback is deliberately preserved.
    @discardableResult
    public mutating func begin(totalScore: Int32,
                               finaleScore: Int32,
                               lives: Int32) throws -> [UIScreenAnimationOutput] {
        guard controller == nil else {
            throw ChallengeBonusSettlementHostError.alreadyBegun
        }

        var newController = ChallengeBonusSettlementController(
            totalScore: totalScore,
            finaleScore: finaleScore,
            lives: lives)
        let animations = try newController.begin(player: &scorePlayer)
        controller = newController
        backgroundExitStarted = false
        didFinishSent = false
        return animations
    }

    /// Advances the bonus controller and background player exactly once each.
    /// Controller achievements and round commands are forwarded verbatim.
    @discardableResult
    public mutating func update(deltaSeconds: Float) throws -> ChallengeBonusSettlementHostOutput {
        guard var activeController = controller else {
            throw ChallengeBonusSettlementHostError.notBegun
        }
        if didFinishSent {
            return ChallengeBonusSettlementHostOutput()
        }

        let controllerOutput = try activeController.update(
            deltaSeconds: deltaSeconds,
            player: &scorePlayer)
        controller = activeController

        var output = ChallengeBonusSettlementHostOutput(
            animations: controllerOutput.animations,
            achievements: controllerOutput.achievements,
            roundCommand: controllerOutput.roundCommand)

        output.animations.append(contentsOf:
            try backgroundPlayer.advance(deltaSeconds: deltaSeconds))

        if backgroundExitStarted {
            let backgroundStillPlaying = try backgroundPlayer.isPlayingRecursively(
                component: "", animation: "animate_out")
            if !backgroundStillPlaying {
                didFinishSent = true
                output.didFinish = true
            }
        } else if activeController.isFinished {
            let exitAnimations = try backgroundPlayer.playRecursively(
                component: "", animation: "animate_out")
            backgroundExitStarted = true
            output.animations.append(contentsOf: exitAnimations)
        }

        return output
    }
}
