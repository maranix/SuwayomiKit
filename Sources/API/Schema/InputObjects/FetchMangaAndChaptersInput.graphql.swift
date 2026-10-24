// @generated
// This file was automatically generated and should not be edited.

@_spi(Internal) @_spi(Unsafe) import ApolloAPI

nonisolated public struct FetchMangaAndChaptersInput: InputObject {
  @_spi(Unsafe) public private(set) var __data: InputDict

  @_spi(Unsafe) public init(_ data: InputDict) {
    __data = data
  }

  public init(
    clientMutationId: GraphQLNullable<String> = nil,
    fetchChapters: Bool,
    fetchManga: Bool,
    id: Int32
  ) {
    __data = InputDict([
      "clientMutationId": clientMutationId,
      "fetchChapters": fetchChapters,
      "fetchManga": fetchManga,
      "id": id
    ])
  }

  public var clientMutationId: GraphQLNullable<String> {
    get { __data["clientMutationId"] }
    set { __data["clientMutationId"] = newValue }
  }

  public var fetchChapters: Bool {
    get { __data["fetchChapters"] }
    set { __data["fetchChapters"] = newValue }
  }

  public var fetchManga: Bool {
    get { __data["fetchManga"] }
    set { __data["fetchManga"] = newValue }
  }

  public var id: Int32 {
    get { __data["id"] }
    set { __data["id"] = newValue }
  }
}
