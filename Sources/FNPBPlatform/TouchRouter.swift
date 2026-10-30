import UIKit
import QuartzCore
import simd

// ============================================================================
// TouchRouter — UIKit 触摸 → 世界坐标（蓝图 S7）
//
// ⚠️ 协议归属说明：`TouchRouting` **不在** FNPBCore（GameWorld.swift 只声明了
//    SliceTesting / ComboTracking / ScoreDispatching / StatsRecording /
//    WaveDirecting / AudioPlaying / EffectEmitting / RandomSource）。
//    故本协议定义在 FNPBPlatform 内，属于平台层私有契约；若后续蓝图把触点
//    纳入 Core，需整体上移并去掉这里的重复定义。
//
// 输出语义（对应 macho 主循环 game+0x10/+0x14/+0x18 = 触摸位置）：
//   TouchSample.position 为**世界坐标** SIMD3<Float>，由调用方写入 GameState。
//   本文件**不**直接改 GameState —— GameState.swift 的属性名不在共享上下文中，
//   臆造字段名会导致编译失败，接线点留在 App 层 TODO。
// ============================================================================

// MARK: - 数据模型

public enum TouchPhase: Int, Sendable {
    case began
    case moved
    case ended
    case cancelled
}

/// 单指单次事件。hostTime 与 FrameStamp.hostTime 同基准（CACurrentMediaTime × 1e9）。
public struct TouchSample: Sendable, Equatable {
    public var position: SIMD3<Float>
    public var hostTime: UInt64
    public var phase: TouchPhase
    /// 同一次触摸内稳定；跨触摸不保证唯一（原版无多指 ID 概念）
    public var pointerID: Int

    public init(position: SIMD3<Float>, hostTime: UInt64, phase: TouchPhase, pointerID: Int) {
        self.position = position
        self.hostTime = hostTime
        self.phase = phase
        self.pointerID = pointerID
    }
}

// MARK: - 坐标换算（依赖注入）

/// 视图像素 → 世界坐标。
///
/// 原版把 UITouch 的 location 写入 game+0x10/+0x14/+0x18，再由命中测试
/// （macho FUN_00017d74）与该点做球体/线段相交。该点在原版究竟是「像素坐标」
/// 还是「已缩放到世界单位」，二进制里被 SIMD 寄存器传递遮蔽。
/// 因此这里把「逻辑尺寸」和「每逻辑单位对应多少世界单位」都做成注入参数：
/// **默认 1:1**，数值闭合后只改 App 层注入值，不动本文件。
public struct TouchCoordinateMapper {

    /// 逻辑分辨率（世界坐标系的可见范围），由渲染层 RenderSurface.logicalSize 提供
    public var logicalSize: @MainActor () -> SIMD2<Float>

    /// 逻辑单位 → 世界单位。碰撞半径归一化常量 15.0（§1.2 步骤 2）作用于世界单位，
    /// 若真机打点发现半径不符，先调这个系数。默认 1.0 [待验证]
    public var worldUnitsPerLogicalUnit: Float

    public init(logicalSize: @escaping @MainActor () -> SIMD2<Float>,
                worldUnitsPerLogicalUnit: Float = 1.0) {
        self.logicalSize = logicalSize
        self.worldUnitsPerLogicalUnit = worldUnitsPerLogicalUnit
    }

    /// 世界坐标约定：原点屏幕中心，X 向右、Y 向上、Z = 0（与 GLES→Metal 的 NDC 同向）。
    /// UIKit 的 y 向下，故翻转 y。安全区裁剪由渲染层负责（本层不夹取）。
    public func worldPoint(forViewPoint point: CGPoint, in viewSize: CGSize) -> SIMD3<Float> {
        guard viewSize.width > 0, viewSize.height > 0 else { return .zero }
        let logical = logicalSize()
        guard logical.x > 0, logical.y > 0 else { return .zero }

        let nx = Float(point.x / viewSize.width)      // [0, 1]
        let ny = Float(point.y / viewSize.height)     // [0, 1]，y 向下
        let x = (nx - 0.5) * logical.x * worldUnitsPerLogicalUnit
        let y = (0.5 - ny) * logical.y * worldUnitsPerLogicalUnit
        return SIMD3<Float>(x, y, 0)
    }
}

