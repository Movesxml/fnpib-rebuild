import Foundation

/// A deliberately small production projection of the release UISF timeline.
/// The JSON is generated from inGameClassic.uiscreen; no timing is duplicated in Swift.
public struct UIScreenAnimationContent: Codable, Equatable, Sendable {
    public struct Source: Codable, Equatable, Sendable {
        public var file: String
        public var sha256: String
    }

    public struct Component: Codable, Equatable, Sendable {
        public struct Layout: Codable, Equatable, Sendable {
            public var texture: String?
            public var text: String?
            public var position: [Float]?
            public var scale: [Float]?
            public var origin: [Float]?
            public var rotation: [Float]?
            public var width: Float?
            public var height: Float?
            public var colour: [Float]?
            public var enabled: Bool?
            public var inputEnabled: Bool?
            public var originFromCenter: Bool?
            public var texCoordPos: [Float]?
            public var texCoordSize: [Float]?
            public var layer: Int?
            public var fontName: String?
            public var fontSize: Float?
            public var alignment: String?
            public var drawNinePatch: Bool?
            public var allowStretchX: Bool?
            public var allowStretchY: Bool?
            public var maintainViewportWidth: Bool?
            public var maintainViewportHeight: Bool?

            public init(
                texture: String? = nil, text: String? = nil,
                position: [Float]? = nil, scale: [Float]? = nil,
                origin: [Float]? = nil, rotation: [Float]? = nil,
                width: Float? = nil, height: Float? = nil, colour: [Float]? = nil,
                enabled: Bool? = nil, inputEnabled: Bool? = nil,
                originFromCenter: Bool? = nil, texCoordPos: [Float]? = nil,
                texCoordSize: [Float]? = nil, layer: Int? = nil,
                fontName: String? = nil, fontSize: Float? = nil,
                alignment: String? = nil, drawNinePatch: Bool? = nil,
                allowStretchX: Bool? = nil, allowStretchY: Bool? = nil,
                maintainViewportWidth: Bool? = nil, maintainViewportHeight: Bool? = nil
            ) {
                self.texture = texture
                self.text = text
                self.position = position
                self.scale = scale
                self.origin = origin
                self.rotation = rotation
                self.width = width
                self.height = height
                self.colour = colour
                self.enabled = enabled
                self.inputEnabled = inputEnabled
                self.originFromCenter = originFromCenter
                self.texCoordPos = texCoordPos
                self.texCoordSize = texCoordSize
                self.layer = layer
                self.fontName = fontName
                self.fontSize = fontSize
                self.alignment = alignment
                self.drawNinePatch = drawNinePatch
                self.allowStretchX = allowStretchX
                self.allowStretchY = allowStretchY
                self.maintainViewportWidth = maintainViewportWidth
                self.maintainViewportHeight = maintainViewportHeight
            }
        }

        public var name: String
        public var animations: [Animation]
        public var parentIndex: Int?
        public var layout: Layout?

        public init(name: String, animations: [Animation],
                    parentIndex: Int? = nil, layout: Layout? = nil) {
            self.name = name
            self.animations = animations
            self.parentIndex = parentIndex
            self.layout = layout
        }
    }

    public struct Animation: Codable, Equatable, Sendable {
        public var name: String
        public var endTimeMS: Int
        public var tracks: [Track]
    }

    public struct Track: Codable, Equatable, Sendable {
        public var name: String
        public var keyframes: [Keyframe]
    }

    public struct Keyframe: Codable, Equatable, Sendable {
        public var timeMS: Int
        public var interpolation: Int
        public var values: [Float]
        public var events: [Event]
        /// String payload used only by the resource's non-numeric `comment` track.
        /// Optional keeps existing numeric-only JSON and constructors source-compatible.
        public var comment: String?
    }

    public struct Event: Codable, Equatable, Sendable {
        public var command: String
        public var arguments: [String]
    }

    public var formatVersion: Int
    public var source: Source
    public var components: [Component]
}

