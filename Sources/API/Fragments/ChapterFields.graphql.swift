// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

nonisolated public struct ChapterFields: API.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    #"fragment ChapterFields on ChapterType { __typename id mangaId name chapterNumber pageCount isBookmarked isDownloaded isRead lastPageRead lastReadAt uploadDate fetchedAt scanlator sourceOrder url realUrl }"#
  }

  @_spi(Unsafe) public let __data: DataDict
  @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

  @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.ChapterType }
  @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("id", Int.self),
    .field("mangaId", Int.self),
    .field("name", String.self),
    .field("chapterNumber", Double.self),
    .field("pageCount", Int.self),
    .field("isBookmarked", Bool.self),
    .field("isDownloaded", Bool.self),
    .field("isRead", Bool.self),
    .field("lastPageRead", Int.self),
    .field("lastReadAt", API.LongString.self),
    .field("uploadDate", API.LongString.self),
    .field("fetchedAt", API.LongString.self),
    .field("scanlator", String?.self),
    .field("sourceOrder", Int.self),
    .field("url", String.self),
    .field("realUrl", String?.self),
  ] }
  @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
    ChapterFields.self
  ] }

  public var id: Int { __data["id"] }
  public var mangaId: Int { __data["mangaId"] }
  public var name: String { __data["name"] }
  public var chapterNumber: Double { __data["chapterNumber"] }
  public var pageCount: Int { __data["pageCount"] }
  public var isBookmarked: Bool { __data["isBookmarked"] }
  public var isDownloaded: Bool { __data["isDownloaded"] }
  public var isRead: Bool { __data["isRead"] }
  public var lastPageRead: Int { __data["lastPageRead"] }
  public var lastReadAt: API.LongString { __data["lastReadAt"] }
  public var uploadDate: API.LongString { __data["uploadDate"] }
  public var fetchedAt: API.LongString { __data["fetchedAt"] }
  public var scanlator: String? { __data["scanlator"] }
  public var sourceOrder: Int { __data["sourceOrder"] }
  public var url: String { __data["url"] }
  public var realUrl: String? { __data["realUrl"] }
}
