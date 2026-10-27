import API
@_spi(Unsafe) import ApolloAPI
import Foundation
import Testing

@testable import SuwayomiKit

@Suite("Model Mapping & Conversion Tests")
struct ModelMappingTests {
    @Test("Enum mapping correctly converts all cases and falls back for unknown/nil values")
    func testEnumFallbacks() {
        // MangaStatus
        #expect(MangaStatus(nil) == .unknown)
        #expect(MangaStatus(GraphQLEnum(.unknown)) == .unknown)
        #expect(MangaStatus(GraphQLEnum(.ongoing)) == .ongoing)
        #expect(MangaStatus(GraphQLEnum(.completed)) == .completed)
        #expect(MangaStatus(GraphQLEnum(.licensed)) == .licensed)
        #expect(MangaStatus(GraphQLEnum(.publishingFinished)) == .publishingFinished)
        #expect(MangaStatus(GraphQLEnum(.cancelled)) == .cancelled)
        #expect(MangaStatus(GraphQLEnum(.onHiatus)) == .onHiatus)

        // UpdateStrategy
        #expect(UpdateStrategy(nil) == .alwaysUpdate)
        #expect(UpdateStrategy(GraphQLEnum(.alwaysUpdate)) == .alwaysUpdate)
        #expect(UpdateStrategy(GraphQLEnum(.onlyFetchOnce)) == .onlyFetchOnce)

        // CategoryIncludeOrExclude
        #expect(CategoryIncludeOrExclude(nil) == .unset)
        #expect(CategoryIncludeOrExclude(GraphQLEnum(.include)) == .include)
        #expect(CategoryIncludeOrExclude(GraphQLEnum(.exclude)) == .exclude)
        #expect(CategoryIncludeOrExclude(GraphQLEnum(.unset)) == .unset)
        #expect(CategoryIncludeOrExclude.include.toAPI() == .include)
        #expect(CategoryIncludeOrExclude.exclude.toAPI() == .exclude)
        #expect(CategoryIncludeOrExclude.unset.toAPI() == .unset)

        // ContentWarning
        #expect(ContentWarning(nil) == .safe)
        #expect(ContentWarning(GraphQLEnum(.safe)) == .safe)
        #expect(ContentWarning(GraphQLEnum(.mixed)) == .mixed)
        #expect(ContentWarning(GraphQLEnum(.nsfw)) == .nsfw)

        // DownloaderState
        #expect(DownloaderState(nil) == .stopped)
        #expect(DownloaderState(GraphQLEnum(.started)) == .started)
        #expect(DownloaderState(GraphQLEnum(.stopped)) == .stopped)

        // DownloadState
        #expect(DownloadState(nil) == .error)
        #expect(DownloadState(GraphQLEnum(.queued)) == .queued)
        #expect(DownloadState(GraphQLEnum(.downloading)) == .downloading)
        #expect(DownloadState(GraphQLEnum(.finished)) == .finished)
        #expect(DownloadState(GraphQLEnum(.error)) == .error)

        // AuthMode
        #expect(AuthMode(nil) == .none)
        #expect(AuthMode(GraphQLEnum(.none)) == .none)
        #expect(AuthMode(GraphQLEnum(.basicAuth)) == .basicAuth)
        #expect(AuthMode(GraphQLEnum(.simpleLogin)) == .simpleLogin)
        #expect(AuthMode(GraphQLEnum(.uiLogin)) == .uiLogin)
    }

    @Test("Date epoch parsing converts valid epoch ms and drops non-positive values")
    func testEpochDateParsing() {
        let validDate = Date(epochMilliseconds: "1729700000000")
        #expect(validDate?.timeIntervalSince1970 == 1_729_700_000)

        #expect(Date(epochMilliseconds: "0") == nil)
        #expect(Date(epochMilliseconds: "-1000") == nil)
        #expect(Date(epochMilliseconds: "invalid") == nil)
        #expect(Date(epochMilliseconds: nil) == nil)
    }

