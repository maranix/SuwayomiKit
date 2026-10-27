# Graph Report - SuwayomiKit  (2026-10-27)

## Corpus Check
- 175 files · ~31,175 words
- Verdict: corpus is large enough that graph structure adds value.
- Unclassified: 33 file(s) not represented in the graph (top: .graphql 27, (none) 4, .graphqls 1)

## Summary
- 2473 nodes · 3952 edges · 170 communities (132 shown, 38 thin omitted)
- Extraction: 96% EXTRACTED · 4% INFERRED · 0% AMBIGUOUS · INFERRED: 164 edges (avg confidence: 0.85)
- Token cost: 0 input · 0 output

## Graph Freshness
- Built from commit: `d40c5b28`
- Run `git rev-parse HEAD` and compare to check if the graph is stale.
- Run `graphify update .` after code changes (no API cost).

## Community Hubs (Navigation)
- SchemaMetadata.graphql.swift
- MangaSummaryFields
- Package API & Roadmap
- Sendable
- String
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
- Source
- DequeueChapterDownload
- EnqueueChapterDownload
- StartDownloader
- MangaFields
- ClearDownloader
- Extension
- ClearCachedImages
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
- API
- Manga
- ChapterOrderBy
- Chapters
- Chapter
- Chapter
- Chapter
- Chapter
- .mutation
- SuwayomiClient
- ExtensionFields
- AuthMode
- SourceFields
- StopDownloader
- Node
- Chapter
- CategoryFields
- .fetchData
- UpdateCategory
- UpdateChapter
- UpdateExtension
- DequeueChapterDownloadInput
- PageInfo
- Extension
- UpdateMangaInput
- DownloadStatus
- Node
- MangaStatus
- PageInfoFields
- EnumType
- InputObject
- UpdateManga
- CreateCategoryInput
- FetchSourceMangaInput
- Category
- Login
- UpdateExtensionMutation
- Category
- Queue
- Data
- Node
- Settings
- Node
- FragmentContainer
- Data
- ModelTests
- Category
- CreateCategory
- DeleteDownloadedChapter
- Data
- Data
- UpdateStrategy
- FetchMangaAndChaptersInput
- SourceConditionInput
- UpdateCategoryPatchInput
- MockURLProtocol
- DataDict
- Data
- Codable
- Chapters
- Mangas
- Sources
- FetchChapterPagesInput
- CategoryIncludeOrExclude
- UpdateChapterInput
- UpdateChapterPatchInput
- UpdateMangaCategoriesInput
- UpdateMangaCategoriesPatchInput
- FetchMangaAndChapters
- Extensions
- PageInfo
- PageInfo
- DeleteDownloadedChapterInput
- UpdateExtensionInput
- UpdateExtensionPatchInput
- SourceMangaType
- InputObject
- UpdateCategoryInput
- GetChaptersQuery
- GetLibraryMangasQuery
- UpdateCategoryOrderInput
- GetSourcesQuery
- DataDict
- FetchChapterPages
- SortOrder
- MangaStatus
- FetchSourceManga
- GetChapterQuery
- Data
- GetExtensionsQuery
- GetMangaQuery
- Categories
- Data
- DataDict
- ChapterOrderInput
- Chapter
- DataDict
- GetSourceQuery
- DeleteDownloadedChapterMutation
- Data
- FetchChapterPagesMutation
- FetchMangaAndChaptersMutation
- SortSelectionInput
- UpdateExtension
- UpdateChapterMutation
- GraphQLMutation
- Data
- UpdateMangaMutation
- GetLibraryUpdateStatusQuery
- IncludeOrExclude
- SchemaConfiguration
- CreateCategoryMutation
- Data
- FetchSourceMangaMutation
- Data
- DataDict
- UpdateCategoryMutation
- DataDict
- Data
- UpdateCategoryOrder
- GetExtensionQuery
- Data
- Fragments
- DownloadState
- Extension
- LibraryJobsInfo
- FetchSourceMangaType
- TriState

