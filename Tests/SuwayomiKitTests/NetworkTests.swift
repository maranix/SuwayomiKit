import Foundation
import Testing

@testable import SuwayomiKit

final class MockURLProtocol: URLProtocol, @unchecked Sendable {
    nonisolated(unsafe) static var requestHandler: ((URLRequest) throws -> (HTTPURLResponse, Data))?

    override static func canInit(with request: URLRequest) -> Bool {
        true
    }

    override static func canInit(with task: URLSessionTask) -> Bool {
        true
    }

    override static func canonicalRequest(for request: URLRequest) -> URLRequest {
        request
    }

    override func startLoading() {
        guard let handler = MockURLProtocol.requestHandler else {
            client?.urlProtocol(self, didFailWithError: URLError(.unknown))
            return
        }

        do {
            let (response, data) = try handler(request)
            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            client?.urlProtocol(self, didLoad: data)
            client?.urlProtocolDidFinishLoading(self)
        } catch {
            client?.urlProtocol(self, didFailWithError: error)
        }
    }

    override func stopLoading() {}
}

@Suite("Network & Media Tests", .serialized)
struct NetworkTests {
    private func makeMockSession() -> URLSession {
        URLProtocol.registerClass(MockURLProtocol.self)
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        return URLSession(configuration: configuration)
    }

    @Test("fetchData succeeds with 200 OK and returns payload")
    func testFetchDataSuccess() async throws {
        let session = makeMockSession()
        let expectedBytes = Data([0x89, 0x50, 0x4E, 0x47])  // PNG header

        MockURLProtocol.requestHandler = { request in
            let response = HTTPURLResponse(
                url: request.url!,
                statusCode: 200,
                httpVersion: nil,
                headerFields: ["Content-Type": "image/png"]
            )!
            return (response, expectedBytes)
        }

        let client = SuwayomiClient(
            baseURL: URL(string: "http://localhost:4567")!,
            urlSession: session
        )

        let data = try await client.fetchData(from: URL(string: "http://localhost:4567/api/v1/page/0")!)
        #expect(data == expectedBytes)
    }

    @Test("fetchData injects Authorization and custom headers")
    func testFetchDataHeaderInjection() async throws {
        let session = makeMockSession()
        nonisolated(unsafe) var capturedHeaders: [String: String]?

        MockURLProtocol.requestHandler = { request in
            capturedHeaders = request.allHTTPHeaderFields
            let response = HTTPURLResponse(
                url: request.url!,
                statusCode: 200,
                httpVersion: nil,
                headerFields: nil
            )!
            return (response, Data())
        }

        let client = SuwayomiClient(
            baseURL: URL(string: "http://localhost:4567")!,
            token: "auth_token_xyz",
            customHeaders: ["X-App-Name": "SuwayomiTestRunner"],
            urlSession: session
        )

        _ = try await client.fetchData(from: URL(string: "http://localhost:4567/api/v1/page/0")!)

        #expect(capturedHeaders?["Authorization"] == "Bearer auth_token_xyz")
        #expect(capturedHeaders?["X-App-Name"] == "SuwayomiTestRunner")
    }

    @Test("fetchData throws server error on non-2xx HTTP status")
    func testFetchDataHTTPError() async {
        let session = makeMockSession()

        MockURLProtocol.requestHandler = { request in
            let response = HTTPURLResponse(
                url: request.url!,
                statusCode: 404,
                httpVersion: nil,
                headerFields: nil
            )!
            return (response, Data())
        }

        let client = SuwayomiClient(
            baseURL: URL(string: "http://localhost:4567")!,
            urlSession: session
        )

        do {
            _ = try await client.fetchData(from: URL(string: "http://localhost:4567/api/v1/page/999")!)
            #expect(Bool(false), "Expected error to be thrown")
        } catch {
            switch error {
            case .server(let message):
                #expect(message.contains("404"))
            default:
                #expect(Bool(false), "Expected SuwayomiError.server, got \(error)")
            }
        }
    }

