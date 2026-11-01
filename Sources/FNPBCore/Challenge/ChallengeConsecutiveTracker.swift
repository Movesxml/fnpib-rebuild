import Foundation

/// 发售版 `DAT_005d4ce0` 的值语义重建：最近切果玩家与连续数量的单一槽位。
/// 它不是 combo，也不由触摸结束或挥刀窗口清零。
public struct ChallengeConsecutiveTracker: Equatable, Sendable {
    public private(set) var lastPlayerIndex: Int32 = 0
    public private(set) var count: Int32 = 0

    public init() {}

    /// FUN_00010bec：同玩家执行裸 32 位加法，换玩家则从 1 开始。
    @discardableResult
    public mutating func recordSlice(playerIndex: Int32 = 0) -> Int32 {
        if lastPlayerIndex == playerIndex {
            count &+= 1
        } else {
            lastPlayerIndex = playerIndex
            count = 1
        }
        return count
    }

    /// 新局边界清零；不添加原版未证实的回合内清零条件。
    public mutating func reset() {
        lastPlayerIndex = 0
        count = 0
    }
}
