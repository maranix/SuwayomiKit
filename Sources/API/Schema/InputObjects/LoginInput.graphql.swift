// @generated
// This file was automatically generated and should not be edited.

@_spi(Internal) @_spi(Unsafe) import ApolloAPI

nonisolated public struct LoginInput: InputObject {
  @_spi(Unsafe) public private(set) var __data: InputDict

  @_spi(Unsafe) public init(_ data: InputDict) {
    __data = data
  }

  public init(
    clientMutationId: GraphQLNullable<String> = nil,
    password: String,
    username: String
  ) {
    __data = InputDict([
      "clientMutationId": clientMutationId,
      "password": password,
      "username": username
    ])
  }

  public var clientMutationId: GraphQLNullable<String> {
    get { __data["clientMutationId"] }
    set { __data["clientMutationId"] = newValue }
  }

  public var password: String {
    get { __data["password"] }
    set { __data["password"] = newValue }
  }

  public var username: String {
    get { __data["username"] }
    set { __data["username"] = newValue }
  }
}
