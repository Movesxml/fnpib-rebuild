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

/// RGBA bytes in the original component-property order.
public struct UIScreenRGBA: Equatable, Sendable {
    public let red: UInt8
    public let green: UInt8
    public let blue: UInt8
    public let alpha: UInt8

    public init(red: UInt8, green: UInt8, blue: UInt8, alpha: UInt8) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }

    public var bytes: [UInt8] { [red, green, blue, alpha] }
    public static let white = UIScreenRGBA(red: 255, green: 255, blue: 255, alpha: 255)
}

/// Original UV corners; negative sizes intentionally preserve texture reversal.
public struct UIScreenTexCoord: Equatable, Sendable {
    public let position: [Float]
    public let size: [Float]

    public init(position: [Float], size: [Float]) {
        precondition(position.count == 2, "UIScreenTexCoord position requires exactly 2 values")
        precondition(size.count == 2, "UIScreenTexCoord size requires exactly 2 values")
        self.position = position
        self.size = size
    }

    public var topLeft: [Float] { position }
    public var topRight: [Float] { [position[0] + size[0], position[1]] }
    public var bottomLeft: [Float] { [position[0], position[1] + size[1]] }
    public var bottomRight: [Float] { [position[0] + size[0], position[1] + size[1]] }
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
    public let localRGBA: UIScreenRGBA
    public let absoluteRGBA: UIScreenRGBA
    public let enabled: Bool
    public let texturePath: String?
    public let texCoord: UIScreenTexCoord
    public let screenVisibility: Bool
    public let localLayer: Int32
    public let effectiveLayer: Int32

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
                worldCorners: UIScreenProjectedCorners,
                localRGBA: UIScreenRGBA,
                absoluteRGBA: UIScreenRGBA,
                enabled: Bool,
                texturePath: String?,
                texCoord: UIScreenTexCoord,
                screenVisibility: Bool,
                localLayer: Int32 = -1,
                effectiveLayer: Int32 = -1) {
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
        self.localRGBA = localRGBA
        self.absoluteRGBA = absoluteRGBA
        self.enabled = enabled
        self.texturePath = texturePath
        self.texCoord = texCoord
        self.screenVisibility = screenVisibility
        self.localLayer = localLayer
        self.effectiveLayer = effectiveLayer
    }
}

public enum UIScreenLayoutProjectionError: Error, Equatable, Sendable {
    case parentCycle(path: [String])
    case invalidParentIndex(component: String, parentIndex: Int)
    case invalidTrackValueCount(component: String, track: String, expected: Int, actual: Int)
    case invalidColourValue(component: String, value: Float)
    case invalidLayerValue(component: String, value: String)
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
    let localRGBA: UIScreenRGBA
    let enabled: Bool
    let texturePath: String?
    let texCoord: UIScreenTexCoord
    let localLayer: Int32
}

public struct UIScreenLayoutProjection: Equatable, Sendable {
    public static let logicalViewportWidth: Float = 480
    public static let logicalViewportHeight: Float = 320

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

            let sampledColour = try sampledValues {
                try player.sampleActive(component: component.name, track: "colour")
            }
            let colourValues = sampledColour ?? layout?.colour ?? [255, 255, 255, 255]
            guard colourValues.count == 4 else {
                throw UIScreenLayoutProjectionError.invalidTrackValueCount(
                    component: component.name, track: "colour",
                    expected: 4, actual: colourValues.count)
            }
            let localRGBA = try makeRGBA(colourValues, component: component.name)

            let sampledEnabled = try sampledValues {
                try player.sampleActive(component: component.name, track: "enabled")
            }
            if let sampledEnabled, sampledEnabled.count != 1 {
                throw UIScreenLayoutProjectionError.invalidTrackValueCount(
                    component: component.name, track: "enabled",
                    expected: 1, actual: sampledEnabled.count)
            }
            let enabled = sampledEnabled.map { $0[0] != 0 } ?? layout?.enabled ?? true

            let sampledLayer = try sampledValues {
                try player.sampleActive(component: component.name, track: "layer")
            }
            let localLayer: Int32
            if let sampledLayer {
                guard sampledLayer.count == 1 else {
                    throw UIScreenLayoutProjectionError.invalidTrackValueCount(
                        component: component.name, track: "layer",
                        expected: 1, actual: sampledLayer.count)
                }
                localLayer = try layerValue(fromAnimated: sampledLayer[0],
                                            component: component.name)
            } else if let staticLayer = layout?.layer {
                localLayer = try layerValue(fromStatic: staticLayer,
                                            component: component.name)
            } else {
                localLayer = -1
            }