    @Test("CategoryFields and SourceFields map correctly to domain models")
    func testCategoryAndSourceFragments() {
        let categoryDict = DataDict(
            data: [
                "id": 42,
                "name": "Manga Favorites",
                "order": 1,
                "default": true,
                "isDefaultCategory": false,
                "includeInDownload": GraphQLEnum<API.IncludeOrExclude>(.include),
                "includeInUpdate": GraphQLEnum<API.IncludeOrExclude>(.exclude),
            ],
            fulfilledFragments: [ObjectIdentifier(CategoryFields.self)]
        )
        let category = Category(CategoryFields(_dataDict: categoryDict))
        #expect(category.id == 42)
        #expect(category.name == "Manga Favorites")
        #expect(category.order == 1)
        #expect(category.isDefault == true)
        #expect(category.isDefaultCategory == false)
        #expect(category.includeInDownload == .include)
        #expect(category.includeInUpdate == .exclude)

        let sourceSummaryDict = DataDict(
            data: [
                "id": API.LongString("dex-source-id"),
                "name": "MangaDex",
                "displayName": "MangaDex (EN)",
                "lang": "en",
                "iconUrl": "/static/dex.png",
                "supportsLatest": true,
            ],
            fulfilledFragments: [ObjectIdentifier(SourceSummaryFields.self)]
        )
        let sourceSummary = SourceSummary(SourceSummaryFields(_dataDict: sourceSummaryDict))
        #expect(sourceSummary.id == "dex-source-id")
        #expect(sourceSummary.displayName == "MangaDex (EN)")
        #expect(sourceSummary.supportsLatest == true)

        let sourceDict = DataDict(
            data: [
                "id": API.LongString("dex-source-id"),
                "name": "MangaDex",
                "displayName": "MangaDex (EN)",
                "lang": "en",
                "iconUrl": "/static/dex.png",
                "homeUrl": "https://mangadex.org",
                "supportsLatest": true,
                "isConfigurable": true,
                "contentWarning": GraphQLEnum<API.ContentWarning>(.mixed),
            ],
            fulfilledFragments: [ObjectIdentifier(SourceFields.self)]
        )
        let source = Source(SourceFields(_dataDict: sourceDict))
        #expect(source.id == "dex-source-id")
        #expect(source.displayName == "MangaDex (EN)")
        #expect(source.homeURL?.host == "mangadex.org")
        #expect(source.supportsLatest == true)
        #expect(source.isConfigurable == true)
        #expect(source.contentWarning == .mixed)
    }

    @Test("MangaSummaryFields and MangaFields map correctly to domain models")
    func testMangaFragments() {
        let summaryDict = DataDict(
            data: [
                "id": 101,
                "title": "One Piece",
                "thumbnailUrl": "/thumb/101.jpg",
                "inLibrary": true,
                "unreadCount": 45,
                "downloadCount": 10,
                "sourceId": API.LongString("src-1"),
            ],
            fulfilledFragments: [ObjectIdentifier(MangaSummaryFields.self)]
        )
        let summary = MangaSummary(MangaSummaryFields(_dataDict: summaryDict))
        #expect(summary.id == 101)
        #expect(summary.title == "One Piece")
        #expect(summary.thumbnailURL == "/thumb/101.jpg")
        #expect(summary.inLibrary == true)
        #expect(summary.unreadCount == 45)
        #expect(summary.downloadCount == 10)
        #expect(summary.sourceID == "src-1")

        let mangaDict = DataDict(
            data: [
                "id": 101,
                "title": "One Piece",
                "artist": "Eiichiro Oda",
                "author": "Eiichiro Oda",
                "description": "Pirate adventure",
                "genre": ["Action", "Adventure"],
                "status": GraphQLEnum<API.MangaStatus>(.ongoing),
                "inLibrary": true,
                "inLibraryAt": API.LongString("1729700000000"),
                "thumbnailUrl": "/thumb/101.jpg",
                "thumbnailUrlLastFetched": API.LongString("1729705000000"),
                "sourceId": API.LongString("src-1"),
                "url": "/manga/one-piece",
                "realUrl": "https://example.com/op",
                "unreadCount": 45,
                "downloadCount": 10,
                "bookmarkCount": 2,
                "updateStrategy": GraphQLEnum<API.UpdateStrategy>(.alwaysUpdate),
                "initialized": true,
                "lastFetchedAt": API.LongString("1729705000000"),
                "chaptersLastFetchedAt": API.LongString("1729705000000"),
            ],
            fulfilledFragments: [ObjectIdentifier(MangaFields.self)]
        )
        let manga = Manga(MangaFields(_dataDict: mangaDict))
        #expect(manga.id == 101)
        #expect(manga.title == "One Piece")
        #expect(manga.status == .ongoing)
        #expect(manga.inLibraryAt?.timeIntervalSince1970 == 1_729_700_000)
        #expect(manga.realURL?.absoluteString == "https://example.com/op")
        #expect(manga.isInitialized == true)
    }

