# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.0] - 2026-10-27

### Added
- **Core Client (`SuwayomiClient`)**:
  - `SuwayomiClientConfig` encapsulating server `baseURL`, custom `graphQLPath`, authentication token, custom headers, and `URLSession`.
  - Automatic base URL normalization and RFC 3986 path resolution (`resolveURL`) with support for reverse proxies and subpaths.
  - Credential redacting in `CustomStringConvertible` and `CustomDebugStringConvertible` descriptions.
  - Origin-guarded media resolution preventing token leakage to external CDN hosts.
  - Query caching defaulting to `.networkOnly` to prevent serving stale server data.
  - Re-authentication helper `authenticated(with:)` reusing the underlying `ApolloStore`.
- **Pure Swift Domain Models**:
  - Entity models conforming to `Identifiable`, `Hashable`, and `Sendable`.
  - Two-tier models for performance: lightweight summaries (`MangaSummary`, `SourceSummary`) for lists/grids, and full models (`Manga`, `Source`) for detail views.
  - Protocols `MangaPreview`, `SourcePreview`, and `IconPreview` for generic UI and media helpers.
  - Multi-key chapter sorting via `ChapterOrder`, `ChapterOrderBy`, and `SortDirection`.
  - Generic pagination wrapper `PagedResult<T>` conforming to `RandomAccessCollection`.
- **Domain Client Extensions**:
  - **Server**: Server info (`serverInfo`), server settings (`serverSettings`), authentication (`login`, `refreshAccessToken`), and cache management (`clearCache`).
  - **Library**: Manga listing with category filtering (`library`), library updates (`updateLibrary`, `stopLibraryUpdate`, `libraryUpdateStatus`).
  - **Categories**: Full CRUD (`categories`, `category`, `createCategory`, `updateCategory`, `deleteCategory`, `reorderCategories`).
  - **Manga**: Details (`manga`), library status toggles (`setMangaInLibrary`), categories assignment (`updateMangaCategories`), metadata refresh (`refreshMangaMetadata`).
  - **Chapters**: List chapters (`chapters`), single chapter (`chapter`), read/bookmark updates (`updateChapter`), page URL resolution (`fetchChapterPages`).
  - **Sources & Extensions**: Source listing (`sources`, `source`), source manga browsing (`fetchSourceManga`), extension management (`extensions`, `installExtension`, `updateExtension`, `uninstallExtension`).
  - **Downloads**: Queue inspection (`downloadQueueStatus`), downloader controls (`startDownloader`, `stopDownloader`, `clearDownloadQueue`), chapter queueing (`enqueueDownload`, `dequeueDownload`), and cache cleanup (`deleteDownloadedChapter`).
  - **Media**: Path resolution and data download helpers (`thumbnailURL`, `iconURL`, `pageURL`, `fetchThumbnail`, `fetchIcon`, `fetchPage`, `fetchMedia`).
- **Error Handling**:
  - Strongly-typed error `SuwayomiError` (`.http`, `.network`, `.cancelled`, `.missingData`, `.invalidURL`, `.invalidID`, `.operation`, `.unexpected`).
  - Helper `isUnauthorized` for 401 response detection.
  - Typed throws (`throws(SuwayomiError)`) across all public client methods.
- **Testing**:
  - Comprehensive test suite with 62 unit and integration tests across 5 test suites.
  - Isolated mock URL protocol and injectable mock network transport for testing GraphQL operations and error mappings without live network sockets.
