import Foundation
import Testing

@testable import SuwayomiKit

@Suite("Domain Model Tests")
struct ModelTests {
    @Test("Manga model encodes, decodes and conforms to Identifiable")
    func testMangaModel() throws {
        let manga = Manga(
            id: 101,
            title: "One Piece",
            artist: "Eiichiro Oda",
            author: "Eiichiro Oda",
            description: "Monkey D. Luffy sets out to find One Piece.",
            genre: ["Action", "Adventure", "Comedy"],
            status: .ongoing,
            inLibrary: true,
            inLibraryAt: "1729700000000",
            thumbnailUrl: "/api/v1/manga/101/thumbnail",
            thumbnailUrlLastFetched: "1729700000000",
            sourceId: "1234567890",
            url: "/manga/one-piece",
            realUrl: "https://example.com/one-piece",
            unreadCount: 45,
            downloadCount: 10,
            bookmarkCount: 2,
            updateStrategy: .alwaysUpdate,
            initialized: true,
            lastFetchedAt: "1729700000000",
            chaptersLastFetchedAt: "1729700000000",
            categories: [
                Category(
                    id: 1,
                    name: "Favorites",
                    order: 0,
                    isDefault: true,
                    isDefaultCategory: true,
                    includeInDownload: .include,
                    includeInUpdate: .include
                )
            ]
        )

        #expect(manga.id == 101)
        #expect(manga.categories?.count == 1)

        let data = try JSONEncoder().encode(manga)
        let decoded = try JSONDecoder().decode(Manga.self, from: data)
        #expect(decoded == manga)
    }

    @Test("Chapter model encodes, decodes and conforms to Identifiable")
    func testChapterModel() throws {
        let chapter = Chapter(
            id: 5001,
            mangaId: 101,
            name: "Chapter 1100: Thank You, Bonney",
            chapterNumber: 1100.0,
            pageCount: 19,
            isBookmarked: true,
            isDownloaded: true,
            isRead: false,
            lastPageRead: 5,
            lastReadAt: "1729705000000",
            uploadDate: "1700000000000",
            fetchedAt: "1729700000000",
            scanlator: "Official",
            sourceOrder: 1100,
            url: "/chapter/1100",
            realUrl: "https://example.com/chapter/1100"
        )

        #expect(chapter.id == 5001)
        #expect(chapter.chapterNumber == 1100.0)

        let data = try JSONEncoder().encode(chapter)
        let decoded = try JSONDecoder().decode(Chapter.self, from: data)
        #expect(decoded == chapter)
    }

    @Test("Category model encodes and decodes")
    func testCategoryModel() throws {
        let category = Category(
            id: 3,
            name: "Action Shonen",
            order: 2,
            isDefault: false,
            isDefaultCategory: false,
            includeInDownload: .include,
            includeInUpdate: .exclude
        )

        #expect(category.id == 3)
        let data = try JSONEncoder().encode(category)
        let decoded = try JSONDecoder().decode(Category.self, from: data)
        #expect(decoded == category)
    }

    @Test("Source model encodes and decodes")
    func testSourceModel() throws {
        let source = Source(
            id: "987654321",
            name: "MangaDex",
            displayName: "MangaDex (EN)",
            lang: "en",
            iconUrl: "/icon.png",
            homeUrl: "https://mangadex.org",
            supportsLatest: true,
            isConfigurable: true,
            contentWarning: .safe
        )

        #expect(source.id == "987654321")
        let data = try JSONEncoder().encode(source)
        let decoded = try JSONDecoder().decode(Source.self, from: data)
        #expect(decoded == source)
    }

    @Test("Extension model encodes and decodes")
    func testExtensionModel() throws {
        let ext = Extension(
            pkgName: "eu.kanade.tachiyomi.extension.en.mangadex",
            name: "MangaDex",
            versionName: "1.4.20",
            versionCode: "20",
            lang: "en",
            isInstalled: true,
            hasUpdate: false,
            isObsolete: false,
            iconUrl: "/ext-icon.png",
            contentWarning: .safe
        )

        #expect(ext.id == "eu.kanade.tachiyomi.extension.en.mangadex")
        let data = try JSONEncoder().encode(ext)
        let decoded = try JSONDecoder().decode(Extension.self, from: data)
        #expect(decoded == ext)
    }

    @Test("DownloadQueueStatus and DownloadItem models encode and decode")
    func testDownloadModels() throws {
        let manga = Manga(id: 1, title: "Title")
        let chapter = Chapter(
            id: 10,
            mangaId: 1,
            name: "Ch 1",
            chapterNumber: 1.0,
            pageCount: 20,
            isBookmarked: false,
            isDownloaded: false,
            isRead: false,
            lastPageRead: 0,
            lastReadAt: "0",
            uploadDate: "0",
            fetchedAt: "0",
            sourceOrder: 1,
            url: "/1"
        )
        let item = DownloadItem(
            position: 1,
            progress: 0.75,
            state: .downloading,
            tries: 1,
            chapter: chapter,
            manga: manga
        )
        let queueStatus = DownloadQueueStatus(state: .started, queue: [item])

        #expect(item.id == chapter.id)
        #expect(queueStatus.state == .started)
        #expect(queueStatus.queue.count == 1)

        let data = try JSONEncoder().encode(queueStatus)
        let decoded = try JSONDecoder().decode(DownloadQueueStatus.self, from: data)
        #expect(decoded == queueStatus)
    }

    @Test("ServerSettings and AuthTokens models encode and decode")
    func testSettingsAndAuthModels() throws {
        let settings = ServerSettings(
            ip: "0.0.0.0",
            port: 4567,
            authMode: .basicAuth,
            authUsername: "admin",
            downloadsPath: "/downloads",
            autoDownloadNewChapters: true,
            maxSourcesInParallel: 4
        )

        let settingsData = try JSONEncoder().encode(settings)
        let decodedSettings = try JSONDecoder().decode(ServerSettings.self, from: settingsData)
        #expect(decodedSettings == settings)

        let auth = AuthTokens(accessToken: "access_123", refreshToken: "refresh_456")
        let authData = try JSONEncoder().encode(auth)
        let decodedAuth = try JSONDecoder().decode(AuthTokens.self, from: authData)
        #expect(decodedAuth == auth)
    }

    @Test("LibraryJobsInfo model encodes and decodes")
    func testLibraryJobsInfo() throws {
        let jobs = LibraryJobsInfo(
            isRunning: true,
            totalJobs: 100,
            finishedJobs: 42,
            skippedCategoriesCount: 2,
            skippedMangasCount: 5
        )

        let data = try JSONEncoder().encode(jobs)
        let decoded = try JSONDecoder().decode(LibraryJobsInfo.self, from: data)
        #expect(decoded == jobs)
    }

    @Test("PagedResult generic container encodes and decodes")
    func testPagedResult() throws {
        let manga = Manga(id: 1, title: "Title")
        let pageInfo = PageInfo(
            hasNextPage: true,
            hasPreviousPage: false,
            startCursor: "cursor_start",
            endCursor: "cursor_end"
        )
        let paged = PagedResult(items: [manga], pageInfo: pageInfo, totalCount: 1)

        #expect(paged.items.count == 1)
        #expect(paged.pageInfo.hasNextPage == true)
        #expect(paged.totalCount == 1)

        let data = try JSONEncoder().encode(paged)
        let decoded = try JSONDecoder().decode(PagedResult<Manga>.self, from: data)
        #expect(decoded == paged)
    }
}
