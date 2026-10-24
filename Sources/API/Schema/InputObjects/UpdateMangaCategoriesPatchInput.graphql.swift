// @generated
// This file was automatically generated and should not be edited.

@_spi(Internal) @_spi(Unsafe) import ApolloAPI

nonisolated public struct UpdateMangaCategoriesPatchInput: InputObject {
  @_spi(Unsafe) public private(set) var __data: InputDict

  @_spi(Unsafe) public init(_ data: InputDict) {
    __data = data
  }

  public init(
    addToCategories: GraphQLNullable<[Int32]> = nil,
    clearCategories: GraphQLNullable<Bool> = nil,
    removeFromCategories: GraphQLNullable<[Int32]> = nil
  ) {
    __data = InputDict([
      "addToCategories": addToCategories,
      "clearCategories": clearCategories,
      "removeFromCategories": removeFromCategories
    ])
  }

  public var addToCategories: GraphQLNullable<[Int32]> {
    get { __data["addToCategories"] }
    set { __data["addToCategories"] = newValue }
  }

  public var clearCategories: GraphQLNullable<Bool> {
    get { __data["clearCategories"] }
    set { __data["clearCategories"] = newValue }
  }

  public var removeFromCategories: GraphQLNullable<[Int32]> {
    get { __data["removeFromCategories"] }
    set { __data["removeFromCategories"] = newValue }
  }
}
