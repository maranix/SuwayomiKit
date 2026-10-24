// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

nonisolated public struct DeleteCategoryMutation: GraphQLMutation {
  public static let operationName: String = "DeleteCategory"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation DeleteCategory($input: DeleteCategoryInput!) { deleteCategory(input: $input) { __typename category { __typename ...CategoryFields } } }"#,
      fragments: [CategoryFields.self]
    ))

  public var input: DeleteCategoryInput

  public init(input: DeleteCategoryInput) {
    self.input = input
  }

  @_spi(Unsafe) public var __variables: Variables? { ["input": input] }

  nonisolated public struct Data: API.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.Mutation }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("deleteCategory", DeleteCategory?.self, arguments: ["input": .variable("input")]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      DeleteCategoryMutation.Data.self
    ] }

    public var deleteCategory: DeleteCategory? { __data["deleteCategory"] }

    /// DeleteCategory
    ///
    /// Parent Type: `DeleteCategoryPayload`
    nonisolated public struct DeleteCategory: API.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.DeleteCategoryPayload }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("category", Category?.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        DeleteCategoryMutation.Data.DeleteCategory.self
      ] }

      public var category: Category? { __data["category"] }

      /// DeleteCategory.Category
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
          DeleteCategoryMutation.Data.DeleteCategory.Category.self,
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
