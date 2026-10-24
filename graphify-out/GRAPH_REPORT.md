# Graph Report - SuwayomiKit  (2026-10-25)

## Corpus Check
- 172 files · ~30,232 words
- Verdict: corpus is large enough that graph structure adds value.
- Unclassified: 31 file(s) not represented in the graph (top: .graphql 25, (none) 4, .graphqls 1)

## Summary
- 2458 nodes · 3919 edges · 153 communities (120 shown, 33 thin omitted)
- Extraction: 96% EXTRACTED · 4% INFERRED · 0% AMBIGUOUS · INFERRED: 149 edges (avg confidence: 0.85)
- Token cost: 0 input · 0 output

## Graph Freshness
- Built from commit: `03844600`
- Run `git rev-parse HEAD` and compare to check if the graph is stale.
- Run `graphify update .` after code changes (no API cost).

## Community Hubs (Navigation)
- SchemaMetadata.graphql.swift
- PlatformInfo
- Package API & Roadmap
- Sendable
- Data
- AboutServer
- AboutServerQuery
- Swift Package Manifest
- Pagination Helpers (Planned)
- AGENTS.md
- SuwayomiError
- ApolloAPI
- Category
- Category
- Manga
- FetchSourceMangaInput
- Node
- Source
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
- API
- Manga
- ChapterOrderBy
- Chapters
- Chapter
- Chapter
- Chapter
- Chapter
- SuwayomiClient
- ExtensionFields
- String
- SourceFields
- StopDownloader
- Node
- Chapter
- CategoryFields
- .fetchData
- UpdateCategory
- UpdateChapter
- UpdateExtension
- UpdateMangaCategories
- PageInfo
- Extension
- UpdateMangaInput
- DownloadStatus
- Node
- MangaStatus
- PageInfoFields
- ContentWarning
- LoginInput
- UpdateLibraryInput
- CreateCategoryInput
- GraphQLMutation
- Category
- Login
- Category
- UpdateExtensionMutation
- Category
- Queue
- Data
- Node
- Settings
- Node
- FragmentContainer
- Data
- LibraryJobsInfo
- GraphQLQuery
- CreateCategory
- DeleteDownloadedChapter
- Data
- Data
- UpdateStrategy
- FetchMangaAndChaptersInput
- SourceConditionInput
- UpdateCategoryPatchInput
- MockURLProtocol
- Data
- Data
- Codable
- Chapters
- Mangas
- Sources
- FetchChapterPagesInput
- UpdateCategoryInput
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
- FetchSourceManga
- GetChaptersQuery
- GetLibraryMangasQuery
- Data
- GetSourcesQuery
- DataDict
- FetchChapterPages
- DataDict
- Jvm
- Os
- GetChapterQuery
- Data
- GetExtensionsQuery
- GetMangaQuery
- Categories
- Data
- DataDict
- AuthTokens
- Chapter
- CreateCategoryMutation
- Data
- DeleteDownloadedChapterMutation
- Data
- FetchChapterPagesMutation
- FetchMangaAndChaptersMutation
- FetchSourceMangaMutation
- UpdateCategoryMutation
- UpdateChapterMutation
- UpdateMangaCategoriesMutation
- Data
- Data
- GetLibraryUpdateStatusQuery
- IncludeOrExclude
- SchemaConfiguration

## God Nodes (most connected - your core abstractions)
1. `ApolloAPI` - 303 edges
2. `API` - 147 edges
3. `SuwayomiClient` - 82 edges
4. `Objects` - 51 edges
5. `MangaFields` - 43 edges
6. `ChapterFields` - 38 edges
7. `Manga` - 37 edges
8. `Source` - 36 edges
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

## Communities (153 total, 33 thin omitted)

### Community 0 - "SchemaMetadata.graphql.swift"
Cohesion: 0.18
Nodes (7): InlineFragment, Interfaces, MutableInlineFragment, MutableSelectionSet, SchemaMetadata, SelectionSet, Unions

### Community 1 - "PlatformInfo"
Cohesion: 0.22
Nodes (8): PlatformInfo, .arch, .__fulfilledFragments, .headless, .jvm, .os, .__parentType, .__selections

### Community 2 - "Package API & Roadmap"
Cohesion: 0.17
Nodes (14): AboutServerQuery, API Target, ApolloClient Setup, apollo-codegen-config.json, Apollo iOS, Async/Await Client, Generated GraphQL Layer, Page and Thumbnail Fetching (+6 more)

