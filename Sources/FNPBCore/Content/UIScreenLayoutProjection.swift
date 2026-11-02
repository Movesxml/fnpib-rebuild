import Foundation

public struct UIScreenPoint3: Equatable, Sendable {
    public var x: Float
    public var y: Float
    public var z: Float

    public init(x: Float, y: Float, z: Float) {
        self.x = x
        self.y = y
        self.z = z
    }

    public static prefix func - (point: UIScreenPoint3) -> UIScreenPoint3 {
        UIScreenPoint3(x: -point.x, y: -point.y, z: -point.z)
    }
}

public struct UIScreenMatrix4: Equatable, Sendable {
    public let elements: [Float]

    public init(elements: [Float]) {
        precondition(elements.count == 16, "UIScreenMatrix4 requires exactly 16 elements")
        self.elements = elements
    }

    public static let identity = UIScreenMatrix4(elements: [
        1, 0, 0, 0,
        0, 1, 0, 0,
        0, 0, 1, 0,
        0, 0, 0, 1,
    ])

    public subscript(column: Int, row: Int) -> Float {
        elements[column * 4 + row]
    }

    public func transformed(_ point: UIScreenPoint3) -> UIScreenPoint3 {
        let x = elements[0] * point.x + elements[4] * point.y + elements[8] * point.z + elements[12]
        let y = elements[1] * point.x + elements[5] * point.y + elements[9] * point.z + elements[13]
        let z = elements[2] * point.x + elements[6] * point.y + elements[10] * point.z + elements[14]
        return UIScreenPoint3(x: x, y: y, z: z)
    }

    public static func * (lhs: UIScreenMatrix4, rhs: UIScreenMatrix4) -> UIScreenMatrix4 {
        var result = [Float](repeating: 0, count: 16)
        for column in 0..<4 {
            for row in 0..<4 {
                // Preserve the original four multiplications and three additions.
                var sum = lhs.elements[row] * rhs.elements[column * 4]
                for k in 1..<4 {
                    sum += lhs.elements[k * 4 + row] * rhs.elements[column * 4 + k]
                }
                result[column * 4 + row] = sum
            }
        }
        return UIScreenMatrix4(elements: result)
    }

    public static func translation(_ point: UIScreenPoint3) -> UIScreenMatrix4 {
        UIScreenMatrix4(elements: [
            1, 0, 0, 0,
            0, 1, 0, 0,
            0, 0, 1, 0,
            point.x, point.y, point.z, 1,
        ])
    }

    public static func scale(_ point: UIScreenPoint3) -> UIScreenMatrix4 {
        UIScreenMatrix4(elements: [
            point.x, 0, 0, 0,
            0, point.y, 0, 0,
            0, 0, point.z, 0,
            0, 0, 0, 1,
        ])
    }

    public static func rotationZ(radians: Float) -> UIScreenMatrix4 {
        let cosine = cosf(radians)
        let sine = sinf(radians)
        return UIScreenMatrix4(elements: [
            cosine, sine, 0, 0,
            -sine, cosine, 0, 0,
            0, 0, 1, 0,
            0, 0, 0, 1,
        ])
    }
}

public struct UIScreenProjectedCorners: Equatable, Sendable {
    public let minimumXMinimumY: UIScreenPoint3
    public let maximumXMinimumY: UIScreenPoint3
    public let maximumXMaximumY: UIScreenPoint3
    public let minimumXMaximumY: UIScreenPoint3

    public init(minimumXMinimumY: UIScreenPoint3,
                maximumXMinimumY: UIScreenPoint3,
                maximumXMaximumY: UIScreenPoint3,
                minimumXMaximumY: UIScreenPoint3) {
        self.minimumXMinimumY = minimumXMinimumY
        self.maximumXMinimumY = maximumXMinimumY
        self.maximumXMaximumY = maximumXMaximumY
        self.minimumXMaximumY = minimumXMaximumY
    }
}

public struct UIScreenProjectedComponent: Equatable, Sendable {
    public let name: String
    public let index: Int
    public let parentIndex: Int?
    public let position: UIScreenPoint3
    public let scale: UIScreenPoint3
    public let rotation: UIScreenPoint3
    public let width: Float
    public let height: Float
    public let origin: UIScreenPoint3
    public let originFromCenter: Bool
    public let effectiveOrigin: UIScreenPoint3
    public let localMatrix: UIScreenMatrix4
    public let worldMatrix: UIScreenMatrix4
    public let worldOrigin: UIScreenPoint3
    public let worldCorners: UIScreenProjectedCorners