## God Nodes (most connected - your core abstractions)
1. `ApolloAPI` - 307 edges
2. `API` - 154 edges
3. `SuwayomiClient` - 82 edges
4. `Objects` - 51 edges
5. `MangaFields` - 41 edges
6. `ChapterFields` - 39 edges
7. `Manga` - 37 edges
8. `Manga` - 34 edges
9. `Manga` - 34 edges
10. `Manga` - 34 edges

## Surprising Connections (you probably didn't know these)
- `InlineFragment` --inherits--> `ApolloAPI`  [EXTRACTED]
  Sources/API/Schema/SchemaMetadata.graphql.swift → Tests/SuwayomiKitTests/ModelMappingTests.swift
- `MutableInlineFragment` --inherits--> `ApolloAPI`  [EXTRACTED]
  Sources/API/Schema/SchemaMetadata.graphql.swift → Tests/SuwayomiKitTests/ModelMappingTests.swift
- `MutableSelectionSet` --inherits--> `ApolloAPI`  [EXTRACTED]
  Sources/API/Schema/SchemaMetadata.graphql.swift → Tests/SuwayomiKitTests/ModelMappingTests.swift
- `SelectionSet` --inherits--> `ApolloAPI`  [EXTRACTED]
  Sources/API/Schema/SchemaMetadata.graphql.swift → Tests/SuwayomiKitTests/ModelMappingTests.swift
- `CategoryFields` --references--> `ApolloAPI`  [EXTRACTED]
  Sources/API/Fragments/CategoryFields.graphql.swift → Tests/SuwayomiKitTests/ModelMappingTests.swift

## Import Cycles
- None detected.

## Hyperedges (group relationships)
- **Planned SuwayomiKit Client Features** — readme_async_await_client, readme_typed_models, readme_query_search_pagination, readme_page_thumbnail_fetching, readme_server_discovery, readme_swift6_strict_concurrency [EXTRACTED 1.00]
- **Schema Download to Generated API Pipeline** — readme_suwayomi_server, readme_apollo_codegen_config, readme_schema_download_target, readme_graphql_codegen_layer, readme_api_target, readme_apollo_client [INFERRED 0.95]

## Communities (170 total, 38 thin omitted)

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
Cohesion: 0.38
Nodes (4): JVM, OS, Platform, ServerInfo

### Community 4 - "String"
Cohesion: 0.21
Nodes (7): Category, ContentWarning, mixed, nsfw, safe, Source, SourceSummary

### Community 5 - "AboutServer"
Cohesion: 0.05
Nodes (37): AboutServer, .buildTime, .buildType, .discord, .__fulfilledFragments, .github, .name, .__parentType (+29 more)

### Community 6 - "SourceSummaryFields"
Cohesion: 0.12
Nodes (11): SourceSummaryFields, .displayName, .fragmentDefinition, .__fulfilledFragments, .iconUrl, .id, .lang, .name (+3 more)

### Community 10 - "SuwayomiError"
Cohesion: 0.16
Nodes (9): Apollo, OperationError, SuwayomiError, .errorDescription, missingData, network, operation, server (+1 more)

### Community 12 - "Category"
Cohesion: 0.14
Nodes (11): Category, .`default`, .__fulfilledFragments, .id, .includeInDownload, .includeInUpdate, .isDefaultCategory, .name (+3 more)

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
Cohesion: 0.06
Nodes (25): Categories, .__fulfilledFragments, .nodes, .__parentType, .__selections, .totalCount, Data, .categories (+17 more)

### Community 17 - "Source"
Cohesion: 0.13
Nodes (13): Source, .contentWarning, .displayName, .__fulfilledFragments, .homeUrl, .iconUrl, .id, .isConfigurable (+5 more)

### Community 18 - "DequeueChapterDownload"
Cohesion: 0.12
Nodes (15): Data, .dequeueChapterDownload, .__fulfilledFragments, .__parentType, .__selections, DequeueChapterDownload, .downloadStatus, .__fulfilledFragments (+7 more)

### Community 19 - "EnqueueChapterDownload"
Cohesion: 0.07
Nodes (20): Data, .enqueueChapterDownload, .__fulfilledFragments, .__parentType, .__selections, DownloadStatus, .__fulfilledFragments, .__parentType (+12 more)