### Community 3 - "Sendable"
Cohesion: 0.19
Nodes (9): Category, CategoryIncludeOrExclude, exclude, include, unset, JVM, OS, Platform (+1 more)

### Community 4 - "Data"
Cohesion: 0.22
Nodes (5): Data, .aboutServer, .__fulfilledFragments, .__parentType, .__selections

### Community 5 - "AboutServer"
Cohesion: 0.18
Nodes (11): AboutServer, .buildTime, .buildType, .discord, .__fulfilledFragments, .github, .name, .__parentType (+3 more)

### Community 6 - "AboutServerQuery"
Cohesion: 0.24
Nodes (4): AboutServerQuery, ServerInfo.Platform, ServerInfo.Platform.JVM, ServerInfo.Platform.OS

### Community 10 - "SuwayomiError"
Cohesion: 0.13
Nodes (10): Apollo, OperationError, SuwayomiError, .errorDescription, missingData, network, operation, server (+2 more)

### Community 12 - "Category"
Cohesion: 0.05
Nodes (29): Category, .`default`, .__fulfilledFragments, .id, .includeInDownload, .includeInUpdate, .isDefaultCategory, .name (+21 more)

### Community 13 - "Category"
Cohesion: 0.05
Nodes (28): Category, .`default`, .__fulfilledFragments, .id, .includeInDownload, .includeInUpdate, .isDefaultCategory, .name (+20 more)

### Community 14 - "Manga"
Cohesion: 0.05
Nodes (37): Data, .__fulfilledFragments, .__parentType, .__selections, .updateManga, Fragments, .mangaFields, Manga (+29 more)

### Community 15 - "FetchSourceMangaInput"
Cohesion: 0.06
Nodes (22): FetchSourceMangaType, latest, popular, search, FetchSourceMangaInput, .clientMutationId, .filters, .page (+14 more)

### Community 16 - "Node"
Cohesion: 0.06
Nodes (25): Categories, .__fulfilledFragments, .nodes, .__parentType, .__selections, .totalCount, Data, .categories (+17 more)

### Community 17 - "Source"
Cohesion: 0.07
Nodes (22): Data, .__fulfilledFragments, .__parentType, .__selections, .source, Fragments, .sourceFields, GetSourceQuery (+14 more)

### Community 18 - "DequeueChapterDownload"
Cohesion: 0.07
Nodes (20): Data, .dequeueChapterDownload, .__fulfilledFragments, .__parentType, .__selections, DequeueChapterDownload, .downloadStatus, .__fulfilledFragments (+12 more)

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
Cohesion: 0.07
Nodes (23): Data, .`extension`, .__fulfilledFragments, .__parentType, .__selections, Extension, .contentWarning, .__fulfilledFragments (+15 more)

### Community 24 - "ClearCachedImagesInput"
Cohesion: 0.08
Nodes (19): ClearCachedImages, .cachedPages, .cachedThumbnails, .downloadedThumbnails, .__fulfilledFragments, .__parentType, .__selections, ClearCachedImagesMutation (+11 more)

### Community 25 - "JobsInfo"
Cohesion: 0.08
Nodes (22): Data, .__fulfilledFragments, .__parentType, .__selections, .updateLibrary, JobsInfo, .finishedJobs, .__fulfilledFragments (+14 more)

### Community 26 - "ChapterFields"
Cohesion: 0.07
Nodes (21): ChapterFields, .chapterNumber, .fetchedAt, .fragmentDefinition, .__fulfilledFragments, .id, .isBookmarked, .isDownloaded (+13 more)

### Community 27 - "Manga"
Cohesion: 0.07
Nodes (25): Manga, .artist, .author, .bookmarkCount, .chaptersLastFetchedAt, .description, .downloadCount, .__fulfilledFragments (+17 more)

### Community 28 - "Manga"
Cohesion: 0.07
Nodes (25): Manga, .artist, .author, .bookmarkCount, .chaptersLastFetchedAt, .description, .downloadCount, .__fulfilledFragments (+17 more)

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
Nodes (17): DownloaderState, started, stopped, DownloadState, downloading, error, finished, queued (+9 more)

### Community 33 - "MangaConditionInput"
Cohesion: 0.09
Nodes (18): MangaConditionInput, .artist, .author, .categoryIds, .chaptersLastFetchedAt, .description, .genre, .id (+10 more)