    public init(name: String,
                index: Int,
                parentIndex: Int?,
                position: UIScreenPoint3,
                scale: UIScreenPoint3,
                rotation: UIScreenPoint3,
                width: Float,
                height: Float,
                origin: UIScreenPoint3,
                originFromCenter: Bool,
                effectiveOrigin: UIScreenPoint3,
                localMatrix: UIScreenMatrix4,
                worldMatrix: UIScreenMatrix4,
                worldOrigin: UIScreenPoint3,
                worldCorners: UIScreenProjectedCorners) {
        self.name = name
        self.index = index
        self.parentIndex = parentIndex
        self.position = position
        self.scale = scale
        self.rotation = rotation
        self.width = width
        self.height = height
        self.origin = origin
        self.originFromCenter = originFromCenter
        self.effectiveOrigin = effectiveOrigin
        self.localMatrix = localMatrix
        self.worldMatrix = worldMatrix
        self.worldOrigin = worldOrigin
        self.worldCorners = worldCorners
    }
}

public enum UIScreenLayoutProjectionError: Error, Equatable, Sendable {
    case parentCycle(path: [String])
    case invalidParentIndex(component: String, parentIndex: Int)
    case invalidTrackValueCount(component: String, track: String, expected: Int, actual: Int)
}

private struct MergedLayout {
    let position: UIScreenPoint3
    let scale: UIScreenPoint3
    let rotation: UIScreenPoint3
    let width: Float
    let height: Float
    let origin: UIScreenPoint3
    let originFromCenter: Bool
    let effectiveOrigin: UIScreenPoint3
}

public struct UIScreenLayoutProjection: Equatable, Sendable {
    public let components: [UIScreenProjectedComponent]

    public init(components: [UIScreenProjectedComponent]) {
        self.components = components
    }

