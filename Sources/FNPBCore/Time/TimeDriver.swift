import Foundation

// ============================================================================
// 时间与主循环（蓝图 §3 S1 / 兼容项 R7、R8）
//   CADisplayLink(最高 120Hz) → FrameDriving → FrameStamp(dt) → FixedStepDriver(1/60)
// 关键约束：
//   · 所有逻辑计时（combo 窗口、slash 轨迹、freeze）只吃逻辑 dt，禁止用 hostTime 直接比较（R8）
//   · 逻辑帧固定 60Hz，渲染帧跟随屏幕；渲染用 advance 返回的 alpha 做位置插值
// ============================================================================

// MARK: - 帧戳
/// 单帧输入。`delta` 为秒；首帧为 0（原 macho/exe 一致，T-006 订正）。
public struct FrameStamp: Sendable, Equatable {
    public var hostTime: UInt64          // CACurrentMediaTime 纳秒级时间戳（调用方换算）
    public var delta: Float              // 秒；首帧 0
    public var targetFPS: Float          // 120 / 80 / 60 / 30

    public init(hostTime: UInt64 = 0, delta: Float = 0, targetFPS: Float = 60) {
        self.hostTime = hostTime
        self.delta = delta
        self.targetFPS = targetFPS
    }

    public static let zero = FrameStamp()

    /// 防御性规整（**非反编译值**，仅为宿主环境鲁棒性）：
    /// 丢帧/断点/后台切回会产生巨帧或 NaN，交给 FixedStepDriver 的 maxSubsteps 丢弃积压，
    /// 但先在此上限，避免 Float 累加精度损失。
    public func clampedDelta(maxFrameDelta: Float = 0.25) -> Float {
        guard delta.isFinite, delta > 0 else { return 0 }
        return min(delta, maxFrameDelta)
    }

    /// 是否逻辑首帧（dt==0）：调用方据此触发 GameWorld.prime()（R7）
    public var isFirstFrame: Bool { delta == 0 }
}

// MARK: - 帧驱动
/// CADisplayLink 必须主线程创建与回调（UIKit/QuartzCore 约束），故整个协议 @MainActor 隔离。
@MainActor
public protocol FrameDriving: AnyObject {
    /// 每帧回调；闭包在 MainActor 上下文调用，无需 @Sendable
    var onFrame: ((FrameStamp) -> Void)? { get set }

    /// 实际刷新率；0 表示未知/未启动（CADisplayLink.actualFrameRate 语义）
    var actualFrameRate: Float { get }

    /// 启动显示链路；返回 false 表示 CADisplayLink 创建失败
    @discardableResult func start() -> Bool

    func stop()

    /// 120Hz 上限；内部映射 CAFrameRateRange(min:60, max:fps, preferred:fps) [待验证 具体映射]
    func setPreferredFrameRate(_ fps: Float)
}

// MARK: - 固定步长驱动器
/// 逻辑帧固定步长累加器。
///
/// 非 Sendable：持有可变状态，**必须由单一 owner（GameLoop / MainActor）独占持有**，
/// 不要跨线程共享或放进 Sendable 结构体。
///
/// 用法：
/// ```swift
/// let alpha = driver.advance(delta: stamp.clampedDelta()) { step in
///     world.tick(dt: step, state: &state, world: &store, services: services)
/// }
/// // renderer.submit(interpolation: alpha)
/// ```
public final class FixedStepDriver {

    /// 逻辑步长（秒）；默认 1/60
    public let step: Float
    /// 单帧最多推进的逻辑步数（防 spiral of death）
    public let maxSubsteps: Int

    private var accumulator: Float = 0
    /// 因超过 maxSubsteps 被丢弃的累计秒数（诊断用，不参与逻辑）
    public private(set) var droppedSeconds: Float = 0

    public init(step: Float = 1.0 / 60.0, maxSubsteps: Int = 4) {
        precondition(step.isFinite && step > 0, "FixedStepDriver: step must be finite and > 0")
        precondition(maxSubsteps >= 1, "FixedStepDriver: maxSubsteps must be >= 1")
        self.step = step
        self.maxSubsteps = maxSubsteps
    }

    /// 未消费的累计时间（秒）
    public var pendingSeconds: Float { accumulator }

    /// 渲染插值系数 ∈ [0,1)；上界取 1-ulp，保证永不等于 1.0（否则插值会提前一帧到位）
    public var alpha: Float {
        let raw = accumulator / step
        guard raw.isFinite else { return 0 }
        let clamped = min(max(raw, 0), 1 - Float.ulpOfOne)
        return clamped
    }

    /// 推进逻辑：调用 body 若干次（每次一个固定 step），返回渲染插值 alpha。
    /// - 丢弃超过 maxSubsteps 的**整步**积压（保留不足一步的相位余量），避免卡顿后爆发式追帧；
    /// - body 内不得再次调用 advance（重入会破坏累加器不变量）。
    @discardableResult
    public func advance(delta: Float, _ body: (_ step: Float) -> Void) -> Float {
        let dt = (delta.isFinite && delta > 0) ? delta : 0
        accumulator += dt

        var substeps = 0
        while accumulator >= step {
            if substeps >= maxSubsteps {
                // 防死循环：把整步积压丢弃，仅留相位余量（< step）
                let remainder = accumulator.truncatingRemainder(dividingBy: step)
                droppedSeconds += accumulator - remainder
                accumulator = remainder
                break
            }
            body(step)
            accumulator -= step
            substeps += 1
        }
        return alpha
    }

    /// 重置累加器；`keepingPhase` 为 true 时保留不足一步的余量（用于暂停/恢复）
    public func reset(keepingPhase: Bool = false) {
        accumulator = keepingPhase ? accumulator.truncatingRemainder(dividingBy: step) : 0
        droppedSeconds = 0
    }
}