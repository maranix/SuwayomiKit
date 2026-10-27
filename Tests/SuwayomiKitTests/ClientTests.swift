import Foundation
import Testing

@testable import SuwayomiKit

@Suite("Client Tests")
struct ClientTests {
    @Test("Client initialization and URL resolution with standard base URL")
    func testStandardBaseURLResolution() {
        let baseURL = URL(string: "http://localhost:4567")!
        let client = SuwayomiClient(baseURL: baseURL)

        #expect(client.baseURL == baseURL)
        #expect(
            client.resolveURL("/api/v1/manga/1/thumbnail").absoluteString
                == "http://localhost:4567/api/v1/manga/1/thumbnail")
        #expect(
            client.resolveURL("api/v1/manga/1/thumbnail").absoluteString
                == "http://localhost:4567/api/v1/manga/1/thumbnail")
    }

    @Test("Client URL resolution with trailing slash")
    func testTrailingSlashBaseURLResolution() {
        let baseURL = URL(string: "http://localhost:4567/")!
        let client = SuwayomiClient(baseURL: baseURL)

        #expect(
            client.resolveURL("/api/v1/manga/1/thumbnail").absoluteString
                == "http://localhost:4567/api/v1/manga/1/thumbnail")
        #expect(
            client.resolveURL("api/v1/manga/1/thumbnail").absoluteString
                == "http://localhost:4567/api/v1/manga/1/thumbnail")
    }

    @Test("Client URL resolution with reverse proxy subpath")
    func testReverseProxySubpathResolution() {
        let baseURL = URL(string: "http://manga.example.com/suwayomi")!
        let client = SuwayomiClient(baseURL: baseURL)

        #expect(
            client.resolveURL("/api/v1/manga/42/chapter/1/page/0").absoluteString
                == "http://manga.example.com/suwayomi/api/v1/manga/42/chapter/1/page/0")
        #expect(
            client.resolveURL("api/v1/manga/42/chapter/1/page/0").absoluteString
                == "http://manga.example.com/suwayomi/api/v1/manga/42/chapter/1/page/0")
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

    @Test("Client URL resolution handles unencoded spaces in relative and absolute URLs")
    func testURLResolutionWithUnencodedSpaces() {
        let baseURL = URL(string: "http://localhost:4567")!
        let client = SuwayomiClient(baseURL: baseURL)

        #expect(
            client.resolveURL("/api/v1/manga/1/chapter/Page 1.jpg").absoluteString
                == "http://localhost:4567/api/v1/manga/1/chapter/Page%201.jpg")
        #expect(
            client.resolveURL("https://cdn.example.com/images/Cover 1.jpg").absoluteString
                == "https://cdn.example.com/images/Cover%201.jpg")
    }

    @Test("Client URL resolution preserves already percent-encoded URLs")
    func testURLResolutionWithAlreadyEncodedURL() {
        let baseURL = URL(string: "http://localhost:4567")!
        let client = SuwayomiClient(baseURL: baseURL)

        #expect(
            client.resolveURL("/api/v1/manga/1/chapter/Page%201.jpg").absoluteString
                == "http://localhost:4567/api/v1/manga/1/chapter/Page%201.jpg")
    }

    @Test("Client URL resolution with empty or whitespace string falls back to baseURL")
    func testURLResolutionEmptyAndWhitespaceStrings() {
        let baseURL = URL(string: "http://localhost:4567/suwayomi")!
        let client = SuwayomiClient(baseURL: baseURL)

        #expect(client.resolveURL("").absoluteString == "http://localhost:4567/suwayomi")
        #expect(client.resolveURL("   \n").absoluteString == "http://localhost:4567/suwayomi")
    }

    @Test("Token prefix formatting avoids duplicate Bearer prefix and supports Basic")
    func testTokenPrefixFormatting() {
        let baseURL = URL(string: "http://localhost:4567")!
        let bearerClient = SuwayomiClient(baseURL: baseURL, token: "Bearer existing_token")
        #expect(bearerClient.token == "Bearer existing_token")

        let basicClient = SuwayomiClient(baseURL: baseURL, token: "Basic dXNlcjpwYXNz")
        #expect(basicClient.token == "Basic dXNlcjpwYXNz")
    }

    @Test("Authenticated client copy preserves base URL and headers while updating token")
    func testAuthenticatedCopy() {
        let baseURL = URL(string: "http://localhost:4567")!
        let initial = SuwayomiClient(
            baseURL: baseURL,
            token: nil,
            customHeaders: ["X-App": "Test"]
        )
        let authenticated = initial.authenticated(with: "token_abc")

        #expect(authenticated.baseURL == baseURL)
        #expect(authenticated.token == "token_abc")
        #expect(authenticated.customHeaders["X-App"] == "Test")
    }

    @Test("Thumbnail and page URL helper resolution")
    func testThumbnailAndPageURLHelpers() {
        let baseURL = URL(string: "http://localhost:4567")!
        let client = SuwayomiClient(baseURL: baseURL)

        let mangaWithThumb = MangaSummary(
            id: 1,
            title: "Title",
            thumbnailPath: "/api/v1/manga/1/thumbnail",
            inLibrary: false,
            unreadCount: 0,
            downloadCount: 0,
            sourceID: "1"
        )
        let mangaNoThumb = MangaSummary(
            id: 2,
            title: "Title 2",
            thumbnailPath: nil,
            inLibrary: false,
            unreadCount: 0,
            downloadCount: 0,
            sourceID: "1"
        )
        let mangaEmptyThumb = MangaSummary(
            id: 3,
            title: "Title 3",
            thumbnailPath: "",
            inLibrary: false,
            unreadCount: 0,
            downloadCount: 0,
            sourceID: "1"
        )

        #expect(
            client.thumbnailURL(for: mangaWithThumb)?.absoluteString
                == "http://localhost:4567/api/v1/manga/1/thumbnail")
        #expect(client.thumbnailURL(for: mangaNoThumb) == nil)
        #expect(client.thumbnailURL(for: mangaEmptyThumb) == nil)

        let fullManga = makeManga(id: 4, thumbnailPath: "/api/v1/manga/4/thumbnail")
        #expect(
            client.thumbnailURL(for: fullManga)?.absoluteString
                == "http://localhost:4567/api/v1/manga/4/thumbnail")
        #expect(client.thumbnailURL(for: makeManga(id: 5, thumbnailPath: nil)) == nil)

        #expect(
            client.pageURL(for: "/api/v1/page/0").absoluteString
                == "http://localhost:4567/api/v1/page/0")
    }
}
