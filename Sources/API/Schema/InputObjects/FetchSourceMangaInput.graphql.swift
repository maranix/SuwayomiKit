// @generated
// This file was automatically generated and should not be edited.

@_spi(Internal) @_spi(Unsafe) import ApolloAPI

nonisolated public struct FetchSourceMangaInput: InputObject {
  @_spi(Unsafe) public private(set) var __data: InputDict

  @_spi(Unsafe) public init(_ data: InputDict) {
    __data = data
  }

  public init(
    clientMutationId: GraphQLNullable<String> = nil,
    filters: GraphQLNullable<[FilterChangeInput]> = nil,
    page: Int32,
    query: GraphQLNullable<String> = nil,
    source: LongString,
    type: GraphQLEnum<FetchSourceMangaType>
  ) {
    __data = InputDict([
      "clientMutationId": clientMutationId,
      "filters": filters,
      "page": page,
      "query": query,
      "source": source,
      "type": type
    ])
  }

  public var clientMutationId: GraphQLNullable<String> {
    get { __data["clientMutationId"] }
    set { __data["clientMutationId"] = newValue }
  }

  public var filters: GraphQLNullable<[FilterChangeInput]> {
    get { __data["filters"] }
    set { __data["filters"] = newValue }
  }

  public var page: Int32 {
    get { __data["page"] }
    set { __data["page"] = newValue }
  }

  public var query: GraphQLNullable<String> {
    get { __data["query"] }
    set { __data["query"] = newValue }
  }

  public var source: LongString {
    get { __data["source"] }
    set { __data["source"] = newValue }
  }

  public var type: GraphQLEnum<FetchSourceMangaType> {
    get { __data["type"] }
    set { __data["type"] = newValue }
  }
}