### Community 34 - "Manga"
Cohesion: 0.08
Nodes (25): Manga, .artist, .author, .bookmarkCount, .chaptersLastFetchedAt, .description, .downloadCount, .__fulfilledFragments (+17 more)

### Community 35 - "Node"
Cohesion: 0.08
Nodes (25): Node, .artist, .author, .bookmarkCount, .chaptersLastFetchedAt, .description, .downloadCount, .__fulfilledFragments (+17 more)

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
Cohesion: 0.15
Nodes (4): API, Foundation, SuwayomiKit, Testing

### Community 40 - "Manga"
Cohesion: 0.08
Nodes (25): Manga, .artist, .author, .bookmarkCount, .chaptersLastFetchedAt, .description, .downloadCount, .__fulfilledFragments (+17 more)

### Community 41 - "ChapterOrderBy"
Cohesion: 0.10
Nodes (18): ChapterOrderBy, chapterNumber, fetchedAt, id, lastReadAt, name, sourceOrder, uploadDate (+10 more)

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

### Community 50 - "String"
Cohesion: 0.12
Nodes (14): AuthMode, basicAuth, none, simpleLogin, uiLogin, TriState, exclude, ignore (+6 more)

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

### Community 57 - "UpdateCategory"
Cohesion: 0.14
Nodes (12): Data, .__fulfilledFragments, .__parentType, .__selections, .updateCategory, Fragments, .categoryFields, UpdateCategory (+4 more)

### Community 58 - "UpdateChapter"
Cohesion: 0.14
Nodes (12): Data, .__fulfilledFragments, .__parentType, .__selections, .updateChapter, Fragments, .chapterFields, UpdateChapter (+4 more)

### Community 59 - "UpdateExtension"
Cohesion: 0.14
Nodes (12): Data, .__fulfilledFragments, .__parentType, .__selections, .updateExtension, Fragments, .extensionFields, UpdateExtension (+4 more)

### Community 60 - "UpdateMangaCategories"
Cohesion: 0.14
Nodes (12): Data, .__fulfilledFragments, .__parentType, .__selections, .updateMangaCategories, Fragments, .mangaFields, UpdateMangaCategories (+4 more)

### Community 62 - "PageInfo"
Cohesion: 0.14
Nodes (11): Fragments, .chapterFields, .pageInfoFields, PageInfo, .endCursor, .__fulfilledFragments, .hasNextPage, .hasPreviousPage (+3 more)

### Community 63 - "Extension"
Cohesion: 0.12
Nodes (14): Extension, .contentWarning, .__fulfilledFragments, .hasUpdate, .iconUrl, .isInstalled, .isObsolete, .lang (+6 more)

### Community 64 - "UpdateMangaInput"
Cohesion: 0.17
Nodes (6): UpdateMangaMutation, .__variables, UpdateMangaInput, .clientMutationId, .id, .patch

### Community 65 - "DownloadStatus"
Cohesion: 0.14
Nodes (9): DownloadStatus, .__fulfilledFragments, .__parentType, .queue, .__selections, .state, Fragments, .chapterFields (+1 more)

### Community 66 - "Node"
Cohesion: 0.12
Nodes (14): Node, .contentWarning, .__fulfilledFragments, .hasUpdate, .iconUrl, .isInstalled, .isObsolete, .lang (+6 more)

### Community 67 - "MangaStatus"
Cohesion: 0.12
Nodes (15): MangaStatus, cancelled, completed, licensed, ongoing, onHiatus, publishingFinished, unknown (+7 more)

### Community 68 - "PageInfoFields"
Cohesion: 0.14
Nodes (9): PageInfoFields, .endCursor, .fragmentDefinition, .__fulfilledFragments, .hasNextPage, .hasPreviousPage, .__parentType, .__selections (+1 more)

### Community 69 - "ContentWarning"
Cohesion: 0.16
Nodes (9): ContentWarning, mixed, nsfw, safe, Extension, .id, mixed, nsfw (+1 more)

### Community 70 - "LoginInput"
Cohesion: 0.17
Nodes (6): LoginMutation, .__variables, LoginInput, .clientMutationId, .password, .username

### Community 71 - "UpdateLibraryInput"
Cohesion: 0.18
Nodes (5): UpdateLibraryMutation, .__variables, UpdateLibraryInput, .categories, .clientMutationId