    public static func project(_ player: UIScreenAnimationPlayer) throws -> UIScreenLayoutProjection {
        let contentComponents = player.content.components
        let count = contentComponents.count
        var mergedLayouts: [MergedLayout] = []
        mergedLayouts.reserveCapacity(count)
        var localMatrices: [UIScreenMatrix4] = []
        localMatrices.reserveCapacity(count)

        for component in contentComponents {
            let layout = component.layout
            var position = vector3(layout?.position, fallback: UIScreenPoint3(x: 0, y: 0, z: 0))
            var scale = vector3(layout?.scale, fallback: UIScreenPoint3(x: 1, y: 1, z: 1))
            var rotation = vector3(layout?.rotation, fallback: UIScreenPoint3(x: 0, y: 0, z: 0))
            let width = layout?.width ?? 100
            let height = layout?.height ?? 100
            let origin = vector3(layout?.origin, fallback: UIScreenPoint3(x: 0, y: 0, z: 0))
            let originFromCenter = layout?.originFromCenter ?? false

            position = try mergedPoint(sampledValues {
                try player.sampleActive(component: component.name, track: "position")
            }, fallback: position, component: component.name, track: "position")
            scale = try mergedPoint(sampledValues {
                try player.sampleActive(component: component.name, track: "scale")
            }, fallback: scale, component: component.name, track: "scale")
            rotation = try mergedPoint(sampledValues {
                try player.sampleActive(component: component.name, track: "rotation")
            }, fallback: rotation, component: component.name, track: "rotation")

            let effectiveOrigin: UIScreenPoint3
            if originFromCenter {
                effectiveOrigin = UIScreenPoint3(
                    x: origin.x + width * 0.5,
                    y: origin.y + height * 0.5,
                    z: origin.z)
            } else {
                effectiveOrigin = origin
            }

            let radians = -rotation.z * Float(bitPattern: 0x3c8e_fa35)
            let localMatrix = UIScreenMatrix4.translation(position)
                * UIScreenMatrix4.rotationZ(radians: radians)
                * UIScreenMatrix4.scale(scale)

            localMatrices.append(localMatrix)
            mergedLayouts.append(MergedLayout(
                position: position,
                scale: scale,
                rotation: rotation,
                width: width,
                height: height,
                origin: origin,
                originFromCenter: originFromCenter,
                effectiveOrigin: effectiveOrigin))
        }

        var worldMatrices = [UIScreenMatrix4](repeating: .identity, count: count)
        var state = [Int](repeating: 0, count: count)

        for start in 0..<count {
            if state[start] == 2 { continue }
            var stack: [Int] = []
            var current = start

            while true {
                if state[current] == 2 { break }
                if state[current] == 1 {
                    guard let cycleStart = stack.firstIndex(of: current) else {
                        throw UIScreenLayoutProjectionError.parentCycle(
                            path: [contentComponents[current].name])
                    }
                    let cycleIndices = Array(stack[cycleStart...]) + [current]
                    throw UIScreenLayoutProjectionError.parentCycle(
                        path: cycleIndices.map { contentComponents[$0].name })
                }

                state[current] = 1
                stack.append(current)
                guard let parentIndex = contentComponents[current].parentIndex, parentIndex != -1 else {
                    break
                }
                guard parentIndex >= 0, parentIndex < count else {
                    throw UIScreenLayoutProjectionError.invalidParentIndex(
                        component: contentComponents[current].name,
                        parentIndex: parentIndex)
                }
                current = parentIndex
            }

            while let index = stack.popLast() {
                let parentWorld: UIScreenMatrix4
                if let parentIndex = contentComponents[index].parentIndex, parentIndex != -1 {
                    guard parentIndex >= 0, parentIndex < count else {
                        throw UIScreenLayoutProjectionError.invalidParentIndex(
                            component: contentComponents[index].name,
                            parentIndex: parentIndex)
                    }
                    parentWorld = worldMatrices[parentIndex]
                } else {
                    parentWorld = .identity
                }
                worldMatrices[index] = parentWorld * localMatrices[index]
                state[index] = 2
            }
        }

        var projected: [UIScreenProjectedComponent] = []
        projected.reserveCapacity(count)
        for index in 0..<count {
            let merged = mergedLayouts[index]
            let worldMatrix = worldMatrices[index]
            let worldOrigin = worldMatrix.transformed(-merged.effectiveOrigin)

            func corner(x: Float, y: Float) -> UIScreenPoint3 {
                worldMatrix.transformed(UIScreenPoint3(
                    x: x - merged.effectiveOrigin.x,
                    y: y - merged.effectiveOrigin.y,
                    z: -merged.effectiveOrigin.z))
            }

            projected.append(UIScreenProjectedComponent(
                name: contentComponents[index].name,
                index: index,
                parentIndex: contentComponents[index].parentIndex,
                position: merged.position,
                scale: merged.scale,
                rotation: merged.rotation,
                width: merged.width,
                height: merged.height,
                origin: merged.origin,
                originFromCenter: merged.originFromCenter,
                effectiveOrigin: merged.effectiveOrigin,
                localMatrix: localMatrices[index],
                worldMatrix: worldMatrix,
                worldOrigin: worldOrigin,
                worldCorners: UIScreenProjectedCorners(
                    minimumXMinimumY: corner(x: 0, y: 0),
                    maximumXMinimumY: corner(x: merged.width, y: 0),
                    maximumXMaximumY: corner(x: merged.width, y: merged.height),
                    minimumXMaximumY: corner(x: 0, y: merged.height))))
        }
        return UIScreenLayoutProjection(components: projected)
    }

    static func sampledValues(_ sample: () throws -> [Float]?) throws -> [Float]? {
        do {
            return try sample()
        } catch let error as UIScreenAnimationError {
            if case .unknownTrack = error { return nil }
            throw error
        }
    }

    private static func vector3(_ values: [Float]?, fallback: UIScreenPoint3) -> UIScreenPoint3 {
        guard let values, values.count == 3 else { return fallback }
        return UIScreenPoint3(x: values[0], y: values[1], z: values[2])
    }

    private static func mergedPoint(_ values: [Float]?,
                                    fallback: UIScreenPoint3,
                                    component: String,
                                    track: String) throws -> UIScreenPoint3 {
        guard let values else { return fallback }
        guard values.count == 3 else {
            throw UIScreenLayoutProjectionError.invalidTrackValueCount(
                component: component, track: track, expected: 3, actual: values.count)
        }
        return UIScreenPoint3(x: values[0], y: values[1], z: values[2])
    }
}
