import Foundation

/// A deliberately small production projection of the release UISF timeline.
/// The JSON is generated from inGameClassic.uiscreen; no timing is duplicated in Swift.
public struct UIScreenAnimationContent: Codable, Equatable, Sendable {
    public struct Source: Codable, Equatable, Sendable {
        public var file: String
        public var sha256: String
    }

    public struct Component: Codable, Equatable, Sendable {
        public var name: String
        public var animations: [Animation]
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
            let next = min(end, previous + Double(deltaSeconds) * 1000)
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
        guard timeMS > Double(first.timeMS) else { return first.values }
        for index in 1..<track.keyframes.count {
            let next = track.keyframes[index]
            if timeMS >= Double(next.timeMS) { continue }
            let previous = track.keyframes[index - 1]
            if track.name == "enabled" { return previous.values }
            let span = Double(next.timeMS - previous.timeMS)
            let amount = Float((timeMS - Double(previous.timeMS)) / span)
            return zip(previous.values, next.values).map { $0 + ($1 - $0) * amount }
        }
        return track.keyframes.last?.values ?? []
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

    private static func validate(_ content: UIScreenAnimationContent) throws {
        guard content.formatVersion == 1 else {
            throw UIScreenAnimationError.unsupportedFormat(content.formatVersion)
        }
        var componentNames = Set<String>()
        for component in content.components {
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
                    var previousTime = -1
                    for (index, keyframe) in track.keyframes.enumerated() {
                        guard keyframe.timeMS >= 0,
                              keyframe.timeMS > previousTime,
                              keyframe.timeMS <= animation.endTimeMS,
                              keyframe.values.allSatisfy({ $0.isFinite }) else {
                            throw UIScreenAnimationError.invalidTimeline(
                                component: component.name,
                                animation: animation.name,
                                reason: "unordered/out-of-range/non-finite keyframe in \(track.name)")
                        }
                        previousTime = keyframe.timeMS
                        let expectedValues = track.name == "_Events_" ? 0 :
                            (track.name == "enabled" || track.name == "movescale" ? 1 :
                                (track.name == "colour" ? 4 : 3))
                        guard keyframe.values.count == expectedValues else {
                            throw UIScreenAnimationError.invalidTimeline(
                                component: component.name,
                                animation: animation.name,
                                reason: "invalid value count in \(track.name)")
                        }
                        for event in keyframe.events {
                            guard event.command == "PlaySound", event.arguments.count == 1 else {
                                throw UIScreenAnimationError.invalidTimeline(
                                    component: component.name,
                                    animation: animation.name,
                                    reason: "unsupported resource event")
                            }
                        }
                        // In this verified subset, interpolation=0 on the destination key
                        // is the linear segment. Other segment modes are not reconstructed.
                        if index > 0, track.name != "enabled", track.name != "_Events_",
                           keyframe.interpolation != 0 {
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
