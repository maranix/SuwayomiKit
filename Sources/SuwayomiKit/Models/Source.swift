import API
import Foundation

public enum ContentWarning: String, Sendable, Equatable, Codable {
    case safe
    case mixed
    case nsfw
}

public struct Source: Sendable, Equatable, Identifiable, Codable {
    public let id: String
    public let name: String
    public let displayName: String
    public let lang: String
    public let iconUrl: String
    public let homeUrl: String?
    public let supportsLatest: Bool
    public let isConfigurable: Bool
    public let contentWarning: ContentWarning

    public init(
        id: String,
        name: String,
        displayName: String,
        lang: String,
        iconUrl: String,
        homeUrl: String? = nil,
        supportsLatest: Bool,
        isConfigurable: Bool,
        contentWarning: ContentWarning
    ) {
        self.id = id
        self.name = name
        self.displayName = displayName
        self.lang = lang
        self.iconUrl = iconUrl
        self.homeUrl = homeUrl
        self.supportsLatest = supportsLatest
        self.isConfigurable = isConfigurable
        self.contentWarning = contentWarning
    }
}

extension ContentWarning {
    static func from(_ apiValue: API.GraphQLEnum<API.ContentWarning>?) -> ContentWarning {
        switch apiValue?.value {
        case .safe, .none: return .safe
        case .mixed: return .mixed
        case .nsfw: return .nsfw
        }
    }
}

extension Source {
    static func from(_ fragment: API.SourceFields) -> Source {
        Source(
            id: fragment.id,
            name: fragment.name,
            displayName: fragment.displayName,
            lang: fragment.lang,
            iconUrl: fragment.iconUrl,
            homeUrl: fragment.homeUrl,
            supportsLatest: fragment.supportsLatest,
            isConfigurable: fragment.isConfigurable,
            contentWarning: ContentWarning.from(fragment.contentWarning)
        )
    }
}
