# Graph Report - SuwayomiKit  (2026-10-27)

## Corpus Check
- 182 files · ~36,306 words
- Verdict: corpus is large enough that graph structure adds value.
- Unclassified: 34 file(s) not represented in the graph (top: .graphql 28, (none) 4, .graphqls 1)

## Summary
- 2669 nodes · 4383 edges · 169 communities (135 shown, 34 thin omitted)
- Extraction: 95% EXTRACTED · 5% INFERRED · 0% AMBIGUOUS · INFERRED: 225 edges (avg confidence: 0.87)
- Token cost: 0 input · 0 output

## Graph Freshness
- Built from commit: `1dc89d50`
- Run `git rev-parse HEAD` and compare to check if the graph is stale.
- Run `graphify update .` after code changes (no API cost).

## Community Hubs (Navigation)
- SchemaMetadata.graphql.swift
- MangaSummaryFields
- Package API & Roadmap
- Sendable
- SuwayomiClientConfig
- AboutServer
- SourceSummaryFields
- Swift Package Manifest
- Pagination Helpers (Planned)
- AGENTS.md
- SuwayomiError
- ApolloAPI
- Category
- Category
- Manga
- FilterChangeInput
- Node
- Sendable
- DequeueChapterDownload
- EnqueueChapterDownload
- StartDownloader
- MangaFields
- ClearDownloader
- Extension
- ClearCachedImagesInput
- JobsInfo
- ChapterFields
- Manga
- Manga
- Data
- Data
- Manga
- DownloaderState
- MangaConditionInput
- Manga
- Node
- JobsInfo
- ChapterConditionInput
- ExtensionConditionInput
- Extension
- Manga
- EnumType
- Chapters
- Chapter
- Chapter
- Chapter
- Chapter
- .mutation
- GraphQLMockURLProtocol
- ExtensionFields
- MockNetworkTransport
- SourceFields
- StopDownloader
- Node
- Chapter
- CategoryFields
- .fetchData
- FetchSourceMangaInput
- UpdateChapter
- ChapterOrderBy
- UpdateMangaCategories
- .chapters
- PageInfo
- Extension
- UpdateMangaInput
- DataDict
- Node
- UpdateExtensionMutation
- PageInfoFields
- MangaWithChapters
- UpdateManga
- CreateCategoryInput
- UpdateLibraryInput
- Category
- Login
- .mutation
- Foundation
- Category
- Queue
- Data
- Node
- Settings
- Node
- FragmentContainer
- Data
- ModelTests
- UpdateCategory
- GraphQLQuery
- DeleteDownloadedChapter
- Data
- MockURLProtocol
- String
- FetchMangaAndChaptersInput
- SourceConditionInput
- UpdateCategoryPatchInput
- mockHTTPResponse
- UpdateChapterInput
- Data
- PagedResult
- Chapters
- Mangas
- Sources
- FetchChapterPagesInput
- CategoryIncludeOrExclude
- UpdateChapterPatchInput
- AuthMode
- UpdateMangaCategoriesInput
- UpdateMangaCategoriesPatchInput
- FetchMangaAndChapters
- Extensions
- PageInfo
- PageInfo
- DeleteDownloadedChapterInput
- UpdateExtensionMutation
- PageInfo
- InputObject
- InputObject
- ChapterOrderBy
- InputObject
- GetLibraryMangasQuery
- MangaStatus
- GetSourcesQuery
- DataDict
- .updateMangaCategories
- FetchChapterPages
- Category
- InputObject
- FetchSourceManga
- DataDict
- GetExtensionsQuery
- GetMangaQuery
- Categories
- Data
- DataDict
- FetchSourceMangaMutation
- StartDownloaderMutation
- GraphQLMutation
- FetchSourceManga
- DeleteDownloadedChapterMutation
- Data
- FetchChapterPagesMutation
- FetchMangaAndChaptersMutation
- UpdateExtension
- AuthMode
- DownloadStatus
- UpdateMangaCategoriesMutation
- Data
- UpdateMangaMutation
- .fetchSourceManga
- IncludeOrExclude
- SchemaConfiguration
- GraphQLQuery
- FragmentContainer
- Fragments
- UpdateCategoryInput
- GetSourceQuery
- makeManga
- Data
- CreateCategoryMutation
- Data
- UpdateCategoryMutation
- FetchSourceMangaType
- TriState
- UpdateChapter
- Data
- DownloadState
- [0.1.0] - 2026-10-27

## God Nodes (most connected - your core abstractions)
1. `ApolloAPI` - 310 edges
2. `API` - 162 edges
3. `Added` - 52 edges
4. `Objects` - 51 edges
5. `MangaFields` - 41 edges
6. `ChapterFields` - 39 edges
7. `Manga` - 37 edges
8. `Source` - 36 edges
9. `Manga` - 34 edges
10. `Manga` - 34 edges

## Surprising Connections (you probably didn't know these)
- `Added` --references--> `Source`  [INFERRED]
  CHANGELOG.md → Sources/API/Operations/Queries/GetSourceQuery.graphql.swift
