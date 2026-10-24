// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

nonisolated public struct UpdateCategoryOrderMutation: GraphQLMutation {
  public static let operationName: String = "UpdateCategoryOrder"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation UpdateCategoryOrder($input: UpdateCategoryOrderInput!) { updateCategoryOrder(input: $input) { __typename categories { __typename ...CategoryFields } } }"#,
      fragments: [CategoryFields.self]
    ))

  public var input: UpdateCategoryOrderInput

  public init(input: UpdateCategoryOrderInput) {
    self.input = input
  }

  @_spi(Unsafe) public var __variables: Variables? { ["input": input] }

  nonisolated public struct Data: API.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.Mutation }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("updateCategoryOrder", UpdateCategoryOrder?.self, arguments: ["input": .variable("input")]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      UpdateCategoryOrderMutation.Data.self
    ] }

    public var updateCategoryOrder: UpdateCategoryOrder? { __data["updateCategoryOrder"] }

    /// UpdateCategoryOrder
    ///
    /// Parent Type: `UpdateCategoryOrderPayload`
    nonisolated public struct UpdateCategoryOrder: API.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.UpdateCategoryOrderPayload }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("categories", [Category].self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        UpdateCategoryOrderMutation.Data.UpdateCategoryOrder.self
      ] }

      public var categories: [Category] { __data["categories"] }

      /// UpdateCategoryOrder.Category
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
          UpdateCategoryOrderMutation.Data.UpdateCategoryOrder.Category.self,
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