### Community 72 - "CreateCategoryInput"
Cohesion: 0.19
Nodes (7): CreateCategoryInput, .clientMutationId, .`default`, .includeInDownload, .includeInUpdate, .name, .order

### Community 73 - "GraphQLMutation"
Cohesion: 0.19
Nodes (4): StopDownloaderMutation, .__variables, StopDownloaderInput, .clientMutationId

### Community 74 - "Category"
Cohesion: 0.14
Nodes (11): Category, .`default`, .__fulfilledFragments, .id, .includeInDownload, .includeInUpdate, .isDefaultCategory, .name (+3 more)

### Community 75 - "Login"
Cohesion: 0.18
Nodes (11): Data, .__fulfilledFragments, .login, .__parentType, .__selections, Login, .accessToken, .__fulfilledFragments (+3 more)

### Community 76 - "Category"
Cohesion: 0.14
Nodes (11): Category, .`default`, .__fulfilledFragments, .id, .includeInDownload, .includeInUpdate, .isDefaultCategory, .name (+3 more)

### Community 78 - "Category"
Cohesion: 0.14
Nodes (11): Category, .`default`, .__fulfilledFragments, .id, .includeInDownload, .includeInUpdate, .isDefaultCategory, .name (+3 more)

### Community 79 - "Queue"
Cohesion: 0.14
Nodes (10): Queue, .chapter, .__fulfilledFragments, .manga, .__parentType, .position, .progress, .__selections (+2 more)

### Community 80 - "Data"
Cohesion: 0.16
Nodes (8): Data, .__fulfilledFragments, .mangas, .__parentType, .__selections, Fragments, .mangaFields, .pageInfoFields

### Community 81 - "Node"
Cohesion: 0.14
Nodes (11): Node, .`default`, .__fulfilledFragments, .id, .includeInDownload, .includeInUpdate, .isDefaultCategory, .name (+3 more)

### Community 82 - "Settings"
Cohesion: 0.14
Nodes (11): Settings, .authMode, .authUsername, .autoDownloadNewChapters, .downloadsPath, .__fulfilledFragments, .ip, .maxSourcesInParallel (+3 more)

### Community 83 - "Node"
Cohesion: 0.14
Nodes (13): Node, .contentWarning, .displayName, .__fulfilledFragments, .homeUrl, .iconUrl, .id, .isConfigurable (+5 more)

### Community 84 - "FragmentContainer"
Cohesion: 0.18
Nodes (7): Data, .fetchChapterPages, .__fulfilledFragments, .__parentType, .__selections, Fragments, .chapterFields

### Community 85 - "Data"
Cohesion: 0.18
Nodes (8): Data, .fetchMangaAndChapters, .__fulfilledFragments, .__parentType, .__selections, Fragments, .chapterFields, .mangaFields

### Community 87 - "GraphQLQuery"
Cohesion: 0.18
Nodes (3): GetCategoryQuery, .__variables, GetSettingsQuery

### Community 88 - "CreateCategory"
Cohesion: 0.20
Nodes (7): CreateCategory, .category, .__fulfilledFragments, .__parentType, .__selections, Fragments, .categoryFields

### Community 89 - "DeleteDownloadedChapter"
Cohesion: 0.20
Nodes (7): DeleteDownloadedChapter, .chapters, .__fulfilledFragments, .__parentType, .__selections, Fragments, .chapterFields

### Community 90 - "Data"
Cohesion: 0.20
Nodes (7): Data, .category, .__fulfilledFragments, .__parentType, .__selections, Fragments, .categoryFields

### Community 91 - "Data"
Cohesion: 0.20
Nodes (7): Data, .chapter, .__fulfilledFragments, .__parentType, .__selections, Fragments, .chapterFields

### Community 92 - "UpdateStrategy"
Cohesion: 0.24
Nodes (6): UpdateStrategy, alwaysUpdate, onlyFetchOnce, Manga, alwaysUpdate, onlyFetchOnce

### Community 93 - "FetchMangaAndChaptersInput"
Cohesion: 0.24
Nodes (5): FetchMangaAndChaptersInput, .clientMutationId, .fetchChapters, .fetchManga, .id

### Community 94 - "SourceConditionInput"
Cohesion: 0.24
Nodes (5): SourceConditionInput, .contentWarning, .id, .lang, .name

### Community 95 - "UpdateCategoryPatchInput"
Cohesion: 0.24
Nodes (5): UpdateCategoryPatchInput, .`default`, .includeInDownload, .includeInUpdate, .name

