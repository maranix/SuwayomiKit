// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

nonisolated public struct MangaFields: API.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    #"fragment MangaFields on MangaType { __typename id title artist author description genre status inLibrary inLibraryAt thumbnailUrl thumbnailUrlLastFetched sourceId url realUrl unreadCount downloadCount bookmarkCount updateStrategy initialized lastFetchedAt chaptersLastFetchedAt }"#
  }

  @_spi(Unsafe) public let __data: DataDict
  @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

  @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.MangaType }
  @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("id", Int.self),
    .field("title", String.self),
    .field("artist", String?.self),
    .field("author", String?.self),
    .field("description", String?.self),
    .field("genre", [String].self),
    .field("status", GraphQLEnum<API.MangaStatus>.self),
    .field("inLibrary", Bool.self),
    .field("inLibraryAt", API.LongString.self),
    .field("thumbnailUrl", String?.self),
    .field("thumbnailUrlLastFetched", API.LongString?.self),
    .field("sourceId", API.LongString.self),
    .field("url", String.self),
    .field("realUrl", String?.self),
    .field("unreadCount", Int.self),
    .field("downloadCount", Int.self),
    .field("bookmarkCount", Int.self),
    .field("updateStrategy", GraphQLEnum<API.UpdateStrategy>.self),
    .field("initialized", Bool.self),
    .field("lastFetchedAt", API.LongString?.self),
    .field("chaptersLastFetchedAt", API.LongString?.self),
  ] }
  @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
    MangaFields.self
  ] }

  public var id: Int { __data["id"] }
  public var title: String { __data["title"] }
  public var artist: String? { __data["artist"] }
  public var author: String? { __data["author"] }
  public var description: String? { __data["description"] }
  public var genre: [String] { __data["genre"] }
  public var status: GraphQLEnum<API.MangaStatus> { __data["status"] }
  public var inLibrary: Bool { __data["inLibrary"] }
  public var inLibraryAt: API.LongString { __data["inLibraryAt"] }
  public var thumbnailUrl: String? { __data["thumbnailUrl"] }
  public var thumbnailUrlLastFetched: API.LongString? { __data["thumbnailUrlLastFetched"] }
  public var sourceId: API.LongString { __data["sourceId"] }
  public var url: String { __data["url"] }
  public var realUrl: String? { __data["realUrl"] }
  public var unreadCount: Int { __data["unreadCount"] }
  public var downloadCount: Int { __data["downloadCount"] }
  public var bookmarkCount: Int { __data["bookmarkCount"] }
  public var updateStrategy: GraphQLEnum<API.UpdateStrategy> { __data["updateStrategy"] }
  public var initialized: Bool { __data["initialized"] }
  public var lastFetchedAt: API.LongString? { __data["lastFetchedAt"] }
  public var chaptersLastFetchedAt: API.LongString? { __data["chaptersLastFetchedAt"] }
}
