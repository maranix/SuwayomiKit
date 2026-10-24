import API
import Foundation

public enum MangaStatus: String, Sendable, Equatable, Codable {
    case unknown
    case ongoing
    case completed
    case licensed
    case publishingFinished
    case cancelled
    case onHiatus
}

public enum UpdateStrategy: String, Sendable, Equatable, Codable {
    case alwaysUpdate
    case onlyFetchOnce
}

public struct Manga: Sendable, Equatable, Identifiable, Codable {
    public let id: Int
    public let title: String
    public let artist: String?
    public let author: String?
    public let description: String?
    public let genre: [String]
    public let status: MangaStatus
    public let inLibrary: Bool
    public let inLibraryAt: String
    public let thumbnailUrl: String?
    public let thumbnailUrlLastFetched: String?
    public let sourceId: String
    public let url: String
    public let realUrl: String?
    public let unreadCount: Int
    public let downloadCount: Int
    public let bookmarkCount: Int
    public let updateStrategy: UpdateStrategy
    public let initialized: Bool
    public let lastFetchedAt: String?
    public let chaptersLastFetchedAt: String?
    public let categories: [Category]?

    public init(
        id: Int,
        title: String,
        artist: String? = nil,
        author: String? = nil,
        description: String? = nil,
        genre: [String] = [],
        status: MangaStatus = .unknown,
        inLibrary: Bool = false,
        inLibraryAt: String = "",
        thumbnailUrl: String? = nil,
        thumbnailUrlLastFetched: String? = nil,
        sourceId: String = "",
        url: String = "",
        realUrl: String? = nil,
        unreadCount: Int = 0,
        downloadCount: Int = 0,
        bookmarkCount: Int = 0,
        updateStrategy: UpdateStrategy = .alwaysUpdate,
        initialized: Bool = false,
        lastFetchedAt: String? = nil,
        chaptersLastFetchedAt: String? = nil,
        categories: [Category]? = nil
    ) {
        self.id = id
        self.title = title
        self.artist = artist
        self.author = author
        self.description = description
        self.genre = genre
        self.status = status
        self.inLibrary = inLibrary
        self.inLibraryAt = inLibraryAt
        self.thumbnailUrl = thumbnailUrl
        self.thumbnailUrlLastFetched = thumbnailUrlLastFetched
        self.sourceId = sourceId
        self.url = url
        self.realUrl = realUrl
        self.unreadCount = unreadCount
        self.downloadCount = downloadCount
        self.bookmarkCount = bookmarkCount
        self.updateStrategy = updateStrategy
        self.initialized = initialized
        self.lastFetchedAt = lastFetchedAt
        self.chaptersLastFetchedAt = chaptersLastFetchedAt
        self.categories = categories
    }
}

extension MangaStatus {
    static func from(_ apiValue: API.GraphQLEnum<API.MangaStatus>?) -> MangaStatus {
        switch apiValue?.value {
        case .unknown, .none: return .unknown
        case .ongoing: return .ongoing
        case .completed: return .completed
        case .licensed: return .licensed
        case .publishingFinished: return .publishingFinished
        case .cancelled: return .cancelled
        case .onHiatus: return .onHiatus
        }
    }
}

extension UpdateStrategy {
    static func from(_ apiValue: API.GraphQLEnum<API.UpdateStrategy>?) -> UpdateStrategy {
        switch apiValue?.value {
        case .alwaysUpdate, .none: return .alwaysUpdate
        case .onlyFetchOnce: return .onlyFetchOnce
        }
    }
}

extension Manga {
    static func from(_ fragment: API.MangaFields, categories: [Category]? = nil) -> Manga {
        Manga(
            id: fragment.id,
            title: fragment.title,
            artist: fragment.artist,
            author: fragment.author,
            description: fragment.description,
            genre: fragment.genre,
            status: MangaStatus.from(fragment.status),
            inLibrary: fragment.inLibrary,
            inLibraryAt: fragment.inLibraryAt,
            thumbnailUrl: fragment.thumbnailUrl,
            thumbnailUrlLastFetched: fragment.thumbnailUrlLastFetched,
            sourceId: fragment.sourceId,
            url: fragment.url,
            realUrl: fragment.realUrl,
            unreadCount: fragment.unreadCount,
            downloadCount: fragment.downloadCount,
            bookmarkCount: fragment.bookmarkCount,
            updateStrategy: UpdateStrategy.from(fragment.updateStrategy),
            initialized: fragment.initialized,
            lastFetchedAt: fragment.lastFetchedAt,
            chaptersLastFetchedAt: fragment.chaptersLastFetchedAt,
            categories: categories
        )
    }
}
