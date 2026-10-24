// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

nonisolated public struct GetMangaQuery: GraphQLQuery {
  public static let operationName: String = "GetManga"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetManga($id: Int!) { manga(id: $id) { __typename ...MangaFields categories { __typename nodes { __typename ...CategoryFields } } } }"#,
      fragments: [CategoryFields.self, MangaFields.self]
    ))

  public var id: Int32

  public init(id: Int32) {
    self.id = id
  }

  @_spi(Unsafe) public var __variables: Variables? { ["id": id] }

  nonisolated public struct Data: API.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.Query }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("manga", Manga.self, arguments: ["id": .variable("id")]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      GetMangaQuery.Data.self
    ] }

    public var manga: Manga { __data["manga"] }

    /// Manga
    ///
    /// Parent Type: `MangaType`
    nonisolated public struct Manga: API.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.MangaType }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("categories", Categories.self),
        .fragment(MangaFields.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        GetMangaQuery.Data.Manga.self,
        MangaFields.self
      ] }

      public var categories: Categories { __data["categories"] }
      public var id: Int { __data["id"] }
      public var title: String { __data["title"] }
      public var artist: String? { __data["artist"] }
      public var author: String? { __data["author"] }
      public var description: String? { __data["description"] }
      public var genre: [String] { __data["genre"] }
      public var status: GraphQLEnum<API.MangaStatus> { __data["status"] }
      public var inLibrary: Bool { __data["inLibrary"] }
      public var inLibraryAt: API.LongString { __data["inLibraryAt"] }
      public var thumbnailUrl: String? { __data["thumbnailUrl"] }
      public var thumbnailUrlLastFetched: API.LongString? { __data["thumbnailUrlLastFetched"] }
      public var sourceId: API.LongString { __data["sourceId"] }
      public var url: String { __data["url"] }
      public var realUrl: String? { __data["realUrl"] }
      public var unreadCount: Int { __data["unreadCount"] }
      public var downloadCount: Int { __data["downloadCount"] }
      public var bookmarkCount: Int { __data["bookmarkCount"] }
      public var updateStrategy: GraphQLEnum<API.UpdateStrategy> { __data["updateStrategy"] }
      public var initialized: Bool { __data["initialized"] }
      public var lastFetchedAt: API.LongString? { __data["lastFetchedAt"] }
      public var chaptersLastFetchedAt: API.LongString? { __data["chaptersLastFetchedAt"] }

      public struct Fragments: FragmentContainer {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        public var mangaFields: MangaFields { _toFragment() }
      }

      /// Manga.Categories
      ///
      /// Parent Type: `CategoryNodeList`
      nonisolated public struct Categories: API.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.CategoryNodeList }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("nodes", [Node].self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          GetMangaQuery.Data.Manga.Categories.self
        ] }

        public var nodes: [Node] { __data["nodes"] }

        /// Manga.Categories.Node
        ///
        /// Parent Type: `CategoryType`
        nonisolated public struct Node: API.SelectionSet {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.CategoryType }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .fragment(CategoryFields.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            GetMangaQuery.Data.Manga.Categories.Node.self,
            CategoryFields.self
          ] }

          public var id: Int { __data["id"] }
          public var name: String { __data["name"] }
          public var order: Int { __data["order"] }
          public var `default`: Bool { __data["default"] }
          public var isDefaultCategory: Bool { __data["isDefaultCategory"] }
          public var includeInDownload: GraphQLEnum<API.IncludeOrExclude> { __data["includeInDownload"] }
          public var includeInUpdate: GraphQLEnum<API.IncludeOrExclude> { __data["includeInUpdate"] }

          public struct Fragments: FragmentContainer {
            @_spi(Unsafe) public let __data: DataDict
            @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

            public var categoryFields: CategoryFields { _toFragment() }
          }
        }
      }
    }
  }
}
