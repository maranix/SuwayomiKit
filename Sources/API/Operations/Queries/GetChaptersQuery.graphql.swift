// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

nonisolated public struct GetChaptersQuery: GraphQLQuery {
  public static let operationName: String = "GetChapters"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetChapters($condition: ChapterConditionInput, $order: [ChapterOrderInput!], $first: Int, $offset: Int) { chapters(condition: $condition, order: $order, first: $first, offset: $offset) { __typename nodes { __typename ...ChapterFields } pageInfo { __typename ...PageInfoFields } totalCount } }"#,
      fragments: [ChapterFields.self, PageInfoFields.self]
    ))

  public var condition: GraphQLNullable<ChapterConditionInput>
  public var order: GraphQLNullable<[ChapterOrderInput]>
  public var first: GraphQLNullable<Int32>
  public var offset: GraphQLNullable<Int32>

  public init(
    condition: GraphQLNullable<ChapterConditionInput>,
    order: GraphQLNullable<[ChapterOrderInput]>,
    first: GraphQLNullable<Int32>,
    offset: GraphQLNullable<Int32>
  ) {
    self.condition = condition
    self.order = order
    self.first = first
    self.offset = offset
  }

  @_spi(Unsafe) public var __variables: Variables? { [
    "condition": condition,
    "order": order,
    "first": first,
    "offset": offset
  ] }

  nonisolated public struct Data: API.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.Query }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("chapters", Chapters.self, arguments: [
        "condition": .variable("condition"),
        "order": .variable("order"),
        "first": .variable("first"),
        "offset": .variable("offset")
      ]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      GetChaptersQuery.Data.self
    ] }

    public var chapters: Chapters { __data["chapters"] }

    /// Chapters
    ///
    /// Parent Type: `ChapterNodeList`
    nonisolated public struct Chapters: API.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.ChapterNodeList }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("nodes", [Node].self),
        .field("pageInfo", PageInfo.self),
        .field("totalCount", Int.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        GetChaptersQuery.Data.Chapters.self
      ] }

      public var nodes: [Node] { __data["nodes"] }
      public var pageInfo: PageInfo { __data["pageInfo"] }
      public var totalCount: Int { __data["totalCount"] }

      /// Chapters.Node
      ///
      /// Parent Type: `ChapterType`
      nonisolated public struct Node: API.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.ChapterType }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .fragment(ChapterFields.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          GetChaptersQuery.Data.Chapters.Node.self,
          ChapterFields.self
        ] }

        public var id: Int { __data["id"] }
        public var mangaId: Int { __data["mangaId"] }
        public var name: String { __data["name"] }
        public var chapterNumber: Double { __data["chapterNumber"] }
        public var pageCount: Int { __data["pageCount"] }
        public var isBookmarked: Bool { __data["isBookmarked"] }
        public var isDownloaded: Bool { __data["isDownloaded"] }
        public var isRead: Bool { __data["isRead"] }
        public var lastPageRead: Int { __data["lastPageRead"] }
        public var lastReadAt: API.LongString { __data["lastReadAt"] }
        public var uploadDate: API.LongString { __data["uploadDate"] }
        public var fetchedAt: API.LongString { __data["fetchedAt"] }
        public var scanlator: String? { __data["scanlator"] }
        public var sourceOrder: Int { __data["sourceOrder"] }
        public var url: String { __data["url"] }
        public var realUrl: String? { __data["realUrl"] }

        public struct Fragments: FragmentContainer {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          public var chapterFields: ChapterFields { _toFragment() }
        }
      }

      /// Chapters.PageInfo
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
          GetChaptersQuery.Data.Chapters.PageInfo.self,
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
