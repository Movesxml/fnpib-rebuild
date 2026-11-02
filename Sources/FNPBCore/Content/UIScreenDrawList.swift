import Foundation

extension UIScreenLayoutProjection {
    /// FUN_003ef458 / FUN_003ef818: visit children of the screen root in resource
    /// order, then partition by effective layer. The root itself is not drawn.
    /// screenVisibility is independent state and is intentionally not consulted.
    public func orderedVisibleComponents(
        visibleTargets: [String: Bool] = [:]
    ) -> [UIScreenProjectedComponent] {
        var childrenByParent: [Int: [Int]] = [:]
        var roots: [Int] = []
        for (index, component) in components.enumerated() {
            if let parentIndex = component.parentIndex, parentIndex != -1 {
                childrenByParent[parentIndex, default: []].append(index)
            } else {
                roots.append(index)
            }
        }

        struct Entry {
            let component: UIScreenProjectedComponent
            let traversalOrder: Int
        }
        var entries: [Entry] = []
        entries.reserveCapacity(components.count)
        var traversalOrder = 0

        func visit(_ index: Int) {
            guard components.indices.contains(index) else { return }
            let component = components[index]
            guard visibleTargets[component.name] ?? component.enabled else { return }
            entries.append(Entry(component: component, traversalOrder: traversalOrder))
            traversalOrder += 1
            for childIndex in childrenByParent[index] ?? [] {
                visit(childIndex)
            }
        }

        for rootIndex in roots {
            for childIndex in childrenByParent[rootIndex] ?? [] {
                visit(childIndex)
            }
        }

        entries.sort { lhs, rhs in
            if lhs.component.effectiveLayer != rhs.component.effectiveLayer {
                return lhs.component.effectiveLayer < rhs.component.effectiveLayer
            }
            return lhs.traversalOrder < rhs.traversalOrder
        }
        return entries.map(\.component)
    }
}
