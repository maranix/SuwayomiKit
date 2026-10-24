// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

nonisolated public struct UpdateCategoryMutation: GraphQLMutation {
  public static let operationName: String = "UpdateCategory"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation UpdateCategory($input: UpdateCategoryInput!) { updateCategory(input: $input) { __typename category { __typename ...CategoryFields } } }"#,
      fragments: [CategoryFields.self]
    ))

  public var input: UpdateCategoryInput

  public init(input: UpdateCategoryInput) {
    self.input = input
  }

  @_spi(Unsafe) public var __variables: Variables? { ["input": input] }

  nonisolated public struct Data: API.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.Mutation }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("updateCategory", UpdateCategory?.self, arguments: ["input": .variable("input")]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      UpdateCategoryMutation.Data.self
    ] }

    public var updateCategory: UpdateCategory? { __data["updateCategory"] }

    /// UpdateCategory
    ///
    /// Parent Type: `UpdateCategoryPayload`
    nonisolated public struct UpdateCategory: API.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.UpdateCategoryPayload }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("category", Category.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        UpdateCategoryMutation.Data.UpdateCategory.self
      ] }

      public var category: Category { __data["category"] }

      /// UpdateCategory.Category
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
          UpdateCategoryMutation.Data.UpdateCategory.Category.self,
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