### Community 97 - "Data"
Cohesion: 0.18
Nodes (6): Data, .downloadStatus, .__fulfilledFragments, .__parentType, .__selections, GetDownloadStatusQuery

### Community 98 - "Data"
Cohesion: 0.22
Nodes (7): Data, .extensions, .__fulfilledFragments, .__parentType, .__selections, Fragments, .extensionFields

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

### Community 104 - "UpdateCategoryInput"
Cohesion: 0.29
Nodes (4): UpdateCategoryInput, .clientMutationId, .id, .patch

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
Cohesion: 0.22
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
Cohesion: 0.25
Nodes (4): SourceMangaType, latest, popular, search

### Community 118 - "FetchSourceManga"
Cohesion: 0.25
Nodes (6): FetchSourceManga, .__fulfilledFragments, .hasNextPage, .mangas, .__parentType, .__selections

### Community 121 - "Data"
Cohesion: 0.29
Nodes (5): Data, .__fulfilledFragments, .__parentType, .__selections, .settings

### Community 123 - "DataDict"
Cohesion: 0.29
Nodes (3): Fragments, .pageInfoFields, .sourceFields

### Community 125 - "FetchChapterPages"
Cohesion: 0.29
Nodes (6): FetchChapterPages, .chapter, .__fulfilledFragments, .pages, .__parentType, .__selections

### Community 127 - "Jvm"
Cohesion: 0.29
Nodes (6): Jvm, .__fulfilledFragments, .javaVersion, .__parentType, .__selections, .vmName

### Community 128 - "Os"
Cohesion: 0.29
Nodes (6): Os, .__fulfilledFragments, .name, .__parentType, .__selections, .version

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

### Community 139 - "Data"
Cohesion: 0.33
Nodes (5): Data, .createCategory, .__fulfilledFragments, .__parentType, .__selections

### Community 141 - "Data"
Cohesion: 0.33
Nodes (5): Data, .deleteDownloadedChapter, .__fulfilledFragments, .__parentType, .__selections

### Community 148 - "Data"
Cohesion: 0.33
Nodes (5): Data, .__fulfilledFragments, .__parentType, .__selections, .sources

### Community 149 - "Data"
Cohesion: 0.40
Nodes (5): Data, .fetchSourceManga, .__fulfilledFragments, .__parentType, .__selections

### Community 151 - "IncludeOrExclude"
Cohesion: 0.40
Nodes (4): IncludeOrExclude, exclude, include, unset

