// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

nonisolated public struct RefreshTokenMutation: GraphQLMutation {
  public static let operationName: String = "RefreshToken"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation RefreshToken($input: RefreshTokenInput!) { refreshToken(input: $input) { __typename accessToken } }"#
    ))

  public var input: RefreshTokenInput

  public init(input: RefreshTokenInput) {
    self.input = input
  }

  @_spi(Unsafe) public var __variables: Variables? { ["input": input] }

  nonisolated public struct Data: API.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.Mutation }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("refreshToken", RefreshToken.self, arguments: ["input": .variable("input")]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      RefreshTokenMutation.Data.self
    ] }

    public var refreshToken: RefreshToken { __data["refreshToken"] }

    /// RefreshToken
    ///
    /// Parent Type: `RefreshTokenPayload`
    nonisolated public struct RefreshToken: API.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.RefreshTokenPayload }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("accessToken", String.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        RefreshTokenMutation.Data.RefreshToken.self
      ] }

      public var accessToken: String { __data["accessToken"] }
    }
  }
}
