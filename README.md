# SuwayomiKit

A Swift package for communitcating with [Suwayomi-Server](https://github.com/Suwayomi/Suwayomi-Server) from Apple platforms without the hassel of GraphQL.

Suwayomi-Server (formerly Tachidesk) is a self-hosted manga server that runs sources, manages a library, and serves chapters and page images. SuwayomiKit aims to be the native Swift layer on top of that server: typed models, a `async`/`await` client, and everything an iOS or macOS reader app needs to browse sources and read manga.

## Status

**Early development.** This repository currently contains the package scaffold only — no public API has been implemented yet. The README describes the intended shape of the package and will be updated as targets land.

## Planned features

- Async/await client built on `URLSession` and Swift concurrency
- Typed models for manga, chapters, categories, extensions, and the library
- Query, search, and pagination helpers
- Page and thumbnail fetching, including authentication and custom headers
- Server discovery/connection handling (base URL, credentials, reachability)
- Swift 6 strict concurrency: `Sendable` models, actor-isolated client state
- No third-party dependencies

## Requirements

- Swift 6.3 or later
- macOS 26 or iOS 26
- A running Suwayomi-Server instance (local or remote)

## Installation

Add the package to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/maranix/SuwayomiKit.git", branch: "main")
]
```

Then depend on the product from your target:

```swift
.target(
    name: "MyApp",
    dependencies: ["SuwayomiKit"]
)
```

> Products and targets are not declared yet, so this snippet will not resolve until the first implementation lands.

## Usage

The API below is illustrative and not yet available:

```swift
import SuwayomiKit

let client = SuwayomiClient(baseURL: URL(string: "http://localhost:4567")!)

for manga in try await client.manga.search("one piece") {
    print(manga.title)
}

let chapters = try await client.manga.chapters(for: manga.id)
let pages = try await client.manga.pages(for: chapters[0].id)
```

## Development

```sh
swift build
swift test
swift format --recursive --in-place Sources Tests
```

Formatting rules live in `.swift-format`.

## Roadmap

- [ ] Package layout and public product
- [ ] HTTP transport and error model
- [ ] Core models and decoding
- [ ] Library, source, and extension endpoints
- [ ] Chapter and page retrieval
- [ ] Test suite and fixtures
- [ ] DocC documentation

## Contributing

Issues and pull requests are welcome. Please keep changes focused, run `swift format` before committing, and make sure `swift build` and `swift test` pass.

## License

MIT — see [LICENSE](LICENSE).
