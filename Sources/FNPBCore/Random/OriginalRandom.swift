import Foundation

/// 发售版 64 位 LCG 随机源。
/// Mach-O：FUN_00039b24、FUN_00039a64、FUN_00062be4、FUN_00301080。
/// 状态先推进再取高 32 位；0 是合法状态，快照恢复时不重映射种子。
public final class OriginalLCGRandom: RandomSource {
    private static let multiplier: UInt64 = 0x5d58_8b65_6c07_8965
    private static let increment: UInt64 = 0x0000_0000_0026_9ec3
    private static let floatQuantizer: UInt32 = 0x0007_ffff

    private var state: UInt64

    public init(seed: UInt64 = 0) {
        state = seed
    }

    private func advance() -> UInt32 {
        state = state &* Self.multiplier &+ Self.increment
        return UInt32(truncatingIfNeeded: state >> 32)
    }

    public func nextInt(_ upperBound: Int32) -> Int32 {
        let high = advance()
        guard upperBound > 0 else {
            return Int32(bitPattern: high)
        }
        let scaled = (UInt64(high) * UInt64(UInt32(bitPattern: upperBound))) >> 32
        return Int32(bitPattern: UInt32(truncatingIfNeeded: scaled))
    }

    public func nextFloat() -> Float {
        let high = advance()
        let q = UInt32(truncatingIfNeeded:
            (UInt64(high) * UInt64(Self.floatQuantizer)) >> 32)
        return Float(q) / Float(Self.floatQuantizer)
    }

    public func snapshot() -> UInt64 {
        state
    }

    public func restore(_ s: UInt64) {
        state = s
    }
}
