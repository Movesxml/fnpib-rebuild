import Foundation
import AVFoundation
import FNPBCore

// ============================================================================
// AudioEngine — AudioPlaying 的 AVAudioPlayer 池实现（蓝图 S7）
//
// 选型说明：任务卡允许 AVAudioEngine 或 AVAudioPlayer。此处选 AVAudioPlayer 池：
//  · 原版音效是「一次性短促触发」（macho §5.2 "Bomb-explode" 音量 1.0），无
//    混音总线/实时参数调制需求；
//  · AVAudioPlayerNode 的 scheduleBuffer/stop 状态机在「同一 key 高频重复触发」时
//    容易产生截断与排队，玩家感受是音效迟滞；
//  · 池化 AVAudioPlayer 的行为可预测（stop→currentTime=0→play），并发上限显式可控。
//  代价：首次 play 有文件 IO，故提供 preload(_:)，资产管线落盘后在启动期预热。
//
// 并发：本类**不是** @MainActor（AudioPlaying 协议是非隔离的，标 @MainActor 会
// 产生 Swift 6 隔离不匹配）。与 GameServices 同约束：由 GameLoop / MainActor 独占调用，
// 不得跨线程共享。AVAudioPlayer 的创建与播放均在调用线程完成。
// ============================================================================

public final class AudioEngine: AudioPlaying {

    // MARK: 配置

    public struct Configuration {
        public var masterVolume: Float
        public var maxSimultaneousVoices: Int
        public var voicesPerKey: Int
        public var fileExtensions: [String]
        public var configuresAudioSession: Bool
        /// key → 文件 URL。默认 nil 表示走 Bundle.main 查找（见 resolveURL）
        public var resourceURL: ((String) -> URL?)?

        public init(masterVolume: Float = 1.0,
                    maxSimultaneousVoices: Int = 8,
                    voicesPerKey: Int = 2,
                    fileExtensions: [String] = ["caf", "wav", "aiff", "aif", "mp3", "m4a"],
                    configuresAudioSession: Bool = true,
                    resourceURL: ((String) -> URL?)? = nil) {
            self.masterVolume = masterVolume
            self.maxSimultaneousVoices = max(1, maxSimultaneousVoices)
            self.voicesPerKey = max(1, voicesPerKey)
            self.fileExtensions = fileExtensions
            self.configuresAudioSession = configuresAudioSession
            self.resourceURL = resourceURL
        }
    }

    public enum AudioEngineError: Error, Equatable {
        case playerCreationFailed(key: String)
        case playFailed(key: String)
        case sessionConfigurationFailed(String)
    }

    // MARK: 状态

    public var configuration: Configuration {
        didSet {
            configuration.maxSimultaneousVoices = max(1, configuration.maxSimultaneousVoices)
            configuration.voicesPerKey = max(1, configuration.voicesPerKey)
            if configuration.masterVolume != oldValue.masterVolume {
                for pool in pools.values {
                    for player in pool { player.volume = configuration.masterVolume }
                }
            }
        }
    }

    public var masterVolume: Float {
        get { configuration.masterVolume }
        set { configuration.masterVolume = max(0, min(1, newValue)) }
    }

    public private(set) var lastError: Error?

    private var pools: [String: [AVAudioPlayer]] = [:]
    private var unavailableKeys: Set<String> = []
    private var didConfigureSession = false

    // MARK: 初始化

    public init(configuration: Configuration = Configuration()) {
        self.configuration = configuration
    }

    // MARK: AudioPlaying