public enum UIScreenAnimationError: Error, Equatable, Sendable {
    case unsupportedFormat(Int)
    case duplicateComponent(String)
    case duplicateAnimation(component: String, animation: String)
    case invalidTimeline(component: String, animation: String, reason: String)
    case unsupportedInterpolation(component: String, animation: String, track: String, timeMS: Int)
    case unknownComponent(String)
    case unknownAnimation(component: String, animation: String)
    case unknownTrack(component: String, animation: String, track: String)
    case invalidDelta(Float)
    case invalidParentIndex(component: String, parentIndex: Int)
    case invalidLayout(component: String, reason: String)
}

/// Verified functors behind FUN_003e86e8. Only modes used by the reconstructed
/// Challenge screens are implemented; other modes remain explicit errors.
enum UIScreenInterpolation {
    static func isSupported(mode: Int) -> Bool {
        switch mode {
        case 0, 1, 2, 3, 5, 7: return true
        default: return false
        }
    }

    static func curve(mode: Int, x: Float) -> Float? {
        switch mode {
        case 0:
            return x
        case 1:
            // FUN_003e7dc4: Float input and π constant, double sin, then Float output.
            let phase = (x + 1.5) * Float(bitPattern: 0x4049_0fdb)
            return Float((sin(Double(phase)) + 1) * 0.5)
        case 2:
            // FUN_003e7e0c: exact Float base 0x402df854, with the original
            // multiplication/addition order preserved.
            let e = Float(bitPattern: 0x402d_f854)
            let exponent = 6 * (-2 * x + 1)
            return 1 / (1 + powf(e, exponent))
        case 3:
            return 0
        case 5:
            return tableLookup(mode5Table, x: x)
        case 7:
            return tableLookup(mode7Table, x: x)
        default:
            return nil
        }
    }

    /// FUN_0038d5d0: scale by count-1, truncate, then interpolate adjacent
    /// UInt8 entries. Resource segments provide x in [0,1]; other domains are
    /// rejected rather than assigned an unverified clamp or integer conversion.
    private static func tableLookup(_ table: [UInt8], x: Float) -> Float? {
        let last = table.count - 1
        let scaled = x * Float(last)
        guard scaled >= 0, scaled <= Float(last) else { return nil }
        let index = Int(scaled)
        if index + 1 < table.count {
            let lower = Float(table[index]) / 255
            let upper = Float(table[index + 1]) / 255
            return lower + (scaled - Float(index)) * (upper - lower)
        }
        return Float(table[last]) / 255
    }

    /// Exact 100-byte table from FUN_0038cd18 (interpolation mode 5).
    private static let mode5Table: [UInt8] = [
        0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0,
        0, 0,
        1, 1, 1, 1, 2, 2,
        3, 3, 3, 3,
        4, 5, 5, 6,
        6, 7, 7, 8,
        8, 9, 10, 10,
        11, 12, 13, 13,
        14, 15, 16, 17,
        18, 19, 20, 21,
        22, 24, 25, 26,
        28, 29, 30, 32,
        33, 36, 37, 39,
        41, 43, 45, 46,
        49, 51, 53, 56,
        59, 61, 64, 67,
        70, 73, 76, 80,
        83, 87, 91, 95,
        100, 105, 109, 115,
        121, 126, 133, 140,
        147, 156, 166, 176,
        189, 203, 223, 255,
    ]

