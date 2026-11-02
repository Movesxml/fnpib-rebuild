import Foundation
import XCTest
@testable import FNPBCore

final class ChallengeMapControllerTests: XCTestCase {
    func testStartupSequenceMarksPassAndEntersState7() throws {
        var player = try makeMapPlayer()
        let input = makeInput(currentRoundIndex: 0,
                              outcomes: [.pass, nil, nil, nil])
        var controller = ChallengeMapController()

        _ = try controller.begin(input: input, player: &player)
        XCTAssertEqual(controller.state, 0)
        XCTAssertTrue(try player.isPlayingRecursively(component: "",
                                                      animation: "start_game"))
        XCTAssertThrowsError(try controller.begin(input: input, player: &player)) { error in
            XCTAssertEqual(error as? ChallengeMapControllerError, .alreadyBegan)
        }

        let outputs = try driveToState7(&controller, player: &player, input: input)
        XCTAssertEqual(controller.state, 7)

        let commands = outputs.flatMap { $0.commands }
        XCTAssertTrue(commands.contains(.playSound("challenge-tick")))
        XCTAssertTrue(commands.contains(
            .setVisible(component: "challengeContainer.spinner.adventureNodePass_1",
                        visible: true)))
        // The release resource omits this dynamic progress node; the original
        // map helper skips its animation and visibility write when lookup is nil.
        XCTAssertFalse(commands.contains(
            .setVisible(component: "progressUIContainer.map.challenge_1_1.pass",
                        visible: true)))
        XCTAssertTrue(commands.contains(
            .setVisible(component: "challengeContainer.spinner.adventureNode_2",
                        visible: true)))
        XCTAssertFalse(commands.contains(
            .setVisible(component: "challengeContainer.spinner.adventureNode_1",
                        visible: true)))
    }

    func testFailResultMarkingUsesFailResources() throws {
        var player = try makeMapPlayer()
        let input = makeInput(currentRoundIndex: 0,
                              outcomes: [.fail, nil, nil, nil])
        var controller = ChallengeMapController()

        _ = try controller.begin(input: input, player: &player)
        let outputs = try driveToState7(&controller, player: &player, input: input)
        XCTAssertEqual(controller.state, 7)

        let commands = outputs.flatMap { $0.commands }
        XCTAssertTrue(commands.contains(.playSound("gank")))
        XCTAssertTrue(commands.contains(
            .setVisible(component: "challengeContainer.spinner.adventureNodeFail_1",
                        visible: true)))
        XCTAssertFalse(commands.contains(
            .setVisible(component: "progressUIContainer.map.challenge_1_1.fail",
                        visible: true)))
        XCTAssertFalse(commands.contains(
            .setVisible(component: "challengeContainer.spinner.adventureNode_1",
                        visible: true)))
    }

    func testIllegalSelectionsAreIdempotentAndPendingIsNotNil() throws {
        var player = try makeMapPlayer()
        let input = makeInput(currentRoundIndex: 0,
                              outcomes: [.pending, nil, nil, nil])
        var controller = ChallengeMapController()

        _ = try controller.begin(input: input, player: &player)
        let outputs = try driveToState7(&controller, player: &player, input: input)
        XCTAssertEqual(controller.state, 7)

        let commands = outputs.flatMap { $0.commands }
        XCTAssertFalse(commands.contains(.playSound("challenge-tick")))
        XCTAssertFalse(commands.contains(.playSound("gank")))
        XCTAssertFalse(commands.contains(
            .setVisible(component: "challengeContainer.spinner.adventureNode_1",
                        visible: true)))

        XCTAssertEqual(try controller.selectRound(index: -1, player: &player), .empty)
        XCTAssertEqual(try controller.selectRound(index: 99, player: &player), .empty)
        XCTAssertEqual(try controller.selectRound(index: 0, player: &player), .empty)
        XCTAssertEqual(controller.state, 7)
    }

    func testLegalSelectionPreparesRoundAndOutroEmitsSelectedRoundOnce() throws {
        var player = try makeMapPlayer()
        let input = makeInput(currentRoundIndex: 0,
                              outcomes: [nil, nil, nil, nil],
                              tierIndex: 2)
        var controller = ChallengeMapController()

        _ = try controller.begin(input: input, player: &player)
        _ = try driveToState7(&controller, player: &player, input: input)
        XCTAssertEqual(controller.state, 7)

        let selected = try controller.selectRound(index: 1, player: &player)
        XCTAssertEqual(controller.state, 8)
        XCTAssertEqual(controller.selectedRoundIndex, 1)
        XCTAssertTrue(selected.commands.contains(.playSound("button-press")))
        XCTAssertTrue(selected.commands.contains(.prepareRound(1)))

        XCTAssertEqual(try controller.selectRound(index: 2, player: &player), .empty)
        XCTAssertEqual(controller.state, 8)

        var transitionOutputs: [ChallengeMapOutput] = []
        for _ in 0..<8 {
            let output = try controller.update(deltaSeconds: 10,
                                              input: input,
                                              player: &player)
            transitionOutputs.append(output)
            if controller.state == 9 { break }
        }

        XCTAssertEqual(controller.state, 9)
        let transitionCommands = transitionOutputs.flatMap { $0.commands }
        let startRoundCommands = transitionCommands.filter { command in
            if case .startRound = command { return true }
            return false
        }
        XCTAssertEqual(startRoundCommands, [.startRound(1)])

        let afterState9 = try controller.update(deltaSeconds: 10,
                                                input: input,
                                                player: &player)
        XCTAssertFalse(afterState9.commands.contains { command in
            if case .startRound = command { return true }
            return false
        })
        XCTAssertEqual(controller.state, 9)
    }