- `Added` --references--> `SuwayomiClientConfig`  [INFERRED]
  CHANGELOG.md → Sources/SuwayomiKit/Configuration.swift
- `Added` --references--> `SuwayomiError`  [INFERRED]
  CHANGELOG.md → Sources/SuwayomiKit/Error.swift
- `Added` --references--> `SortDirection`  [INFERRED]
  CHANGELOG.md → Sources/SuwayomiKit/Models/Chapter.swift
- `Added` --references--> `ChapterOrder`  [INFERRED]
  CHANGELOG.md → Sources/SuwayomiKit/Models/Chapter.swift

## Import Cycles
- None detected.

## Hyperedges (group relationships)
- **Planned SuwayomiKit Client Features** — readme_async_await_client, readme_typed_models, readme_query_search_pagination, readme_page_thumbnail_fetching, readme_server_discovery, readme_swift6_strict_concurrency [EXTRACTED 1.00]
- **Schema Download to Generated API Pipeline** — readme_suwayomi_server, readme_apollo_codegen_config, readme_schema_download_target, readme_graphql_codegen_layer, readme_api_target, readme_apollo_client [INFERRED 0.95]

## Communities (169 total, 34 thin omitted)

### Community 0 - "SchemaMetadata.graphql.swift"
Cohesion: 0.18
Nodes (7): InlineFragment, Interfaces, MutableInlineFragment, MutableSelectionSet, SchemaMetadata, SelectionSet, Unions

### Community 1 - "MangaSummaryFields"
Cohesion: 0.11
Nodes (12): MangaSummaryFields, .downloadCount, .fragmentDefinition, .__fulfilledFragments, .id, .inLibrary, .__parentType, .__selections (+4 more)

### Community 2 - "Package API & Roadmap"
Cohesion: 0.17
Nodes (14): AboutServerQuery, API Target, ApolloClient Setup, apollo-codegen-config.json, Apollo iOS, Async/Await Client, Generated GraphQL Layer, Page and Thumbnail Fetching (+6 more)

### Community 3 - "Sendable"
Cohesion: 0.24
Nodes (5): Date, JVM, OS, Platform, ServerInfo

### Community 4 - "SuwayomiClientConfig"
Cohesion: 0.06
Nodes (13): SuwayomiClient, .baseURL, .debugDescription, .description, .headers, .isAuthenticated, .token, SuwayomiClientConfig (+5 more)

### Community 5 - "AboutServer"
Cohesion: 0.05
Nodes (37): AboutServer, .buildTime, .buildType, .discord, .__fulfilledFragments, .github, .name, .__parentType (+29 more)

### Community 6 - "SourceSummaryFields"
Cohesion: 0.12
Nodes (11): SourceSummaryFields, .displayName, .fragmentDefinition, .__fulfilledFragments, .iconUrl, .id, .lang, .name (+3 more)

### Community 10 - "SuwayomiError"
Cohesion: 0.10
Nodes (13): OperationError, .errorDescription, SuwayomiError, cancelled, .errorDescription, http, invalidID, invalidURL (+5 more)

### Community 12 - "Category"
Cohesion: 0.05
Nodes (29): Category, .`default`, .__fulfilledFragments, .id, .includeInDownload, .includeInUpdate, .isDefaultCategory, .name (+21 more)

### Community 13 - "Category"
Cohesion: 0.05
Nodes (28): Category, .`default`, .__fulfilledFragments, .id, .includeInDownload, .includeInUpdate, .isDefaultCategory, .name (+20 more)

### Community 14 - "Manga"
Cohesion: 0.07
Nodes (25): Manga, .artist, .author, .bookmarkCount, .chaptersLastFetchedAt, .description, .downloadCount, .__fulfilledFragments (+17 more)

### Community 15 - "FilterChangeInput"
Cohesion: 0.17
Nodes (8): FilterChangeInput, .checkBoxState, .groupChange, .position, .selectState, .sortState, .textState, .triState

### Community 16 - "Node"
Cohesion: 0.07
Nodes (24): Categories, .__fulfilledFragments, .nodes, .__parentType, .__selections, .totalCount, Data, .categories (+16 more)

### Community 17 - "Sendable"
Cohesion: 0.06
Nodes (26): Data, .__fulfilledFragments, .__parentType, .__selections, .source, Fragments, .sourceFields, Source (+18 more)

### Community 18 - "DequeueChapterDownload"
Cohesion: 0.07
Nodes (20): Data, .dequeueChapterDownload, .__fulfilledFragments, .__parentType, .__selections, DequeueChapterDownload, .downloadStatus, .__fulfilledFragments (+12 more)

### Community 19 - "EnqueueChapterDownload"
Cohesion: 0.07
Nodes (20): Data, .enqueueChapterDownload, .__fulfilledFragments, .__parentType, .__selections, DownloadStatus, .__fulfilledFragments, .__parentType (+12 more)

### Community 20 - "StartDownloader"
Cohesion: 0.12
Nodes (15): Data, .__fulfilledFragments, .__parentType, .__selections, .startDownloader, DownloadStatus, .__fulfilledFragments, .__parentType (+7 more)

