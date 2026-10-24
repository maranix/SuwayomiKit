// @generated
// This file was automatically generated and should not be edited.

@_spi(Internal) @_spi(Unsafe) import ApolloAPI

nonisolated public struct FetchChapterPagesInput: InputObject {
  @_spi(Unsafe) public private(set) var __data: InputDict

  @_spi(Unsafe) public init(_ data: InputDict) {
    __data = data
  }

  public init(
    chapterId: Int32,
    clientMutationId: GraphQLNullable<String> = nil,
    format: GraphQLNullable<String> = nil
  ) {
    __data = InputDict([
      "chapterId": chapterId,
      "clientMutationId": clientMutationId,
      "format": format
    ])
  }

  public var chapterId: Int32 {
    get { __data["chapterId"] }
    set { __data["chapterId"] = newValue }
  }

  public var clientMutationId: GraphQLNullable<String> {
    get { __data["clientMutationId"] }
    set { __data["clientMutationId"] = newValue }
  }

  public var format: GraphQLNullable<String> {
    get { __data["format"] }
    set { __data["format"] = newValue }
  }
}