### Community 20 - "StartDownloader"
Cohesion: 0.07
Nodes (19): Data, .__fulfilledFragments, .__parentType, .__selections, .startDownloader, DownloadStatus, .__fulfilledFragments, .__parentType (+11 more)

### Community 21 - "MangaFields"
Cohesion: 0.06
Nodes (26): MangaFields, .artist, .author, .bookmarkCount, .chaptersLastFetchedAt, .description, .downloadCount, .fragmentDefinition (+18 more)

### Community 22 - "ClearDownloader"
Cohesion: 0.07
Nodes (19): ClearDownloader, .downloadStatus, .__fulfilledFragments, .__parentType, .__selections, ClearDownloaderMutation, .__variables, Data (+11 more)

### Community 23 - "Extension"
Cohesion: 0.12
Nodes (14): Extension, .contentWarning, .__fulfilledFragments, .hasUpdate, .iconUrl, .isInstalled, .isObsolete, .lang (+6 more)

### Community 24 - "ClearCachedImages"
Cohesion: 0.15
Nodes (12): ClearCachedImages, .cachedPages, .cachedThumbnails, .downloadedThumbnails, .__fulfilledFragments, .__parentType, .__selections, Data (+4 more)

### Community 25 - "JobsInfo"
Cohesion: 0.05
Nodes (29): Data, .__fulfilledFragments, .__parentType, .__selections, .updateLibrary, JobsInfo, .finishedJobs, .__fulfilledFragments (+21 more)

### Community 26 - "ChapterFields"
Cohesion: 0.07
Nodes (21): ChapterFields, .chapterNumber, .fetchedAt, .fragmentDefinition, .__fulfilledFragments, .id, .isBookmarked, .isDownloaded (+13 more)

### Community 27 - "Manga"
Cohesion: 0.05
Nodes (37): Data, .__fulfilledFragments, .__parentType, .__selections, .updateMangaCategories, Fragments, .mangaFields, Manga (+29 more)

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
Cohesion: 0.11
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
Cohesion: 0.09
Nodes (19): Data, .__fulfilledFragments, .libraryUpdateStatus, .__parentType, .__selections, JobsInfo, .finishedJobs, .__fulfilledFragments (+11 more)

### Community 37 - "ChapterConditionInput"
Cohesion: 0.10
Nodes (17): ChapterConditionInput, .chapterNumber, .fetchedAt, .id, .isBookmarked, .isDownloaded, .isRead, .lastPageRead (+9 more)

### Community 38 - "ExtensionConditionInput"
Cohesion: 0.10
Nodes (17): ExtensionConditionInput, .apkName, .apkUrl, .contentWarning, .extensionLib, .hasUpdate, .iconUrl, .isInstalled (+9 more)

### Community 39 - "API"
Cohesion: 0.16
Nodes (4): API, Foundation, SuwayomiKit, Testing

### Community 40 - "Manga"
Cohesion: 0.15
Nodes (11): Manga, .downloadCount, .__fulfilledFragments, .id, .inLibrary, .__parentType, .__selections, .sourceId (+3 more)

### Community 41 - "ChapterOrderBy"
Cohesion: 0.22
Nodes (8): ChapterOrderBy, chapterNumber, fetchedAt, id, lastReadAt, name, sourceOrder, uploadDate

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
Cohesion: 0.09
Nodes (20): Chapter, .chapterNumber, .fetchedAt, .__fulfilledFragments, .id, .isBookmarked, .isDownloaded, .isRead (+12 more)

### Community 49 - "ExtensionFields"
Cohesion: 0.10
Nodes (15): ExtensionFields, .contentWarning, .fragmentDefinition, .__fulfilledFragments, .hasUpdate, .iconUrl, .isInstalled, .isObsolete (+7 more)

### Community 50 - "AuthMode"
Cohesion: 0.27
Nodes (6): AuthMode, basicAuth, none, simpleLogin, uiLogin, ServerSettings

### Community 51 - "SourceFields"
Cohesion: 0.10
Nodes (14): SourceFields, .contentWarning, .displayName, .fragmentDefinition, .__fulfilledFragments, .homeUrl, .iconUrl, .id (+6 more)

