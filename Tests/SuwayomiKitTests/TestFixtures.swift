import SuwayomiKit

func makeManga(
    id: Int = 1,
    title: String = "Test Manga",
    thumbnailPath: String? = "/api/v1/manga/1/thumbnail",
    categories: [SuwayomiKit.Category]? = nil
) -> Manga {
    Manga(
        id: id,
        title: title,
        artist: nil,
        author: nil,
        description: nil,
        genre: [],
        status: .unknown,
        inLibrary: false,
        inLibraryAt: nil,
        thumbnailPath: thumbnailPath,
        thumbnailLastFetchedAt: nil,
        sourceID: "1",
        url: "/manga/\(id)",
        realURL: nil,
        unreadCount: 0,
        downloadCount: 0,
        bookmarkCount: 0,
        updateStrategy: .alwaysUpdate,
        isInitialized: false,
        lastFetchedAt: nil,
        chaptersLastFetchedAt: nil,
        categories: categories
    )
}
