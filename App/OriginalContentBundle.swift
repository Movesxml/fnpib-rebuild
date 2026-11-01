import Foundation
import FNPBCore

/// App Bundle 中真实水果 / 波次内容的唯一加载入口（T-030）。
/// 资源缺失、读取失败和解析失败均保留诊断，不产生占位内容。
enum OriginalContentBundle {
    enum LoadFailure: Error, LocalizedError, Sendable, Equatable {
        case missingResource(name: String)
        case unreadableResource(name: String, reason: String)
        case invalidContent(reason: String)

        var errorDescription: String? {
            switch self {
            case .missingResource(let name):
                return "App Bundle 缺少原始内容资源 \(name)"
            case .unreadableResource(let name, let reason):
                return "读取 \(name) 失败：\(reason)"
            case .invalidContent(let reason):
                return "原始内容解析失败：\(reason)"
            }
        }
    }

    static func load(bundle: Bundle = .main) -> Result<OriginalContent, LoadFailure> {
        do {
            let fruitsData = try readResource(named: "fruitList", bundle: bundle)
            let wavesData = try readResource(named: "originalWaveList", bundle: bundle)
            let bonusAwardsData = try readResource(named: "bonusAwards", bundle: bundle)
            return .success(try OriginalContentLoader.load(fruitsData: fruitsData,
                                                           wavesData: wavesData,
                                                           bonusAwardsData: bonusAwardsData))
        } catch let failure as LoadFailure {
            return .failure(failure)
        } catch {
            let reason = (error as? LocalizedError)?.errorDescription
                ?? String(describing: error)
            return .failure(.invalidContent(reason: reason))
        }
    }

    private static func readResource(named name: String, bundle: Bundle) throws -> Data {
        let fileName = "\(name).json"
        // XcodeGen 的 group 展开通常放在根目录；subdirectory 兼容 folder reference，
        // 两者指向同一份只读内容，不是数据兜底。
        guard let url = bundle.url(forResource: name, withExtension: "json")
                ?? bundle.url(forResource: name, withExtension: "json", subdirectory: "Content") else {
            throw LoadFailure.missingResource(name: fileName)
        }
        do {
            return try Data(contentsOf: url)
        } catch {
            throw LoadFailure.unreadableResource(name: fileName,
                                                 reason: error.localizedDescription)
        }
    }
}
