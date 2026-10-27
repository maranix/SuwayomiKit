import API
import Foundation

public enum MangaStatus: String, Sendable, Hashable, CaseIterable {
    case unknown
    case ongoing
    case completed
    case licensed
    case publishingFinished
    case cancelled
    case onHiatus

    init(_ apiValue: API.GraphQLEnum<API.MangaStatus>?) {
        switch apiValue?.value {
        case .ongoing: self = .ongoing
        case .completed: self = .completed
        case .licensed: self = .licensed
        case .publishingFinished: self = .publishingFinished
        case .cancelled: self = .cancelled
        case .onHiatus: self = .onHiatus
        case .unknown, .none: self = .unknown
        }
    }
}

public enum UpdateStrategy: String, Sendable, Hashable, CaseIterable {
    case alwaysUpdate
    case onlyFetchOnce

    init(_ apiValue: API.GraphQLEnum<API.UpdateStrategy>?) {
        switch apiValue?.value {
        case .onlyFetchOnce: self = .onlyFetchOnce
        case .alwaysUpdate, .none: self = .alwaysUpdate
        }
    }
}

public struct MangaSummary: Identifiable, Hashable, Sendable {
    public let id: Int
    public let title: String
    public let thumbnailPath: String?
    public let inLibrary: Bool
    public let unreadCount: Int
    public let downloadCount: Int
    public let sourceID: String

    public init(
        id: Int,
        title: String,
        thumbnailPath: String?,
        inLibrary: Bool,
        unreadCount: Int,
        downloadCount: Int,
        sourceID: String
    ) {
        self.id = id
        self.title = title
        self.thumbnailPath = thumbnailPath
        self.inLibrary = inLibrary
        self.unreadCount = unreadCount
        self.downloadCount = downloadCount
        self.sourceID = sourceID
    }

    init(_ fragment: API.MangaSummaryFields) {
        self.id = fragment.id
        self.title = fragment.title
        self.thumbnailPath = fragment.thumbnailUrl
        self.inLibrary = fragment.inLibrary
        self.unreadCount = fragment.unreadCount
        self.downloadCount = fragment.downloadCount
        self.sourceID = fragment.sourceId
    }
}

public struct Manga: Identifiable, Hashable, Sendable {
    public let id: Int
    public let title: String
    public let artist: String?
    public let author: String?
    public let description: String?
    public let genre: [String]
    public let status: MangaStatus
    public let inLibrary: Bool
    public let inLibraryAt: Date?
    public let thumbnailPath: String?
    public let thumbnailLastFetchedAt: Date?
    public let sourceID: String
    public let url: String
    public let realURL: URL?
    public let unreadCount: Int
    public let downloadCount: Int
    public let bookmarkCount: Int
    public let updateStrategy: UpdateStrategy
    public let isInitialized: Bool
    public let lastFetchedAt: Date?
    public let chaptersLastFetchedAt: Date?
    public let categories: [Category]?

    public init(
        id: Int,
        title: String,
        artist: String?,
        author: String?,
        description: String?,
        genre: [String],
        status: MangaStatus,
        inLibrary: Bool,
        inLibraryAt: Date?,
        thumbnailPath: String?,
        thumbnailLastFetchedAt: Date?,
        sourceID: String,
        url: String,
        realURL: URL?,
        unreadCount: Int,
        downloadCount: Int,
        bookmarkCount: Int,
        updateStrategy: UpdateStrategy,
        isInitialized: Bool,
        lastFetchedAt: Date?,
        chaptersLastFetchedAt: Date?,
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
        self.thumbnailPath = thumbnailPath
        self.thumbnailLastFetchedAt = thumbnailLastFetchedAt
        self.sourceID = sourceID
        self.url = url
        self.realURL = realURL
        self.unreadCount = unreadCount
        self.downloadCount = downloadCount
        self.bookmarkCount = bookmarkCount
        self.updateStrategy = updateStrategy
        self.isInitialized = isInitialized
        self.lastFetchedAt = lastFetchedAt
        self.chaptersLastFetchedAt = chaptersLastFetchedAt
        self.categories = categories
    }

    init(_ fragment: API.MangaFields, categories: [Category]? = nil) {
        self.id = fragment.id
        self.title = fragment.title
        self.artist = fragment.artist
        self.author = fragment.author
        self.description = fragment.description
        self.genre = fragment.genre
        self.status = MangaStatus(fragment.status)
        self.inLibrary = fragment.inLibrary
        self.inLibraryAt = Date(epochMilliseconds: fragment.inLibraryAt)
        self.thumbnailPath = fragment.thumbnailUrl
        self.thumbnailLastFetchedAt = Date(epochMilliseconds: fragment.thumbnailUrlLastFetched)
        self.sourceID = fragment.sourceId
        self.url = fragment.url
        self.realURL = fragment.realUrl.flatMap(URL.init(string:))
        self.unreadCount = fragment.unreadCount
        self.downloadCount = fragment.downloadCount
        self.bookmarkCount = fragment.bookmarkCount
        self.updateStrategy = UpdateStrategy(fragment.updateStrategy)
        self.isInitialized = fragment.initialized
        self.lastFetchedAt = Date(epochMilliseconds: fragment.lastFetchedAt)
        self.chaptersLastFetchedAt = Date(epochMilliseconds: fragment.chaptersLastFetchedAt)
        self.categories = categories
    }
}

extension Manga: MangaPreview {}
extension MangaSummary: MangaPreview {}
