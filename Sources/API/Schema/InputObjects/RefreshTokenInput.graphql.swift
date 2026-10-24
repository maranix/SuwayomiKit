// @generated
// This file was automatically generated and should not be edited.

@_spi(Internal) @_spi(Unsafe) import ApolloAPI

nonisolated public struct RefreshTokenInput: InputObject {
  @_spi(Unsafe) public private(set) var __data: InputDict

  @_spi(Unsafe) public init(_ data: InputDict) {
    __data = data
  }

  public init(
    clientMutationId: GraphQLNullable<String> = nil,
    refreshToken: String
  ) {
    __data = InputDict([
      "clientMutationId": clientMutationId,
      "refreshToken": refreshToken
    ])
  }

  public var clientMutationId: GraphQLNullable<String> {
    get { __data["clientMutationId"] }
    set { __data["clientMutationId"] = newValue }
  }

  public var refreshToken: String {
    get { __data["refreshToken"] }
    set { __data["refreshToken"] = newValue }
  }
}