### Community 21 - "MangaFields"
Cohesion: 0.06
Nodes (26): MangaFields, .artist, .author, .bookmarkCount, .chaptersLastFetchedAt, .description, .downloadCount, .fragmentDefinition (+18 more)

### Community 22 - "ClearDownloader"
Cohesion: 0.12
Nodes (15): ClearDownloader, .downloadStatus, .__fulfilledFragments, .__parentType, .__selections, Data, .clearDownloader, .__fulfilledFragments (+7 more)

### Community 23 - "Extension"
Cohesion: 0.07
Nodes (23): Data, .`extension`, .__fulfilledFragments, .__parentType, .__selections, Extension, .contentWarning, .__fulfilledFragments (+15 more)

### Community 24 - "ClearCachedImagesInput"
Cohesion: 0.08
Nodes (19): ClearCachedImages, .cachedPages, .cachedThumbnails, .downloadedThumbnails, .__fulfilledFragments, .__parentType, .__selections, ClearCachedImagesMutation (+11 more)

### Community 25 - "JobsInfo"
Cohesion: 0.07
Nodes (26): Data, .__fulfilledFragments, .__parentType, .__selections, .updateLibrary, Fragments, .libraryJobsInfoFields, JobsInfo (+18 more)

### Community 26 - "ChapterFields"
Cohesion: 0.07
Nodes (21): ChapterFields, .chapterNumber, .fetchedAt, .fragmentDefinition, .__fulfilledFragments, .id, .isBookmarked, .isDownloaded (+13 more)

### Community 27 - "Manga"
Cohesion: 0.07
Nodes (25): Manga, .artist, .author, .bookmarkCount, .chaptersLastFetchedAt, .description, .downloadCount, .__fulfilledFragments (+17 more)

### Community 28 - "Manga"
Cohesion: 0.17
Nodes (11): Manga, .downloadCount, .__fulfilledFragments, .id, .inLibrary, .__parentType, .__selections, .sourceId (+3 more)

### Community 29 - "Data"
Cohesion: 0.10
Nodes (15): Data, .__fulfilledFragments, .__parentType, .refreshToken, .__selections, RefreshToken, .accessToken, .__fulfilledFragments (+7 more)

### Community 30 - "Data"
Cohesion: 0.10
Nodes (14): Data, .__fulfilledFragments, .__parentType, .__selections, .updateStop, UpdateStop, .clientMutationId, .__fulfilledFragments (+6 more)

### Community 31 - "Manga"
Cohesion: 0.07
Nodes (26): Manga, .artist, .author, .bookmarkCount, .categories, .chaptersLastFetchedAt, .description, .downloadCount (+18 more)

### Community 32 - "DownloaderState"
Cohesion: 0.12
Nodes (12): GetDownloadStatusQuery, DownloaderState, started, stopped, DownloadItem, .id, DownloadQueueStatus, DownloadState (+4 more)

### Community 33 - "MangaConditionInput"
Cohesion: 0.09
Nodes (18): MangaConditionInput, .artist, .author, .categoryIds, .chaptersLastFetchedAt, .description, .genre, .id (+10 more)

### Community 34 - "Manga"
Cohesion: 0.08
Nodes (25): Manga, .artist, .author, .bookmarkCount, .chaptersLastFetchedAt, .description, .downloadCount, .__fulfilledFragments (+17 more)

### Community 35 - "Node"
Cohesion: 0.18
Nodes (11): Node, .downloadCount, .__fulfilledFragments, .id, .inLibrary, .__parentType, .__selections, .sourceId (+3 more)

### Community 36 - "JobsInfo"
Cohesion: 0.05
Nodes (31): LibraryJobsInfoFields, .finishedJobs, .fragmentDefinition, .__fulfilledFragments, .isRunning, .__parentType, .__selections, .skippedCategoriesCount (+23 more)

### Community 37 - "ChapterConditionInput"
Cohesion: 0.05
Nodes (29): GetChaptersQuery, .__variables, SortOrder, asc, ascNullsFirst, ascNullsLast, desc, descNullsFirst (+21 more)

### Community 38 - "ExtensionConditionInput"
Cohesion: 0.10
Nodes (17): ExtensionConditionInput, .apkName, .apkUrl, .contentWarning, .extensionLib, .hasUpdate, .iconUrl, .isInstalled (+9 more)

### Community 40 - "Manga"
Cohesion: 0.15
Nodes (11): Manga, .downloadCount, .__fulfilledFragments, .id, .inLibrary, .__parentType, .__selections, .sourceId (+3 more)

### Community 41 - "EnumType"
Cohesion: 0.14
Nodes (10): ContentWarning, mixed, nsfw, safe, DownloaderState, started, stopped, UpdateStrategy (+2 more)

### Community 42 - "Chapters"
Cohesion: 0.09
Nodes (20): Chapters, .chapterNumber, .fetchedAt, .__fulfilledFragments, .id, .isBookmarked, .isDownloaded, .isRead (+12 more)