    @Test("fetchData throws network error on URLError")
    func testFetchDataNetworkError() async {
        let session = makeMockSession()

        MockURLProtocol.requestHandler = { _ in
            throw URLError(.notConnectedToInternet)
        }

        let client = SuwayomiClient(
            baseURL: URL(string: "http://localhost:4567")!,
            urlSession: session
        )

        do {
            _ = try await client.fetchData(from: URL(string: "http://localhost:4567/api/v1/page/0")!)
            #expect(Bool(false), "Expected error to be thrown")
        } catch {
            switch error {
            case .network(let urlError):
                #expect(urlError.code == .notConnectedToInternet)
            default:
                #expect(Bool(false), "Expected SuwayomiError.network, got \(error)")
            }
        }
    }

    @Test("fetchThumbnail and fetchIcon helper methods execute successfully")
    func testMediaHelperMethods() async throws {
        let session = makeMockSession()
        let mockData = Data("mock-image-bytes".utf8)

        MockURLProtocol.requestHandler = { request in
            let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!
            return (response, mockData)
        }

        let client = SuwayomiClient(
            baseURL: URL(string: "http://localhost:4567")!,
            urlSession: session
        )

        let manga = MangaSummary(
            id: 1,
            title: "Manga",
            thumbnailPath: "/api/v1/manga/1/thumbnail",
            inLibrary: false,
            unreadCount: 0,
            downloadCount: 0,
            sourceID: "1"
        )
        let thumbData = try await client.fetchThumbnail(for: manga)
        #expect(thumbData == mockData)

        let directThumbData = try await client.fetchThumbnail(from: "/api/v1/manga/1/thumbnail")
        #expect(directThumbData == mockData)

        let fullManga = makeManga(id: 3, thumbnailPath: "/api/v1/manga/3/thumbnail")
        let fullThumbData = try await client.fetchThumbnail(for: fullManga)
        #expect(fullThumbData == mockData)

        let mangaNoThumb = MangaSummary(
            id: 2,
            title: "No Thumb",
            thumbnailPath: nil,
            inLibrary: false,
            unreadCount: 0,
            downloadCount: 0,
            sourceID: "1"
        )
        let noThumbData = try await client.fetchThumbnail(for: mangaNoThumb)
        #expect(noThumbData == nil)

        let source = Source(
            id: "1",
            name: "Dex",
            displayName: "MangaDex",
            lang: "en",
            iconPath: "/icon.png",
            homeURL: nil,
            supportsLatest: true,
            isConfigurable: false,
            contentWarning: .safe
        )
        let iconData = try await client.fetchIcon(for: source)
        #expect(iconData == mockData)

        let sourceSummary = SourceSummary(
            id: "2",
            name: "Dex",
            displayName: "MangaDex",
            lang: "en",
            iconPath: "/icon-2.png",
            supportsLatest: true
        )
        let summaryIconData = try await client.fetchIcon(for: sourceSummary)
        #expect(summaryIconData == mockData)

        let sourceWithoutIcon = SourceSummary(
            id: "3",
            name: "No Icon",
            displayName: "No Icon Source",
            lang: "en",
            iconPath: "",
            supportsLatest: false
        )
        let noIconData = try await client.fetchIcon(for: sourceWithoutIcon)
        #expect(noIconData == nil)

        let extensionFixture = Extension(
            pkgName: "eu.kanade.tachiyomi.extension.en.dex",
            name: "MangaDex",
            versionName: "1.4.0",
            versionCode: "140",
            lang: "en",
            isInstalled: true,
            hasUpdate: false,
            isObsolete: false,
            iconPath: "/icon-ext.png",
            contentWarning: .safe
        )
        let extensionIconData = try await client.fetchIcon(for: extensionFixture)
        #expect(extensionIconData == mockData)

        let pageData = try await client.fetchPageImageData(pagePathOrURL: "/api/v1/page/0")
        #expect(pageData == mockData)
    }
}
