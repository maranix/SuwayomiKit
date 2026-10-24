import API
import Foundation

public struct Chapter: Sendable, Equatable, Identifiable, Codable {
    public let id: Int
    public let mangaId: Int
    public let name: String
    public let chapterNumber: Double
    public let pageCount: Int
    public let isBookmarked: Bool
    public let isDownloaded: Bool
    public let isRead: Bool
    public let lastPageRead: Int
    public let lastReadAt: String
    public let uploadDate: String
    public let fetchedAt: String
    public let scanlator: String?
    public let sourceOrder: Int
    public let url: String
    public let realUrl: String?

    public init(
        id: Int,
        mangaId: Int,
        name: String,
        chapterNumber: Double,
        pageCount: Int,
        isBookmarked: Bool,
        isDownloaded: Bool,
        isRead: Bool,
        lastPageRead: Int,
        lastReadAt: String,
        uploadDate: String,
        fetchedAt: String,
        scanlator: String? = nil,
        sourceOrder: Int,
        url: String,
        realUrl: String? = nil
    ) {
        self.id = id
        self.mangaId = mangaId
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
        self.realUrl = realUrl
    }
}

extension Chapter {
    static func from(_ fragment: API.ChapterFields) -> Chapter {
        Chapter(
            id: fragment.id,
            mangaId: fragment.mangaId,
            name: fragment.name,
            chapterNumber: Double(fragment.chapterNumber),
            pageCount: fragment.pageCount,
            isBookmarked: fragment.isBookmarked,
            isDownloaded: fragment.isDownloaded,
            isRead: fragment.isRead,
            lastPageRead: fragment.lastPageRead,
            lastReadAt: fragment.lastReadAt,
            uploadDate: fragment.uploadDate,
            fetchedAt: fragment.fetchedAt,
            scanlator: fragment.scanlator,
            sourceOrder: fragment.sourceOrder,
            url: fragment.url,
            realUrl: fragment.realUrl
        )
    }
}
