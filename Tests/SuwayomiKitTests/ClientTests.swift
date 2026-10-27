import Foundation
import SuwayomiKit
import Testing

@Suite("Client Tests")
struct ClientTests {
    @Test("Client initialization and URL resolution with standard base URL")
    func testStandardBaseURLResolution() throws {
        let baseURL = try #require(URL(string: "http://localhost:4567"))
        let client = SuwayomiClient(baseURL: baseURL)

        #expect(client.baseURL == baseURL)
        #expect(
            client.resolveURL("/api/v1/manga/1/thumbnail")?.absoluteString
                == "http://localhost:4567/api/v1/manga/1/thumbnail")
        #expect(
            client.resolveURL("api/v1/manga/1/thumbnail")?.absoluteString
                == "http://localhost:4567/api/v1/manga/1/thumbnail")
    }

    @Test("Client URL resolution with trailing slash")
    func testTrailingSlashBaseURLResolution() throws {
        let baseURL = try #require(URL(string: "http://localhost:4567/"))
        let client = SuwayomiClient(baseURL: baseURL)

        #expect(
            client.resolveURL("/api/v1/manga/1/thumbnail")?.absoluteString
                == "http://localhost:4567/api/v1/manga/1/thumbnail")
        #expect(
            client.resolveURL("api/v1/manga/1/thumbnail")?.absoluteString
                == "http://localhost:4567/api/v1/manga/1/thumbnail")
    }

    @Test("Client URL resolution with reverse proxy subpath")
    func testReverseProxySubpathResolution() throws {
        let baseURL = try #require(URL(string: "http://manga.example.com/suwayomi"))
        let client = SuwayomiClient(baseURL: baseURL)

        #expect(
            client.resolveURL("/api/v1/manga/42/chapter/1/page/0")?.absoluteString
                == "http://manga.example.com/suwayomi/api/v1/manga/42/chapter/1/page/0")
        #expect(
            client.resolveURL("api/v1/manga/42/chapter/1/page/0")?.absoluteString
                == "http://manga.example.com/suwayomi/api/v1/manga/42/chapter/1/page/0")
        #expect(
            client.config.graphQLEndpoint.absoluteString
                == "http://manga.example.com/suwayomi/api/graphql")
    }

    @Test("Client URL resolution preserves absolute URLs")
    func testAbsoluteURLResolution() throws {
        let baseURL = try #require(URL(string: "http://localhost:4567"))
        let client = SuwayomiClient(baseURL: baseURL)

        let extImage = "https://cdn.example.com/images/cover.jpg"
        #expect(client.resolveURL(extImage)?.absoluteString == extImage)
    }

    @Test("Client normalizes baseURL when passed /api/graphql")
    func testBaseURLGraphQLStripping() throws {
        let endpointURL = try #require(URL(string: "http://localhost:4567/api/graphql/"))
        let client = SuwayomiClient(baseURL: endpointURL)

        #expect(client.baseURL.absoluteString == "http://localhost:4567")
        #expect(client.config.graphQLEndpoint.absoluteString == "http://localhost:4567/api/graphql")
        #expect(
            client.resolveURL("/api/v1/manga/1/thumbnail")?.absoluteString
                == "http://localhost:4567/api/v1/manga/1/thumbnail")
    }

    @Test("Client initializes with token and headers")
    func testTokenAndHeaders() throws {
        let baseURL = try #require(URL(string: "http://localhost:4567"))
        let client = SuwayomiClient(
            baseURL: baseURL,
            token: "test_secret_token",
            headers: ["X-Custom-Client": "SuwayomiReader/1.0"]
        )

        #expect(client.token == "test_secret_token")
        #expect(client.headers["X-Custom-Client"] == "SuwayomiReader/1.0")
    }

    @Test("Convenience init with URL maps correctly")
    func testConvenienceInit() throws {
        let url = try #require(URL(string: "http://127.0.0.1:4567"))
        let client = SuwayomiClient(url: url)
        #expect(client.baseURL == url)
    }

    @Test("Client URL resolution handles unencoded spaces in relative and absolute URLs")
    func testURLResolutionWithUnencodedSpaces() throws {
        let baseURL = try #require(URL(string: "http://localhost:4567"))
        let client = SuwayomiClient(baseURL: baseURL)

        #expect(
            client.resolveURL("/api/v1/manga/1/chapter/Page 1.jpg")?.absoluteString
                == "http://localhost:4567/api/v1/manga/1/chapter/Page%201.jpg")
        #expect(
            client.resolveURL("https://cdn.example.com/images/Cover 1.jpg")?.absoluteString
                == "https://cdn.example.com/images/Cover%201.jpg")
    }

    @Test("Client URL resolution preserves already percent-encoded URLs")
    func testURLResolutionWithAlreadyEncodedURL() throws {
        let baseURL = try #require(URL(string: "http://localhost:4567"))
        let client = SuwayomiClient(baseURL: baseURL)

        #expect(
            client.resolveURL("/api/v1/manga/1/chapter/Page%201.jpg")?.absoluteString
                == "http://localhost:4567/api/v1/manga/1/chapter/Page%201.jpg")
    }

    @Test("Client URL resolution preserves query strings and fragments")
    func testURLResolutionWithQueryAndFragment() throws {
        let baseURL = try #require(URL(string: "http://localhost:4567/suwayomi"))
        let client = SuwayomiClient(baseURL: baseURL)

        #expect(
            client.resolveURL("/api/v1/manga/1/thumbnail?lastModified=1729700000")?.absoluteString
                == "http://localhost:4567/suwayomi/api/v1/manga/1/thumbnail?lastModified=1729700000")
        #expect(
            client.resolveURL("api/v1/manga/1/thumbnail?lastModified=1729700000")?.absoluteString
                == "http://localhost:4567/suwayomi/api/v1/manga/1/thumbnail?lastModified=1729700000")
        #expect(
            client.resolveURL("/api/v1/page/0?redirect=https://example.com/x")?.absoluteString
                == "http://localhost:4567/suwayomi/api/v1/page/0?redirect=https://example.com/x")
        #expect(
            client.resolveURL("/api/Page#1.jpg")?.absoluteString
                == "http://localhost:4567/suwayomi/api/Page#1.jpg")
        #expect(
            client.resolveURL("/api/v1/page/0#a b")?.absoluteString
                == "http://localhost:4567/suwayomi/api/v1/page/0#a%20b")
    }

    @Test("Client URL resolution encodes raw query values without trapping")
    func testURLResolutionWithRawQueryCharacters() throws {
        let baseURL = try #require(URL(string: "http://localhost:4567"))
        let client = SuwayomiClient(baseURL: baseURL)

        #expect(
            client.resolveURL("/api/v1/page/0?q=a b")?.absoluteString
                == "http://localhost:4567/api/v1/page/0?q=a%20b")
        #expect(
            client.resolveURL("/api/v1/page/0?q=café")?.absoluteString
                == "http://localhost:4567/api/v1/page/0?q=caf%C3%A9")
        #expect(
            client.resolveURL("/api/v1/page/0?q=a%20b")?.absoluteString
                == "http://localhost:4567/api/v1/page/0?q=a%20b")
        #expect(
            client.resolveURL("/api/v1/page/0?q=100%")?.absoluteString
                == "http://localhost:4567/api/v1/page/0?q=100%25")
        #expect(
            client.resolveURL("/api/v1/page/0?q=%zz")?.absoluteString
                == "http://localhost:4567/api/v1/page/0?q=%25zz")
    }

    @Test("Client URL resolution handles colons in relative paths")
    func testURLResolutionWithColonsInRelativePaths() throws {
        let baseURL = try #require(URL(string: "http://localhost:4567"))
        let client = SuwayomiClient(baseURL: baseURL)

        #expect(
            client.resolveURL("/api/Chapter 1: Start.jpg")?.absoluteString
                == "http://localhost:4567/api/Chapter%201:%20Start.jpg")
    }

    @Test("Client URL resolution preserves encoded path separators")
    func testURLResolutionPreservesEncodedPathSeparators() throws {
        let baseURL = try #require(URL(string: "http://localhost:4567"))
        let client = SuwayomiClient(baseURL: baseURL)

        #expect(
            client.resolveURL("/api/a%2Fb.jpg")?.absoluteString
                == "http://localhost:4567/api/a%2Fb.jpg")
        #expect(
            client.resolveURL("/api/100%25.jpg")?.absoluteString
                == "http://localhost:4567/api/100%25.jpg")
    }

    @Test("Client honors a custom GraphQL path and normalizes endpoint URLs")
    func testCustomGraphQLPath() throws {
        let baseURL = try #require(URL(string: "http://example.com/app/custom/graphql/"))
        var config = SuwayomiClientConfig(baseURL: baseURL, graphQLPath: "/custom/graphql")

        #expect(config.baseURL.absoluteString == "http://example.com/app")
        #expect(config.graphQLEndpoint.absoluteString == "http://example.com/app/custom/graphql")

        config.graphQLPath = "custom/graphql/"
        #expect(config.graphQLEndpoint.absoluteString == "http://example.com/app/custom/graphql")
    }

    @Test("GraphQL endpoint drops base URL query and fragment")
    func testGraphQLEndpointDropsBaseQueryAndFragment() throws {
        let baseURL = try #require(URL(string: "http://example.com/app/api/graphql?x=1#frag"))
        let config = SuwayomiClientConfig(baseURL: baseURL)

        #expect(config.baseURL.absoluteString == "http://example.com/app")
        #expect(config.graphQLEndpoint.absoluteString == "http://example.com/app/api/graphql")
    }

    @Test("Client URL resolution returns nil for empty, whitespace, and invalid URLs")
    func testURLResolutionEmptyAndWhitespaceStrings() throws {
        let baseURL = try #require(URL(string: "http://localhost:4567/suwayomi"))
        let client = SuwayomiClient(baseURL: baseURL)

        #expect(client.resolveURL("") == nil)
        #expect(client.resolveURL("   \n") == nil)
        #expect(client.resolveURL("//cdn.example.com/x.jpg") == nil)
        #expect(client.resolveURL("javascript:alert(1)") == nil)
        #expect(client.resolveURL("ftp://example.com/file.jpg") == nil)
    }

    @Test("Origin guard detects same origin vs external CDN")
    func testOriginGuard() throws {
        let config = SuwayomiClientConfig(
            baseURL: try #require(URL(string: "http://localhost:4567/suwayomi")),
            token: "my_token",
            headers: ["X-App": "Test"]
        )

        let localURL = try #require(URL(string: "http://localhost:4567/suwayomi/api/v1/manga/1/thumbnail"))
        let cdnURL = try #require(URL(string: "https://uploads.mangadex.org/covers/1.jpg"))
        let otherSubpath = try #require(URL(string: "http://localhost:4567/otherapp/data"))

        #expect(config.isSameOriginAndPrefix(localURL) == true)
        #expect(config.isSameOriginAndPrefix(cdnURL) == false)
        #expect(config.isSameOriginAndPrefix(otherSubpath) == false)

        let localHeaders = config.resolvedHeaders(for: localURL)
        #expect(localHeaders["Authorization"] == "Bearer my_token")
        #expect(localHeaders["X-App"] == "Test")

        let cdnHeaders = config.resolvedHeaders(for: cdnURL)
        #expect(cdnHeaders.isEmpty)
        #expect(config.resolvedHeaders(for: otherSubpath).isEmpty)

        let defaultPortConfig = SuwayomiClientConfig(
            baseURL: try #require(URL(string: "https://example.com/suwayomi"))
        )
        let implicitPort = try #require(URL(string: "https://example.com/suwayomi/api/v1/page/0"))
        let explicitPort = try #require(URL(string: "https://example.com:443/suwayomi/api/v1/page/0"))
        #expect(defaultPortConfig.isSameOriginAndPrefix(implicitPort))
        #expect(defaultPortConfig.isSameOriginAndPrefix(explicitPort))
    }

    @Test("Token prefix formatting avoids duplicate Bearer prefix and supports Basic")
    func testTokenPrefixFormatting() throws {
        let baseURL = try #require(URL(string: "http://localhost:4567"))
        let bearerClient = SuwayomiClient(baseURL: baseURL, token: "Bearer existing_token")
        #expect(bearerClient.token == "Bearer existing_token")
        #expect(bearerClient.config.resolvedHeaders()["Authorization"] == "Bearer existing_token")

        let basicClient = SuwayomiClient(baseURL: baseURL, token: "Basic dXNlcjpwYXNz")
        #expect(basicClient.token == "Basic dXNlcjpwYXNz")
        #expect(basicClient.config.resolvedHeaders()["Authorization"] == "Basic dXNlcjpwYXNz")
    }

    @Test("Authenticated client copy preserves base URL and headers while updating token")
    func testAuthenticatedCopy() throws {
        let baseURL = try #require(URL(string: "http://localhost:4567"))
        let initial = SuwayomiClient(
            baseURL: baseURL,
            token: nil,
            headers: ["X-App": "Test"]
        )
        let authenticated = initial.authenticated(with: "token_abc")

        #expect(authenticated.baseURL == baseURL)
        #expect(authenticated.token == "token_abc")
        #expect(authenticated.headers["X-App"] == "Test")
        #expect(authenticated.isAuthenticated)
        #expect(initial.isAuthenticated == false)
    }

    @Test("Client descriptions redact credentials")
    func testCredentialRedaction() throws {
        let baseURL = try #require(URL(string: "http://localhost:4567"))
        let client = SuwayomiClient(
            baseURL: baseURL,
            token: "super-secret-token",
            headers: ["X-Api-Key": "super-secret-header"]
        )

        let description = String(describing: client)
        let configDescription = String(describing: client.config)
        let debugDescription = String(reflecting: client)

        #expect(!description.contains("super-secret-token"))
        #expect(!description.contains("super-secret-header"))
        #expect(!configDescription.contains("super-secret-token"))
        #expect(!debugDescription.contains("super-secret-token"))
        #expect(description.contains("<redacted>"))
        #expect(description.contains("X-Api-Key"))

        let userInfoURL = try #require(URL(string: "http://user:password@localhost:4567"))
        let userInfoConfig = SuwayomiClientConfig(baseURL: userInfoURL)
        #expect(!String(describing: userInfoConfig).contains("password"))
    }

    @Test("Thumbnail and page URL helper resolution")
    func testThumbnailAndPageURLHelpers() throws {
        let baseURL = try #require(URL(string: "http://localhost:4567"))
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
            client.pageURL(for: "/api/v1/page/0")?.absoluteString
                == "http://localhost:4567/api/v1/page/0")
    }
}
