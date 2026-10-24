// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

nonisolated public struct GetCategoriesQuery: GraphQLQuery {
  public static let operationName: String = "GetCategories"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetCategories { categories { __typename nodes { __typename ...CategoryFields } totalCount } }"#,
      fragments: [CategoryFields.self]
    ))

  public init() {}

  nonisolated public struct Data: API.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.Query }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("categories", Categories.self),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      GetCategoriesQuery.Data.self
    ] }

    public var categories: Categories { __data["categories"] }

    /// Categories
    ///
    /// Parent Type: `CategoryNodeList`
    nonisolated public struct Categories: API.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.CategoryNodeList }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("nodes", [Node].self),
        .field("totalCount", Int.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        GetCategoriesQuery.Data.Categories.self
      ] }

      public var nodes: [Node] { __data["nodes"] }
      public var totalCount: Int { __data["totalCount"] }

      /// Categories.Node
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
          GetCategoriesQuery.Data.Categories.Node.self,
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
