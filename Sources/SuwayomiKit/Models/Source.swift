import API
import Foundation

public enum ContentWarning: String, Sendable, Hashable, CaseIterable {
    case safe
    case mixed
    case nsfw

    init(_ apiValue: API.GraphQLEnum<API.ContentWarning>?) {
        switch apiValue?.value {
        case .mixed: self = .mixed
        case .nsfw: self = .nsfw
        case .safe, .none: self = .safe
        }
    }

    func toAPI() -> API.ContentWarning {
        switch self {
        case .mixed: return .mixed
        case .nsfw: return .nsfw
        case .safe: return .safe
        }
    }
}

public enum SourceMangaType: String, Sendable, Hashable, CaseIterable {
    case popular
    case latest
    case search

    func toAPI() -> API.FetchSourceMangaType {
        switch self {
        case .popular: return .popular
        case .latest: return .latest
        case .search: return .search
        }
    }
}

public struct SourceSummary: Identifiable, Hashable, Sendable {
    public let id: String
    public let name: String
    public let displayName: String
    public let lang: String
    public let iconPath: String
    public let supportsLatest: Bool

    public init(
        id: String,
        name: String,
        displayName: String,
        lang: String,
        iconPath: String,
        supportsLatest: Bool
    ) {
        self.id = id
        self.name = name
        self.displayName = displayName
        self.lang = lang
        self.iconPath = iconPath
        self.supportsLatest = supportsLatest
    }

    init(_ fragment: API.SourceSummaryFields) {
        self.id = fragment.id
        self.name = fragment.name
        self.displayName = fragment.displayName
        self.lang = fragment.lang
        self.iconPath = fragment.iconUrl
        self.supportsLatest = fragment.supportsLatest
    }
}

public struct Source: Identifiable, Hashable, Sendable {
    public let id: String
    public let name: String
    public let displayName: String
    public let lang: String
    public let iconPath: String
    public let homeURL: URL?
    public let supportsLatest: Bool
    public let isConfigurable: Bool
    public let contentWarning: ContentWarning

    public init(
        id: String,
        name: String,
        displayName: String,
        lang: String,
        iconPath: String,
        homeURL: URL?,
        supportsLatest: Bool,
        isConfigurable: Bool,
        contentWarning: ContentWarning
    ) {
        self.id = id
        self.name = name
        self.displayName = displayName
        self.lang = lang
        self.iconPath = iconPath
        self.homeURL = homeURL
        self.supportsLatest = supportsLatest
        self.isConfigurable = isConfigurable
        self.contentWarning = contentWarning
    }

    init(_ fragment: API.SourceFields) {
        self.id = fragment.id
        self.name = fragment.name
        self.displayName = fragment.displayName
        self.lang = fragment.lang
        self.iconPath = fragment.iconUrl
        self.homeURL = fragment.homeUrl.flatMap(URL.init(string:))
        self.supportsLatest = fragment.supportsLatest
        self.isConfigurable = fragment.isConfigurable
        self.contentWarning = ContentWarning(fragment.contentWarning)
    }
}

extension Source: SourcePreview {}
extension SourceSummary: SourcePreview {}
