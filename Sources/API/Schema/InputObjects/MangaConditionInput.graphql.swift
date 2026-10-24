// @generated
// This file was automatically generated and should not be edited.

@_spi(Internal) @_spi(Unsafe) import ApolloAPI

nonisolated public struct MangaConditionInput: InputObject {
  @_spi(Unsafe) public private(set) var __data: InputDict

  @_spi(Unsafe) public init(_ data: InputDict) {
    __data = data
  }

  public init(
    artist: GraphQLNullable<String> = nil,
    author: GraphQLNullable<String> = nil,
    categoryIds: GraphQLNullable<[Int32]> = nil,
    chaptersLastFetchedAt: GraphQLNullable<LongString> = nil,
    description: GraphQLNullable<String> = nil,
    genre: GraphQLNullable<[String]> = nil,
    id: GraphQLNullable<Int32> = nil,
    inLibrary: GraphQLNullable<Bool> = nil,
    inLibraryAt: GraphQLNullable<LongString> = nil,
    initialized: GraphQLNullable<Bool> = nil,
    lastFetchedAt: GraphQLNullable<LongString> = nil,
    realUrl: GraphQLNullable<String> = nil,
    sourceId: GraphQLNullable<LongString> = nil,
    status: GraphQLNullable<GraphQLEnum<MangaStatus>> = nil,
    thumbnailUrl: GraphQLNullable<String> = nil,
    title: GraphQLNullable<String> = nil,
    url: GraphQLNullable<String> = nil
  ) {
    __data = InputDict([
      "artist": artist,
      "author": author,
      "categoryIds": categoryIds,
      "chaptersLastFetchedAt": chaptersLastFetchedAt,
      "description": description,
      "genre": genre,
      "id": id,
      "inLibrary": inLibrary,
      "inLibraryAt": inLibraryAt,
      "initialized": initialized,
      "lastFetchedAt": lastFetchedAt,
      "realUrl": realUrl,
      "sourceId": sourceId,
      "status": status,
      "thumbnailUrl": thumbnailUrl,
      "title": title,
      "url": url
    ])
  }

  public var artist: GraphQLNullable<String> {
    get { __data["artist"] }
    set { __data["artist"] = newValue }
  }

  public var author: GraphQLNullable<String> {
    get { __data["author"] }
    set { __data["author"] = newValue }
  }

  public var categoryIds: GraphQLNullable<[Int32]> {
    get { __data["categoryIds"] }
    set { __data["categoryIds"] = newValue }
  }

  public var chaptersLastFetchedAt: GraphQLNullable<LongString> {
    get { __data["chaptersLastFetchedAt"] }
    set { __data["chaptersLastFetchedAt"] = newValue }
  }

  public var description: GraphQLNullable<String> {
    get { __data["description"] }
    set { __data["description"] = newValue }
  }

  public var genre: GraphQLNullable<[String]> {
    get { __data["genre"] }
    set { __data["genre"] = newValue }
  }

  public var id: GraphQLNullable<Int32> {
    get { __data["id"] }
    set { __data["id"] = newValue }
  }

  public var inLibrary: GraphQLNullable<Bool> {
    get { __data["inLibrary"] }
    set { __data["inLibrary"] = newValue }
  }

  public var inLibraryAt: GraphQLNullable<LongString> {
    get { __data["inLibraryAt"] }
    set { __data["inLibraryAt"] = newValue }
  }

  public var initialized: GraphQLNullable<Bool> {
    get { __data["initialized"] }
    set { __data["initialized"] = newValue }
  }

  public var lastFetchedAt: GraphQLNullable<LongString> {
    get { __data["lastFetchedAt"] }
    set { __data["lastFetchedAt"] = newValue }
  }

  public var realUrl: GraphQLNullable<String> {
    get { __data["realUrl"] }
    set { __data["realUrl"] = newValue }
  }

  public var sourceId: GraphQLNullable<LongString> {
    get { __data["sourceId"] }
    set { __data["sourceId"] = newValue }
  }

  public var status: GraphQLNullable<GraphQLEnum<MangaStatus>> {
    get { __data["status"] }
    set { __data["status"] = newValue }
  }

  public var thumbnailUrl: GraphQLNullable<String> {
    get { __data["thumbnailUrl"] }
    set { __data["thumbnailUrl"] = newValue }
  }

  public var title: GraphQLNullable<String> {
    get { __data["title"] }
    set { __data["title"] = newValue }
  }

  public var url: GraphQLNullable<String> {
    get { __data["url"] }
    set { __data["url"] = newValue }
  }
}
