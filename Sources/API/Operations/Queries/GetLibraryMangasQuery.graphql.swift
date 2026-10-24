// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

nonisolated public struct GetLibraryMangasQuery: GraphQLQuery {
  public static let operationName: String = "GetLibraryMangas"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetLibraryMangas($condition: MangaConditionInput, $first: Int, $offset: Int) { mangas(condition: $condition, first: $first, offset: $offset) { __typename nodes { __typename ...MangaFields } pageInfo { __typename ...PageInfoFields } totalCount } }"#,
      fragments: [MangaFields.self, PageInfoFields.self]
    ))

  public var condition: GraphQLNullable<MangaConditionInput>
  public var first: GraphQLNullable<Int32>
  public var offset: GraphQLNullable<Int32>

  public init(
    condition: GraphQLNullable<MangaConditionInput>,
    first: GraphQLNullable<Int32>,
    offset: GraphQLNullable<Int32>
  ) {
    self.condition = condition
    self.first = first
    self.offset = offset
  }

  @_spi(Unsafe) public var __variables: Variables? { [
    "condition": condition,
    "first": first,
    "offset": offset
  ] }

  nonisolated public struct Data: API.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.Query }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("mangas", Mangas.self, arguments: [
        "condition": .variable("condition"),
        "first": .variable("first"),
        "offset": .variable("offset")
      ]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      GetLibraryMangasQuery.Data.self
    ] }

    public var mangas: Mangas { __data["mangas"] }

    /// Mangas
    ///
    /// Parent Type: `MangaNodeList`
    nonisolated public struct Mangas: API.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.MangaNodeList }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("nodes", [Node].self),
        .field("pageInfo", PageInfo.self),
        .field("totalCount", Int.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        GetLibraryMangasQuery.Data.Mangas.self
      ] }

      public var nodes: [Node] { __data["nodes"] }
      public var pageInfo: PageInfo { __data["pageInfo"] }
      public var totalCount: Int { __data["totalCount"] }

      /// Mangas.Node
      ///
      /// Parent Type: `MangaType`
      nonisolated public struct Node: API.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.MangaType }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .fragment(MangaFields.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          GetLibraryMangasQuery.Data.Mangas.Node.self,
          MangaFields.self
        ] }

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
      }

      /// Mangas.PageInfo
      ///
      /// Parent Type: `PageInfo`
      nonisolated public struct PageInfo: API.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.PageInfo }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .fragment(PageInfoFields.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          GetLibraryMangasQuery.Data.Mangas.PageInfo.self,
          PageInfoFields.self
        ] }

        /// When paginating forwards, are there more items?
        public var hasNextPage: Bool { __data["hasNextPage"] }
        /// When paginating backwards, are there more items?
        public var hasPreviousPage: Bool { __data["hasPreviousPage"] }
        /// When paginating backwards, the cursor to continue.
        public var startCursor: API.Cursor? { __data["startCursor"] }
        /// When paginating forwards, the cursor to continue.
        public var endCursor: API.Cursor? { __data["endCursor"] }

        public struct Fragments: FragmentContainer {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          public var pageInfoFields: PageInfoFields { _toFragment() }
        }
      }
    }
  }
}
