import API
@_spi(Unsafe) import ApolloAPI
import Foundation
import Testing

@testable import SuwayomiKit

@Suite("Model Mapping & Error Tests")
struct ModelMappingTests {
    @Test("Enum mapping correctly falls back for unknown/nil values")
    func testEnumFallbacks() {
        // MangaStatus
        #expect(MangaStatus.from(nil) == .unknown)
        #expect(MangaStatus.from(GraphQLEnum(.ongoing)) == .ongoing)
        #expect(MangaStatus.from(GraphQLEnum(.completed)) == .completed)
        #expect(MangaStatus.from(GraphQLEnum(.licensed)) == .licensed)
        #expect(MangaStatus.from(GraphQLEnum(.publishingFinished)) == .publishingFinished)
        #expect(MangaStatus.from(GraphQLEnum(.cancelled)) == .cancelled)
        #expect(MangaStatus.from(GraphQLEnum(.onHiatus)) == .onHiatus)

        // UpdateStrategy
        #expect(UpdateStrategy.from(nil) == .alwaysUpdate)
        #expect(UpdateStrategy.from(GraphQLEnum(.alwaysUpdate)) == .alwaysUpdate)
        #expect(UpdateStrategy.from(GraphQLEnum(.onlyFetchOnce)) == .onlyFetchOnce)

        // CategoryIncludeOrExclude
        #expect(CategoryIncludeOrExclude.from(nil) == .unset)
        #expect(CategoryIncludeOrExclude.from(GraphQLEnum(.include)) == .include)
        #expect(CategoryIncludeOrExclude.from(GraphQLEnum(.exclude)) == .exclude)
        #expect(CategoryIncludeOrExclude.from(GraphQLEnum(.unset)) == .unset)
        #expect(CategoryIncludeOrExclude.include.toAPI() == .include)
        #expect(CategoryIncludeOrExclude.exclude.toAPI() == .exclude)
        #expect(CategoryIncludeOrExclude.unset.toAPI() == .unset)

        // ContentWarning
        #expect(ContentWarning.from(nil) == .safe)
        #expect(ContentWarning.from(GraphQLEnum(.safe)) == .safe)
        #expect(ContentWarning.from(GraphQLEnum(.mixed)) == .mixed)
        #expect(ContentWarning.from(GraphQLEnum(.nsfw)) == .nsfw)

        // DownloaderState
        #expect(DownloaderState.from(nil) == .stopped)
        #expect(DownloaderState.from(GraphQLEnum(.started)) == .started)
        #expect(DownloaderState.from(GraphQLEnum(.stopped)) == .stopped)

        // DownloadState
        #expect(DownloadState.from(nil) == .error)
        #expect(DownloadState.from(GraphQLEnum(.queued)) == .queued)
        #expect(DownloadState.from(GraphQLEnum(.downloading)) == .downloading)
        #expect(DownloadState.from(GraphQLEnum(.finished)) == .finished)
        #expect(DownloadState.from(GraphQLEnum(.error)) == .error)

        // AuthMode
        #expect(AuthMode.from(nil) == .none)
        #expect(AuthMode.from(GraphQLEnum(.none)) == .none)
        #expect(AuthMode.from(GraphQLEnum(.basicAuth)) == .basicAuth)
        #expect(AuthMode.from(GraphQLEnum(.simpleLogin)) == .simpleLogin)
        #expect(AuthMode.from(GraphQLEnum(.uiLogin)) == .uiLogin)
    }

    @Test("SuwayomiError errorDescription formatting across all cases")
    func testSuwayomiErrorDescriptions() {
        let missing = SuwayomiError.missingData
        #expect(missing.errorDescription == "The server returned an empty response")

        let server = SuwayomiError.server(message: "502 Bad Gateway")
        #expect(server.errorDescription == "502 Bad Gateway")

        let unexpected = SuwayomiError.unexpected("Parse failed")
        #expect(unexpected.errorDescription == "Parse failed")

        let network = SuwayomiError.network(URLError(.timedOut))
        #expect(network.errorDescription != nil)

        let opWithError = OperationError(
            description: "desc",
            localizedDescription: "loc_desc",
            message: "Field 'foo' not found",
            errorDescription: nil
        )
        let operationErr = SuwayomiError.operation([opWithError])
        #expect(operationErr.errorDescription == "Field 'foo' not found")

        let opWithNoMsg = OperationError(
            description: "desc",
            localizedDescription: "GraphQL syntax error",
            message: nil,
            errorDescription: nil
        )
        let operationFallbackErr = SuwayomiError.operation([opWithNoMsg])
        #expect(operationFallbackErr.errorDescription == "GraphQL syntax error")
    }

    @Test("Apollo CategoryFields and SourceFields map correctly to domain models")
    func testFragmentMappings() {
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
        let category = Category.from(CategoryFields(_dataDict: categoryDict))
        #expect(category.id == 42)
        #expect(category.name == "Manga Favorites")
        #expect(category.isDefault == true)
        #expect(category.isDefaultCategory == false)
        #expect(category.includeInDownload == CategoryIncludeOrExclude.include)
        #expect(category.includeInUpdate == CategoryIncludeOrExclude.exclude)

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
        let source = Source.from(SourceFields(_dataDict: sourceDict))
        #expect(source.id == "dex-source-id")
        #expect(source.displayName == "MangaDex (EN)")
        #expect(source.supportsLatest == true)
        #expect(source.isConfigurable == true)
        #expect(source.contentWarning == ContentWarning.mixed)
    }
}
