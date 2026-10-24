import Foundation
@testable import SuwayomiKit
import Testing

@Suite("Client Tests")
struct ClientTests {
    @Test("Client initialization and URL resolution with standard base URL")
    func testStandardBaseURLResolution() {
        let baseURL = URL(string: "http://localhost:4567")!
        let client = SuwayomiClient(baseURL: baseURL)

        #expect(client.baseURL == baseURL)
        #expect(client.resolveURL("/api/v1/manga/1/thumbnail").absoluteString == "http://localhost:4567/api/v1/manga/1/thumbnail")
        #expect(client.resolveURL("api/v1/manga/1/thumbnail").absoluteString == "http://localhost:4567/api/v1/manga/1/thumbnail")
    }

    @Test("Client URL resolution with trailing slash")
    func testTrailingSlashBaseURLResolution() {
        let baseURL = URL(string: "http://localhost:4567/")!
        let client = SuwayomiClient(baseURL: baseURL)

        #expect(client.resolveURL("/api/v1/manga/1/thumbnail").absoluteString == "http://localhost:4567/api/v1/manga/1/thumbnail")
        #expect(client.resolveURL("api/v1/manga/1/thumbnail").absoluteString == "http://localhost:4567/api/v1/manga/1/thumbnail")
    }

    @Test("Client URL resolution with reverse proxy subpath")
    func testReverseProxySubpathResolution() {
        let baseURL = URL(string: "http://manga.example.com/suwayomi")!
        let client = SuwayomiClient(baseURL: baseURL)

        #expect(client.resolveURL("/api/v1/manga/42/chapter/1/page/0").absoluteString == "http://manga.example.com/suwayomi/api/v1/manga/42/chapter/1/page/0")
        #expect(client.resolveURL("api/v1/manga/42/chapter/1/page/0").absoluteString == "http://manga.example.com/suwayomi/api/v1/manga/42/chapter/1/page/0")
    }

    @Test("Client URL resolution preserves absolute URLs")
    func testAbsoluteURLResolution() {
        let baseURL = URL(string: "http://localhost:4567")!
        let client = SuwayomiClient(baseURL: baseURL)

        let extImage = "https://cdn.example.com/images/cover.jpg"
        #expect(client.resolveURL(extImage).absoluteString == extImage)
    }

    @Test("Client initializes with token and custom headers")
    func testTokenAndHeaders() {
        let baseURL = URL(string: "http://localhost:4567")!
        let client = SuwayomiClient(
            baseURL: baseURL,
            token: "test_secret_token",
            customHeaders: ["X-Custom-Client": "SuwayomiReader/1.0"]
        )

        #expect(client.token == "test_secret_token")
        #expect(client.customHeaders["X-Custom-Client"] == "SuwayomiReader/1.0")
    }

    @Test("Convenience init with URL maps correctly")
    func testConvenienceInit() {
        let url = URL(string: "http://127.0.0.1:4567")!
        let client = SuwayomiClient(url: url)
        #expect(client.baseURL == url)
    }
}
