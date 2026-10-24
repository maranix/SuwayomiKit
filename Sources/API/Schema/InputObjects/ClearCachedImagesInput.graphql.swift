// @generated
// This file was automatically generated and should not be edited.

@_spi(Internal) @_spi(Unsafe) import ApolloAPI

nonisolated public struct ClearCachedImagesInput: InputObject {
  @_spi(Unsafe) public private(set) var __data: InputDict

  @_spi(Unsafe) public init(_ data: InputDict) {
    __data = data
  }

  public init(
    cachedPages: GraphQLNullable<Bool> = nil,
    cachedThumbnails: GraphQLNullable<Bool> = nil,
    clientMutationId: GraphQLNullable<String> = nil,
    downloadedThumbnails: GraphQLNullable<Bool> = nil
  ) {
    __data = InputDict([
      "cachedPages": cachedPages,
      "cachedThumbnails": cachedThumbnails,
      "clientMutationId": clientMutationId,
      "downloadedThumbnails": downloadedThumbnails
    ])
  }

  public var cachedPages: GraphQLNullable<Bool> {
    get { __data["cachedPages"] }
    set { __data["cachedPages"] = newValue }
  }

  public var cachedThumbnails: GraphQLNullable<Bool> {
    get { __data["cachedThumbnails"] }
    set { __data["cachedThumbnails"] = newValue }
  }

  public var clientMutationId: GraphQLNullable<String> {
    get { __data["clientMutationId"] }
    set { __data["clientMutationId"] = newValue }
  }

  public var downloadedThumbnails: GraphQLNullable<Bool> {
    get { __data["downloadedThumbnails"] }
    set { __data["downloadedThumbnails"] = newValue }
  }
}
