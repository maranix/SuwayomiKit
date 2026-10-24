// @generated
// This file was automatically generated and should not be edited.

@_spi(Internal) @_spi(Unsafe) import ApolloAPI

nonisolated public struct DeleteCategoryInput: InputObject {
  @_spi(Unsafe) public private(set) var __data: InputDict

  @_spi(Unsafe) public init(_ data: InputDict) {
    __data = data
  }

  public init(
    categoryId: Int32,
    clientMutationId: GraphQLNullable<String> = nil
  ) {
    __data = InputDict([
      "categoryId": categoryId,
      "clientMutationId": clientMutationId
    ])
  }

  public var categoryId: Int32 {
    get { __data["categoryId"] }
    set { __data["categoryId"] = newValue }
  }

  public var clientMutationId: GraphQLNullable<String> {
    get { __data["clientMutationId"] }
    set { __data["clientMutationId"] = newValue }
  }
}
