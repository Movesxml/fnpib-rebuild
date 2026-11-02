import Foundation
import XCTest
@testable import FNPBCore

final class ChallengeMapControllerTests: XCTestCase {
    private final class MapRandom: RandomSource {
        private var indices: [Int32]
        private(set) var upperBounds: [Int32] = []

        init(indices: [Int32] = []) { self.indices = indices }
        var calls: Int { upperBounds.count }

        func nextFloat() -> Float { 0 }
        func nextInt(_ upperBound: Int32) -> Int32 {
            upperBounds.append(upperBound)
            guard !indices.isEmpty else { return 0 }
            return indices.removeFirst()
        }
        func snapshot() -> UInt64 { UInt64(calls) }
        func restore(_ s: UInt64) {}
    }

    func testStartupSequenceMarksPassAndEntersState7() throws {
        var player = try makeMapPlayer()
        let input = makeInput(currentRoundIndex: 0, outcomes: [.pass, nil, nil, nil])
        let random = MapRandom()
        var controller = ChallengeMapController()

        _ = try controller.begin(input: input, player: &player)
        XCTAssertEqual(controller.state, 0)
        XCTAssertTrue(try player.isPlayingRecursively(component: "", animation: "start_game"))
        XCTAssertThrowsError(try controller.begin(input: input, player: &player)) { error in
            XCTAssertEqual(error as? ChallengeMapControllerError, .alreadyBegan)
        }

        let outputs = try driveToState7(&controller, player: &player, input: input, random: random)
        XCTAssertEqual(controller.state, 7)
        let commands = outputs.flatMap { $0.commands }
        XCTAssertTrue(commands.contains(.playSound("challenge-tick")))
        XCTAssertTrue(commands.contains(.setVisible(
            component: "challengeContainer.spinner.adventureNodePass_1", visible: true)))
        XCTAssertFalse(commands.contains(.setVisible(
            component: "progressUIContainer.map.challenge_1_1.pass", visible: true)))
        XCTAssertTrue(commands.contains(.setVisible(
            component: "challengeContainer.spinner.adventureNode_2", visible: true)))
        XCTAssertFalse(commands.contains(.setVisible(
            component: "challengeContainer.spinner.adventureNode_1", visible: true)))
    }

    func testFailResultMarkingUsesFailResources() throws {
        var player = try makeMapPlayer()
        let input = makeInput(outcomes: [.fail, nil, nil, nil])
        let random = MapRandom()
        var controller = ChallengeMapController()
        _ = try controller.begin(input: input, player: &player)
        let outputs = try driveToState7(&controller, player: &player, input: input, random: random)

        let commands = outputs.flatMap { $0.commands }
        XCTAssertTrue(commands.contains(.playSound("gank")))
        XCTAssertTrue(commands.contains(.setVisible(
            component: "challengeContainer.spinner.adventureNodeFail_1", visible: true)))
        XCTAssertFalse(commands.contains(.setVisible(
            component: "progressUIContainer.map.challenge_1_1.fail", visible: true)))
        XCTAssertFalse(commands.contains(.setVisible(
            component: "challengeContainer.spinner.adventureNode_1", visible: true)))
    }

    func testIllegalSelectionsAreIdempotentAndPendingIsNotNil() throws {
        var player = try makeMapPlayer()
        let input = makeInput(outcomes: [.pending, nil, nil, nil])
        let random = MapRandom()
        var controller = ChallengeMapController()
        _ = try controller.begin(input: input, player: &player)
        let outputs = try driveToState7(&controller, player: &player, input: input, random: random)

        let commands = outputs.flatMap { $0.commands }
        XCTAssertFalse(commands.contains(.playSound("challenge-tick")))
        XCTAssertFalse(commands.contains(.playSound("gank")))
        XCTAssertFalse(commands.contains(.setVisible(
            component: "challengeContainer.spinner.adventureNode_1", visible: true)))
        XCTAssertEqual(try controller.selectRound(index: -1, player: &player), .empty)
        XCTAssertEqual(try controller.selectRound(index: 99, player: &player), .empty)
        XCTAssertEqual(try controller.selectRound(index: 0, player: &player), .empty)
        XCTAssertEqual(controller.state, 7)
    }