    @Test("ChapterFields, ExtensionFields, and PageInfoFields map correctly")
    func testRemainingFragments() {
        let chapterDict = DataDict(
            data: [
                "id": 501,
                "mangaId": 101,
                "name": "Chapter 1",
                "chapterNumber": Double(1.5),
                "pageCount": 24,
                "isBookmarked": true,
                "isDownloaded": false,
                "isRead": true,
                "lastPageRead": 24,
                "lastReadAt": API.LongString("1729700000000"),
                "uploadDate": API.LongString("1700000000000"),
                "fetchedAt": API.LongString("1729700000000"),
                "scanlator": "ScanGroup",
                "sourceOrder": 1,
                "url": "/ch1",
                "realUrl": "https://example.com/ch1",
            ],
            fulfilledFragments: [ObjectIdentifier(ChapterFields.self)]
        )
        let chapter = Chapter(ChapterFields(_dataDict: chapterDict))
        #expect(chapter.id == 501)
        #expect(chapter.chapterNumber == 1.5)
        #expect(chapter.lastReadAt?.timeIntervalSince1970 == 1_729_700_000)
        #expect(chapter.uploadDate?.timeIntervalSince1970 == 1_700_000_000)
        #expect(chapter.realURL?.absoluteString == "https://example.com/ch1")

        let extDict = DataDict(
            data: [
                "pkgName": "eu.kanade.tachiyomi.extension.en.dex",
                "name": "MangaDex",
                "versionName": "1.4.0",
                "versionCodeLong": API.LongString("140"),
                "lang": "en",
                "isInstalled": true,
                "hasUpdate": false,
                "isObsolete": false,
                "iconUrl": "/icon.png",
                "contentWarning": GraphQLEnum<API.ContentWarning>(.safe),
            ],
            fulfilledFragments: [ObjectIdentifier(ExtensionFields.self)]
        )
        let ext = Extension(ExtensionFields(_dataDict: extDict))
        #expect(ext.id == "eu.kanade.tachiyomi.extension.en.dex")
        #expect(ext.versionCode == "140")
        #expect(ext.contentWarning == .safe)

        let pageDict = DataDict(
            data: [
                "hasNextPage": true,
                "hasPreviousPage": false,
                "startCursor": "start",
                "endCursor": "end",
            ],
            fulfilledFragments: [ObjectIdentifier(PageInfoFields.self)]
        )
        let pageInfo = PageInfo(PageInfoFields(_dataDict: pageDict))
        #expect(pageInfo.hasNextPage == true)
        #expect(pageInfo.hasPreviousPage == false)
        #expect(pageInfo.startCursor == "start")
        #expect(pageInfo.endCursor == "end")
    }
}
