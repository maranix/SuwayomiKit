// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

nonisolated public struct GetSourcesQuery: GraphQLQuery {
  public static let operationName: String = "GetSources"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetSources($condition: SourceConditionInput, $first: Int, $offset: Int) { sources(condition: $condition, first: $first, offset: $offset) { __typename nodes { __typename ...SourceFields } pageInfo { __typename ...PageInfoFields } totalCount } }"#,
      fragments: [PageInfoFields.self, SourceFields.self]
    ))

  public var condition: GraphQLNullable<SourceConditionInput>
  public var first: GraphQLNullable<Int32>
  public var offset: GraphQLNullable<Int32>

  public init(
    condition: GraphQLNullable<SourceConditionInput>,
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
      .field("sources", Sources.self, arguments: [
        "condition": .variable("condition"),
        "first": .variable("first"),
        "offset": .variable("offset")
      ]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      GetSourcesQuery.Data.self
    ] }

    public var sources: Sources { __data["sources"] }

    /// Sources
    ///
    /// Parent Type: `SourceNodeList`
    nonisolated public struct Sources: API.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.SourceNodeList }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("nodes", [Node].self),
        .field("pageInfo", PageInfo.self),
        .field("totalCount", Int.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        GetSourcesQuery.Data.Sources.self
      ] }

      public var nodes: [Node] { __data["nodes"] }
      public var pageInfo: PageInfo { __data["pageInfo"] }
      public var totalCount: Int { __data["totalCount"] }

      /// Sources.Node
      ///
      /// Parent Type: `SourceType`
      nonisolated public struct Node: API.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.SourceType }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .fragment(SourceFields.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          GetSourcesQuery.Data.Sources.Node.self,
          SourceFields.self
        ] }

        public var id: API.LongString { __data["id"] }
        public var name: String { __data["name"] }
        public var displayName: String { __data["displayName"] }
        public var lang: String { __data["lang"] }
        public var iconUrl: String { __data["iconUrl"] }
        public var homeUrl: String? { __data["homeUrl"] }
        public var supportsLatest: Bool { __data["supportsLatest"] }
        public var isConfigurable: Bool { __data["isConfigurable"] }
        public var contentWarning: GraphQLEnum<API.ContentWarning> { __data["contentWarning"] }

        public struct Fragments: FragmentContainer {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          public var sourceFields: SourceFields { _toFragment() }
        }
      }

      /// Sources.PageInfo
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
          GetSourcesQuery.Data.Sources.PageInfo.self,
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
