// @generated
// This file was automatically generated and should not be edited.

@_spi(Internal) @_spi(Unsafe) import ApolloAPI

nonisolated public struct UpdateLibraryInput: InputObject {
  @_spi(Unsafe) public private(set) var __data: InputDict

  @_spi(Unsafe) public init(_ data: InputDict) {
    __data = data
  }

  public init(
    categories: GraphQLNullable<[Int32]> = nil,
    clientMutationId: GraphQLNullable<String> = nil
  ) {
    __data = InputDict([
      "categories": categories,
      "clientMutationId": clientMutationId
    ])
  }

  public var categories: GraphQLNullable<[Int32]> {
    get { __data["categories"] }
    set { __data["categories"] = newValue }
  }

  public var clientMutationId: GraphQLNullable<String> {
    get { __data["clientMutationId"] }
    set { __data["clientMutationId"] = newValue }
  }
}