    /// Exact 100-byte table from FUN_0038d164 (interpolation mode 7).
    private static let mode7Table: [UInt8] = [
        0x00, 0x22, 0x36, 0x45, 0x51, 0x5C, 0x65, 0x6D,
        0x74, 0x7B, 0x82, 0x88, 0x8E, 0x93, 0x98, 0x9C,
        0xA1, 0xA5, 0xA9, 0xAC, 0xB0, 0xB3, 0xB7, 0xBA,
        0xBC, 0xBF, 0xC2, 0xC5, 0xC8, 0xCA, 0xCC, 0xCF,
        0xD1, 0xD3, 0xD5, 0xD7, 0xD8, 0xDB, 0xDC, 0xDE,
        0xE0, 0xE1, 0xE3, 0xE4, 0xE6, 0xE7, 0xE8, 0xEA,
        0xEB, 0xEC, 0xED, 0xEE, 0xEF, 0xF0, 0xF1, 0xF2,
        0xF3, 0xF4, 0xF4, 0xF5, 0xF5, 0xF6, 0xF7, 0xF8,
        0xF8, 0xF9, 0xF9, 0xF9, 0xFA, 0xFA, 0xFA, 0xFB,
        0xFC, 0xFC, 0xFD, 0xFD, 0xFD, 0xFD, 0xFE, 0xFE,
        0xFE, 0xFE, 0xFE, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
        0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
        0xFF, 0xFF, 0xFF, 0xFF,
    ]
}

public enum UIScreenAnimationOutput: Equatable, Sendable {
    case event(component: String, animation: String, command: String, arguments: [String])
    case completed(component: String, animation: String)
}

/// Deterministic, fixed-step friendly playback for the verified Classic subset.
/// A component has one replaceable active animation, matching the play(entry, true)
/// calls used by the Classic controller. Completed timelines remain sampleable.
public struct UIScreenAnimationPlayer: Sendable {
    public let content: UIScreenAnimationContent

    private struct Playback: Sendable {
        var animation: UIScreenAnimationContent.Animation
        var elapsedMS: Double
        var isPlaying: Bool
    }

    private var playbacks: [String: Playback] = [:]

    public init(data: Data) throws {
        let decoded = try JSONDecoder().decode(UIScreenAnimationContent.self, from: data)
        try Self.validate(decoded)
        content = decoded
    }

    public init(content: UIScreenAnimationContent) throws {
        try Self.validate(content)
        self.content = content
    }

    public mutating func reset() {
        playbacks.removeAll(keepingCapacity: false)
    }

    public func isPlaying(component: String, animation: String) -> Bool {
        guard let playback = playbacks[component], playback.animation.name == animation else {
            return false
        }
        return playback.isPlaying
    }

    /// FUN_0039834c: a matching active animation on the located component or any
    /// descendant makes the recursive query true. Missing animations are skipped.
    public func isPlayingRecursively(component componentName: String,
                                     animation animationName: String) throws -> Bool {
        try recursiveComponents(for: componentName).contains {
            isPlaying(component: $0.name, animation: animationName)
        }
    }

    /// FUN_00398154: play on this component first, then recursively visit children
    /// in resource order. A component without the requested animation is not an error.
    @discardableResult
    public mutating func playRecursively(component componentName: String,
                                         animation animationName: String) throws -> [UIScreenAnimationOutput] {
        var output: [UIScreenAnimationOutput] = []
        for component in try recursiveComponents(for: componentName)
        where component.animations.contains(where: { $0.name == animationName }) {
            output.append(contentsOf: try play(component: component.name,
                                               animation: animationName))
        }
        return output
    }

    /// Reconstructs the actual qualified component tree without inventing playback
    /// errors for unrelated or unreachable content. The located component must exist.
    private func recursiveComponents(for componentName: String)
        throws -> [UIScreenAnimationContent.Component] {
        let componentsByName = Dictionary(
            uniqueKeysWithValues: content.components.map { ($0.name, $0) })
        guard componentsByName[componentName] != nil else {
            throw UIScreenAnimationError.unknownComponent(componentName)
        }
        var children: [String: [String]] = [:]
        for component in content.components {
            // The generated UISF screen root has the empty qualified name.
            // Top-level components are its children; non-empty Classic queries
            // keep the same parent-first traversal as before.
            if component.name.isEmpty { continue }
            if let dot = component.name.lastIndex(of: ".") {
                children[String(component.name[..<dot]), default: []].append(component.name)
            } else {
                children["", default: []].append(component.name)
            }
        }
        var ordered: [UIScreenAnimationContent.Component] = []
        func visit(_ name: String) {
            guard let component = componentsByName[name] else { return }
            ordered.append(component)
            for child in children[name] ?? [] { visit(child) }
        }
        visit(componentName)
        return ordered
    }