## Knowledge Gaps
- **1192 isolated node(s):** `PackageDescription`, `.fragmentDefinition`, `.__parentType`, `.__selections`, `.__fulfilledFragments` (+1187 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 1401 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **33 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `ApolloAPI` connect `ApolloAPI` to `SchemaMetadata.graphql.swift`, `PlatformInfo`, `Data`, `AboutServer`, `AboutServerQuery`, `Category`, `Category`, `Manga`, `FetchSourceMangaInput`, `Node`, `Source`, `DequeueChapterDownload`, `EnqueueChapterDownload`, `StartDownloader`, `MangaFields`, `ClearDownloader`, `Extension`, `ClearCachedImagesInput`, `JobsInfo`, `ChapterFields`, `Manga`, `Manga`, `Data`, `Data`, `Manga`, `DownloaderState`, `MangaConditionInput`, `Manga`, `Node`, `JobsInfo`, `ChapterConditionInput`, `ExtensionConditionInput`, `API`, `Manga`, `ChapterOrderBy`, `Chapters`, `Chapter`, `Chapter`, `Chapter`, `Chapter`, `ExtensionFields`, `String`, `SourceFields`, `StopDownloader`, `Node`, `Chapter`, `CategoryFields`, `UpdateCategory`, `UpdateChapter`, `UpdateExtension`, `UpdateMangaCategories`, `PageInfo`, `Extension`, `UpdateMangaInput`, `DownloadStatus`, `Node`, `MangaStatus`, `PageInfoFields`, `ContentWarning`, `LoginInput`, `UpdateLibraryInput`, `CreateCategoryInput`, `GraphQLMutation`, `Category`, `Login`, `Category`, `UpdateExtensionMutation`, `Category`, `Queue`, `Data`, `Node`, `Settings`, `Node`, `FragmentContainer`, `Data`, `GraphQLQuery`, `CreateCategory`, `DeleteDownloadedChapter`, `Data`, `Data`, `UpdateStrategy`, `FetchMangaAndChaptersInput`, `SourceConditionInput`, `UpdateCategoryPatchInput`, `Data`, `Data`, `Chapters`, `Mangas`, `Sources`, `FetchChapterPagesInput`, `UpdateCategoryInput`, `UpdateChapterInput`, `UpdateChapterPatchInput`, `UpdateMangaCategoriesInput`, `UpdateMangaCategoriesPatchInput`, `FetchMangaAndChapters`, `Extensions`, `PageInfo`, `PageInfo`, `DeleteDownloadedChapterInput`, `UpdateExtensionInput`, `UpdateExtensionPatchInput`, `InputObject`, `FetchSourceManga`, `GetChaptersQuery`, `GetLibraryMangasQuery`, `Data`, `GetSourcesQuery`, `FetchChapterPages`, `Jvm`, `Os`, `GetChapterQuery`, `Data`, `GetExtensionsQuery`, `GetMangaQuery`, `Categories`, `Data`, `CreateCategoryMutation`, `Data`, `DeleteDownloadedChapterMutation`, `Data`, `FetchChapterPagesMutation`, `FetchMangaAndChaptersMutation`, `FetchSourceMangaMutation`, `UpdateCategoryMutation`, `UpdateChapterMutation`, `UpdateMangaCategoriesMutation`, `Data`, `Data`, `GetLibraryUpdateStatusQuery`, `IncludeOrExclude`, `SchemaConfiguration`?**
  _High betweenness centrality (0.585) - this node is a cross-community bridge._
- **Are the 18 inferred relationships involving `SuwayomiClient` (e.g. with `.testAbsoluteURLResolution()` and `.testAuthenticatedCopy()`) actually correct?**
  _`SuwayomiClient` has 18 INFERRED edges - model-reasoned connections that need verification._
- **What connects `PackageDescription`, `.fragmentDefinition`, `.__parentType` to the rest of the system?**
  _1192 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `SuwayomiError` be split into smaller, more focused modules?**
  _Cohesion score 0.13450292397660818 - nodes in this community are weakly interconnected._
- **Why does `API` connect `API` to `PlatformInfo`, `Sendable`, `Data`, `AboutServer`, `Category`, `Category`, `Manga`, `Node`, `Source`, `DequeueChapterDownload`, `EnqueueChapterDownload`, `StartDownloader`, `MangaFields`, `ClearDownloader`, `Extension`, `ClearCachedImagesInput`, `JobsInfo`, `ChapterFields`, `Manga`, `Manga`, `Data`, `Data`, `Manga`, `DownloaderState`, `Manga`, `Node`, `JobsInfo`, `Manga`, `Chapters`, `Chapter`, `Chapter`, `Chapter`, `Chapter`, `.mutation`, `ExtensionFields`, `SourceFields`, `StopDownloader`, `Node`, `Chapter`, `CategoryFields`, `UpdateCategory`, `UpdateChapter`, `UpdateExtension`, `UpdateMangaCategories`, `.query`, `PageInfo`, `Extension`, `DownloadStatus`, `Node`, `PageInfoFields`, `ContentWarning`, `Category`, `Login`, `Category`, `Category`, `Queue`, `Data`, `Node`, `Settings`, `Node`, `FragmentContainer`, `Data`, `CreateCategory`, `DeleteDownloadedChapter`, `Data`, `Data`, `UpdateStrategy`, `Data`, `Data`, `Chapters`, `Mangas`, `Sources`, `FetchMangaAndChapters`, `Extensions`, `PageInfo`, `PageInfo`, `SourceMangaType`, `FetchSourceManga`, `Data`, `FetchChapterPages`, `Jvm`, `Os`, `Data`, `Categories`, `Data`, `Chapter`, `Data`, `Data`, `Data`, `Data`?**
  _High betweenness centrality (0.295) - this node is a cross-community bridge._
- **Should `ApolloAPI` be split into smaller, more focused modules?**
  _Cohesion score 0.07127882599580712 - nodes in this community are weakly interconnected._
- **Why does `Source` connect `Source` to `Codable`, `Sendable`, `ContentWarning`, `API`, `ApolloAPI`, `String`, `LibraryJobsInfo`, `.fetchData`?**
  _High betweenness centrality (0.071) - this node is a cross-community bridge._