import Foundation

/// Release `xml/challengeTypes.xml` entry, loaded by FUN_00060bb8.
/// Document order is significant because FUN_00060da0 draws directly from this vector.
public struct ChallengeTypeDefinition: Sendable, Equatable {
    public var name: String
    public var iconIndex: Int32
    public var showInRandom: Bool

    public init(name: String, iconIndex: Int32, showInRandom: Bool = true) {
        self.name = name
        self.iconIndex = iconIndex
        self.showInRandom = showInRandom
    }
}

public enum ChallengeTypeCatalogLoader {
    private struct Document: Decodable {
        let root: ContentNode
    }

    public static func load(from data: Data) throws -> [ChallengeTypeDefinition] {
        let document: Document
        do {
            document = try JSONDecoder().decode(Document.self, from: data)
        } catch {
            throw ChallengeCatalogLoadError.invalidJSON(String(describing: error))
        }
        guard document.root.tag == "challengeTypes" else {
            throw ChallengeCatalogLoadError.unexpectedRoot(
                expected: "challengeTypes", actual: document.root.tag)
        }
        return try document.root.children.enumerated().compactMap { offset, node in
            guard node.tag == "type" else { return nil }
            let path = "challengeTypes/type[\(offset)]"
            guard let name = node.attrs["name"] else {
                throw ChallengeCatalogLoadError.missingAttribute(
                    node: node.tag, attribute: "name", path: path)
            }
            var iconIndex: Int32 = 0
            if let raw = node.attrs["iconIndex"] {
                guard let parsed = Int32(raw.trimmingCharacters(in: .whitespacesAndNewlines)) else {
                    throw ChallengeCatalogLoadError.invalidNumber(
                        node: node.tag, attribute: "iconIndex", raw: raw, path: path)
                }
                iconIndex = parsed
            }
            return ChallengeTypeDefinition(
                name: name,
                iconIndex: iconIndex,
                showInRandom: node.attrs["dontShowInRandom"] != "true")
        }
    }
}