### Community 43 - "Chapter"
Cohesion: 0.09
Nodes (20): Chapter, .chapterNumber, .fetchedAt, .__fulfilledFragments, .id, .isBookmarked, .isDownloaded, .isRead (+12 more)

### Community 44 - "Chapter"
Cohesion: 0.09
Nodes (20): Chapter, .chapterNumber, .fetchedAt, .__fulfilledFragments, .id, .isBookmarked, .isDownloaded, .isRead (+12 more)

### Community 45 - "Chapter"
Cohesion: 0.09
Nodes (20): Chapter, .chapterNumber, .fetchedAt, .__fulfilledFragments, .id, .isBookmarked, .isDownloaded, .isRead (+12 more)

### Community 46 - "Chapter"
Cohesion: 0.06
Nodes (29): Chapter, .chapterNumber, .fetchedAt, .__fulfilledFragments, .id, .isBookmarked, .isDownloaded, .isRead (+21 more)

### Community 48 - "GraphQLMockURLProtocol"
Cohesion: 0.14
Nodes (3): graphQLHTTPResponse(), GraphQLMockURLProtocol, .requestHandler

### Community 49 - "ExtensionFields"
Cohesion: 0.10
Nodes (15): ExtensionFields, .contentWarning, .fragmentDefinition, .__fulfilledFragments, .hasUpdate, .iconUrl, .isInstalled, .isObsolete (+7 more)

### Community 51 - "SourceFields"
Cohesion: 0.10
Nodes (14): SourceFields, .contentWarning, .displayName, .fragmentDefinition, .__fulfilledFragments, .homeUrl, .iconUrl, .id (+6 more)

### Community 52 - "StopDownloader"
Cohesion: 0.12
Nodes (15): Data, .__fulfilledFragments, .__parentType, .__selections, .stopDownloader, DownloadStatus, .__fulfilledFragments, .__parentType (+7 more)

### Community 53 - "Node"
Cohesion: 0.10
Nodes (20): Node, .chapterNumber, .fetchedAt, .__fulfilledFragments, .id, .isBookmarked, .isDownloaded, .isRead (+12 more)

### Community 54 - "Chapter"
Cohesion: 0.10
Nodes (20): Chapter, .chapterNumber, .fetchedAt, .__fulfilledFragments, .id, .isBookmarked, .isDownloaded, .isRead (+12 more)

### Community 55 - "CategoryFields"
Cohesion: 0.11
Nodes (12): CategoryFields, .`default`, .fragmentDefinition, .__fulfilledFragments, .id, .includeInDownload, .includeInUpdate, .isDefaultCategory (+4 more)

### Community 56 - ".fetchData"
Cohesion: 0.25
Nodes (6): Added, SuwayomiClient, Extension, IconPreview, MangaPreview, SourcePreview

### Community 57 - "FetchSourceMangaInput"
Cohesion: 0.19
Nodes (7): FetchSourceMangaInput, .clientMutationId, .filters, .page, .query, .source, .type

### Community 58 - "UpdateChapter"
Cohesion: 0.20
Nodes (7): Data, .__fulfilledFragments, .__parentType, .__selections, .updateChapter, Fragments, .chapterFields

### Community 59 - "ChapterOrderBy"
Cohesion: 0.17
Nodes (12): ChapterOrder, ChapterOrderBy, chapterNumber, fetchedAt, id, lastReadAt, name, sourceOrder (+4 more)

### Community 60 - "UpdateMangaCategories"
Cohesion: 0.14
Nodes (12): Data, .__fulfilledFragments, .__parentType, .__selections, .updateMangaCategories, Fragments, .mangaFields, UpdateMangaCategories (+4 more)

### Community 62 - "PageInfo"
Cohesion: 0.20
Nodes (8): PageInfo, .endCursor, .__fulfilledFragments, .hasNextPage, .hasPreviousPage, .__parentType, .__selections, .startCursor

### Community 63 - "Extension"
Cohesion: 0.12
Nodes (14): Extension, .contentWarning, .__fulfilledFragments, .hasUpdate, .iconUrl, .isInstalled, .isObsolete, .lang (+6 more)

### Community 64 - "UpdateMangaInput"
Cohesion: 0.29
Nodes (4): UpdateMangaInput, .clientMutationId, .id, .patch

### Community 65 - "DataDict"
Cohesion: 0.15
Nodes (8): Data, .downloadStatus, .__fulfilledFragments, .__parentType, .__selections, Fragments, .chapterFields, .mangaSummaryFields

### Community 66 - "Node"
Cohesion: 0.13
Nodes (14): Node, .contentWarning, .__fulfilledFragments, .hasUpdate, .iconUrl, .isInstalled, .isObsolete, .lang (+6 more)

### Community 67 - "UpdateExtensionMutation"
Cohesion: 0.20
Nodes (3): UpdateExtensionMutation, .__variables, SuwayomiClient

### Community 68 - "PageInfoFields"
Cohesion: 0.14
Nodes (9): PageInfoFields, .endCursor, .fragmentDefinition, .__fulfilledFragments, .hasNextPage, .hasPreviousPage, .__parentType, .__selections (+1 more)