### Community 52 - "StopDownloader"
Cohesion: 0.07
Nodes (19): Data, .__fulfilledFragments, .__parentType, .__selections, .stopDownloader, DownloadStatus, .__fulfilledFragments, .__parentType (+11 more)

### Community 53 - "Node"
Cohesion: 0.10
Nodes (20): Node, .chapterNumber, .fetchedAt, .__fulfilledFragments, .id, .isBookmarked, .isDownloaded, .isRead (+12 more)

### Community 54 - "Chapter"
Cohesion: 0.10
Nodes (20): Chapter, .chapterNumber, .fetchedAt, .__fulfilledFragments, .id, .isBookmarked, .isDownloaded, .isRead (+12 more)

### Community 55 - "CategoryFields"
Cohesion: 0.11
Nodes (12): CategoryFields, .`default`, .fragmentDefinition, .__fulfilledFragments, .id, .includeInDownload, .includeInUpdate, .isDefaultCategory (+4 more)

### Community 57 - "UpdateCategory"
Cohesion: 0.14
Nodes (12): Data, .__fulfilledFragments, .__parentType, .__selections, .updateCategory, Fragments, .categoryFields, UpdateCategory (+4 more)

### Community 58 - "UpdateChapter"
Cohesion: 0.14
Nodes (12): Data, .__fulfilledFragments, .__parentType, .__selections, .updateChapter, Fragments, .chapterFields, UpdateChapter (+4 more)

### Community 59 - "UpdateExtension"
Cohesion: 0.20
Nodes (7): Data, .__fulfilledFragments, .__parentType, .__selections, .updateExtension, Fragments, .extensionFields

### Community 60 - "DequeueChapterDownloadInput"
Cohesion: 0.18
Nodes (5): DequeueChapterDownloadMutation, .__variables, DequeueChapterDownloadInput, .clientMutationId, .id

### Community 62 - "PageInfo"
Cohesion: 0.20
Nodes (8): PageInfo, .endCursor, .__fulfilledFragments, .hasNextPage, .hasPreviousPage, .__parentType, .__selections, .startCursor

### Community 63 - "Extension"
Cohesion: 0.12
Nodes (14): Extension, .contentWarning, .__fulfilledFragments, .hasUpdate, .iconUrl, .isInstalled, .isObsolete, .lang (+6 more)

### Community 64 - "UpdateMangaInput"
Cohesion: 0.29
Nodes (4): UpdateMangaInput, .clientMutationId, .id, .patch

### Community 65 - "DownloadStatus"
Cohesion: 0.25
Nodes (6): DownloadStatus, .__fulfilledFragments, .__parentType, .queue, .__selections, .state

### Community 66 - "Node"
Cohesion: 0.12
Nodes (14): Node, .contentWarning, .__fulfilledFragments, .hasUpdate, .iconUrl, .isInstalled, .isObsolete, .lang (+6 more)

### Community 67 - "MangaStatus"
Cohesion: 0.22
Nodes (8): MangaStatus, cancelled, completed, licensed, ongoing, onHiatus, publishingFinished, unknown

### Community 68 - "PageInfoFields"
Cohesion: 0.14
Nodes (9): PageInfoFields, .endCursor, .fragmentDefinition, .__fulfilledFragments, .hasNextPage, .hasPreviousPage, .__parentType, .__selections (+1 more)

### Community 69 - "EnumType"
Cohesion: 0.10
Nodes (15): AuthMode, basicAuth, none, simpleLogin, uiLogin, ContentWarning, mixed, nsfw (+7 more)

### Community 70 - "InputObject"
Cohesion: 0.23
Nodes (5): ClearCachedImagesInput, .cachedPages, .cachedThumbnails, .clientMutationId, .downloadedThumbnails

### Community 71 - "UpdateManga"
Cohesion: 0.14
Nodes (12): Data, .__fulfilledFragments, .__parentType, .__selections, .updateManga, Fragments, .mangaFields, UpdateManga (+4 more)

### Community 72 - "CreateCategoryInput"
Cohesion: 0.19
Nodes (7): CreateCategoryInput, .clientMutationId, .`default`, .includeInDownload, .includeInUpdate, .name, .order