    /// Starts at exactly 0 ms, emits 0 ms resource events immediately, and replaces
    /// any previous animation on that component. No implicit dt is consumed.
    @discardableResult
    public mutating func play(component componentName: String,
                              animation animationName: String) throws -> [UIScreenAnimationOutput] {
        let animation = try findAnimation(component: componentName, animation: animationName)
        playbacks[componentName] = Playback(animation: animation,
                                            elapsedMS: 0,
                                            isPlaying: true)
        var output = events(component: componentName, animation: animation, fromMS: -1, toMS: 0)
        if animation.endTimeMS == 0 {
            playbacks[componentName]?.isPlaying = false
            output.append(.completed(component: componentName, animation: animationName))
        }
        return output
    }

    /// Advances only when the caller advances the logical clock. Every crossed event
    /// is emitted once in timeline order; completion follows events at the same time.
    public mutating func advance(deltaSeconds: Float) throws -> [UIScreenAnimationOutput] {
        guard deltaSeconds.isFinite, deltaSeconds >= 0 else {
            throw UIScreenAnimationError.invalidDelta(deltaSeconds)
        }
        guard deltaSeconds > 0 else { return [] }

        var output: [UIScreenAnimationOutput] = []
        // Dictionary order is not a gameplay input. Sort for deterministic cross-component output.
        for componentName in playbacks.keys.sorted() {
            guard var playback = playbacks[componentName], playback.isPlaying else { continue }
            let previous = playback.elapsedMS
            let end = Double(playback.animation.endTimeMS)
            // Keep the multiplication in the same Float time domain as the logical clock.
            // Converting 0.35f to Double first produces 349.999994 ms and incorrectly
            // withholds an event keyed at exactly 350 ms until the following frame.
            let next = min(end, previous + Double(deltaSeconds * 1000))
            output.append(contentsOf: events(component: componentName,
                                             animation: playback.animation,
                                             fromMS: previous,
                                             toMS: next))
            playback.elapsedMS = next
            if next >= end {
                playback.isPlaying = false
                output.append(.completed(component: componentName,
                                         animation: playback.animation.name))
            }
            playbacks[componentName] = playback
        }
        return output
    }

    /// Samples the component's current animation at its current logical-clock time.
    /// A completed animation remains sampleable at its end frame; reset removes it.
    public func sampleActive(component componentName: String,
                             track trackName: String) throws -> [Float]? {
        guard let playback = playbacks[componentName] else { return nil }
        return try sample(component: componentName,
                          animation: playback.animation.name,
                          track: trackName,
                          atTimeMS: playback.elapsedMS)
    }