    func testLegalSelectionPreparesRoundAndOutroEmitsSelectedRoundOnce() throws {
        var player = try makeMapPlayer()
        let input = makeInput(tierIndex: 2)
        let random = MapRandom()
        var controller = ChallengeMapController()
        _ = try controller.begin(input: input, player: &player)
        _ = try driveToState7(&controller, player: &player, input: input, random: random)

        let selected = try controller.selectRound(index: 1, player: &player)
        XCTAssertEqual(controller.state, 8)
        XCTAssertEqual(controller.selectedRoundIndex, 1)
        XCTAssertTrue(selected.commands.contains(.playSound("button-press")))
        XCTAssertTrue(selected.commands.contains(.prepareRound(1)))
        XCTAssertEqual(try controller.selectRound(index: 2, player: &player), .empty)

        var transitionOutputs: [ChallengeMapOutput] = []
        for _ in 0..<8 {
            let output = try controller.update(
                deltaSeconds: 10, input: input, random: random, player: &player)
            transitionOutputs.append(output)
            if controller.state == 9 { break }
        }
        XCTAssertEqual(controller.state, 9)
        let startCommands = transitionOutputs.flatMap(\.commands).filter {
            if case .startRound = $0 { return true }
            return false
        }
        XCTAssertEqual(startCommands, [.startRound(1)])
        let afterState9 = try controller.update(
            deltaSeconds: 10, input: input, random: random, player: &player)
        XCTAssertFalse(afterState9.commands.contains {
            if case .startRound = $0 { return true }
            return false
        })
    }

    func testInitialActChangeUsesNilPussMapBranchAndRetriesHiddenIcons() throws {
        var player = try makeMapPlayer()
        let types = [
            ChallengeTypeDefinition(name: "unknown", iconIndex: 0, showInRandom: false),
            ChallengeTypeDefinition(name: "fruit", iconIndex: 1),
        ]
        let input = makeInput(
            outcomes: [.pass, .pass, .pass, .pass], actChange: true, challengeTypes: types)
        let random = MapRandom(indices: [0, 1, 1, 1, 1])
        var controller = ChallengeMapController()
        _ = try controller.begin(input: input, player: &player)
        let outputs = try driveToState7(&controller, player: &player, input: input, random: random)

        XCTAssertEqual(controller.state, 7)
        XCTAssertEqual(random.calls, 5, "首个隐藏项必须重抽并额外消耗一次 RNG")
        XCTAssertEqual(random.upperBounds, Array(repeating: 2, count: 5))
        let node1Icons = outputs.flatMap(\.commands).compactMap { command -> Int32? in
            guard case let .setIcon(component, icon) = command,
                  component == "challengeContainer.spinner.adventureNode_1" else { return nil }
            return icon
        }
        XCTAssertEqual(node1Icons.first, 1, "随机滚动先写抽中的可见图标")
        XCTAssertEqual(node1Icons.last, 0, "无类型槽位最终写原版图标 0")
    }

    func testSpinnerSoundStartsBeforeDeadlineAndFadesAfterDeadline() throws {
        var player = try makeMapPlayer()
        let input = makeInput(actChange: true)
        let random = MapRandom()
        var controller = ChallengeMapController()
        _ = try controller.begin(input: input, player: &player)
        _ = try controller.update(deltaSeconds: 10, input: input, random: random, player: &player)
        _ = try controller.update(deltaSeconds: 10, input: input, random: random, player: &player)
        XCTAssertEqual(controller.state, 4)

        let spinning = try controller.update(
            deltaSeconds: 0.1, input: input, random: random, player: &player)
        XCTAssertTrue(spinning.commands.contains(.playSound("slot_spin_lp")))
        let stopped = try controller.update(
            deltaSeconds: 0.51, input: input, random: random, player: &player)
        XCTAssertEqual(controller.state, 7)
        XCTAssertTrue(stopped.commands.contains(.fadeOutSound("slot_spin_lp", duration: 0.1)))
    }