### Community 73 - "FetchSourceMangaInput"
Cohesion: 0.19
Nodes (7): FetchSourceMangaInput, .clientMutationId, .filters, .page, .query, .source, .type

### Community 74 - "Category"
Cohesion: 0.14
Nodes (11): Category, .`default`, .__fulfilledFragments, .id, .includeInDownload, .includeInUpdate, .isDefaultCategory, .name (+3 more)

### Community 75 - "Login"
Cohesion: 0.09
Nodes (17): Data, .__fulfilledFragments, .login, .__parentType, .__selections, Login, .accessToken, .__fulfilledFragments (+9 more)

### Community 78 - "Category"
Cohesion: 0.07
Nodes (20): Category, .`default`, .__fulfilledFragments, .id, .includeInDownload, .includeInUpdate, .isDefaultCategory, .name (+12 more)

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
Cohesion: 0.09
Nodes (17): Data, .__fulfilledFragments, .__parentType, .__selections, .settings, GetSettingsQuery, Settings, .authMode (+9 more)

### Community 83 - "Node"
Cohesion: 0.20
Nodes (10): Node, .displayName, .__fulfilledFragments, .iconUrl, .id, .lang, .name, .__parentType (+2 more)

### Community 84 - "FragmentContainer"
Cohesion: 0.22
Nodes (7): Data, .fetchChapterPages, .__fulfilledFragments, .__parentType, .__selections, Fragments, .chapterFields

### Community 85 - "Data"
Cohesion: 0.18
Nodes (8): Data, .fetchMangaAndChapters, .__fulfilledFragments, .__parentType, .__selections, Fragments, .chapterFields, .mangaFields

### Community 87 - "Category"
Cohesion: 0.14
Nodes (11): Category, .`default`, .__fulfilledFragments, .id, .includeInDownload, .includeInUpdate, .isDefaultCategory, .name (+3 more)

### Community 88 - "CreateCategory"
Cohesion: 0.20
Nodes (7): CreateCategory, .category, .__fulfilledFragments, .__parentType, .__selections, Fragments, .categoryFields

### Community 89 - "DeleteDownloadedChapter"
Cohesion: 0.20
Nodes (7): DeleteDownloadedChapter, .chapters, .__fulfilledFragments, .__parentType, .__selections, Fragments, .chapterFields

### Community 90 - "Data"
Cohesion: 0.20
Nodes (7): Data, .__fulfilledFragments, .__parentType, .__selections, .source, Fragments, .sourceFields

### Community 91 - "Data"
Cohesion: 0.20
Nodes (7): Data, .chapter, .__fulfilledFragments, .__parentType, .__selections, Fragments, .chapterFields

### Community 92 - "UpdateStrategy"
Cohesion: 0.29
Nodes (5): Manga, MangaSummary, UpdateStrategy, alwaysUpdate, onlyFetchOnce

### Community 93 - "FetchMangaAndChaptersInput"
Cohesion: 0.24
Nodes (5): FetchMangaAndChaptersInput, .clientMutationId, .fetchChapters, .fetchManga, .id

### Community 94 - "SourceConditionInput"
Cohesion: 0.23
Nodes (5): SourceConditionInput, .contentWarning, .id, .lang, .name

### Community 95 - "UpdateCategoryPatchInput"
Cohesion: 0.24
Nodes (5): UpdateCategoryPatchInput, .`default`, .includeInDownload, .includeInUpdate, .name

### Community 97 - "DataDict"
Cohesion: 0.15
Nodes (8): Data, .downloadStatus, .__fulfilledFragments, .__parentType, .__selections, Fragments, .chapterFields, .mangaSummaryFields

### Community 98 - "Data"
Cohesion: 0.22
Nodes (7): Data, .extensions, .__fulfilledFragments, .__parentType, .__selections, Fragments, .extensionFields

### Community 99 - "Codable"
Cohesion: 0.20
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
Cohesion: 0.18
Nodes (5): CategoryIncludeOrExclude, exclude, include, unset, ModelMappingTests