### Community 69 - "MangaWithChapters"
Cohesion: 0.31
Nodes (3): CacheClearResult, MangaWithChapters, SourceMangaPage

### Community 71 - "UpdateManga"
Cohesion: 0.14
Nodes (12): Data, .__fulfilledFragments, .__parentType, .__selections, .updateManga, Fragments, .mangaFields, UpdateManga (+4 more)

### Community 72 - "CreateCategoryInput"
Cohesion: 0.19
Nodes (7): CreateCategoryInput, .clientMutationId, .`default`, .includeInDownload, .includeInUpdate, .name, .order

### Community 73 - "UpdateLibraryInput"
Cohesion: 0.18
Nodes (5): UpdateLibraryMutation, .__variables, UpdateLibraryInput, .categories, .clientMutationId

### Community 74 - "Category"
Cohesion: 0.14
Nodes (11): Category, .`default`, .__fulfilledFragments, .id, .includeInDownload, .includeInUpdate, .isDefaultCategory, .name (+3 more)

### Community 75 - "Login"
Cohesion: 0.09
Nodes (17): Data, .__fulfilledFragments, .login, .__parentType, .__selections, Login, .accessToken, .__fulfilledFragments (+9 more)

### Community 77 - "Foundation"
Cohesion: 0.25
Nodes (4): Apollo, Foundation, SuwayomiKit, Testing

### Community 78 - "Category"
Cohesion: 0.14
Nodes (11): Category, .`default`, .__fulfilledFragments, .id, .includeInDownload, .includeInUpdate, .isDefaultCategory, .name (+3 more)

### Community 79 - "Queue"
Cohesion: 0.15
Nodes (10): Queue, .chapter, .__fulfilledFragments, .manga, .__parentType, .position, .progress, .__selections (+2 more)

### Community 80 - "Data"
Cohesion: 0.18
Nodes (8): Data, .__fulfilledFragments, .mangas, .__parentType, .__selections, Fragments, .mangaSummaryFields, .pageInfoFields

### Community 81 - "Node"
Cohesion: 0.14
Nodes (11): Node, .`default`, .__fulfilledFragments, .id, .includeInDownload, .includeInUpdate, .isDefaultCategory, .name (+3 more)

### Community 82 - "Settings"
Cohesion: 0.10
Nodes (16): Data, .__fulfilledFragments, .__parentType, .__selections, .settings, Settings, .authMode, .authUsername (+8 more)

### Community 83 - "Node"
Cohesion: 0.20
Nodes (10): Node, .displayName, .__fulfilledFragments, .iconUrl, .id, .lang, .name, .__parentType (+2 more)

### Community 84 - "FragmentContainer"
Cohesion: 0.22
Nodes (7): Data, .fetchChapterPages, .__fulfilledFragments, .__parentType, .__selections, Fragments, .chapterFields

### Community 85 - "Data"
Cohesion: 0.18
Nodes (8): Data, .fetchMangaAndChapters, .__fulfilledFragments, .__parentType, .__selections, Fragments, .chapterFields, .mangaFields

### Community 87 - "UpdateCategory"
Cohesion: 0.14
Nodes (12): Data, .__fulfilledFragments, .__parentType, .__selections, .updateCategory, Fragments, .categoryFields, UpdateCategory (+4 more)

### Community 88 - "GraphQLQuery"
Cohesion: 0.14
Nodes (3): GetCategoriesQuery, GetLibraryUpdateStatusQuery, GetSettingsQuery

### Community 89 - "DeleteDownloadedChapter"
Cohesion: 0.20
Nodes (7): DeleteDownloadedChapter, .chapters, .__fulfilledFragments, .__parentType, .__selections, Fragments, .chapterFields

### Community 90 - "Data"
Cohesion: 0.20
Nodes (7): Data, .__fulfilledFragments, .__parentType, .__selections, .updateExtension, Fragments, .extensionFields

### Community 92 - "String"
Cohesion: 0.14
Nodes (13): Manga, MangaStatus, cancelled, completed, licensed, ongoing, onHiatus, publishingFinished (+5 more)

### Community 93 - "FetchMangaAndChaptersInput"
Cohesion: 0.24
Nodes (5): FetchMangaAndChaptersInput, .clientMutationId, .fetchChapters, .fetchManga, .id

### Community 94 - "SourceConditionInput"
Cohesion: 0.23
Nodes (5): SourceConditionInput, .contentWarning, .id, .lang, .name

### Community 95 - "UpdateCategoryPatchInput"
Cohesion: 0.24
Nodes (5): UpdateCategoryPatchInput, .`default`, .includeInDownload, .includeInUpdate, .name

### Community 97 - "UpdateChapterInput"
Cohesion: 0.17
Nodes (6): UpdateChapterMutation, .__variables, UpdateChapterInput, .clientMutationId, .id, .patch

### Community 98 - "Data"
Cohesion: 0.20
Nodes (8): Data, .extensions, .__fulfilledFragments, .__parentType, .__selections, Fragments, .extensionFields, .pageInfoFields

