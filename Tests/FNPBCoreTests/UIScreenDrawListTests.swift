import Foundation
import XCTest
@testable import FNPBCore

final class UIScreenDrawListTests: XCTestCase {
    func testRootDisabledDoesNotAppearAndDoesNotHideChildren() throws {
        let projection = try project([
            component("", parent: -1, layout: .init(enabled: false)),
            component("childA", parent: 0),
            component("childB", parent: 0),
        ])
        let ordered = projection.orderedVisibleComponents()
        XCTAssertEqual(ordered.map(\.name), ["childA", "childB"])
        XCTAssertFalse(ordered.contains { $0.name.isEmpty })
    }

    func testResourcePreorderAndCrossLayerSorting() throws {
        let projection = try project([
            component("", parent: -1),
            component("a", parent: 0, layout: .init(layer: 5)),
            component("aChild", parent: 1, layout: .init(layer: 0)),
            component("b", parent: 0, layout: .init(layer: 5)),
            component("bChild", parent: 3, layout: .init(layer: 0)),
            component("c", parent: 0, layout: .init(layer: 10)),
        ])
        XCTAssertEqual(projection.orderedVisibleComponents().map(\.name),
                       ["aChild", "bChild", "a", "b", "c"])
    }

    func testSameLayerUsesStableResourcePreorderEvenWhenNamesAreReverseSorted() throws {
        let projection = try project([
            component("", parent: -1),
            component("zeta", parent: 0, layout: .init(layer: 0)),
            component("alpha", parent: 1, layout: .init(layer: 0)),
            component("middle", parent: 0, layout: .init(layer: 0)),
        ])
        XCTAssertEqual(projection.orderedVisibleComponents().map(\.name),
                       ["zeta", "alpha", "middle"])
    }

    func testHiddenParentSkipsEntireSubtreeEvenWithChildOverrides() throws {
        let disabledParentProjection = try project([
            component("", parent: -1),
            component("hiddenParent", parent: 0, layout: .init(enabled: false)),
            component("child", parent: 1),
            component("grandchild", parent: 2),
            component("visibleSibling", parent: 0),
        ])
        XCTAssertEqual(disabledParentProjection.orderedVisibleComponents(
            visibleTargets: ["child": true, "grandchild": true]).map(\.name),
            ["visibleSibling"])

        let overriddenParentProjection = try project([
            component("", parent: -1),
            component("parent", parent: 0),
            component("child", parent: 1),
            component("grandchild", parent: 2),
        ])
        XCTAssertTrue(overriddenParentProjection.orderedVisibleComponents(
            visibleTargets: ["parent": false, "child": true, "grandchild": true]).isEmpty)
    }

    func testVisibleTargetsShowHideAndUnknownNamesAreIgnored() throws {
        let projection = try project([
            component("", parent: -1),
            component("offByDefault", parent: 0, layout: .init(enabled: false)),
            component("onByDefault", parent: 0),
        ])
        XCTAssertEqual(projection.orderedVisibleComponents().map(\.name), ["onByDefault"])
        XCTAssertEqual(projection.orderedVisibleComponents(
            visibleTargets: ["offByDefault": true]).map(\.name),
            ["offByDefault", "onByDefault"])
        XCTAssertTrue(projection.orderedVisibleComponents(
            visibleTargets: ["onByDefault": false]).isEmpty)
        XCTAssertEqual(projection.orderedVisibleComponents(
            visibleTargets: ["unknown": true]).map(\.name), ["onByDefault"])
    }

    func testScreenVisibilityFalseDoesNotFilterDrawList() throws {
        let projection = try project([
            component("", parent: -1),
            component("offscreen", parent: 0, layout: .init(
                position: [1000, 1000, 0], width: 10, height: 10)),
            component("onscreen", parent: 0, layout: .init(
                position: [10, 10, 0], width: 10, height: 10)),
        ])
        let offscreen = try XCTUnwrap(projection.components.first {
            $0.name == "offscreen"
        })
        XCTAssertFalse(offscreen.screenVisibility)
        XCTAssertEqual(projection.orderedVisibleComponents().map(\.name),
                       ["offscreen", "onscreen"])
    }

    func testProductionChallengeMapKeepsNormalTreeAndSkipsWholeBonusTree() throws {
        let projection = try UIScreenLayoutProjection.project(productionChallengeMapPlayer())
        XCTAssertEqual(projection.components.count, 95)
        let ordered = projection.orderedVisibleComponents(visibleTargets: [
            "challengeContainer": true,
            "bossChallengeContainer": false,
        ])
        let names = Set(ordered.map(\.name))
        XCTAssertTrue(names.contains("challengeContainer"))
        XCTAssertTrue(names.contains("challengeContainer.spinner.adventureNode_1"))
        XCTAssertFalse(names.contains(""))
        XCTAssertFalse(names.contains { $0 == "bossChallengeContainer" })
        XCTAssertFalse(names.contains { $0.hasPrefix("bossChallengeContainer.") })
        XCTAssertFalse(names.contains("challengeContainer")
            && names.contains("bossChallengeContainer"))
        XCTAssertEqual(ordered.map(\.effectiveLayer),
                       ordered.map(\.effectiveLayer).sorted())
    }

    private func component(
        _ name: String,
        parent: Int? = -1,
        layout: UIScreenAnimationContent.Component.Layout = .init()
    ) -> UIScreenAnimationContent.Component {
        UIScreenAnimationContent.Component(
            name: name, animations: [], parentIndex: parent, layout: layout)
    }

    private func project(_ components: [UIScreenAnimationContent.Component])
        throws -> UIScreenLayoutProjection {
        let player = try UIScreenAnimationPlayer(content: makeContent(components))
        return try UIScreenLayoutProjection.project(player)
    }

    private func makeContent(_ components: [UIScreenAnimationContent.Component])
        -> UIScreenAnimationContent {
        UIScreenAnimationContent(
            formatVersion: 1,
            source: UIScreenAnimationContent.Source(
                file: "test.uiscreen", sha256: String(repeating: "0", count: 64)),
            components: components)
    }

    private func productionChallengeMapPlayer() throws -> UIScreenAnimationPlayer {
        let data = try Data(contentsOf: repositoryRoot()
            .appendingPathComponent("Content/challengeMapAnimations.json"))
        return try UIScreenAnimationPlayer(data: data)
    }

    private func repositoryRoot() -> URL {
        URL(fileURLWithPath: #filePath)
            .deletingLastPathComponent().deletingLastPathComponent().deletingLastPathComponent()
    }
}