### Community 105 - "UpdateChapterInput"
Cohesion: 0.29
Nodes (4): UpdateChapterInput, .clientMutationId, .id, .patch

### Community 106 - "UpdateChapterPatchInput"
Cohesion: 0.29
Nodes (4): UpdateChapterPatchInput, .isBookmarked, .isRead, .lastPageRead

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
Cohesion: 0.22
Nodes (6): Extensions, .__fulfilledFragments, .nodes, .__parentType, .__selections, .totalCount

### Community 111 - "PageInfo"
Cohesion: 0.20
Nodes (8): PageInfo, .endCursor, .__fulfilledFragments, .hasNextPage, .hasPreviousPage, .__parentType, .__selections, .startCursor

### Community 112 - "PageInfo"
Cohesion: 0.22
Nodes (8): PageInfo, .endCursor, .__fulfilledFragments, .hasNextPage, .hasPreviousPage, .__parentType, .__selections, .startCursor

### Community 113 - "DeleteDownloadedChapterInput"
Cohesion: 0.33
Nodes (3): DeleteDownloadedChapterInput, .clientMutationId, .id

### Community 114 - "UpdateExtensionInput"
Cohesion: 0.31
Nodes (4): UpdateExtensionInput, .clientMutationId, .id, .patch

### Community 115 - "UpdateExtensionPatchInput"
Cohesion: 0.31
Nodes (4): UpdateExtensionPatchInput, .install, .uninstall, .update

### Community 116 - "SourceMangaType"
Cohesion: 0.22
Nodes (4): SourceMangaType, latest, popular, search

### Community 118 - "UpdateCategoryInput"
Cohesion: 0.29
Nodes (4): UpdateCategoryInput, .clientMutationId, .id, .patch

### Community 121 - "UpdateCategoryOrderInput"
Cohesion: 0.29
Nodes (4): UpdateCategoryOrderInput, .clientMutationId, .id, .position

### Community 123 - "DataDict"
Cohesion: 0.29
Nodes (3): Fragments, .pageInfoFields, .sourceSummaryFields

### Community 125 - "FetchChapterPages"
Cohesion: 0.25
Nodes (6): FetchChapterPages, .chapter, .__fulfilledFragments, .pages, .__parentType, .__selections

### Community 126 - "SortOrder"
Cohesion: 0.25
Nodes (7): SortOrder, asc, ascNullsFirst, ascNullsLast, desc, descNullsFirst, descNullsLast

### Community 127 - "MangaStatus"
Cohesion: 0.22
Nodes (8): MangaStatus, cancelled, completed, licensed, ongoing, onHiatus, publishingFinished, unknown

### Community 128 - "FetchSourceManga"
Cohesion: 0.25
Nodes (6): FetchSourceManga, .__fulfilledFragments, .hasNextPage, .mangas, .__parentType, .__selections

### Community 130 - "Data"
Cohesion: 0.29
Nodes (5): Data, .chapters, .__fulfilledFragments, .__parentType, .__selections

### Community 133 - "Categories"
Cohesion: 0.29
Nodes (5): Categories, .__fulfilledFragments, .nodes, .__parentType, .__selections

### Community 134 - "Data"
Cohesion: 0.29
Nodes (5): Data, .__fulfilledFragments, .manga, .__parentType, .__selections

### Community 135 - "DataDict"
Cohesion: 0.33
Nodes (3): Fragments, .categoryFields, .mangaFields

### Community 136 - "ChapterOrderInput"
Cohesion: 0.36
Nodes (3): ChapterOrderInput, .by, .byType

### Community 138 - "DataDict"
Cohesion: 0.33
Nodes (3): Fragments, .chapterFields, .pageInfoFields

### Community 141 - "Data"
Cohesion: 0.33
Nodes (5): Data, .deleteDownloadedChapter, .__fulfilledFragments, .__parentType, .__selections

### Community 144 - "SortSelectionInput"
Cohesion: 0.36
Nodes (3): SortSelectionInput, .ascending, .index

### Community 145 - "UpdateExtension"
Cohesion: 0.29
Nodes (5): UpdateExtension, .`extension`, .__fulfilledFragments, .__parentType, .__selections