### Community 99 - "PagedResult"
Cohesion: 0.21
Nodes (4): PagedResult, .endIndex, .startIndex, PageInfo

### Community 100 - "Chapters"
Cohesion: 0.20
Nodes (7): Chapters, .__fulfilledFragments, .nodes, .pageInfo, .__parentType, .__selections, .totalCount

### Community 101 - "Mangas"
Cohesion: 0.20
Nodes (7): Mangas, .__fulfilledFragments, .nodes, .pageInfo, .__parentType, .__selections, .totalCount

### Community 102 - "Sources"
Cohesion: 0.20
Nodes (7): Sources, .__fulfilledFragments, .nodes, .pageInfo, .__parentType, .__selections, .totalCount

### Community 103 - "FetchChapterPagesInput"
Cohesion: 0.29
Nodes (4): FetchChapterPagesInput, .chapterId, .clientMutationId, .format

### Community 104 - "CategoryIncludeOrExclude"
Cohesion: 0.17
Nodes (7): API, Category, CategoryIncludeOrExclude, exclude, include, unset, LibraryJobsInfo

### Community 105 - "UpdateChapterPatchInput"
Cohesion: 0.29
Nodes (4): UpdateChapterPatchInput, .isBookmarked, .isRead, .lastPageRead

### Community 106 - "AuthMode"
Cohesion: 0.18
Nodes (7): Chapter, AuthMode, basicAuth, none, simpleLogin, uiLogin, ServerSettings

### Community 107 - "UpdateMangaCategoriesInput"
Cohesion: 0.29
Nodes (4): UpdateMangaCategoriesInput, .clientMutationId, .id, .patch

### Community 108 - "UpdateMangaCategoriesPatchInput"
Cohesion: 0.29
Nodes (4): UpdateMangaCategoriesPatchInput, .addToCategories, .clearCategories, .removeFromCategories

### Community 109 - "FetchMangaAndChapters"
Cohesion: 0.22
Nodes (6): FetchMangaAndChapters, .chapters, .__fulfilledFragments, .manga, .__parentType, .__selections

### Community 110 - "Extensions"
Cohesion: 0.18
Nodes (7): Extensions, .__fulfilledFragments, .nodes, .pageInfo, .__parentType, .__selections, .totalCount

### Community 111 - "PageInfo"
Cohesion: 0.20
Nodes (8): PageInfo, .endCursor, .__fulfilledFragments, .hasNextPage, .hasPreviousPage, .__parentType, .__selections, .startCursor

### Community 112 - "PageInfo"
Cohesion: 0.22
Nodes (8): PageInfo, .endCursor, .__fulfilledFragments, .hasNextPage, .hasPreviousPage, .__parentType, .__selections, .startCursor

### Community 113 - "DeleteDownloadedChapterInput"
Cohesion: 0.33
Nodes (3): DeleteDownloadedChapterInput, .clientMutationId, .id

### Community 114 - "UpdateExtensionMutation"
Cohesion: 0.31
Nodes (4): UpdateExtensionInput, .clientMutationId, .id, .patch

### Community 115 - "PageInfo"
Cohesion: 0.20
Nodes (8): PageInfo, .endCursor, .__fulfilledFragments, .hasNextPage, .hasPreviousPage, .__parentType, .__selections, .startCursor

### Community 116 - "InputObject"
Cohesion: 0.36
Nodes (3): SortSelectionInput, .ascending, .index

### Community 118 - "ChapterOrderBy"
Cohesion: 0.22
Nodes (8): ChapterOrderBy, chapterNumber, fetchedAt, id, lastReadAt, name, sourceOrder, uploadDate

### Community 119 - "InputObject"
Cohesion: 0.21
Nodes (4): StopDownloaderMutation, .__variables, StopDownloaderInput, .clientMutationId

### Community 121 - "MangaStatus"
Cohesion: 0.22
Nodes (8): MangaStatus, cancelled, completed, licensed, ongoing, onHiatus, publishingFinished, unknown

### Community 123 - "DataDict"
Cohesion: 0.29
Nodes (3): Fragments, .pageInfoFields, .sourceSummaryFields

### Community 125 - "FetchChapterPages"
Cohesion: 0.25
Nodes (6): FetchChapterPages, .chapter, .__fulfilledFragments, .pages, .__parentType, .__selections

### Community 126 - "Category"
Cohesion: 0.14
Nodes (11): Category, .`default`, .__fulfilledFragments, .id, .includeInDownload, .includeInUpdate, .isDefaultCategory, .name (+3 more)

### Community 127 - "InputObject"
Cohesion: 0.27
Nodes (4): UpdateExtensionPatchInput, .install, .uninstall, .update

### Community 128 - "FetchSourceManga"
Cohesion: 0.20
Nodes (7): Data, .fetchSourceManga, .__fulfilledFragments, .__parentType, .__selections, Fragments, .mangaSummaryFields

### Community 130 - "DataDict"
Cohesion: 0.33
Nodes (3): Fragments, .chapterFields, .pageInfoFields