    func testState1ThresholdsAndTierAdvanceHappenOnce() throws {
        var player = try makeMapPlayer()
        let oldInput = makeInput(
            outcomes: [.pass, .pass, .pass, .pass],
            actChange: true,
            isInitialPresentation: false,
            playActChangeSound: true)
        let random = MapRandom(indices: Array(repeating: 0, count: 20))
        var controller = ChallengeMapController()
        _ = try controller.begin(input: oldInput, player: &player)
        XCTAssertEqual(controller.state, 1)

        var outputs: [ChallengeMapOutput] = []
        outputs.append(try controller.update(
            deltaSeconds: 0.8, input: oldInput, random: random, player: &player))
        XCTAssertFalse(outputs.flatMap(\.commands).contains(.playSound("challenge-tick")),
                       "0.8 秒本身是严格阈值，不能提前触发")
        outputs.append(try controller.update(
            deltaSeconds: 0.0001, input: oldInput, random: random, player: &player))
        outputs.append(try controller.update(
            deltaSeconds: 0.7, input: oldInput, random: random, player: &player))
        XCTAssertEqual(outputs.flatMap(\.commands).filter { $0 == .playSound("act-change") }.count, 1)
        outputs.append(try controller.update(
            deltaSeconds: 10, input: oldInput, random: random, player: &player))
        XCTAssertEqual(outputs.flatMap(\.commands).filter { $0 == .advanceTier }.count, 1)
        XCTAssertEqual(outputs.flatMap(\.commands).filter { $0 == .clearActChangeSound }.count, 1)
        XCTAssertEqual(controller.state, 2)

        // App 处理 advanceTier 后提供新 tier 的空计划；actChange 表现仍继续进入 state 4。
        let promoted = makeInput(tierIndex: 1, actChange: false, isInitialPresentation: false)
        _ = try controller.update(
            deltaSeconds: 10, input: promoted, random: random, player: &player)
        XCTAssertEqual(controller.state, 4)
        _ = try controller.update(
            deltaSeconds: 10, input: promoted, random: random, player: &player)
        XCTAssertEqual(controller.state, 7)
        XCTAssertEqual(outputs.flatMap(\.commands).filter { $0 == .advanceTier }.count, 1)
    }

    func testBonusActChangeUsesState5WithoutSpinnerRandomDraws() throws {
        var player = try makeMapPlayer()
        let oldInput = makeInput(
            outcomes: [.pass, .pass, .pass, .pass],
            tierIndex: 3,
            isBonus: true,
            actChange: true,
            isInitialPresentation: false,
            playActChangeSound: true)
        let random = MapRandom()
        var controller = ChallengeMapController()
        _ = try controller.begin(input: oldInput, player: &player)
        let state1 = try controller.update(
            deltaSeconds: 10, input: oldInput, random: random, player: &player)
        XCTAssertFalse(state1.commands.contains(.playSound("act-change")))

        let promoted = makeInput(
            tierIndex: 4, isBonus: true, actChange: false, isInitialPresentation: false)
        _ = try controller.update(
            deltaSeconds: 10, input: promoted, random: random, player: &player)
        XCTAssertEqual(controller.state, 5)
        _ = try controller.update(
            deltaSeconds: 0.61, input: promoted, random: random, player: &player)
        XCTAssertEqual(controller.state, 7)
        XCTAssertEqual(random.calls, 0)
    }

