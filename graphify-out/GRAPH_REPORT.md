# Graph Report - SuwayomiKit  (2026-10-24)

## Corpus Check
- 16 files · ~2,050 words
- Verdict: corpus is large enough that graph structure adds value.
- Unclassified: 8 file(s) not represented in the graph (top: (none) 4, .xcscheme 1, .graphql 1)

## Summary
- 122 nodes · 179 edges · 10 communities (7 shown, 3 thin omitted)
- Extraction: 97% EXTRACTED · 3% INFERRED · 0% AMBIGUOUS · INFERRED: 6 edges (avg confidence: 0.88)
- Token cost: 0 input · 0 output

## Graph Freshness
- Built from commit: `57490c17`
- Run `git rev-parse HEAD` and compare to check if the graph is stale.
- Run `graphify update .` after code changes (no API cost).

## Community Hubs (Navigation)
- ApolloAPI
- PlatformInfo
- Package API & Roadmap
- ServerInfo
- Data
- AboutServer
- AboutServerQuery
- Swift Package Manifest
- Pagination Helpers (Planned)
- AGENTS.md

## God Nodes (most connected - your core abstractions)
1. `ApolloAPI` - 23 edges
2. `AboutServer` - 17 edges
3. `PlatformInfo` - 16 edges
4. `AboutServerQuery` - 11 edges
5. `Os` - 11 edges
6. `Jvm` - 11 edges
7. `ServerInfo` - 8 edges
8. `API` - 7 edges
9. `Platform` - 7 edges
10. `Generated GraphQL Layer` - 7 edges

## Surprising Connections (you probably didn't know these)
- `AboutServer` --references--> `ApolloAPI`  [EXTRACTED]
  Sources/API/Operations/Queries/AboutServerQuery.graphql.swift → Sources/API/Schema/SchemaMetadata.graphql.swift
- `AboutServerQuery` --references--> `ApolloAPI`  [EXTRACTED]
  Sources/API/Operations/Queries/AboutServerQuery.graphql.swift → Sources/API/Schema/SchemaMetadata.graphql.swift
- `Data` --references--> `ApolloAPI`  [EXTRACTED]
  Sources/API/Operations/Queries/AboutServerQuery.graphql.swift → Sources/API/Schema/SchemaMetadata.graphql.swift
- `Jvm` --references--> `ApolloAPI`  [EXTRACTED]
  Sources/API/Operations/Queries/AboutServerQuery.graphql.swift → Sources/API/Schema/SchemaMetadata.graphql.swift
- `Os` --references--> `ApolloAPI`  [EXTRACTED]
  Sources/API/Operations/Queries/AboutServerQuery.graphql.swift → Sources/API/Schema/SchemaMetadata.graphql.swift

## Import Cycles
- None detected.

## Hyperedges (group relationships)
- **Planned SuwayomiKit Client Features** — readme_async_await_client, readme_typed_models, readme_query_search_pagination, readme_page_thumbnail_fetching, readme_server_discovery, readme_swift6_strict_concurrency [EXTRACTED 1.00]
- **Schema Download to Generated API Pipeline** — readme_suwayomi_server, readme_apollo_codegen_config, readme_schema_download_target, readme_graphql_codegen_layer, readme_api_target, readme_apollo_client [INFERRED 0.95]

## Communities (10 total, 3 thin omitted)

### Community 0 - "ApolloAPI"
Cohesion: 0.15
Nodes (10): ApolloAPI, SchemaConfiguration, InlineFragment, Interfaces, MutableInlineFragment, MutableSelectionSet, Objects, SchemaMetadata (+2 more)

### Community 1 - "PlatformInfo"
Cohesion: 0.09
Nodes (20): Jvm, .__fulfilledFragments, .javaVersion, .__parentType, .__selections, .vmName, Os, .__fulfilledFragments (+12 more)

### Community 2 - "Package API & Roadmap"
Cohesion: 0.17
Nodes (14): AboutServerQuery, API Target, ApolloClient Setup, apollo-codegen-config.json, Apollo iOS, Async/Await Client, Generated GraphQL Layer, Page and Thumbnail Fetching (+6 more)

### Community 3 - "ServerInfo"
Cohesion: 0.24
Nodes (7): ClientError, error, missingData, JVM, OS, Platform, ServerInfo

### Community 4 - "Data"
Cohesion: 0.15
Nodes (8): API, Apollo, Data, .aboutServer, .__fulfilledFragments, .__parentType, .__selections, SuwayomiClient

### Community 5 - "AboutServer"
Cohesion: 0.18
Nodes (11): AboutServer, .buildTime, .buildType, .discord, .__fulfilledFragments, .github, .name, .__parentType (+3 more)

### Community 6 - "AboutServerQuery"
Cohesion: 0.20
Nodes (5): Foundation, AboutServerQuery, ServerInfo.Platform, ServerInfo.Platform.JVM, ServerInfo.Platform.OS

## Knowledge Gaps
- **38 isolated node(s):** `PackageDescription`, `.__parentType`, `.__selections`, `.__fulfilledFragments`, `.aboutServer` (+33 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 56 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **3 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `ApolloAPI` connect `ApolloAPI` to `PlatformInfo`, `Data`, `AboutServer`, `AboutServerQuery`?**
  _High betweenness centrality (0.281) - this node is a cross-community bridge._
- **What connects `PackageDescription`, `.__parentType`, `.__selections` to the rest of the system?**
  _38 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `PlatformInfo` be split into smaller, more focused modules?**
  _Cohesion score 0.09401709401709402 - nodes in this community are weakly interconnected._
- **Why does `AboutServerQuery` connect `AboutServerQuery` to `ApolloAPI`, `PlatformInfo`, `Data`?**
  _High betweenness centrality (0.162) - this node is a cross-community bridge._
- **Why does `API` connect `Data` to `PlatformInfo`, `AboutServer`, `AboutServerQuery`?**
  _High betweenness centrality (0.161) - this node is a cross-community bridge._