            let texCoordPos = layout?.texCoordPos ?? [0, 0]
            let texCoordSize = layout?.texCoordSize ?? [1, 1]
            guard texCoordPos.count == 2 else {
                throw UIScreenLayoutProjectionError.invalidTrackValueCount(
                    component: component.name, track: "texCoordPos",
                    expected: 2, actual: texCoordPos.count)
            }
            guard texCoordSize.count == 2 else {
                throw UIScreenLayoutProjectionError.invalidTrackValueCount(
                    component: component.name, track: "texCoordSize",
                    expected: 2, actual: texCoordSize.count)
            }

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
                effectiveOrigin: effectiveOrigin,
                localRGBA: localRGBA,
                enabled: enabled,
                texturePath: layout?.texture,
                texCoord: UIScreenTexCoord(position: texCoordPos, size: texCoordSize),
                localLayer: localLayer))
        }

        var worldMatrices = [UIScreenMatrix4](repeating: .identity, count: count)
        var absoluteRGBAs = [UIScreenRGBA?](repeating: nil, count: count)
        var effectiveLayers = [Int32](repeating: -1, count: count)
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
                let parentAbsolute: UIScreenRGBA
                let inheritedLayer: Int32
                if let parentIndex = contentComponents[index].parentIndex, parentIndex != -1 {
                    guard parentIndex >= 0, parentIndex < count else {
                        throw UIScreenLayoutProjectionError.invalidParentIndex(
                            component: contentComponents[index].name,
                            parentIndex: parentIndex)
                    }
                    parentWorld = worldMatrices[parentIndex]
                    parentAbsolute = absoluteRGBAs[parentIndex] ?? .white
                    inheritedLayer = effectiveLayers[parentIndex]
                } else {
                    parentWorld = .identity
                    parentAbsolute = .white
                    inheritedLayer = -1
                }
                worldMatrices[index] = parentWorld * localMatrices[index]
                absoluteRGBAs[index] = modulate(mergedLayouts[index].localRGBA, by: parentAbsolute)
                let localLayer = mergedLayouts[index].localLayer
                effectiveLayers[index] = localLayer < 0 ? inheritedLayer : localLayer
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

            let corners = UIScreenProjectedCorners(
                minimumXMinimumY: corner(x: 0, y: 0),
                maximumXMinimumY: corner(x: merged.width, y: 0),
                maximumXMaximumY: corner(x: merged.width, y: merged.height),
                minimumXMaximumY: corner(x: 0, y: merged.height))
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
                worldCorners: corners,
                localRGBA: merged.localRGBA,
                absoluteRGBA: absoluteRGBAs[index] ?? merged.localRGBA,
                enabled: merged.enabled,
                texturePath: merged.texturePath,
                texCoord: merged.texCoord,
                screenVisibility: screenVisibility(
                    corners: corners,
                    viewportWidth: logicalViewportWidth,
                    viewportHeight: logicalViewportHeight),
                localLayer: merged.localLayer,
                effectiveLayer: effectiveLayers[index]))
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

    /// Independent screen-space AABB visibility, not component enabled state.
    static func screenVisibility(corners: UIScreenProjectedCorners,
                                 viewportWidth: Float,
                                 viewportHeight: Float) -> Bool {
        let points = [corners.minimumXMinimumY, corners.maximumXMinimumY,
                      corners.maximumXMaximumY, corners.minimumXMaximumY]
        let left = points.map(\.x).min() ?? 0
        let right = points.map(\.x).max() ?? 0
        let top = points.map(\.y).min() ?? 0
        let bottom = points.map(\.y).max() ?? 0
        return right - left > -1
            && bottom - top > -1
            && right > 0
            && left < viewportWidth
            && bottom > 0
            && top < viewportHeight
    }

    private static func makeRGBA(_ values: [Float], component: String) throws -> UIScreenRGBA {
        func byte(_ value: Float) throws -> UInt8 {
            guard value >= 0, value <= 255 else {
                throw UIScreenLayoutProjectionError.invalidColourValue(
                    component: component, value: value)
            }
            return UInt8(value.rounded(.towardZero))
        }
        return UIScreenRGBA(red: try byte(values[0]), green: try byte(values[1]),
                            blue: try byte(values[2]), alpha: try byte(values[3]))
    }

    private static func modulate(_ local: UIScreenRGBA, by parent: UIScreenRGBA) -> UIScreenRGBA {
        func channel(_ local: UInt8, _ parent: UInt8) -> UInt8 {
            // FUN_003d8dd0: division, multiplication, then truncation at every level.
            UInt8((Float(local) / 255.0 * Float(parent)).rounded(.towardZero))
        }
        return UIScreenRGBA(red: channel(local.red, parent.red),
                            green: channel(local.green, parent.green),
                            blue: channel(local.blue, parent.blue),
                            alpha: channel(local.alpha, parent.alpha))
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

    /// The release resource stores a 32-bit layer bit pattern. JSON positive
    /// values above Int32.max therefore represent negative Int32 layer values.
    private static func layerValue(fromStatic value: Int, component: String) throws -> Int32 {
        if let signed = Int32(exactly: value) { return signed }
        if let bits = UInt32(exactly: value) { return Int32(bitPattern: bits) }
        throw UIScreenLayoutProjectionError.invalidLayerValue(
            component: component, value: String(value))
    }

    /// Float(UInt32.max) is 2^32, which is the resource animation encoding of
    /// 0xffffffff. Handle it explicitly before any trapping integer conversion.
    private static func layerValue(fromAnimated value: Float, component: String) throws -> Int32 {
        guard value.isFinite, value == value.rounded(.towardZero) else {
            throw UIScreenLayoutProjectionError.invalidLayerValue(
                component: component, value: String(value))
        }
        if value == Float(UInt32.max) { return -1 }
        if value >= -2_147_483_648, value < 2_147_483_648 {
            return Int32(value)
        }
        if value >= 2_147_483_648, value < 4_294_967_296 {
            return Int32(bitPattern: UInt32(value))
        }
        throw UIScreenLayoutProjectionError.invalidLayerValue(
            component: component, value: String(value))
    }
}
