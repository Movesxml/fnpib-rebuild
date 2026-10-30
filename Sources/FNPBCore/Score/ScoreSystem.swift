//
//  ScoreSystem.swift
//  FNPBCore
//
//  ScoreDispatching 协议实现（T-013）
//
//  来源：core_logic_notes §3.2（macho FUN_0001cb08 计分事件分发器）[macho H]
//
//  【职责边界】本类不含基础分公式——基础分在命中时写入 GameState.lastSliceScore（+0x110），
//  §3.2 已明确说明；本类只做「事件序号 → 延迟回调出队 → 总分累加 → 溢出保护」。
//

import Foundation

public final class ScoreSystem: ScoreDispatching {

    // MARK: - 延迟回调（UI 滚动计分）

    /// 回调节点：`delay == 0` 立即触发；
    /// 否则在 `mode == 1` 且事件序号超过 delay 后触发（§3.2 步骤 2）。
    public struct DelayedCallback {
        public let delay: Int32
        public let handler: (_ score: Int32, _ comboType: Int32) -> Void

        public init(delay: Int32,
                    handler: @escaping (_ score: Int32, _ comboType: Int32) -> Void) {
            self.delay = delay
            self.handler = handler
        }
    }

    /// 原 `DAT_005576f0` 全局事件序号。
    private var sequence: Int32 = 0

    /// 原 `DAT_005f8dd4` 总分。用 Int64 累计以避开 Swift Int32 溢出 trap，
    /// 对外暴露时按 32 位回绕截断（原 C 的 int 语义）。
    private var accumulated: Int64 = 0

    private var callbacks: [DelayedCallback] = []

    public init() {}

    public var total: Int32 { Int32(truncatingIfNeeded: accumulated) }

    /// 注册延迟回调（原 `DAT_005576e8` 回调链）。
    /// 非协议方法——协议签名由 GameWorld.swift 固定，不得扩展。
    public func schedule(delay: Int32,
                         handler: @escaping (_ score: Int32, _ comboType: Int32) -> Void) {
        callbacks.append(DelayedCallback(delay: delay, handler: handler))
    }

    // MARK: - ScoreDispatching

    @discardableResult
    public func dispatch(score: Int32, comboType: Int32, isScoring: Bool, mode: Int32) -> Int32 {
        // 1. 全局事件序号 +1（原 DAT_005576f0 += 1；&+= 保留 32 位回绕语义）
        sequence &+= 1

        // 2. 遍历回调链：delay==0 立即触发；或 delay < seq 且 mode==1 时出队触发
        //    ⚠️ [M] 推断：触发的节点从队列移除，未触发的保留（原文 FUN_0001d888「清链」语义未完全闭合）
        if !callbacks.isEmpty {
            var pending: [DelayedCallback] = []
            pending.reserveCapacity(callbacks.count)
            for callback in callbacks {
                if callback.delay == 0 || (callback.delay < sequence && mode == 1) {
                    callback.handler(score, comboType)
                } else {
                    pending.append(callback)
                }
            }
            callbacks = pending
        }

        // 3. 总分累加（原 DAT_005f8dd4 += 本次得分）
        //    单次 score 为 Int32，累计 43 亿次才会触及 Int64 上限，实际不可达。
        accumulated += Int64(score)

        // 4. 溢出保护（§3.2 步骤 4）：
        //    mode==4 → 不做归零；否则 total > 0x7fffffff 且 mode!=5 → 归零
        if mode != Constants.Scoring.overflowSkippedMode {
            if accumulated > Int64(Constants.Scoring.intMax)
                && mode != Constants.Scoring.overflowKeepMode {
                accumulated = 0
            }
        }

        // 注：§3.2 步骤 5/6 的 "all" / "upside_down_points" / "score_without_beans" 统计
        //     与成就回调不在本类职责内，由 GameWorld 步骤 10 消费 dispatch 返回值后上报。
        return total
    }

    public func reset() {
        accumulated = 0
        callbacks.removeAll()
        // [M] 推断：新会话从 0 起算；原全局序号是否清零未知
        sequence = 0
    }
}