### Community 147 - "GraphQLMutation"
Cohesion: 0.15
Nodes (4): ClearCachedImagesMutation, .__variables, UpdateMangaCategoriesMutation, .__variables

### Community 148 - "Data"
Cohesion: 0.33
Nodes (5): Data, .__fulfilledFragments, .__parentType, .__selections, .sources

### Community 151 - "IncludeOrExclude"
Cohesion: 0.40
Nodes (4): IncludeOrExclude, exclude, include, unset

### Community 154 - "Data"
Cohesion: 0.33
Nodes (5): Data, .createCategory, .__fulfilledFragments, .__parentType, .__selections

### Community 156 - "Data"
Cohesion: 0.33
Nodes (5): Data, .fetchSourceManga, .__fulfilledFragments, .__parentType, .__selections

### Community 160 - "Data"
Cohesion: 0.33
Nodes (5): Data, .__fulfilledFragments, .__parentType, .__selections, .updateCategoryOrder

### Community 161 - "UpdateCategoryOrder"
Cohesion: 0.33
Nodes (5): UpdateCategoryOrder, .categories, .__fulfilledFragments, .__parentType, .__selections

### Community 163 - "Data"
Cohesion: 0.33
Nodes (5): Data, .`extension`, .__fulfilledFragments, .__parentType, .__selections

### Community 165 - "DownloadState"
Cohesion: 0.33
Nodes (5): DownloadState, downloading, error, finished, queued

### Community 168 - "FetchSourceMangaType"
Cohesion: 0.40
Nodes (4): FetchSourceMangaType, latest, popular, search

### Community 169 - "TriState"
Cohesion: 0.40
Nodes (4): TriState, exclude, ignore, include