### Community 133 - "Categories"
Cohesion: 0.29
Nodes (5): Categories, .__fulfilledFragments, .nodes, .__parentType, .__selections

### Community 134 - "Data"
Cohesion: 0.29
Nodes (5): Data, .__fulfilledFragments, .manga, .__parentType, .__selections

### Community 135 - "DataDict"
Cohesion: 0.33
Nodes (3): Fragments, .categoryFields, .mangaFields

### Community 137 - "StartDownloaderMutation"
Cohesion: 0.21
Nodes (4): StartDownloaderMutation, .__variables, StartDownloaderInput, .clientMutationId

### Community 138 - "GraphQLMutation"
Cohesion: 0.19
Nodes (4): ClearDownloaderMutation, .__variables, ClearDownloaderInput, .clientMutationId

### Community 139 - "FetchSourceManga"
Cohesion: 0.22
Nodes (6): FetchSourceManga, .__fulfilledFragments, .hasNextPage, .mangas, .__parentType, .__selections

### Community 141 - "Data"
Cohesion: 0.33
Nodes (5): Data, .deleteDownloadedChapter, .__fulfilledFragments, .__parentType, .__selections

### Community 144 - "UpdateExtension"
Cohesion: 0.33
Nodes (5): UpdateExtension, .`extension`, .__fulfilledFragments, .__parentType, .__selections

### Community 145 - "AuthMode"
Cohesion: 0.33
Nodes (5): AuthMode, basicAuth, none, simpleLogin, uiLogin

### Community 146 - "DownloadStatus"
Cohesion: 0.25
Nodes (6): DownloadStatus, .__fulfilledFragments, .__parentType, .queue, .__selections, .state

### Community 148 - "Data"
Cohesion: 0.33
Nodes (5): Data, .__fulfilledFragments, .__parentType, .__selections, .sources

### Community 150 - ".fetchSourceManga"
Cohesion: 0.18
Nodes (5): SuwayomiClient, SourceMangaType, latest, popular, search

### Community 151 - "IncludeOrExclude"
Cohesion: 0.40
Nodes (4): IncludeOrExclude, exclude, include, unset

### Community 154 - "FragmentContainer"
Cohesion: 0.20
Nodes (7): CreateCategory, .category, .__fulfilledFragments, .__parentType, .__selections, Fragments, .categoryFields

### Community 156 - "UpdateCategoryInput"
Cohesion: 0.29
Nodes (4): UpdateCategoryInput, .clientMutationId, .id, .patch

### Community 159 - "Data"
Cohesion: 0.29
Nodes (5): Data, .chapters, .__fulfilledFragments, .__parentType, .__selections

### Community 161 - "Data"
Cohesion: 0.33
Nodes (5): Data, .createCategory, .__fulfilledFragments, .__parentType, .__selections

### Community 163 - "FetchSourceMangaType"
Cohesion: 0.40
Nodes (4): FetchSourceMangaType, latest, popular, search

### Community 164 - "TriState"
Cohesion: 0.40
Nodes (4): TriState, exclude, ignore, include

### Community 165 - "UpdateChapter"
Cohesion: 0.33
Nodes (5): UpdateChapter, .chapter, .__fulfilledFragments, .__parentType, .__selections

### Community 166 - "Data"
Cohesion: 0.33
Nodes (5): Data, .category, .__fulfilledFragments, .__parentType, .__selections

### Community 167 - "DownloadState"
Cohesion: 0.33
Nodes (5): DownloadState, downloading, error, finished, queued

