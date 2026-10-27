import API
import Foundation

public enum ChapterOrderBy: String, Sendable, Hashable, CaseIterable {
    case id
    case sourceOrder
    case name
    case uploadDate
    case chapterNumber
    case lastReadAt
    case fetchedAt

    func toAPI() -> API.ChapterOrderBy {
        switch self {
        case .id: return .id
        case .sourceOrder: return .sourceOrder
        case .name: return .name
        case .uploadDate: return .uploadDate
        case .chapterNumber: return .chapterNumber
        case .lastReadAt: return .lastReadAt
        case .fetchedAt: return .fetchedAt
        }
    }
}

public enum SortDirection: String, Sendable, Hashable, CaseIterable {
    case ascending
    case descending

    func toAPI() -> API.SortOrder {
        switch self {
        case .ascending: return .asc
        case .descending: return .desc
        }
    }
}

public struct ChapterOrder: Sendable, Hashable {
    public let by: ChapterOrderBy
    public let direction: SortDirection

    public init(by: ChapterOrderBy, direction: SortDirection = .ascending) {
        self.by = by
        self.direction = direction
    }
}

public struct Chapter: Identifiable, Hashable, Sendable {
    public let id: Int
    public let mangaID: Int
    public let name: String
    public let chapterNumber: Double
    public let pageCount: Int
    public let isBookmarked: Bool
    public let isDownloaded: Bool
    public let isRead: Bool
    public let lastPageRead: Int
    public let lastReadAt: Date?
    public let uploadDate: Date?
    public let fetchedAt: Date?
    public let scanlator: String?
    public let sourceOrder: Int
    public let url: String
    public let realURL: URL?

    public init(
        id: Int,
        mangaID: Int,
        name: String,
        chapterNumber: Double,
        pageCount: Int,
        isBookmarked: Bool,
        isDownloaded: Bool,
        isRead: Bool,
        lastPageRead: Int,
        lastReadAt: Date?,
        uploadDate: Date?,
        fetchedAt: Date?,
        scanlator: String?,
        sourceOrder: Int,
        url: String,
        realURL: URL?
    ) {
        self.id = id
        self.mangaID = mangaID
        self.name = name
        self.chapterNumber = chapterNumber
        self.pageCount = pageCount
        self.isBookmarked = isBookmarked
        self.isDownloaded = isDownloaded
        self.isRead = isRead
        self.lastPageRead = lastPageRead
        self.lastReadAt = lastReadAt
        self.uploadDate = uploadDate
        self.fetchedAt = fetchedAt
        self.scanlator = scanlator
        self.sourceOrder = sourceOrder
        self.url = url
        self.realURL = realURL
    }

    init(_ fragment: API.ChapterFields) {
        self.id = fragment.id
        self.mangaID = fragment.mangaId
        self.name = fragment.name
        self.chapterNumber = Double(fragment.chapterNumber)
        self.pageCount = fragment.pageCount
        self.isBookmarked = fragment.isBookmarked
        self.isDownloaded = fragment.isDownloaded
        self.isRead = fragment.isRead
        self.lastPageRead = fragment.lastPageRead
        self.lastReadAt = Date(epochMilliseconds: fragment.lastReadAt)
        self.uploadDate = Date(epochMilliseconds: fragment.uploadDate)
        self.fetchedAt = Date(epochMilliseconds: fragment.fetchedAt)
        self.scanlator = fragment.scanlator
        self.sourceOrder = fragment.sourceOrder
        self.url = fragment.url
        self.realURL = fragment.realUrl.flatMap(URL.init(string:))
    }
}
