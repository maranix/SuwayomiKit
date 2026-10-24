# Graph Report - SuwayomiKit  (2026-10-24)

## Corpus Check
- 17 files · ~2,200 words
- Verdict: corpus is large enough that graph structure adds value.
- Unclassified: 7 file(s) not represented in the graph (top: (none) 4, .graphql 1, .graphqls 1)

## Summary
- 134 nodes · 200 edges · 11 communities (8 shown, 3 thin omitted)
- Extraction: 96% EXTRACTED · 4% INFERRED · 0% AMBIGUOUS · INFERRED: 7 edges (avg confidence: 0.88)
- Token cost: 0 input · 0 output

## Graph Freshness
- Built from commit: `02f0d9bc`
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
- SuwayomiError

## God Nodes (most connected - your core abstractions)
1. `ApolloAPI` - 23 edges
2. `AboutServer` - 17 edges
3. `PlatformInfo` - 16 edges
4. `SuwayomiError` - 13 edges
5. `AboutServerQuery` - 11 edges
6. `Os` - 11 edges
7. `Jvm` - 11 edges
8. `API` - 8 edges
9. `ServerInfo` - 8 edges
10. `SuwayomiClient` - 7 edges

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

## Communities (11 total, 3 thin omitted)

### Community 0 - "ApolloAPI"
Cohesion: 0.15
Nodes (10): ApolloAPI, SchemaConfiguration, InlineFragment, Interfaces, MutableInlineFragment, MutableSelectionSet, Objects, SchemaMetadata (+2 more)

### Community 1 - "PlatformInfo"
Cohesion: 0.09
Nodes (21): API, Jvm, .__fulfilledFragments, .javaVersion, .__parentType, .__selections, .vmName, Os (+13 more)

### Community 2 - "Package API & Roadmap"
Cohesion: 0.17
Nodes (14): AboutServerQuery, API Target, ApolloClient Setup, apollo-codegen-config.json, Apollo iOS, Async/Await Client, Generated GraphQL Layer, Page and Thumbnail Fetching (+6 more)

### Community 3 - "ServerInfo"
Cohesion: 0.24
Nodes (5): SuwayomiClient, JVM, OS, Platform, ServerInfo

### Community 4 - "Data"
Cohesion: 0.33
Nodes (5): Data, .aboutServer, .__fulfilledFragments, .__parentType, .__selections

### Community 5 - "AboutServer"
Cohesion: 0.18
Nodes (11): AboutServer, .buildTime, .buildType, .discord, .__fulfilledFragments, .github, .name, .__parentType (+3 more)

### Community 6 - "AboutServerQuery"
Cohesion: 0.21
Nodes (4): AboutServerQuery, ServerInfo.Platform, ServerInfo.Platform.JVM, ServerInfo.Platform.OS

### Community 10 - "SuwayomiError"
Cohesion: 0.14
Nodes (10): Apollo, Foundation, OperationError, SuwayomiError, .errorDescription, missingData, network, operation (+2 more)

## Knowledge Gaps
- **41 isolated node(s):** `PackageDescription`, `.__parentType`, `.__selections`, `.__fulfilledFragments`, `.aboutServer` (+36 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 59 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **3 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `ApolloAPI` connect `ApolloAPI` to `PlatformInfo`, `Data`, `AboutServer`, `AboutServerQuery`?**
  _High betweenness centrality (0.262) - this node is a cross-community bridge._
- **What connects `PackageDescription`, `.__parentType`, `.__selections` to the rest of the system?**
  _41 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `PlatformInfo` be split into smaller, more focused modules?**
  _Cohesion score 0.08994708994708994 - nodes in this community are weakly interconnected._
- **Why does `API` connect `PlatformInfo` to `SuwayomiError`, `Data`, `AboutServer`, `AboutServerQuery`?**
  _High betweenness centrality (0.195) - this node is a cross-community bridge._
- **Should `SuwayomiError` be split into smaller, more focused modules?**
  _Cohesion score 0.1437908496732026 - nodes in this community are weakly interconnected._
- **Why does `AboutServerQuery` connect `AboutServerQuery` to `ApolloAPI`, `ServerInfo`, `Data`?**
  _High betweenness centrality (0.169) - this node is a cross-community bridge._