## Knowledge Gaps
- **1172 isolated node(s):** `PackageDescription`, `.fragmentDefinition`, `.__parentType`, `.__selections`, `.__fulfilledFragments` (+1167 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 1389 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **38 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `ApolloAPI` connect `ApolloAPI` to `SchemaMetadata.graphql.swift`, `MangaSummaryFields`, `AboutServer`, `SourceSummaryFields`, `Category`, `Category`, `Manga`, `FilterChangeInput`, `Node`, `Source`, `DequeueChapterDownload`, `EnqueueChapterDownload`, `StartDownloader`, `MangaFields`, `ClearDownloader`, `Extension`, `ClearCachedImages`, `JobsInfo`, `ChapterFields`, `Manga`, `Manga`, `Data`, `Data`, `Manga`, `DownloaderState`, `MangaConditionInput`, `Manga`, `Node`, `JobsInfo`, `ChapterConditionInput`, `ExtensionConditionInput`, `API`, `Manga`, `ChapterOrderBy`, `Chapters`, `Chapter`, `Chapter`, `Chapter`, `Chapter`, `.mutation`, `ExtensionFields`, `SourceFields`, `StopDownloader`, `Node`, `Chapter`, `CategoryFields`, `UpdateCategory`, `UpdateChapter`, `UpdateExtension`, `DequeueChapterDownloadInput`, `PageInfo`, `Extension`, `UpdateMangaInput`, `DownloadStatus`, `Node`, `MangaStatus`, `PageInfoFields`, `EnumType`, `InputObject`, `UpdateManga`, `CreateCategoryInput`, `FetchSourceMangaInput`, `Category`, `Login`, `UpdateExtensionMutation`, `Category`, `Queue`, `Data`, `Node`, `Settings`, `Node`, `FragmentContainer`, `Data`, `Category`, `CreateCategory`, `DeleteDownloadedChapter`, `Data`, `Data`, `FetchMangaAndChaptersInput`, `SourceConditionInput`, `UpdateCategoryPatchInput`, `DataDict`, `Data`, `Chapters`, `Mangas`, `Sources`, `FetchChapterPagesInput`, `UpdateChapterInput`, `UpdateChapterPatchInput`, `UpdateMangaCategoriesInput`, `UpdateMangaCategoriesPatchInput`, `FetchMangaAndChapters`, `Extensions`, `PageInfo`, `PageInfo`, `DeleteDownloadedChapterInput`, `UpdateExtensionInput`, `UpdateExtensionPatchInput`, `InputObject`, `UpdateCategoryInput`, `GetChaptersQuery`, `GetLibraryMangasQuery`, `UpdateCategoryOrderInput`, `GetSourcesQuery`, `FetchChapterPages`, `SortOrder`, `FetchSourceManga`, `GetChapterQuery`, `Data`, `GetExtensionsQuery`, `GetMangaQuery`, `Categories`, `Data`, `ChapterOrderInput`, `GetSourceQuery`, `DeleteDownloadedChapterMutation`, `Data`, `FetchChapterPagesMutation`, `FetchMangaAndChaptersMutation`, `SortSelectionInput`, `UpdateExtension`, `UpdateChapterMutation`, `GraphQLMutation`, `Data`, `UpdateMangaMutation`, `GetLibraryUpdateStatusQuery`, `IncludeOrExclude`, `SchemaConfiguration`, `CreateCategoryMutation`, `Data`, `FetchSourceMangaMutation`, `Data`, `UpdateCategoryMutation`, `Data`, `UpdateCategoryOrder`, `GetExtensionQuery`, `Data`, `DownloadState`, `FetchSourceMangaType`, `TriState`?**
  _High betweenness centrality (0.558) - this node is a cross-community bridge._
- **Are the 18 inferred relationships involving `SuwayomiClient` (e.g. with `.testAbsoluteURLResolution()` and `.testAuthenticatedCopy()`) actually correct?**
  _`SuwayomiClient` has 18 INFERRED edges - model-reasoned connections that need verification._
- **What connects `PackageDescription`, `.fragmentDefinition`, `.__parentType` to the rest of the system?**
  _1172 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `MangaSummaryFields` be split into smaller, more focused modules?**
  _Cohesion score 0.1111111111111111 - nodes in this community are weakly interconnected._
- **Why does `API` connect `API` to `MangaSummaryFields`, `Sendable`, `String`, `AboutServer`, `SourceSummaryFields`, `Category`, `Category`, `Manga`, `Node`, `Source`, `DequeueChapterDownload`, `EnqueueChapterDownload`, `StartDownloader`, `MangaFields`, `ClearDownloader`, `Extension`, `ClearCachedImages`, `JobsInfo`, `ChapterFields`, `Manga`, `Manga`, `Data`, `Data`, `Manga`, `DownloaderState`, `Manga`, `Node`, `JobsInfo`, `Manga`, `Chapters`, `Chapter`, `Chapter`, `Chapter`, `Chapter`, `ExtensionFields`, `AuthMode`, `SourceFields`, `StopDownloader`, `Node`, `Chapter`, `CategoryFields`, `UpdateCategory`, `UpdateChapter`, `UpdateExtension`, `PageInfo`, `Extension`, `DownloadStatus`, `Node`, `PageInfoFields`, `UpdateManga`, `Category`, `Login`, `Category`, `Queue`, `Data`, `Node`, `Settings`, `Node`, `FragmentContainer`, `Data`, `Category`, `CreateCategory`, `DeleteDownloadedChapter`, `Data`, `Data`, `UpdateStrategy`, `DataDict`, `Data`, `Codable`, `Chapters`, `Mangas`, `Sources`, `CategoryIncludeOrExclude`, `FetchMangaAndChapters`, `Extensions`, `PageInfo`, `PageInfo`, `SourceMangaType`, `FetchChapterPages`, `MangaStatus`, `FetchSourceManga`, `Data`, `Categories`, `Data`, `Chapter`, `Data`, `UpdateExtension`, `Data`, `Data`, `Data`, `Data`, `UpdateCategoryOrder`, `Data`, `Extension`?**
  _High betweenness centrality (0.306) - this node is a cross-community bridge._
- **Should `AboutServer` be split into smaller, more focused modules?**
  _Cohesion score 0.05319148936170213 - nodes in this community are weakly interconnected._
- **Why does `Manga` connect `Manga` to `ApolloAPI`, `GraphQLMutation`, `API`?**
  _High betweenness centrality (0.051) - this node is a cross-community bridge._