    public func sample(component componentName: String,
                       animation animationName: String,
                       track trackName: String,
                       atTimeMS timeMS: Double) throws -> [Float] {
        let animation = try findAnimation(component: componentName, animation: animationName)
        guard let track = animation.tracks.first(where: { $0.name == trackName }) else {
            throw UIScreenAnimationError.unknownTrack(component: componentName,
                                                      animation: animationName,
                                                      track: trackName)
        }
        guard let first = track.keyframes.first else { return [] }
        // FUN_003e5554/FUN_003e5750 advance while keyTime <= currentTime.
        // Consequently the last of several equal-time keys is the outgoing key.
        // Searching for the first strictly later key also avoids a zero-length
        // interpolation span at a duplicated timestamp.
        guard let nextIndex = track.keyframes.firstIndex(where: {
            timeMS < Double($0.timeMS)
        }) else {
            return track.keyframes.last?.values ?? []
        }
        guard nextIndex > 0 else { return first.values }
        let previous = track.keyframes[nextIndex - 1]
        let next = track.keyframes[nextIndex]
        if track.name == "enabled" { return previous.values }
        let span = Double(next.timeMS - previous.timeMS)
        let x = Float((timeMS - Double(previous.timeMS)) / span)
        // The outgoing keyframe's interpolation mode drives this segment,
        // not the destination key.
        guard let amount = UIScreenInterpolation.curve(
            mode: previous.interpolation, x: x) else {
            throw UIScreenAnimationError.unsupportedInterpolation(
                component: componentName, animation: animationName,
                track: trackName, timeMS: previous.timeMS)
        }
        if track.name == "colour" {
            // FUN_003104d8 keeps this exact Float operation order before quantizing
            // the animated RGBA channels back to bytes. Algebraically rearranging it
            // changes truncation at boundaries such as 0 -> 25 with amount = 0.4.
            return zip(previous.values, next.values).map { $1 - ($1 - $0) * (1 - amount) }
        }
        return zip(previous.values, next.values).map { $0 + ($1 - $0) * amount }
    }

    private func findAnimation(component componentName: String,
                               animation animationName: String) throws -> UIScreenAnimationContent.Animation {
        guard let component = content.components.first(where: { $0.name == componentName }) else {
            throw UIScreenAnimationError.unknownComponent(componentName)
        }
        guard let animation = component.animations.first(where: { $0.name == animationName }) else {
            throw UIScreenAnimationError.unknownAnimation(component: componentName, animation: animationName)
        }
        return animation
    }

    private func events(component componentName: String,
                        animation: UIScreenAnimationContent.Animation,
                        fromMS: Double,
                        toMS: Double) -> [UIScreenAnimationOutput] {
        var timed: [(timeMS: Int, order: Int, event: UIScreenAnimationContent.Event)] = []
        var order = 0
        for track in animation.tracks {
            for keyframe in track.keyframes where Double(keyframe.timeMS) > fromMS && Double(keyframe.timeMS) <= toMS {
                for event in keyframe.events {
                    timed.append((keyframe.timeMS, order, event))
                    order += 1
                }
            }
        }
        return timed.sorted { lhs, rhs in
            lhs.timeMS == rhs.timeMS ? lhs.order < rhs.order : lhs.timeMS < rhs.timeMS
        }.map {
            .event(component: componentName,
                   animation: animation.name,
                   command: $0.event.command,
                   arguments: $0.event.arguments)
        }
    }

    private static func expectedValueCount(for trackName: String) -> Int? {
        switch trackName {
        case "_Events_", "comment": return 0
        case "enabled", "movescale", "layer": return 1
        case "position", "scale", "rotation": return 3
        case "colour", "insideColour", "outsideColour": return 4
        case "texCoordPos": return 2
        default: return nil
        }
    }

    private static func validateParentIndices(
        _ components: [UIScreenAnimationContent.Component]) throws {
        for (index, component) in components.enumerated() {
            guard let parentIndex = component.parentIndex else { continue }
            guard parentIndex >= -1, parentIndex < components.count, parentIndex != index,
                  index != 0 || parentIndex == -1 else {
                throw UIScreenAnimationError.invalidParentIndex(
                    component: component.name, parentIndex: parentIndex)
            }
        }
    }

    private static func validateLayout(
        _ layout: UIScreenAnimationContent.Component.Layout,
        componentName: String) throws {
        func requireVector(_ values: [Float]?, count: Int, name: String) throws {
            guard let values else { return }
            guard values.count == count, values.allSatisfy({ $0.isFinite }) else {
                throw UIScreenAnimationError.invalidLayout(
                    component: componentName,
                    reason: "\(name) must have \(count) finite values")
            }
        }
        try requireVector(layout.position, count: 3, name: "position")
        try requireVector(layout.scale, count: 3, name: "scale")
        try requireVector(layout.origin, count: 3, name: "origin")
        try requireVector(layout.rotation, count: 3, name: "rotation")
        try requireVector(layout.texCoordPos, count: 2, name: "texCoordPos")
        try requireVector(layout.texCoordSize, count: 2, name: "texCoordSize")
        try requireVector(layout.colour, count: 4, name: "colour")
        for (name, value) in [("width", layout.width), ("height", layout.height),
                              ("fontSize", layout.fontSize)] {
            guard let value else { continue }
            guard value.isFinite, value >= 0 else {
                throw UIScreenAnimationError.invalidLayout(
                    component: componentName,
                    reason: "\(name) must be finite and non-negative")
            }
        }
    }