    public func play(_ key: String) {
        guard configuration.masterVolume > 0, !key.isEmpty else { return }
        configureSessionIfNeeded()
        guard !unavailableKeys.contains(key) else { return }

        let pool = players(forKey: key)
        guard !pool.isEmpty else { return }

        // 全局并发上限：已满则抢占「最接近播完」的音效（currentTime 最大者）
        if activeVoiceCount >= configuration.maxSimultaneousVoices {
            guard let victim = pool.filter({ $0.isPlaying })
                .max(by: { $0.currentTime < $1.currentTime }) else { return }
            victim.stop()
        }

        guard let player = pool.first(where: { !$0.isPlaying })
                ?? pool.min(by: { $0.currentTime < $1.currentTime }) else { return }

        if player.isPlaying { player.stop() }
        player.currentTime = 0
        player.volume = configuration.masterVolume
        if !player.play() {
            lastError = AudioEngineError.playFailed(key: key)
        }
    }

    public func stop(_ key: String) {
        guard let pool = pools[key] else { return }
        for player in pool where player.isPlaying { player.stop() }
    }

    // MARK: 便捷能力

    /// 当前正在播放的 voice 数（诊断/性能面板用）
    public var activeVoiceCount: Int {
        pools.values.reduce(0) { partial, pool in
            partial + pool.reduce(0) { $0 + ($1.isPlaying ? 1 : 0) }
        }
    }

    /// 启动期预热，避免首次触发卡顿。资产管线落盘后传入音效 key 清单。
    public func preload(_ keys: [String]) {
        for key in keys where !key.isEmpty {
            _ = players(forKey: key)
        }
    }

    public func stopAll() {
        for pool in pools.values {
            for player in pool where player.isPlaying { player.stop() }
        }
    }

    // MARK: 内部

    private func players(forKey key: String) -> [AVAudioPlayer] {
        if let existing = pools[key] { return existing }
        if unavailableKeys.contains(key) { return [] }

        guard let url = resolveURL(forKey: key) else {
            unavailableKeys.insert(key)     // 缺资源不应崩：原版 assets 存在改名/裁撤
            return []
        }

        var created: [AVAudioPlayer] = []
        created.reserveCapacity(configuration.voicesPerKey)
        for _ in 0..<configuration.voicesPerKey {
            do {
                let player = try AVAudioPlayer(contentsOf: url)
                player.numberOfLoops = 0
                player.volume = configuration.masterVolume
                player.prepareToPlay()
                created.append(player)
            } catch {
                lastError = error
                break
            }
        }

        if created.isEmpty {
            unavailableKeys.insert(key)
            lastError = AudioEngineError.playerCreationFailed(key: key)
        }
        pools[key] = created
        return created
    }

    /// [待验证] `ContentBundle` 类型尚未落盘（资产管线任务卡未完成）。
    /// 默认实现退化为 Bundle.main 查找：先平铺、再试常见子目录。
    /// 资产管线约定正式文件名后，通过 Configuration.resourceURL 注入即可，不必改本文件。
    private func resolveURL(forKey key: String) -> URL? {
        if let custom = configuration.resourceURL, let url = custom(key) {
            return url
        }
        let bundle = Bundle.main
        for ext in configuration.fileExtensions {
            if let url = bundle.url(forResource: key, withExtension: ext) { return url }
            for sub in ["Sounds", "Audio", "assets"] {
                if let url = bundle.url(forResource: key, withExtension: ext,
                                        subdirectory: sub) { return url }
            }
        }
        return nil
    }

    /// 会话类别取 .ambient + mixWithOthers：
    ///  · .ambient 遵从静音拨片（原版 iOS 6 时代游戏普遍如此）
    ///  · mixWithOthers 允许与用户后台音乐共存
    /// [待验证] 原版 AudioToolbox/OpenAL 的会话配置无法从二进制闭合；
    /// 若需「不遵从静音键」应改 .playback。.ambient 与 iOS 26 兼容性无问题。
    private func configureSessionIfNeeded() {
        guard configuration.configuresAudioSession, !didConfigureSession else { return }
        didConfigureSession = true
        let session = AVAudioSession.sharedInstance()
        do {
            try session.setCategory(.ambient, mode: .default, options: [.mixWithOthers])
            try session.setActive(true)
        } catch {
            lastError = AudioEngineError.sessionConfigurationFailed(String(describing: error))
        }
    }
}