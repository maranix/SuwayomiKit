// @generated
// This file was automatically generated and should not be edited.

@_spi(Internal) @_spi(Unsafe) import ApolloAPI

nonisolated public struct UpdateExtensionInput: InputObject {
  @_spi(Unsafe) public private(set) var __data: InputDict

  @_spi(Unsafe) public init(_ data: InputDict) {
    __data = data
  }

  public init(
    clientMutationId: GraphQLNullable<String> = nil,
    id: String,
    patch: UpdateExtensionPatchInput
  ) {
    __data = InputDict([
      "clientMutationId": clientMutationId,
      "id": id,
      "patch": patch
    ])
  }

  public var clientMutationId: GraphQLNullable<String> {
    get { __data["clientMutationId"] }
    set { __data["clientMutationId"] = newValue }
  }

  public var id: String {
    get { __data["id"] }
    set { __data["id"] = newValue }
  }

  public var patch: UpdateExtensionPatchInput {
    get { __data["patch"] }
    set { __data["patch"] = newValue }
  }
}
