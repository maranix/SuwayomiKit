// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

nonisolated public struct GetExtensionsQuery: GraphQLQuery {
  public static let operationName: String = "GetExtensions"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetExtensions($condition: ExtensionConditionInput, $first: Int, $offset: Int) { extensions(condition: $condition, first: $first, offset: $offset) { __typename nodes { __typename ...ExtensionFields } pageInfo { __typename ...PageInfoFields } totalCount } }"#,
      fragments: [ExtensionFields.self, PageInfoFields.self]
    ))

  public var condition: GraphQLNullable<ExtensionConditionInput>
  public var first: GraphQLNullable<Int32>
  public var offset: GraphQLNullable<Int32>

  public init(
    condition: GraphQLNullable<ExtensionConditionInput>,
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
      .field("extensions", Extensions.self, arguments: [
        "condition": .variable("condition"),
        "first": .variable("first"),
        "offset": .variable("offset")
      ]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      GetExtensionsQuery.Data.self
    ] }

    public var extensions: Extensions { __data["extensions"] }

    /// Extensions
    ///
    /// Parent Type: `ExtensionNodeList`
    nonisolated public struct Extensions: API.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.ExtensionNodeList }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("nodes", [Node].self),
        .field("pageInfo", PageInfo.self),
        .field("totalCount", Int.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        GetExtensionsQuery.Data.Extensions.self
      ] }

      public var nodes: [Node] { __data["nodes"] }
      public var pageInfo: PageInfo { __data["pageInfo"] }
      public var totalCount: Int { __data["totalCount"] }

      /// Extensions.Node
      ///
      /// Parent Type: `ExtensionType`
      nonisolated public struct Node: API.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.ExtensionType }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .fragment(ExtensionFields.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          GetExtensionsQuery.Data.Extensions.Node.self,
          ExtensionFields.self
        ] }

        public var pkgName: String { __data["pkgName"] }
        public var name: String { __data["name"] }
        public var versionName: String { __data["versionName"] }
        public var versionCodeLong: API.LongString { __data["versionCodeLong"] }
        public var lang: String { __data["lang"] }
        public var isInstalled: Bool { __data["isInstalled"] }
        public var hasUpdate: Bool { __data["hasUpdate"] }
        public var isObsolete: Bool { __data["isObsolete"] }
        public var iconUrl: String { __data["iconUrl"] }
        public var contentWarning: GraphQLEnum<API.ContentWarning> { __data["contentWarning"] }

        public struct Fragments: FragmentContainer {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          public var extensionFields: ExtensionFields { _toFragment() }
        }
      }

      /// Extensions.PageInfo
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
          GetExtensionsQuery.Data.Extensions.PageInfo.self,
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
