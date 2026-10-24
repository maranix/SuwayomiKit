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

- **Swift 6 Strict Concurrency**: All domain models conform to `Sendable, Equatable, Identifiable, Codable`.
- **Pure Swift Domain Models**: Isolates client applications completely from raw GraphQL and Apollo-generated types.
- **Typed Errors**: Uses typed Swift throws (`throws(SuwayomiError)`) for explicit, clean error handling.
- **Base URL & Reverse Proxy Support**: Automatically derives GraphQL endpoint and resolves relative media paths (`/api/v1/...`) against arbitrary server base URLs and subpaths.
- **Token & Custom Headers**: Seamlessly handles Bearer token authentication and custom HTTP headers for both GraphQL requests and direct media/page image downloads.

## Requirements

- Swift 6.0 or later (Tested with Swift 6.3)
- macOS 14+ / iOS 17+ (Package platform targets macOS 26 / iOS 26)
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
    customHeaders: ["X-App-Name": "MyReader"]
)
```

### Browse Library & Categories

```swift
// Fetch library mangas
let libraryResult = try await client.library(first: 20, offset: 0)
for manga in libraryResult.items {
    print("Manga: \(manga.title) (ID: \(manga.id))")
}

// Fetch categories
let categories = try await client.categories()
for category in categories {
    print("Category: \(category.name) (ID: \(category.id))")
}
```

### Read Manga & Chapters

```swift
// Get manga details
let manga = try await client.manga(id: 1)

// Fetch chapters for the manga
let chaptersResult = try await client.chapters(mangaId: manga.id)
if let chapter = chaptersResult.items.first {
    // Fetch chapter page URLs
    let pages = try await client.fetchChapterPages(chapterId: chapter.id)
    
    // Download first page image
    if let firstPagePath = pages.first {
        let imageData = try await client.fetchPageImageData(pagePathOrURL: firstPagePath)
        print("Downloaded page data: \(imageData.count) bytes")
    }

    // Mark chapter as read
    let updatedChapter = try await client.updateChapter(
        id: chapter.id,
        isRead: true,
        lastPageRead: chapter.pageCount
    )
}
```

### Fetch Thumbnails

```swift
if let thumbnailData = try await client.fetchThumbnail(for: manga) {
    print("Loaded thumbnail: \(thumbnailData.count) bytes")
}
```

### Manage Download Queue

```swift
// Check download queue
let status = try await client.downloadStatus()
print("Downloader state: \(status.state), Queued items: \(status.queue.count)")

// Enqueue chapter for offline reading
let state = try await client.enqueueDownload(chapterId: 10)
```

## Development

GraphQL operations live in `GraphQL/Queries`, `GraphQL/Mutations`, and `GraphQL/Fragments`. The schema is at `GraphQL/schema.graphqls`.

```sh
make schema    # Download latest schema from Suwayomi-Server
make generate  # Regenerate Apollo GraphQL Swift sources
swift build    # Build package
swift test     # Run test suite
swift format --recursive --in-place Sources Tests # Format code
```

## Roadmap

- [x] Package layout and public product
- [x] Apollo client and code generation
- [x] Typed domain models (`Sendable`, `Equatable`, `Identifiable`, `Codable`)
- [x] Async/await `SuwayomiClient`
- [x] Core models and operations (library, sources, extensions, categories)
- [x] Chapter and page retrieval
- [x] Media/image fetcher with auth & reverse proxy URL resolution
- [x] Download queue management
- [x] Error model (`SuwayomiError`)
- [x] Unit test suite (`ClientTests`, `ModelTests`)
- [ ] Subscriptions / WebSockets for real-time download and update events
- [ ] DocC documentation

## Contributing

Issues and pull requests are welcome. Please keep changes focused, format code with `swift format`, and make sure `swift build` and `swift test` pass before committing.

## License

MIT — see [LICENSE](LICENSE).
