import Foundation
import SuwayomiKit
import Testing

@Suite("Domain Model Tests")
struct ModelTests {
    @Test("MangaSummary initializes and conforms to Identifiable and Hashable")
    func testMangaSummary() {
        let summary1 = MangaSummary(
            id: 101,
            title: "One Piece",
            thumbnailURL: "/api/v1/manga/101/thumbnail",
            inLibrary: true,
            unreadCount: 45,
            downloadCount: 10,
            sourceID: "1234567890"
        )
        let summary2 = MangaSummary(
            id: 101,
            title: "One Piece",
            thumbnailURL: "/api/v1/manga/101/thumbnail",
            inLibrary: true,
            unreadCount: 45,
            downloadCount: 10,
            sourceID: "1234567890"
        )

        #expect(summary1.id == 101)
        #expect(summary1.title == "One Piece")
        #expect(summary1.thumbnailURL == "/api/v1/manga/101/thumbnail")
        #expect(summary1.inLibrary == true)
        #expect(summary1.unreadCount == 45)
        #expect(summary1.downloadCount == 10)
        #expect(summary1.sourceID == "1234567890")
        #expect(summary1 == summary2)
        #expect(summary1.hashValue == summary2.hashValue)
    }

    @Test("Manga initializes and conforms to Identifiable and Hashable")
    func testManga() {
        let inLibraryDate = Date(timeIntervalSince1970: 1_729_700_000)
        let lastFetchedDate = Date(timeIntervalSince1970: 1_729_705_000)
        let realURL = URL(string: "https://example.com/one-piece")

        let category = Category(
            id: 1,
            name: "Favorites",
            order: 0,
            isDefault: true,
            isDefaultCategory: true,
            includeInDownload: .include,
            includeInUpdate: .include
        )

        let manga = Manga(
            id: 101,
            title: "One Piece",
            artist: "Eiichiro Oda",
            author: "Eiichiro Oda",
            description: "Monkey D. Luffy sets out to find One Piece.",
            genre: ["Action", "Adventure", "Comedy"],
            status: .ongoing,
            inLibrary: true,
            inLibraryAt: inLibraryDate,
            thumbnailURL: "/api/v1/manga/101/thumbnail",
            thumbnailUrlLastFetched: lastFetchedDate,
            sourceID: "1234567890",
            url: "/manga/one-piece",
            realURL: realURL,
            unreadCount: 45,
            downloadCount: 10,
            bookmarkCount: 2,
            updateStrategy: .alwaysUpdate,
            isInitialized: true,
            lastFetchedAt: lastFetchedDate,
            chaptersLastFetchedAt: lastFetchedDate,
            categories: [category]
        )

        #expect(manga.id == 101)
        #expect(manga.title == "One Piece")
        #expect(manga.artist == "Eiichiro Oda")
        #expect(manga.author == "Eiichiro Oda")
        #expect(manga.genre == ["Action", "Adventure", "Comedy"])
        #expect(manga.status == .ongoing)
        #expect(manga.inLibrary == true)
        #expect(manga.inLibraryAt == inLibraryDate)
        #expect(manga.realURL == realURL)
        #expect(manga.categories.count == 1)
        #expect(manga.categories.first?.id == 1)
        #expect(manga.isInitialized == true)
    }

    @Test("Chapter initializes with Double chapterNumber, dates, and URL")
    func testChapter() {
        let uploadDate = Date(timeIntervalSince1970: 1_700_000_000)
        let lastReadDate = Date(timeIntervalSince1970: 1_729_705_000)
        let realURL = URL(string: "https://example.com/chapter/1100")

        let chapter = Chapter(
            id: 5001,
            mangaID: 101,
            name: "Chapter 1100: Thank You, Bonney",
            chapterNumber: 1100.5,
            pageCount: 19,
            isBookmarked: true,
            isDownloaded: true,
            isRead: false,
            lastPageRead: 5,
            lastReadAt: lastReadDate,
            uploadDate: uploadDate,
            fetchedAt: uploadDate,
            scanlator: "Official",
            sourceOrder: 1100,
            url: "/chapter/1100",
            realURL: realURL
        )

        #expect(chapter.id == 5001)
        #expect(chapter.mangaID == 101)
        #expect(chapter.chapterNumber == 1100.5)
        #expect(chapter.pageCount == 19)
        #expect(chapter.isBookmarked == true)
        #expect(chapter.isDownloaded == true)
        #expect(chapter.isRead == false)
        #expect(chapter.lastPageRead == 5)
        #expect(chapter.lastReadAt == lastReadDate)
        #expect(chapter.uploadDate == uploadDate)
        #expect(chapter.scanlator == "Official")
        #expect(chapter.realURL == realURL)
    }

    @Test("Category initializes and conforms to Identifiable and Hashable")
    func testCategory() {
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
        #expect(category.name == "Action Shonen")
        #expect(category.order == 2)
        #expect(category.isDefault == false)
        #expect(category.isDefaultCategory == false)
        #expect(category.includeInDownload == .include)
        #expect(category.includeInUpdate == .exclude)
    }

