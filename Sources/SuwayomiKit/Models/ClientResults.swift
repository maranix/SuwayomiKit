import Foundation

public struct MangaWithChapters: Sendable, Equatable, Hashable {
    public let manga: Manga
    public let chapters: [Chapter]

    public init(manga: Manga, chapters: [Chapter]) {
        self.manga = manga
        self.chapters = chapters
    }
}

public struct SourceMangaPage: Sendable, Equatable, Hashable {
    public let mangas: [MangaSummary]
    public let hasNextPage: Bool

    public init(mangas: [MangaSummary], hasNextPage: Bool) {
        self.mangas = mangas
        self.hasNextPage = hasNextPage
    }
}

public struct CacheClearResult: Sendable, Equatable, Hashable {
    public let cachedPages: Bool
    public let cachedThumbnails: Bool
    public let downloadedThumbnails: Bool

    public init(cachedPages: Bool, cachedThumbnails: Bool, downloadedThumbnails: Bool) {
        self.cachedPages = cachedPages
        self.cachedThumbnails = cachedThumbnails
        self.downloadedThumbnails = downloadedThumbnails
    }
}