## Knowledge Gaps
- **1217 isolated node(s):** `PackageDescription`, `.fragmentDefinition`, `.__parentType`, `.__selections`, `.__fulfilledFragments` (+1212 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 1481 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **34 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `ApolloAPI` connect `ApolloAPI` to `SchemaMetadata.graphql.swift`, `MangaSummaryFields`, `AboutServer`, `SourceSummaryFields`, `Category`, `Category`, `Manga`, `FilterChangeInput`, `Node`, `Sendable`, `DequeueChapterDownload`, `EnqueueChapterDownload`, `StartDownloader`, `MangaFields`, `ClearDownloader`, `Extension`, `ClearCachedImagesInput`, `JobsInfo`, `ChapterFields`, `Manga`, `Manga`, `Data`, `Data`, `Manga`, `DownloaderState`, `MangaConditionInput`, `Manga`, `Node`, `JobsInfo`, `ChapterConditionInput`, `ExtensionConditionInput`, `Manga`, `EnumType`, `Chapters`, `Chapter`, `Chapter`, `Chapter`, `Chapter`, `ExtensionFields`, `SourceFields`, `StopDownloader`, `Node`, `Chapter`, `CategoryFields`, `FetchSourceMangaInput`, `UpdateChapter`, `UpdateMangaCategories`, `PageInfo`, `Extension`, `UpdateMangaInput`, `DataDict`, `Node`, `UpdateExtensionMutation`, `PageInfoFields`, `UpdateManga`, `CreateCategoryInput`, `UpdateLibraryInput`, `Category`, `Login`, `Foundation`, `Category`, `Queue`, `Data`, `Node`, `Settings`, `Node`, `FragmentContainer`, `Data`, `UpdateCategory`, `GraphQLQuery`, `DeleteDownloadedChapter`, `Data`, `FetchMangaAndChaptersInput`, `SourceConditionInput`, `UpdateCategoryPatchInput`, `UpdateChapterInput`, `Data`, `Chapters`, `Mangas`, `Sources`, `FetchChapterPagesInput`, `UpdateChapterPatchInput`, `UpdateMangaCategoriesInput`, `UpdateMangaCategoriesPatchInput`, `FetchMangaAndChapters`, `Extensions`, `PageInfo`, `PageInfo`, `DeleteDownloadedChapterInput`, `UpdateExtensionMutation`, `PageInfo`, `InputObject`, `InputObject`, `ChapterOrderBy`, `InputObject`, `GetLibraryMangasQuery`, `MangaStatus`, `GetSourcesQuery`, `FetchChapterPages`, `Category`, `InputObject`, `FetchSourceManga`, `GetExtensionsQuery`, `GetMangaQuery`, `Categories`, `Data`, `FetchSourceMangaMutation`, `StartDownloaderMutation`, `GraphQLMutation`, `FetchSourceManga`, `DeleteDownloadedChapterMutation`, `Data`, `FetchChapterPagesMutation`, `FetchMangaAndChaptersMutation`, `UpdateExtension`, `AuthMode`, `DownloadStatus`, `UpdateMangaCategoriesMutation`, `Data`, `UpdateMangaMutation`, `IncludeOrExclude`, `SchemaConfiguration`, `GraphQLQuery`, `FragmentContainer`, `UpdateCategoryInput`, `GetSourceQuery`, `Data`, `CreateCategoryMutation`, `Data`, `UpdateCategoryMutation`, `FetchSourceMangaType`, `TriState`, `UpdateChapter`, `Data`, `DownloadState`?**
  _High betweenness centrality (0.522) - this node is a cross-community bridge._
- **Are the 51 inferred relationships involving `Added` (e.g. with `Source` and `.chapter()`) actually correct?**
  _`Added` has 51 INFERRED edges - model-reasoned connections that need verification._
- **What connects `PackageDescription`, `.fragmentDefinition`, `.__parentType` to the rest of the system?**
  _1217 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `MangaSummaryFields` be split into smaller, more focused modules?**
  _Cohesion score 0.1111111111111111 - nodes in this community are weakly interconnected._
- **Why does `API` connect `CategoryIncludeOrExclude` to `MangaSummaryFields`, `Sendable`, `AboutServer`, `SourceSummaryFields`, `Category`, `Category`, `Manga`, `Node`, `Sendable`, `DequeueChapterDownload`, `EnqueueChapterDownload`, `StartDownloader`, `MangaFields`, `ClearDownloader`, `Extension`, `ClearCachedImagesInput`, `JobsInfo`, `ChapterFields`, `Manga`, `Manga`, `Data`, `Data`, `Manga`, `DownloaderState`, `Manga`, `Node`, `JobsInfo`, `Extension`, `Manga`, `Chapters`, `Chapter`, `Chapter`, `Chapter`, `Chapter`, `.mutation`, `ExtensionFields`, `SourceFields`, `StopDownloader`, `Node`, `Chapter`, `CategoryFields`, `UpdateChapter`, `ChapterOrderBy`, `UpdateMangaCategories`, `.chapters`, `PageInfo`, `Extension`, `DataDict`, `Node`, `PageInfoFields`, `UpdateManga`, `Category`, `Login`, `.mutation`, `Foundation`, `Category`, `Queue`, `Data`, `Node`, `Settings`, `Node`, `FragmentContainer`, `Data`, `UpdateCategory`, `DeleteDownloadedChapter`, `Data`, `String`, `Data`, `PagedResult`, `Chapters`, `Mangas`, `Sources`, `AuthMode`, `FetchMangaAndChapters`, `Extensions`, `PageInfo`, `PageInfo`, `PageInfo`, `.updateMangaCategories`, `FetchChapterPages`, `Category`, `FetchSourceManga`, `Categories`, `Data`, `FetchSourceManga`, `Data`, `UpdateExtension`, `DownloadStatus`, `Data`, `.fetchSourceManga`, `FragmentContainer`, `Data`, `Data`, `UpdateChapter`, `Data`?**
  _High betweenness centrality (0.320) - this node is a cross-community bridge._
- **Should `SuwayomiClientConfig` be split into smaller, more focused modules?**
  _Cohesion score 0.05552617662612375 - nodes in this community are weakly interconnected._
- **Why does `Source` connect `Sendable` to `mockHTTPResponse`, `Sendable`, `CategoryIncludeOrExclude`, `AuthMode`, `ApolloAPI`, `.fetchSourceManga`, `.fetchData`, `ChapterOrderBy`, `GetSourceQuery`?**
  _High betweenness centrality (0.063) - this node is a cross-community bridge._