    private static func validate(_ content: UIScreenAnimationContent) throws {
        guard content.formatVersion == 1 else {
            throw UIScreenAnimationError.unsupportedFormat(content.formatVersion)
        }
        try validateParentIndices(content.components)
        var componentNames = Set<String>()
        for component in content.components {
            if let layout = component.layout {
                try validateLayout(layout, componentName: component.name)
            }
            guard componentNames.insert(component.name).inserted else {
                throw UIScreenAnimationError.duplicateComponent(component.name)
            }
            var animationNames = Set<String>()
            for animation in component.animations {
                guard animationNames.insert(animation.name).inserted else {
                    throw UIScreenAnimationError.duplicateAnimation(component: component.name,
                                                                     animation: animation.name)
                }
                guard animation.endTimeMS >= 0 else {
                    throw UIScreenAnimationError.invalidTimeline(component: component.name,
                                                                  animation: animation.name,
                                                                  reason: "negative endTimeMS")
                }
                for track in animation.tracks {
                    guard let expectedValues = expectedValueCount(for: track.name) else {
                        throw UIScreenAnimationError.invalidTimeline(
                            component: component.name,
                            animation: animation.name,
                            reason: "unknown track \(track.name)")
                    }
                    var previousTime = -1
                    for keyframe in track.keyframes {
                        guard keyframe.timeMS >= 0,
                              // Release UISF resources contain equal-time keys.
                              // Their order is significant: the last key at the
                              // current timestamp wins, so only regression is invalid.
                              keyframe.timeMS >= previousTime,
                              keyframe.timeMS <= animation.endTimeMS,
                              keyframe.values.allSatisfy({ $0.isFinite }) else {
                            throw UIScreenAnimationError.invalidTimeline(
                                component: component.name,
                                animation: animation.name,
                                reason: "unordered/out-of-range/non-finite keyframe in \(track.name)")
                        }
                        previousTime = keyframe.timeMS
                        guard keyframe.values.count == expectedValues else {
                            throw UIScreenAnimationError.invalidTimeline(
                                component: component.name,
                                animation: animation.name,
                                reason: "invalid value count in \(track.name)")
                        }
                        guard (track.name == "comment") == (keyframe.comment != nil) else {
                            throw UIScreenAnimationError.invalidTimeline(
                                component: component.name,
                                animation: animation.name,
                                reason: "invalid comment payload in \(track.name)")
                        }
                        for event in keyframe.events {
                            let validEvent = (event.command == "PlaySound" && event.arguments.count == 1)
                                || (event.command == "PlayAnimation" && event.arguments.count == 2)
                            guard validEvent else {
                                throw UIScreenAnimationError.invalidTimeline(
                                    component: component.name,
                                    animation: animation.name,
                                    reason: "unsupported resource event")
                            }
                        }
                        // FUN_003e5554 uses each keyframe's outgoing interpolation.
                        // Validate the first key too: it controls the first segment.
                        if track.name != "enabled", track.name != "_Events_", track.name != "comment",
                           !UIScreenInterpolation.isSupported(mode: keyframe.interpolation) {
                            throw UIScreenAnimationError.unsupportedInterpolation(
                                component: component.name,
                                animation: animation.name,
                                track: track.name,
                                timeMS: keyframe.timeMS)
                        }
                    }
                }
            }
        }
    }
}
