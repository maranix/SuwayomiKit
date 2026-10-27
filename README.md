# SuwayomiKit

A Swift package for communicating with [Suwayomi-Server](https://github.com/Suwayomi/Suwayomi-Server) from Apple platforms without the hassle of GraphQL.

Suwayomi-Server (formerly Tachidesk) is a self-hosted manga server that runs sources, manages a library, and serves chapters and page images. SuwayomiKit is the native Swift layer on top of that server: strongly-typed domain models, a modern `async`/`await` client, automatic URL resolution, and media/image fetching with authentication header support.

## Status

**Active Implementation.** SuwayomiKit provides high-level typed APIs for all core domains:
- **Server**: Server info, server settings, authentication (login, refresh token), image cache management
- **Library**: Manga listing, category filtering, library updates (start/stop/status)
- **Categories**: Full CRUD and category reordering
- **Manga**: Details, in-library status toggling, categories management, metadata refresh
- **Chapters**: List chapters by manga, update read/bookmark/page status, fetch page URLs
- **Sources & Extensions**: Browse sources, search/popular/latest manga from sources, manage extensions (install/update/uninstall)
- **Downloads**: Download queue status, start/stop/clear downloader, enqueue/dequeue downloads, delete downloaded chapters
- **Media**: Thumbnail and chapter page image fetching with automatic auth injection

## Features

- **Swift 6 Strict Concurrency**: Domain models are `Sendable` value types; entity models conform to `Identifiable` and `Hashable`.
- **Pure Swift Domain Models**: Isolates client applications completely from raw GraphQL and Apollo-generated types.
- **Typed Errors**: Uses typed Swift throws (`throws(SuwayomiError)`) for explicit, clean error handling.
- **Base URL & Reverse Proxy Support**: Automatically derives the GraphQL endpoint and resolves relative media paths (`/api/v1/...`) against arbitrary server base URLs, subpaths, and custom GraphQL routes.
- **Token & Custom Headers**: Seamlessly handles Bearer token authentication and custom HTTP headers for both GraphQL requests and direct media/page image downloads. Credentials are redacted from descriptions and stripped on cross-origin redirects.
- **Chapter Ordering**: Multi-key chapter sorting with ascending/descending directions.

## Requirements

- Swift 6.0 or later (Tested with Swift 6.3)
- macOS 15+ / iOS 15+
- Apollo iOS 2.x
- A running Suwayomi-Server instance

## Installation

Add the package to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/maranix/SuwayomiKit.git", branch: "main")
]
```

Then depend on `SuwayomiKit` in your target:

```swift
.target(
    name: "MyApp",
    dependencies: [
        .product(name: "SuwayomiKit", package: "SuwayomiKit")
    ]
)
```

## Quick Start

### Initialize Client

```swift
import SuwayomiKit

let client = SuwayomiClient(
    baseURL: URL(string: "http://localhost:4567")!,
    token: "optional_bearer_token",
    headers: ["X-App-Name": "MyReader"]
)
```

### Browse Library & Categories

```swift
// Fetch library mangas (optionally filtered by category IDs or source)
let libraryResult = try await client.library(categoryIDs: [1], first: 20, offset: 0)
for manga in libraryResult {
    print("Manga: \(manga.title) (ID: \(manga.id))")
}

// Fetch categories
let categories = try await client.categories()
for category in categories {
    print("Category: \(category.name) (ID: \(category.id))")
}

// Browse sources by language and filter by content warning server-side
let sourcesResult = try await client.sources(lang: "en", contentWarning: .safe)
for source in sourcesResult {
    print("Source: \(source.displayName) (ID: \(source.id))")
}
```

### Summary vs. Full Models

List and grid queries return lightweight models to avoid fetching fields the UI does not need:

- `library(...)` returns `PagedResult<MangaSummary>`
- `sources(...)` returns `PagedResult<SourceSummary>`

Use `manga(id:)` or `source(id:)` when the complete model is required. `MangaSummary` and `SourceSummary` conform to `MangaPreview` and `SourcePreview`, so generic list UI and the media helpers work with either tier.

`Manga.categories` is `nil` when the endpoint did not request categories, and a (possibly empty) array when it did. Manga returned from mutations does not fetch categories.

### Read Manga & Chapters

```swift
// Get manga details
let manga = try await client.manga(id: 1)

