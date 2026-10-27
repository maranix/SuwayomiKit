import Foundation
import Testing

@testable import SuwayomiKit

final class MockURLProtocol: URLProtocol, @unchecked Sendable {
    private static let lock = NSLock()
    nonisolated(unsafe) private static var _requestHandler: ((URLRequest) throws -> (HTTPURLResponse, Data))?

    static var requestHandler: ((URLRequest) throws -> (HTTPURLResponse, Data))? {
        get {
            lock.lock()
            defer { lock.unlock() }
            return _requestHandler
        }
        set {
            lock.lock()
            defer { lock.unlock() }
            _requestHandler = newValue
        }
    }

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

private func mockHTTPResponse(
    for request: URLRequest,
    statusCode: Int,
    headers: [String: String]? = nil
) throws -> HTTPURLResponse {
    guard let url = request.url,
        let response = HTTPURLResponse(
            url: url,
            statusCode: statusCode,
            httpVersion: nil,
            headerFields: headers
        )
    else {
        throw URLError(.badServerResponse)
    }
    return response
}

@Suite("Network & Media Tests", .serialized)
struct NetworkTests {
    private func makeMockSession() -> URLSession {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        return URLSession(configuration: configuration)
    }

    @Test("fetchData succeeds with 200 OK and returns payload")
    func testFetchDataSuccess() async throws {
        let session = makeMockSession()
        let expectedBytes = Data([0x89, 0x50, 0x4E, 0x47])

        MockURLProtocol.requestHandler = { request in
            let response = try mockHTTPResponse(
                for: request,
                statusCode: 200,
                headers: ["Content-Type": "image/png"]
            )
            return (response, expectedBytes)
        }
        defer { MockURLProtocol.requestHandler = nil }

        let baseURL = try #require(URL(string: "http://localhost:4567"))
        let client = SuwayomiClient(baseURL: baseURL, urlSession: session)

        let data = try await client.fetchData(from: baseURL.appendingPathComponent("api/v1/page/0"))
        #expect(data == expectedBytes)
    }

    @Test("fetchData injects Authorization and custom headers for same origin")
    func testFetchDataHeaderInjection() async throws {
        let session = makeMockSession()
        nonisolated(unsafe) var capturedHeaders: [String: String]?

        MockURLProtocol.requestHandler = { request in
            capturedHeaders = request.allHTTPHeaderFields
            return (try mockHTTPResponse(for: request, statusCode: 200), Data())
        }
        defer { MockURLProtocol.requestHandler = nil }

        let baseURL = try #require(URL(string: "http://localhost:4567"))
        let client = SuwayomiClient(
            baseURL: baseURL,
            token: "auth_token_xyz",
            headers: ["X-App-Name": "SuwayomiTestRunner"],
            urlSession: session
        )

        _ = try await client.fetchData(from: baseURL.appendingPathComponent("api/v1/page/0"))

        #expect(capturedHeaders?["Authorization"] == "Bearer auth_token_xyz")
        #expect(capturedHeaders?["X-App-Name"] == "SuwayomiTestRunner")
    }

    @Test("fetchData strips credentials when requesting from external CDN hosts (SEC-01)")
    func testFetchDataOriginGuarding() async throws {
        let session = makeMockSession()
        nonisolated(unsafe) var capturedHeaders: [String: String]?

        MockURLProtocol.requestHandler = { request in
            capturedHeaders = request.allHTTPHeaderFields
            return (try mockHTTPResponse(for: request, statusCode: 200), Data())
        }
        defer { MockURLProtocol.requestHandler = nil }

        let baseURL = try #require(URL(string: "http://localhost:4567"))
        let externalURL = try #require(URL(string: "https://uploads.mangadex.org/covers/1.jpg"))
        let client = SuwayomiClient(
            baseURL: baseURL,
            token: "secret_token",
            headers: ["X-Secret": "Sensitive"],
            urlSession: session
        )

        _ = try await client.fetchData(from: externalURL)

        #expect(capturedHeaders?["Authorization"] == nil)
        #expect(capturedHeaders?["X-Secret"] == nil)
    }

    @Test("fetchData maps URLError.cancelled to SuwayomiError.cancelled")
    func testFetchDataCancellationMapping() async throws {
        let session = makeMockSession()

        MockURLProtocol.requestHandler = { _ in
            throw URLError(.cancelled)
        }
        defer { MockURLProtocol.requestHandler = nil }

        let baseURL = try #require(URL(string: "http://localhost:4567"))
        let client = SuwayomiClient(baseURL: baseURL, urlSession: session)

        do {
            _ = try await client.fetchData(from: baseURL.appendingPathComponent("api/v1/page/0"))
            Issue.record("Expected cancellation error")
        } catch {
            #expect(error == .cancelled)
        }
    }

    @Test("fetchData throws http error on non-2xx HTTP status")
    func testFetchDataHTTPError() async throws {
        let session = makeMockSession()

        MockURLProtocol.requestHandler = { request in
            let response = try mockHTTPResponse(for: request, statusCode: 404)
            return (response, Data("Not Found".utf8))
        }
        defer { MockURLProtocol.requestHandler = nil }

        let baseURL = try #require(URL(string: "http://localhost:4567"))
        let client = SuwayomiClient(baseURL: baseURL, urlSession: session)

        do {
            _ = try await client.fetchData(from: baseURL.appendingPathComponent("api/v1/page/999"))
            Issue.record("Expected error to be thrown")
        } catch {
            #expect(error == .http(statusCode: 404, data: Data("Not Found".utf8)))
        }
    }

    @Test("fetchData throws network error on URLError")
    func testFetchDataNetworkError() async throws {
        let session = makeMockSession()

        MockURLProtocol.requestHandler = { _ in
            throw URLError(.notConnectedToInternet)
        }
        defer { MockURLProtocol.requestHandler = nil }

        let baseURL = try #require(URL(string: "http://localhost:4567"))
        let client = SuwayomiClient(baseURL: baseURL, urlSession: session)

        do {
            _ = try await client.fetchData(from: baseURL.appendingPathComponent("api/v1/page/0"))
            Issue.record("Expected error to be thrown")
        } catch {
            guard case .network(let urlError) = error else {
                Issue.record("Expected SuwayomiError.network, got \(error)")
                return
            }
            #expect(urlError.code == .notConnectedToInternet)
        }
    }

    @Test("fetchThumbnail and fetchIcon helper methods execute successfully")
    func testMediaHelperMethods() async throws {
        let session = makeMockSession()
        let mockData = Data("mock-image-bytes".utf8)

        MockURLProtocol.requestHandler = { request in
            (try mockHTTPResponse(for: request, statusCode: 200), mockData)
        }
        defer { MockURLProtocol.requestHandler = nil }

        let baseURL = try #require(URL(string: "http://localhost:4567"))
        let client = SuwayomiClient(baseURL: baseURL, urlSession: session)

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

        let directThumbData = try await client.fetchMedia(from: "/api/v1/manga/1/thumbnail")
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

        let pageData = try await client.fetchPage(at: "/api/v1/page/0")
        #expect(pageData == mockData)
    }
}