// MARK: - 协议

@MainActor
public protocol TouchRouting: AnyObject {
    var onTouch: ((TouchSample) -> Void)? { get set }
    /// 供 SwiftUI 的 UIViewRepresentable 挂载
    var captureView: UIView { get }
    /// 暂停采集（后台 / 过场动画期间）
    func setEnabled(_ enabled: Bool)
}

// MARK: - 触摸采集视图

/// 只做事件转发的透明 UIView。
/// 注意：`isMultipleTouchEnabled = true` 是必须的——原版只处理单指，但多指同时按下
/// 会产生两个 began 事件，路由层按 pointerID 区分，逻辑层只认最后一个（见 App 层 TODO）。
final class TouchCaptureView: UIView {

    weak var router: TouchRouter?

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }

    private func configure() {
        isMultipleTouchEnabled = true
        isUserInteractionEnabled = true
        isOpaque = false
        backgroundColor = .clear
        // 不参与 Auto Layout 体系（由 UIViewRepresentable 铺满父视图）
        autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        router?.deliver(touches, phase: .began, view: self)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        router?.deliver(touches, phase: .moved, view: self)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        router?.deliver(touches, phase: .ended, view: self)
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        router?.deliver(touches, phase: .cancelled, view: self)
    }
}

// MARK: - 路由

@MainActor
public final class TouchRouter: TouchRouting {

    public var onTouch: ((TouchSample) -> Void)?

    public var mapper: TouchCoordinateMapper

    /// 是否展开 event.coalescedTouches（ProMotion 下可获得 120Hz 采样）。
    /// 默认关闭：原版 slash 轨迹采样间隔 0.05s（20Hz，§1.1），过密采样只会放大
    /// 轨迹缓冲（容量 8）的写入频率，属行为偏差。需要高精度笔迹时再打开。
    public var expandsCoalescedTouches: Bool = false

    public private(set) var isEnabled: Bool = true

    public lazy var captureView: UIView = {
        let view = TouchCaptureView(frame: .zero)
        view.router = self
        return view
    }()

    public init(mapper: TouchCoordinateMapper) {
        self.mapper = mapper
    }

    public func setEnabled(_ enabled: Bool) {
        isEnabled = enabled
    }

    // MARK: 事件入口（由 TouchCaptureView 调用）

    func deliver(_ touches: Set<UITouch>, phase: TouchPhase, view: UIView) {
        guard isEnabled, let onTouch else { return }
        let viewSize = view.bounds.size
        guard viewSize.width > 0, viewSize.height > 0 else { return }

        for touch in touches {
            if expandsCoalescedTouches, let event = touch.gestureRecognizers?.first?.view?.window {
                _ = event // 占位：coalescedTouches 需要 UIEvent，本类未持有，见下行注释
            }
            let sample = makeSample(from: touch, phase: phase, view: view, viewSize: viewSize)
            onTouch(sample)
        }
    }

    private func makeSample(from touch: UITouch, phase: TouchPhase,
                            view: UIView, viewSize: CGSize) -> TouchSample {
        TouchSample(
            position: mapper.worldPoint(forViewPoint: touch.location(in: view), in: viewSize),
            hostTime: Self.hostTime(from: touch.timestamp),
            phase: phase,
            pointerID: ObjectIdentifier(touch).hashValue
        )
    }

    /// UITouch.timestamp 与 CACurrentMediaTime 同基准（自系统启动的秒数），
    /// 与 DisplayLinkDriver 的 FrameStamp.hostTime 可直接比较（R8 要求逻辑计时
    /// 一律吃 dt，不得直接用 hostTime 比较——此值仅供诊断/输入重放）。
    static func hostTime(from seconds: TimeInterval) -> UInt64 {
        guard seconds.isFinite, seconds > 0 else { return 0 }
        return UInt64(seconds * 1_000_000_000)
    }
}