    func testActualTypeLookupKeepsFirstMatchAndMissingTypeUsesZero() throws {
        var player = try makeMapPlayer()
        let types = [
            ChallengeTypeDefinition(name: "unknown", iconIndex: 0, showInRandom: false),
            ChallengeTypeDefinition(name: "fruit", iconIndex: 1),
            ChallengeTypeDefinition(name: "duplicate", iconIndex: 7),
            ChallengeTypeDefinition(name: "duplicate", iconIndex: 8),
        ]
        let input = makeInput(
            outcomes: [.pass, .pass, .pass, .pass],
            actChange: true,
            challengeTypes: types,
            typeNames: ["missing", "duplicate", nil, "fruit"])
        let random = MapRandom(indices: [1, 1, 1, 1])
        var controller = ChallengeMapController()
        _ = try controller.begin(input: input, player: &player)
        let outputs = try driveToState7(&controller, player: &player, input: input, random: random)
        let commands = outputs.flatMap(\.commands)

        XCTAssertEqual(lastIcon(commands, slot: 1), 0, "未知类型按 FUN_000607f8 回退首项")
        XCTAssertEqual(lastIcon(commands, slot: 2), 7, "重复名称取文档第一项")
        XCTAssertEqual(lastIcon(commands, slot: 3), 0)
        XCTAssertEqual(lastIcon(commands, slot: 4), 1)
    }

    func testBonusUsesBossSpinnerAndSkipsNormalOutroWait() throws {
        var player = try makeMapPlayer()
        let input = makeInput(outcomes: [.pass, nil, nil, nil], isBonus: true)
        let random = MapRandom()
        var controller = ChallengeMapController()
        _ = try controller.begin(input: input, player: &player)
        let outputs = try driveToState7(&controller, player: &player, input: input, random: random)
        XCTAssertTrue(outputs.flatMap(\.commands).contains(.setVisible(
            component: "bossChallengeContainer.spinner.adventureNodePass_1", visible: true)))

        _ = try controller.selectRound(index: 1, player: &player)
        let started = try controller.update(
            deltaSeconds: 1 / 60, input: input, random: random, player: &player)
        XCTAssertEqual(controller.state, 9)
        XCTAssertEqual(started.commands, [.startRound(1)])
    }

    func testUpdateRequiresBeginAndRejectsInvalidDelta() throws {
        var player = try makeMapPlayer()
        var controller = ChallengeMapController()
        let input = makeInput()
        let random = MapRandom()
        XCTAssertThrowsError(try controller.update(
            deltaSeconds: 1 / 60, input: input, random: random, player: &player)) { error in
            XCTAssertEqual(error as? ChallengeMapControllerError, .notBegun)
        }
        _ = try controller.begin(input: input, player: &player)
        XCTAssertThrowsError(try controller.update(
            deltaSeconds: .nan, input: input, random: random, player: &player)) { error in
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
                               random: MapRandom,
                               file: StaticString = #filePath,
                               line: UInt = #line) throws -> [ChallengeMapOutput] {
        var outputs: [ChallengeMapOutput] = []
        for _ in 0..<8 {
            if controller.state == 7 { return outputs }
            outputs.append(try controller.update(
                deltaSeconds: 10, input: input, random: random, player: &player))
        }
        XCTAssertEqual(controller.state, 7, file: file, line: line)
        return outputs
    }

    private func lastIcon(_ commands: [ChallengeMapCommand], slot: Int) -> Int32? {
        commands.compactMap { command -> Int32? in
            guard case let .setIcon(component, icon) = command,
                  component == "challengeContainer.spinner.adventureNode_\(slot)" else { return nil }
            return icon
        }.last
    }

    private func makeInput(currentRoundIndex: Int = 0,
                           outcomes: [ChallengeOutcome?] = [nil, nil, nil, nil],
                           tierIndex: Int32 = 0,
                           isBonus: Bool = false,
                           actChange: Bool = false,
                           challengeTypes: [ChallengeTypeDefinition] = [],
                           typeNames: [String?]? = nil,
                           isInitialPresentation: Bool = true,
                           playActChangeSound: Bool = false) -> ChallengeMapInput {
        let rounds = outcomes.enumerated().map {
            ChallengeMapRoundState(
                challengeName: "round\($0.offset + 1)",
                challengeTypeName: typeNames?[$0.offset],
                outcome: $0.element)
        }
        return ChallengeMapInput(
            tierIndex: tierIndex,
            isBonus: isBonus,
            currentRoundIndex: currentRoundIndex,
            rounds: rounds,
            actChange: actChange,
            challengeTypes: challengeTypes,
            isInitialPresentation: isInitialPresentation,
            playActChangeSound: playActChangeSound)
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
