# SuwayomiKit

A Swift package for communicating with [Suwayomi-Server](https://github.com/Suwayomi/Suwayomi-Server) from Apple platforms without the hassle of GraphQL.

Suwayomi-Server (formerly Tachidesk) is a self-hosted manga server that runs sources, manages a library, and serves chapters and page images. SuwayomiKit aims to be the native Swift layer on top of that server: typed models, a `async`/`await` client, and everything an iOS or macOS reader app needs to browse sources and read manga.

## Status

**Early development.** The GraphQL layer is generated with [Apollo iOS](https://github.com/apollographql/apollo-ios) and currently exposes the `AboutServer` query. More operations and a hand-written convenience API will land incrementally.

## Planned features

- Async/await client built on Apollo and Swift concurrency
- Typed models for manga, chapters, categories, extensions, and the library
- Query, search, and pagination helpers
- Page and thumbnail fetching, including authentication and custom headers
- Server discovery/connection handling (base URL, credentials, reachability)
- Swift 6 strict concurrency: `Sendable` models, actor-isolated client state

## Requirements

- Swift 6.3 or later
- macOS 26 or iOS 26
- Apollo iOS 2.x
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

> The product currently points at the `API` target, so the module to import is `API` until a hand-written `SuwayomiKit` target is added.

## Usage

```swift
import API
import Apollo

let client = ApolloClient(url: URL(string: "http://localhost:4567/api/graphql")!)

client.fetch(query: AboutServerQuery()) { result in
    switch result {
    case .success(let graphQLResult):
        if let server = graphQLResult.data?.aboutServer {
            print("\(server.name) \(server.version)")
        }
    case .failure(let error):
        print(error)
    }
}
```

## Development

Query and mutation documents live in `Sources/GraphQL/Queries`. The downloaded schema is `Sources/GraphQL/schema.graphqls`, and generated code lives in `Sources/API/Generated`.

```sh
make schema    # download the schema from the server configured in apollo-codegen-config.json
make generate  # regenerate sources from the schema and operations
swift build
swift test
swift format --recursive --in-place Sources Tests
```

To target a different server, change `schemaDownload.downloadMethod.introspection.endpointURL` in `Sources/GraphQL/apollo-codegen-config.json` before running `make schema`. Formatting rules live in `.swift-format`; avoid formatting `Sources/API/Generated`, since it is overwritten on every generation.

## Roadmap

- [x] Package layout and public product
- [x] Apollo client and code generation
- [x] Initial `AboutServer` query
- [ ] Core models and operations (library, sources, extensions)
- [ ] Chapter and page retrieval
- [ ] Error model and retry handling
- [ ] Test suite and fixtures
- [ ] DocC documentation

## Contributing

Issues and pull requests are welcome. Please keep changes focused, run `swift format` before committing, and make sure `swift build` and `swift test` pass.

## License

MIT — see [LICENSE](LICENSE).
