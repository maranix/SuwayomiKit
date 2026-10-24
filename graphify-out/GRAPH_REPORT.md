# Graph Report - SuwayomiKit  (2026-10-24)

## Corpus Check
- Corpus is ~1,533 words - fits in a single context window. You may not need a graph.

## Summary
- 90 nodes · 128 edges · 9 communities (6 shown, 3 thin omitted)
- Extraction: 96% EXTRACTED · 4% INFERRED · 0% AMBIGUOUS · INFERRED: 5 edges (avg confidence: 0.89)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- Apollo Schema & Cache Config
- Apollo DataDict Accessors
- Package API & Roadmap
- AboutServer Response Fields
- Platform Info Fields
- JVM Info Fields
- AboutServer Query Model
- Swift Package Manifest
- Pagination Helpers (Planned)

## God Nodes (most connected - your core abstractions)
1. `ApolloAPI` - 23 edges
2. `AboutServer` - 17 edges
3. `PlatformInfo` - 16 edges
4. `Os` - 11 edges
5. `Jvm` - 11 edges
6. `Generated GraphQL Layer` - 7 edges
7. `AboutServerQuery` - 6 edges
8. `Objects` - 6 edges
9. `SchemaMetadata` - 4 edges
10. `SuwayomiKit` - 4 edges

## Surprising Connections (you probably didn't know these)
- `AboutServer` --references--> `ApolloAPI`  [EXTRACTED]
  Sources/API/Generated/Operations/Queries/AboutServerQuery.graphql.swift → Sources/API/Generated/Schema/SchemaMetadata.graphql.swift
- `AboutServerQuery` --references--> `ApolloAPI`  [EXTRACTED]
  Sources/API/Generated/Operations/Queries/AboutServerQuery.graphql.swift → Sources/API/Generated/Schema/SchemaMetadata.graphql.swift
- `Data` --references--> `ApolloAPI`  [EXTRACTED]
  Sources/API/Generated/Operations/Queries/AboutServerQuery.graphql.swift → Sources/API/Generated/Schema/SchemaMetadata.graphql.swift
- `Jvm` --references--> `ApolloAPI`  [EXTRACTED]
  Sources/API/Generated/Operations/Queries/AboutServerQuery.graphql.swift → Sources/API/Generated/Schema/SchemaMetadata.graphql.swift
- `Os` --references--> `ApolloAPI`  [EXTRACTED]
  Sources/API/Generated/Operations/Queries/AboutServerQuery.graphql.swift → Sources/API/Generated/Schema/SchemaMetadata.graphql.swift

## Import Cycles
- None detected.

## Hyperedges (group relationships)
- **Planned SuwayomiKit Client Features** — readme_async_await_client, readme_typed_models, readme_query_search_pagination, readme_page_thumbnail_fetching, readme_server_discovery, readme_swift6_strict_concurrency [EXTRACTED 1.00]
- **Schema Download to Generated API Pipeline** — readme_suwayomi_server, readme_apollo_codegen_config, readme_schema_download_target, readme_graphql_codegen_layer, readme_api_target, readme_apollo_client [INFERRED 0.95]

## Communities (9 total, 3 thin omitted)

### Community 0 - "Apollo Schema & Cache Config"
Cohesion: 0.15
Nodes (10): ApolloAPI, SchemaConfiguration, InlineFragment, Interfaces, MutableInlineFragment, MutableSelectionSet, Objects, SchemaMetadata (+2 more)

### Community 1 - "Apollo DataDict Accessors"
Cohesion: 0.14
Nodes (11): Data, .aboutServer, .__fulfilledFragments, .__parentType, .__selections, Os, .__fulfilledFragments, .name (+3 more)

### Community 2 - "Package API & Roadmap"
Cohesion: 0.17
Nodes (14): AboutServerQuery, API Target, ApolloClient Setup, apollo-codegen-config.json, Apollo iOS, Async/Await Client, Generated GraphQL Layer, Page and Thumbnail Fetching (+6 more)

### Community 3 - "AboutServer Response Fields"
Cohesion: 0.18
Nodes (11): AboutServer, .buildTime, .buildType, .discord, .__fulfilledFragments, .github, .name, .__parentType (+3 more)

### Community 4 - "Platform Info Fields"
Cohesion: 0.22
Nodes (8): PlatformInfo, .arch, .__fulfilledFragments, .headless, .jvm, .os, .__parentType, .__selections

### Community 5 - "JVM Info Fields"
Cohesion: 0.29
Nodes (6): Jvm, .__fulfilledFragments, .javaVersion, .__parentType, .__selections, .vmName

## Knowledge Gaps
- **35 isolated node(s):** `PackageDescription`, `.__parentType`, `.__selections`, `.__fulfilledFragments`, `.aboutServer` (+30 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 45 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **3 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `ApolloAPI` connect `Apollo Schema & Cache Config` to `Apollo DataDict Accessors`, `AboutServer Response Fields`, `Platform Info Fields`, `JVM Info Fields`, `AboutServer Query Model`?**
  _High betweenness centrality (0.339) - this node is a cross-community bridge._
- **What connects `PackageDescription`, `.__parentType`, `.__selections` to the rest of the system?**
  _35 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `Apollo DataDict Accessors` be split into smaller, more focused modules?**
  _Cohesion score 0.13970588235294118 - nodes in this community are weakly interconnected._
- **Why does `AboutServer` connect `AboutServer Response Fields` to `Apollo Schema & Cache Config`, `Apollo DataDict Accessors`, `Platform Info Fields`, `AboutServer Query Model`?**
  _High betweenness centrality (0.181) - this node is a cross-community bridge._
- **Why does `PlatformInfo` connect `Platform Info Fields` to `Apollo Schema & Cache Config`, `Apollo DataDict Accessors`, `AboutServer Response Fields`, `JVM Info Fields`, `AboutServer Query Model`?**
  _High betweenness centrality (0.156) - this node is a cross-community bridge._