    @Test("SourceSummary and Source initialize properly")
    func testSources() {
        let summary = SourceSummary(
            id: "mangadex-en",
            name: "MangaDex",
            displayName: "MangaDex (EN)",
            lang: "en",
            iconURL: "/api/v1/source/mangadex-en/icon",
            supportsLatest: true
        )
        #expect(summary.id == "mangadex-en")
        #expect(summary.supportsLatest == true)

        let detail = Source(
            id: "mangadex-en",
            name: "MangaDex",
            displayName: "MangaDex (EN)",
            lang: "en",
            iconURL: "/api/v1/source/mangadex-en/icon",
            homeURL: URL(string: "https://mangadex.org"),
            supportsLatest: true,
            isConfigurable: true,
            contentWarning: .safe
        )
        #expect(detail.id == "mangadex-en")
        #expect(detail.homeURL?.host == "mangadex.org")
        #expect(detail.isConfigurable == true)
        #expect(detail.contentWarning == .safe)
    }

    @Test("Extension initializes with pkgName as id")
    func testExtension() {
        let ext = Extension(
            pkgName: "eu.kanade.tachiyomi.extension.en.mangadex",
            name: "MangaDex",
            versionName: "1.4.20",
            versionCode: "20",
            lang: "en",
            isInstalled: true,
            hasUpdate: false,
            isObsolete: false,
            iconURL: "/api/v1/extension/mangadex/icon",
            contentWarning: .safe
        )

        #expect(ext.id == "eu.kanade.tachiyomi.extension.en.mangadex")
        #expect(ext.pkgName == "eu.kanade.tachiyomi.extension.en.mangadex")
        #expect(ext.versionCode == "20")
        #expect(ext.isInstalled == true)
    }

    @Test("DownloadItem and DownloadQueueStatus initialize properly")
    func testDownloads() {
        let chapter = Chapter(
            id: 201,
            mangaID: 101,
            name: "Ch. 1",
            chapterNumber: 1.0,
            pageCount: 20,
            isBookmarked: false,
            isDownloaded: false,
            isRead: false,
            lastPageRead: 0,
            lastReadAt: nil,
            uploadDate: nil,
            fetchedAt: nil,
            scanlator: nil,
            sourceOrder: 1,
            url: "/ch1",
            realURL: nil
        )

        let manga = MangaSummary(
            id: 101,
            title: "Test Manga",
            thumbnailURL: nil,
            inLibrary: true,
            unreadCount: 1,
            downloadCount: 0,
            sourceID: "source-1"
        )

        let item = DownloadItem(
            position: 0,
            progress: 0.75,
            state: .downloading,
            tries: 1,
            chapter: chapter,
            manga: manga
        )

        #expect(item.id == chapter.id)
        #expect(item.progress == 0.75)
        #expect(item.state == .downloading)

        let status = DownloadQueueStatus(state: .started, queue: [item])
        #expect(status.state == .started)
        #expect(status.queue.count == 1)
    }

    @Test("LibraryJobsInfo contains all 5 properties")
    func testLibraryJobsInfo() {
        let info = LibraryJobsInfo(
            isRunning: true,
            totalJobs: 10,
            finishedJobs: 6,
            skippedCategoriesCount: 1,
            skippedMangasCount: 2
        )
        #expect(info.isRunning == true)
        #expect(info.totalJobs == 10)
        #expect(info.finishedJobs == 6)
        #expect(info.skippedCategoriesCount == 1)
        #expect(info.skippedMangasCount == 2)
    }

    @Test("PagedResult conforms to RandomAccessCollection and supports indexing")
    func testPagedResultCollection() {
        let pageInfo = PageInfo(
            hasNextPage: true,
            hasPreviousPage: false,
            startCursor: "cursor_start",
            endCursor: "cursor_end"
        )
        let items = ["Item A", "Item B", "Item C"]
        let paged = PagedResult(items: items, pageInfo: pageInfo, totalCount: 100)

        #expect(paged.count == 3)
        #expect(paged.startIndex == 0)
        #expect(paged.endIndex == 3)
        #expect(paged[0] == "Item A")
        #expect(paged[1] == "Item B")
        #expect(paged[2] == "Item C")
        #expect(paged.totalCount == 100)
        #expect(paged.pageInfo.hasNextPage == true)

        var iterated: [String] = []
        for item in paged {
            iterated.append(item)
        }
        #expect(iterated == items)
    }

    @Test("ServerInfo, ServerSettings and AuthTokens initialize properly")
    func testServerAndAuth() {
        let server = ServerInfo(
            name: "Suwayomi-Server",
            version: "1.1.0",
            buildTime: "1729700000000",
            buildType: "Release",
            githubURL: URL(string: "https://github.com/Suwayomi/Suwayomi-Server"),
            discordURL: URL(string: "https://discord.gg/suwayomi"),
            platform: .init(
                headless: true,
                arch: "aarch64",
                os: .init(name: "Linux", version: "6.1"),
                jvm: .init(vmName: "OpenJDK", javaVersion: "21")
            )
        )
        #expect(server.name == "Suwayomi-Server")
        #expect(server.platform.headless == true)
        #expect(server.platform.os.name == "Linux")

        let settings = ServerSettings(
            ip: "0.0.0.0",
            port: 4567,
            authMode: .basicAuth,
            authUsername: "admin",
            downloadsPath: "/downloads",
            autoDownloadNewChapters: true,
            maxSourcesInParallel: 4
        )
        #expect(settings.authMode == .basicAuth)
        #expect(settings.maxSourcesInParallel == 4)

        let tokens = AuthTokens(accessToken: "access_token_123", refreshToken: "refresh_token_456")
        #expect(tokens.accessToken == "access_token_123")
        #expect(tokens.refreshToken == "refresh_token_456")
    }
}
