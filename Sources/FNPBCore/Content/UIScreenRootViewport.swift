import Foundation

/// Verified UIScreen root-viewport scale modes from FUN_003ec940 / FUN_003ec8bc.
/// Raw-value construction is intentionally open so unknown values follow the
/// original switch default branch instead of being coerced to KeepAspect.
public struct UIScreenViewportScaleMode: RawRepresentable, Equatable, Sendable {
    public let rawValue: Int

    public init(rawValue: Int) {
        self.rawValue = rawValue
    }

    public static let none = Self(rawValue: 0)
    public static let keepAspect = Self(rawValue: 1)
    public static let scaleX = Self(rawValue: 2)
    public static let scaleY = Self(rawValue: 3)
    public static let scale = Self(rawValue: 4)

    public static let verifiedModes: [Self] = [
        .none, .keepAspect, .scaleX, .scaleY, .scale,
    ]

    public var isVerified: Bool {
        (0...4).contains(rawValue)
    }
}

public enum UIScreenRootViewportError: Error, Equatable, Sendable {
    case invalidDimension(name: String, value: Float)
}

/// Root viewport for the release UIScreen projection.
public struct UIScreenRootViewport: Equatable, Sendable {
    public static let iPhoneDesignWidth: Float = 480
    public static let iPhoneDesignHeight: Float = 320

    public let deviceWidth: Float
    public let deviceHeight: Float
    public let designWidth: Float
    public let designHeight: Float
    public let scaleToViewportMode: UIScreenViewportScaleMode

    public init(
        deviceWidth: Float,
        deviceHeight: Float,
        designWidth: Float = UIScreenRootViewport.iPhoneDesignWidth,
        designHeight: Float = UIScreenRootViewport.iPhoneDesignHeight,
        scaleToViewportMode: UIScreenViewportScaleMode = .scale
    ) throws {
        try Self.validateDimension(deviceWidth, name: "deviceWidth")
        try Self.validateDimension(deviceHeight, name: "deviceHeight")
        try Self.validateDimension(designWidth, name: "designWidth")
        try Self.validateDimension(designHeight, name: "designHeight")

        self.deviceWidth = deviceWidth
        self.deviceHeight = deviceHeight
        self.designWidth = designWidth
        self.designHeight = designHeight
        self.scaleToViewportMode = scaleToViewportMode
    }

    public var xRatio: Float {
        deviceWidth / designWidth
    }

    public var yRatio: Float {
        deviceHeight / designHeight
    }

    /// FUN_003cd778. No cap, centering or letterboxing is applied here.
    public var rootScale: UIScreenPoint3 {
        let xRatio = self.xRatio
        let yRatio = self.yRatio

        switch scaleToViewportMode.rawValue {
        case 0:
            return UIScreenPoint3(x: 1, y: 1, z: 1)
        case 1:
            let aspect = min(xRatio, yRatio)
            return UIScreenPoint3(x: aspect, y: aspect, z: 1)
        case 2:
            return UIScreenPoint3(x: xRatio, y: xRatio, z: 1)
        case 3:
            return UIScreenPoint3(x: yRatio, y: yRatio, z: 1)
        case 4:
            return UIScreenPoint3(x: xRatio, y: yRatio, z: 1)
        default:
            return UIScreenPoint3(x: xRatio, y: yRatio, z: 1)
        }
    }

    public var rootScaleMatrix: UIScreenMatrix4 {
        UIScreenMatrix4.scale(rootScale)
    }

    private static func validateDimension(_ value: Float, name: String) throws {
        guard value.isFinite, value > 0 else {
            throw UIScreenRootViewportError.invalidDimension(name: name, value: value)
        }
    }
}