    func testActChangeIsExplicitlyUnsupported() throws {
        var player = try makeMapPlayer()
        let input = makeInput(actChange: true)
        var controller = ChallengeMapController()

        _ = try controller.begin(input: input, player: &player)

        do {
            for _ in 0..<8 {
                _ = try controller.update(deltaSeconds: 10,
                                          input: input,
                                          player: &player)
                if controller.state == 7 { break }
            }
            XCTFail("actChange=true 应显式失败")
        } catch let error as ChallengeMapControllerError {
            XCTAssertEqual(error, .unsupportedActChange)
        } catch {
            XCTFail("unexpected error: \(error)")
        }
    }

    func testBonusUsesBossSpinnerAndSkipsNormalOutroWait() throws {
        var player = try makeMapPlayer()
        let input = makeInput(currentRoundIndex: 0,
                              outcomes: [.pass, nil, nil, nil],
                              isBonus: true)
        var controller = ChallengeMapController()

        _ = try controller.begin(input: input, player: &player)
        let outputs = try driveToState7(&controller, player: &player, input: input)
        XCTAssertEqual(controller.state, 7)
        XCTAssertTrue(outputs.flatMap(\.commands).contains(
            .setVisible(component: "bossChallengeContainer.spinner.adventureNodePass_1",
                        visible: true)))
        XCTAssertFalse(outputs.flatMap(\.commands).contains(
            .setVisible(component: "challengeContainer.spinner.adventureNodePass_1",
                        visible: true)))

        _ = try controller.selectRound(index: 1, player: &player)
        XCTAssertEqual(controller.state, 8)

        let started = try controller.update(deltaSeconds: 1 / 60,
                                            input: input,
                                            player: &player)
        XCTAssertEqual(controller.state, 9)
        XCTAssertEqual(started.commands, [.startRound(1)])
    }

    func testUpdateRequiresBeginAndRejectsInvalidDelta() throws {
        var player = try makeMapPlayer()
        var controller = ChallengeMapController()
        let input = makeInput()
        XCTAssertThrowsError(try controller.update(deltaSeconds: 1 / 60,
                                                   input: input,
                                                   player: &player)) { error in
            XCTAssertEqual(error as? ChallengeMapControllerError, .notBegun)
        }
        _ = try controller.begin(input: input, player: &player)
        XCTAssertThrowsError(try controller.update(deltaSeconds: .nan,
                                                   input: input,
                                                   player: &player)) { error in
            guard case let .invalidDelta(delta)? = error as? ChallengeMapControllerError else {
                return XCTFail("unexpected error: \(error)")
            }
            XCTAssertTrue(delta.isNaN)
        }
    }

    @discardableResult
    private func driveToState7(_ controller: inout ChallengeMapController,
                               player: inout UIScreenAnimationPlayer,
                               input: ChallengeMapInput,
                               file: StaticString = #filePath,
                               line: UInt = #line) throws -> [ChallengeMapOutput] {
        var outputs: [ChallengeMapOutput] = []
        for _ in 0..<8 {
            if controller.state == 7 { return outputs }
            outputs.append(try controller.update(deltaSeconds: 10,
                                                 input: input,
                                                 player: &player))
        }
        XCTAssertEqual(controller.state, 7, file: file, line: line)
        return outputs
    }

    private func makeInput(currentRoundIndex: Int = 0,
                           outcomes: [ChallengeOutcome?] = [nil, nil, nil, nil],
                           tierIndex: Int32 = 0,
                           isBonus: Bool = false,
                           actChange: Bool = false) -> ChallengeMapInput {
        let rounds = outcomes.enumerated().map {
            ChallengeMapRoundState(challengeName: "round\($0.offset + 1)",
                                   outcome: $0.element)
        }
        return ChallengeMapInput(tierIndex: tierIndex,
                                 isBonus: isBonus,
                                 currentRoundIndex: currentRoundIndex,
                                 rounds: rounds,
                                 actChange: actChange)
    }

    private func makeMapPlayer() throws -> UIScreenAnimationPlayer {
        let root = URL(fileURLWithPath: #filePath)
            .deletingLastPathComponent()
            .deletingLastPathComponent()
            .deletingLastPathComponent()
        return try UIScreenAnimationPlayer(data: Data(contentsOf: root.appendingPathComponent(
            "Content/challengeMapAnimations.json")))
    }
}
