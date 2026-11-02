import Foundation

public enum ChallengeBonusAchievement: String, Sendable, Equatable {
    case bandito2000OrUnder = "bandito_2000_or_under"
    case banditoCompleteLives = "bandito_complete_lives"
}

public struct ChallengeBonusAchievementUpdate: Sendable, Equatable {
    public var achievement: ChallengeBonusAchievement
    public var value: Int32

    public init(achievement: ChallengeBonusAchievement, value: Int32) {
        self.achievement = achievement
        self.value = value
    }
}

public enum ChallengeBonusRoundCommand: Sendable, Equatable {
    /// FUN_00020698(1, 1), issued with the life tally.
    case beginLifeTally
    /// FUN_0006059c(parent), issued before the result outro.
    case finishRound
}

public struct ChallengeBonusSettlementOutput: Sendable, Equatable {
    public var animations: [UIScreenAnimationOutput] = []
    public var achievements: [ChallengeBonusAchievementUpdate] = []
    public var roundCommand: ChallengeBonusRoundCommand?

    public init(animations: [UIScreenAnimationOutput] = [],
                achievements: [ChallengeBonusAchievementUpdate] = [],
                roundCommand: ChallengeBonusRoundCommand? = nil) {
        self.animations = animations
        self.achievements = achievements
        self.roundCommand = roundCommand
    }
}

/// The independent release bonus-result machine at controller+0x40.
///
/// FUN_0006d53c/FUN_0006d5c8 initialize the score projection and play `animate_in`.
/// FUN_0006d80c owns raw outer state +0x1c and inner state +0x30. Every transition
/// waits for the actual UISF animation; elapsed +0x20 is retained but never replaced
/// by a timing-based transition. The parent turns completed state 3 into background
/// exit substate 3, so this type deliberately has no next-round or cleanup shortcut.
public struct ChallengeBonusSettlementController: Sendable, Equatable {
    public private(set) var state: Int32 = 0
    public private(set) var substate: Int32 = 0
    public private(set) var elapsedSeconds: Float = 0
    public private(set) var resultVisible = false

    public let totalScore: Int32
    public let finaleScore: Int32
    public let lives: Int32
    public let scorePerLife: Int32
    public private(set) var scoreCounterValue: Int32

    public init(totalScore: Int32,
                finaleScore: Int32,
                lives: Int32,
                scorePerLife: Int32 = 100) {
        self.totalScore = totalScore
        self.finaleScore = finaleScore
        self.lives = lives
        self.scorePerLife = scorePerLife
        // FUN_0006d5c8: total - finale - lives * 100, with 32-bit arithmetic.
        scoreCounterValue = (totalScore &- finaleScore) &- (lives &* scorePerLife)
    }

    public var isFinished: Bool { state == 3 }

    /// Original @lifeScore1...@lifeScore3 and @cross1...@cross3 visibility writes.
    /// Indices outside 1...3 have no corresponding resource and return false.
    public func isLifeScoreVisible(index: Int32) -> Bool {
        (1...3).contains(index) && index - 1 < lives
    }

    public func isCrossVisible(index: Int32) -> Bool {
        isLifeScoreVisible(index: index)
    }

    @discardableResult
    public mutating func begin(
        player: inout UIScreenAnimationPlayer
    ) throws -> [UIScreenAnimationOutput] {
        player.reset()
        resultVisible = true
        state = 0
        substate = 0
        elapsedSeconds = 0
        scoreCounterValue = (totalScore &- finaleScore) &- (lives &* scorePerLife)
        return try player.playRecursively(component: "", animation: "animate_in")
    }

    @discardableResult
    public mutating func update(
        deltaSeconds: Float,
        player: inout UIScreenAnimationPlayer
    ) throws -> ChallengeBonusSettlementOutput {
        var output = ChallengeBonusSettlementOutput(
            animations: try player.advance(deltaSeconds: deltaSeconds))
        elapsedSeconds += deltaSeconds

        switch state {
        case 0:
            try updateInnerMachine(player: &player, output: &output)
        case 2:
            if try !player.isPlayingRecursively(component: "", animation: "animate_out") {
                state = 3
                resultVisible = false
            }
        default:
            break
        }
        return output
    }

    private mutating func updateInnerMachine(
        player: inout UIScreenAnimationPlayer,
        output: inout ChallengeBonusSettlementOutput
    ) throws {
        switch substate {
        case 0:
            let finaleIntroPlaying = try player.isPlayingRecursively(
                component: "scoreContainer.bonusPoster.finaleScore",
                animation: "animate_in")
            guard !finaleIntroPlaying else { return }
            scoreCounterValue = totalScore &- (lives &* scorePerLife)
            output.animations.append(contentsOf: try player.playRecursively(
                component: "", animation: "life_trigger"))
            elapsedSeconds = 0
            substate = 1
            output.roundCommand = .beginLifeTally

        case 1:
            if let lastLifeScore = lastLifeScoreComponent {
                if try player.isPlayingRecursively(
                    component: lastLifeScore, animation: "life_trigger") {
                    return
                }
            }
            scoreCounterValue = totalScore
            output.animations.append(contentsOf: try player.playRecursively(
                component: "scoreContainer.scorePoster.scoreCounterTotal",
                animation: "animate_trigger"))
            elapsedSeconds = 0
            substate = 2

        case 2:
            let counter = "scoreContainer.scorePoster.scoreCounterTotal"
            if try player.isPlayingRecursively(
                component: counter, animation: "animate_trigger") {
                return
            }
            output.animations.append(contentsOf: try player.playRecursively(
                component: counter, animation: "score_trigger"))
            elapsedSeconds = 0
            substate = 3
            // The release uses an unsigned `bhi` after comparing against 2000.
            if UInt32(bitPattern: totalScore) <= 2_000 {
                output.achievements.append(ChallengeBonusAchievementUpdate(
                    achievement: .bandito2000OrUnder, value: 1))
            }
            output.achievements.append(ChallengeBonusAchievementUpdate(
                achievement: .banditoCompleteLives, value: lives))

        case 3:
            let counter = "scoreContainer.scorePoster.scoreCounterTotal"
            if try player.isPlayingRecursively(
                component: counter, animation: "score_trigger") {
                return
            }
            output.roundCommand = .finishRound
            output.animations.append(contentsOf: try player.playRecursively(
                component: "", animation: "animate_out"))
            elapsedSeconds = 0
            state = 2

        default:
            break
        }
    }

    /// FUN_0006d5c8 remembers the last visible heart. With no lives it is null and
    /// FUN_0006d80c skips that wait; the resource loop contains exactly three hearts.
    private var lastLifeScoreComponent: String? {
        guard lives > 0 else { return nil }
        return "scoreContainer.bonusPoster.misscounters.lifeScore\(min(lives, 3))"
    }
}