// Fetch chapters for the manga (optionally filter unread or bookmarked)
let chaptersResult = try await client.chapters(
    mangaId: manga.id,
    isRead: false,
    order: [ChapterOrder(by: .uploadDate, direction: .descending)]
)
if let chapter = chaptersResult.first {
    // Fetch chapter page URLs
    let pages = try await client.fetchChapterPages(chapterId: chapter.id)
    
    // Download first page image or resolve URL for SwiftUI AsyncImage / Kingfisher
    if let firstPagePath = pages.first {
        if let pageURL = client.pageURL(for: firstPagePath) {
            print("Page URL: \(pageURL)")
        }
        let imageData = try await client.fetchPage(at: firstPagePath)
        print("Downloaded: \(imageData.count) bytes")
    }

    // Mark chapter as read
    let updatedChapter = try await client.updateChapter(
        id: chapter.id,
        isRead: true,
        lastPageRead: chapter.pageCount
    )
}
```

### Media & Thumbnails

Model fields such as `thumbnailPath` and `iconPath` are server-relative paths. Use the client helpers below to resolve them against the configured `baseURL`.

```swift
// Get resolved URL for UI image loaders (Kingfisher, Nuke, AsyncImage)
if let thumbnailURL = client.thumbnailURL(for: manga) {
    print("Thumbnail URL: \(thumbnailURL)")
}

// Or directly download image data with automatic authorization headers
if let thumbnailData = try await client.fetchThumbnail(for: manga) {
    print("Loaded thumbnail: \(thumbnailData.count) bytes")
}
```

### Manage Download Queue

```swift
// Check download queue
let status = try await client.downloadQueueStatus()
print("Downloader state: \(status.state), Queued items: \(status.queue.count)")

// Enqueue chapter for offline reading
let state = try await client.enqueueDownload(chapterId: 10)
```

### Authentication, Custom Endpoints & Cache

```swift
// Add or replace the bearer token without losing the Apollo cache
let authenticated = client.authenticated(with: "fresh_token")

// Point at a reverse proxy or non-default GraphQL route
let proxyClient = SuwayomiClient(
    baseURL: URL(string: "https://reader.example.com/suwayomi")!,
    graphQLPath: "/custom/graphql"
)

// Clear the local normalized cache
try await authenticated.clearCache()
```

`SuwayomiClient` redacts tokens and header values from `description` output. Media
requests also strip managed headers if a redirect leaves the configured server
origin or subpath.

## Development

GraphQL operations live in `GraphQL/Queries`, `GraphQL/Mutations`, and `GraphQL/Fragments`. The schema is at `GraphQL/schema.graphqls`.

```sh
make schema    # Download latest schema from Suwayomi-Server
make generate  # Regenerate Apollo GraphQL Swift sources
make test      # Run test suite
make format    # Format code
make lint      # Lint code
swift build    # Build package
```

## Roadmap

- [x] Package layout and public product
- [x] Apollo client and code generation
- [x] Typed domain models (`Sendable`, `Hashable`, `Identifiable`)
- [x] Async/await `SuwayomiClient`
- [x] Core models and operations (library, sources, extensions, categories)
- [x] Chapter and page retrieval
- [x] Media/image fetcher with auth & reverse proxy URL resolution
- [x] Download queue management
- [x] Error model (`SuwayomiError`)
- [x] Unit test suite (`ClientTests`, `GraphQLTests`, `ModelTests`, `ModelMappingTests`, `NetworkTests`)
- [ ] Subscriptions / WebSockets for real-time download and update events
- [ ] DocC documentation

## Contributing

Issues and pull requests are welcome. Please keep changes focused, format code with `make format`, and make sure `swift build` and `make test` pass before committing.

## License

MIT — see [LICENSE](LICENSE).
