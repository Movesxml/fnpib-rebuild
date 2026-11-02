import Foundation

public enum ChallengeSettlementControllerError: Error, Equatable, Sendable {
    case pendingOutcome
    case normalResultsAlreadyStarted
    case normalResultsNotStarted
    case resultInteractionNotFinished(state: Int32)
    case invalidDispatchSubstate(Int32)
}

/// Release normal-result and background-exit state machines.
///
/// Main states and the saved dispatch substate are the raw values at +0xac/+0xb0
/// in FUN_000686e8/FUN_000688c8. All waits query the actual UISF players; there
/// are no replacement timers. Bonus settlement is intentionally not routed
/// through this normal-result controller (FUN_0006d80c is a separate machine).
public struct ChallengeSettlementController: Sendable, Equatable {
    public enum NormalResultState: Int32, Sendable, Equatable {
        case waitingForIntro = 0
        case waitingForSuccessSequence = 1
        case waitingForFailureIntro = 2
        case waitingForOutro = 3
        case finished = 4
    }

    public private(set) var state: Int32 = 0
    public private(set) var substate: Int32 = 0
    public private(set) var normalResultState: NormalResultState = .finished
    public private(set) var outcome: ChallengeOutcome = .pending
    public private(set) var normalResultVisible = false

    public init() {}

    public var isNormalResultFinished: Bool { normalResultState == .finished }

    /// FUN_000680f0 + FUN_0006c100. The real result resource has no root
    /// `animate_in`; recursive play reaches scoreContainer/resultsContainer.
    @discardableResult
    public mutating func beginNormalResults(
        outcome result: ChallengeOutcome,
        resultPlayer: inout UIScreenAnimationPlayer,
        backgroundPlayer: inout UIScreenAnimationPlayer
    ) throws -> [UIScreenAnimationOutput] {
        guard result != .pending else { throw ChallengeSettlementControllerError.pendingOutcome }
        guard state == 0 else { throw ChallengeSettlementControllerError.normalResultsAlreadyStarted }
        outcome = result
        normalResultState = .waitingForIntro
        normalResultVisible = true
        substate = 0
        resultPlayer.reset()
        backgroundPlayer.reset()
        var output = try backgroundPlayer.playRecursively(component: "", animation: "animate_in")
        output.append(contentsOf: try resultPlayer.playRecursively(component: "", animation: "animate_in"))
        state = 1
        return output
    }

    /// FUN_000686e8 states 1/6 and FUN_0006c95c states 0...3.
    /// `canAnimateResultExit` is the already-resolved FUN_00062a28(parent)==0
    /// predicate; the caller must not substitute a timing or outcome guess.
    @discardableResult
    public mutating func update(
        deltaSeconds: Float,
        resultPlayer: inout UIScreenAnimationPlayer,
        backgroundPlayer: inout UIScreenAnimationPlayer,
        canAnimateResultExit: Bool
    ) throws -> [UIScreenAnimationOutput] {
        var output = try resultPlayer.advance(deltaSeconds: deltaSeconds)
        output.append(contentsOf: try backgroundPlayer.advance(deltaSeconds: deltaSeconds))
        switch state {
        case 1:
            output.append(contentsOf: try updateNormalResult(
                resultPlayer: &resultPlayer,
                canAnimateResultExit: canAnimateResultExit))
        case 6:
            if try !backgroundPlayer.isPlayingRecursively(component: "", animation: "animate_out") {
                state = 7
                normalResultVisible = false
                resultPlayer.reset()
            }
        default:
            break
        }
        return output
    }

    /// A map/round callback explicitly chooses the next-round dispatch (saved +0xb0 = 2).
    @discardableResult
    public mutating func requestNextRound(
        backgroundPlayer: inout UIScreenAnimationPlayer
    ) throws -> [UIScreenAnimationOutput] {
        try requireFinishedNormalResult(dispatchSubstate: 2)
        return try beginBackgroundExit(dispatchSubstate: 2, backgroundPlayer: &backgroundPlayer)
    }

    /// Explicit cleanup/map exit; ordinary round completion never implies this automatically.
    @discardableResult
    public mutating func requestCleanup(
        backgroundPlayer: inout UIScreenAnimationPlayer
    ) throws -> [UIScreenAnimationOutput] {
        try requireFinishedNormalResult(dispatchSubstate: 5)
        return try beginBackgroundExit(dispatchSubstate: 5, backgroundPlayer: &backgroundPlayer)
    }

    private func requireFinishedNormalResult(dispatchSubstate: Int32) throws {
        guard state == 1 else { throw ChallengeSettlementControllerError.normalResultsNotStarted }
        guard normalResultState == .finished else {
            throw ChallengeSettlementControllerError.resultInteractionNotFinished(
                state: normalResultState.rawValue)
        }
        guard dispatchSubstate == 2 || dispatchSubstate == 5 else {
            throw ChallengeSettlementControllerError.invalidDispatchSubstate(dispatchSubstate)
        }
    }

    private mutating func beginBackgroundExit(
        dispatchSubstate: Int32,
        backgroundPlayer: inout UIScreenAnimationPlayer
    ) throws -> [UIScreenAnimationOutput] {
        substate = dispatchSubstate
        state = 6
        return try backgroundPlayer.playRecursively(component: "", animation: "animate_out")
    }

    private mutating func updateNormalResult(
        resultPlayer: inout UIScreenAnimationPlayer,
        canAnimateResultExit: Bool
    ) throws -> [UIScreenAnimationOutput] {
        switch normalResultState {
        case .waitingForIntro:
            if try !resultPlayer.isPlayingRecursively(component: "", animation: "animate_in"),
               !resultPlayer.isPlayingRecursively(component: "", animation: "s/challengeComplete.tex") {
                applyOutcome()
            }
        case .waitingForSuccessSequence:
            if try !resultPlayer.isPlayingRecursively(component: "", animation: "ins") {
                return try finishNormalResult(
                    resultPlayer: &resultPlayer,
                    canAnimateResultExit: canAnimateResultExit)
            }
        case .waitingForFailureIntro:
            if try !resultPlayer.isPlayingRecursively(component: "", animation: "animate_in"),
               !resultPlayer.isPlayingRecursively(component: "", animation: "ins") {
                return try finishNormalResult(
                    resultPlayer: &resultPlayer,
                    canAnimateResultExit: canAnimateResultExit)
            }
        case .waitingForOutro:
            if try !resultPlayer.isPlayingRecursively(component: "", animation: "animate_out") {
                normalResultVisible = false
                normalResultState = .finished
                resultPlayer.reset()
            }
        case .finished:
            break
        }
        return []
    }

    /// FUN_0006cae0(false): preserve the release 1/2 mapping exactly.
    private mutating func applyOutcome() {
        normalResultState = outcome == .pass ? .waitingForSuccessSequence : .waitingForFailureIntro
    }

    /// FUN_0006cc28 is reached by the real `ins`/intro completion paths for both
    /// success and failure. It does not represent a user-interaction callback.
    @discardableResult
    private mutating func finishNormalResult(
        resultPlayer: inout UIScreenAnimationPlayer,
        canAnimateResultExit: Bool
    ) throws -> [UIScreenAnimationOutput] {
        guard canAnimateResultExit else {
            normalResultVisible = false
            normalResultState = .finished
            return []
        }
        normalResultState = .waitingForOutro
        return try resultPlayer.playRecursively(component: "", animation: "animate_out")
    }
}
