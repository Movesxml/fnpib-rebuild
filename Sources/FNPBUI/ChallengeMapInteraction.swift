import SwiftUI
import CoreGraphics

public enum ChallengeMapHitGeometry {
    public static func contains(point: CGPoint, quad: [CGPoint]) -> Bool {
        guard quad.count == 4, point.x.isFinite, point.y.isFinite,
              quad.allSatisfy({ $0.x.isFinite && $0.y.isFinite }) else { return false }
        var twiceArea: CGFloat = 0
        for index in 0..<4 {
            let current = quad[index]
            let next = quad[(index + 1) % 4]
            twiceArea += current.x * next.y - next.x * current.y
        }
        guard twiceArea.isFinite, abs(twiceArea) > 1e-12 else { return false }

        var hasPositive = false
        var hasNegative = false
        for index in 0..<4 {
            let start = quad[index]
            let end = quad[(index + 1) % 4]
            let cross = (end.x - start.x) * (point.y - start.y)
                - (end.y - start.y) * (point.x - start.x)
            hasPositive = hasPositive || cross > 0
            hasNegative = hasNegative || cross < 0
            if hasPositive && hasNegative { return false }
        }
        return true
    }
}

public struct ChallengeMapInteraction: View {
    public let map: ChallengeMapHUDState
    public let actions: UIActions

    public init(map: ChallengeMapHUDState, actions: UIActions) {
        self.map = map
        self.actions = actions
    }

    public var body: some View {
        GeometryReader { proxy in
            Color.clear
                .contentShape(Rectangle())
                .gesture(SpatialTapGesture().onEnded { value in
                    handleTap(at: value.location, viewportSize: proxy.size)
                })
        }
    }

    private func handleTap(at point: CGPoint, viewportSize: CGSize) {
        for component in map.components.reversed() {
            guard let round = matchingRound(for: component) else { continue }
            let quad = ChallengeMapLayoutGeometry.positions(
                for: component, deviceWidth: viewportSize.width,
                deviceHeight: viewportSize.height)
            guard ChallengeMapHitGeometry.contains(point: point, quad: quad) else { continue }
            if map.canSelect && round.outcomeRawValue == nil {
                actions.send(.selectChallengeMapRound(round.id))
            }
            return
        }
    }

    private func matchingRound(
        for component: ChallengeMapLayoutComponent
    ) -> ChallengeMapRoundHUDState? {
        map.rounds.first { round in
            component.name.hasSuffix(".spinner.adventureNode_\(round.id + 1)")
        }
    }
}
