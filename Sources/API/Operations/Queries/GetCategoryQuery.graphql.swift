// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

nonisolated public struct GetCategoryQuery: GraphQLQuery {
  public static let operationName: String = "GetCategory"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetCategory($id: Int!) { category(id: $id) { __typename ...CategoryFields } }"#,
      fragments: [CategoryFields.self]
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
      .field("category", Category.self, arguments: ["id": .variable("id")]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      GetCategoryQuery.Data.self
    ] }

    public var category: Category { __data["category"] }

    /// Category
    ///
    /// Parent Type: `CategoryType`
    nonisolated public struct Category: API.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.CategoryType }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .fragment(CategoryFields.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        GetCategoryQuery.Data.Category.self,
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
