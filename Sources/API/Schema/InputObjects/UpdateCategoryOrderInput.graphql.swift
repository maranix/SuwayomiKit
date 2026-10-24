// @generated
// This file was automatically generated and should not be edited.

@_spi(Internal) @_spi(Unsafe) import ApolloAPI

nonisolated public struct UpdateCategoryOrderInput: InputObject {
  @_spi(Unsafe) public private(set) var __data: InputDict

  @_spi(Unsafe) public init(_ data: InputDict) {
    __data = data
  }

  public init(
    clientMutationId: GraphQLNullable<String> = nil,
    id: Int32,
    position: Int32
  ) {
    __data = InputDict([
      "clientMutationId": clientMutationId,
      "id": id,
      "position": position
    ])
  }

  public var clientMutationId: GraphQLNullable<String> {
    get { __data["clientMutationId"] }
    set { __data["clientMutationId"] = newValue }
  }

  public var id: Int32 {
    get { __data["id"] }
    set { __data["id"] = newValue }
  }

  public var position: Int32 {
    get { __data["position"] }
    set { __data["position"] = newValue }
  }
}
