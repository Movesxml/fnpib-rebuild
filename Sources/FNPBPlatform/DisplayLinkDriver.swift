import Foundation
import QuartzCore
import FNPBCore

// ============================================================================
// DisplayLinkDriver — FrameDriving 的 CADisplayLink 实现（蓝图 §3 S1 / R7、R8）
//
// 关键约束与依据：
//  · CADisplayLink 必须在主线程创建与回调，故整体 @MainActor（与 FNPBCore 的
//    FrameDriving 协议隔离一致）。
//  · 120Hz 双保险：
//      1) 代码侧 CAFrameRateRange(minimum: 60, maximum: 120, preferred: 120)
//      2) Info.plist 的 CADisableMinimumFrameDurationOnPhone = YES
//    —— iPhone 上缺 2) 时系统会把 CADisplayLink 钳在 60Hz，只改代码无效。
//  · dt 语义：FrameStamp.delta = 本帧 timestamp - 上帧 timestamp，**首帧为 0**，
//    与 FrameStamp.isFirstFrame / GameWorld.prime() 的契约一致（R7）。
//    不用 targetTimestamp - timestamp，是为了让 delta 表示「已经过的时间」而不是
//    「预测的下一帧间隔」——固定步长下后者会系统性超前半帧。
//  · 宿主防御：后台切回 / 断点 / 系统卡顿会产出巨帧，统一上限 0.25s
//    （与 FrameStamp.clampedDelta 的默认 maxFrameDelta 一致），积压由 FixedStepDriver
//    的 maxSubsteps 丢弃。
// ============================================================================

@MainActor
public final class DisplayLinkDriver: NSObject, FrameDriving {

    // MARK: 公共常量

    /// 目标上限：ProMotion 最高 120Hz（iPad Pro 2018+ / iPhone 13 Pro+）
    public static let maximumFrameRate: Float = 120
    public static let minimumFrameRate: Float = 1

    // MARK: FrameDriving

    public var onFrame: ((FrameStamp) -> Void)?

    /// 实测帧率（由 link.duration 反推）；未启动或 duration 无效时为 0
    public private(set) var actualFrameRate: Float = 0

    // MARK: 状态

    /// 当前请求的刷新率（用于 start 时重建 range 与 FrameStamp.targetFPS 兜底）
    public private(set) var preferredFrameRate: Float = DisplayLinkDriver.maximumFrameRate

    public var isRunning: Bool { displayLink != nil }

    private var displayLink: CADisplayLink?
    private var lastTimestamp: CFTimeInterval?
    private(set) var frameIndex: UInt64 = 0

    // 注：不实现 deinit 做 invalidate —— @MainActor 类的 deinit 在 Swift 6 语言模式下
    // 属于 nonisolated 上下文，访问 CADisplayLink 会触发并发检查。
    // 由持有者（GameHost）在 scenePhase 变化时调用 stop()；App 生命周期内 driver 唯一。

    public override init() {
        super.init()
    }

    // MARK: - 生命周期

    @discardableResult
    public func start() -> Bool {
        guard displayLink == nil else { return true }

        let link = CADisplayLink(target: self, selector: #selector(handleFrame(_:)))
        link.preferredFrameRateRange = Self.frameRateRange(for: preferredFrameRate)
        link.add(to: .main, forMode: .common)

        displayLink = link
        lastTimestamp = nil          // 首帧 delta == 0
        frameIndex = 0
        actualFrameRate = 0
        return true
    }

    public func stop() {
        displayLink?.invalidate()
        displayLink = nil
        lastTimestamp = nil
        actualFrameRate = 0
    }

    /// 回到前台时清零时间基准，避免把后台停留时长当成一帧
    public func resetTimeBase() {
        lastTimestamp = nil
    }

    // MARK: - 帧率

    public func setPreferredFrameRate(_ fps: Float) {
        let clamped = Self.clampedFrameRate(fps)
        preferredFrameRate = clamped
        displayLink?.preferredFrameRateRange = Self.frameRateRange(for: clamped)
    }

    /// 120Hz 上限映射：minimum 取 min(60, maximum)，preferred = maximum。
    /// - 120 → (60, 120, 120)  ProMotion 全速
    /// - 60  → (60, 60, 60)    普通屏 / 省电
    /// - 30  → (30, 30, 30)    低功耗
    /// [待验证] CADisplayLink 在可变刷新率屏上对「非屏刷新率整除值」的实际取整策略，
    /// 属系统行为，真机 Frida/Instruments 才能确认；此处只保证 range 合法。
    public static func frameRateRange(for fps: Float) -> CAFrameRateRange {
        let maximum = clampedFrameRate(fps)
        let minimum = min(60, maximum)
        return CAFrameRateRange(minimum: minimum, maximum: maximum, preferred: maximum)
    }

    public static func clampedFrameRate(_ fps: Float) -> Float {
        guard fps.isFinite, fps > 0 else { return 60 }
        return min(max(fps.rounded(), minimumFrameRate), maximumFrameRate)
    }

    // MARK: - 回调

    @objc
    private func handleFrame(_ link: CADisplayLink) {
        let timestamp = link.timestamp        // 本帧显示时间（CACurrentMediaTime 基准）

        var delta: Float = 0
        if let previous = lastTimestamp {
            delta = Float(timestamp - previous)
        }
        lastTimestamp = timestamp

        // 宿主环境防御（非反编译值）：NaN / 负值 / 巨帧
        if !delta.isFinite || delta < 0 {
            delta = 0
        } else {
            delta = min(delta, 0.25)
        }

        actualFrameRate = Self.measuredFrameRate(of: link)
        frameIndex &+= 1

        let stamp = FrameStamp(
            hostTime: Self.nanoseconds(from: timestamp),
            delta: delta,
            targetFPS: actualFrameRate > 0 ? actualFrameRate : preferredFrameRate
        )
        onFrame?(stamp)
    }

    // MARK: - 工具

    /// CADisplayLink 没有 actualFrameRate 属性（那是 Qt/QML 的 API，此前属幻觉），
    /// 实际帧率只能从 duration 反推：1 / duration。duration 在帧率被系统钳制后
    /// 反映真实间隔，故作为 targetFPS 的兜底来源。
    private static func measuredFrameRate(of link: CADisplayLink) -> Float {
        let duration = link.duration
        return duration > 0 ? Float(1.0 / duration) : 0
    }

    /// 与 UITouch.timestamp / CACurrentMediaTime 同基准，供 TouchRouter 交叉比对
    private static func nanoseconds(from seconds: CFTimeInterval) -> UInt64 {
        guard seconds.isFinite, seconds > 0 else { return 0 }
        return UInt64(seconds * 1_000_000_000)
    }
}