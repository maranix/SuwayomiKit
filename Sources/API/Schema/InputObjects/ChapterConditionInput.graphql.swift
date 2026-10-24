// @generated
// This file was automatically generated and should not be edited.

@_spi(Internal) @_spi(Unsafe) import ApolloAPI

nonisolated public struct ChapterConditionInput: InputObject {
  @_spi(Unsafe) public private(set) var __data: InputDict

  @_spi(Unsafe) public init(_ data: InputDict) {
    __data = data
  }

  public init(
    chapterNumber: GraphQLNullable<Double> = nil,
    fetchedAt: GraphQLNullable<LongString> = nil,
    id: GraphQLNullable<Int32> = nil,
    isBookmarked: GraphQLNullable<Bool> = nil,
    isDownloaded: GraphQLNullable<Bool> = nil,
    isRead: GraphQLNullable<Bool> = nil,
    lastPageRead: GraphQLNullable<Int32> = nil,
    lastReadAt: GraphQLNullable<LongString> = nil,
    mangaId: GraphQLNullable<Int32> = nil,
    name: GraphQLNullable<String> = nil,
    pageCount: GraphQLNullable<Int32> = nil,
    realUrl: GraphQLNullable<String> = nil,
    scanlator: GraphQLNullable<String> = nil,
    sourceOrder: GraphQLNullable<Int32> = nil,
    uploadDate: GraphQLNullable<LongString> = nil,
    url: GraphQLNullable<String> = nil
  ) {
    __data = InputDict([
      "chapterNumber": chapterNumber,
      "fetchedAt": fetchedAt,
      "id": id,
      "isBookmarked": isBookmarked,
      "isDownloaded": isDownloaded,
      "isRead": isRead,
      "lastPageRead": lastPageRead,
      "lastReadAt": lastReadAt,
      "mangaId": mangaId,
      "name": name,
      "pageCount": pageCount,
      "realUrl": realUrl,
      "scanlator": scanlator,
      "sourceOrder": sourceOrder,
      "uploadDate": uploadDate,
      "url": url
    ])
  }

  public var chapterNumber: GraphQLNullable<Double> {
    get { __data["chapterNumber"] }
    set { __data["chapterNumber"] = newValue }
  }

  public var fetchedAt: GraphQLNullable<LongString> {
    get { __data["fetchedAt"] }
    set { __data["fetchedAt"] = newValue }
  }

  public var id: GraphQLNullable<Int32> {
    get { __data["id"] }
    set { __data["id"] = newValue }
  }

  public var isBookmarked: GraphQLNullable<Bool> {
    get { __data["isBookmarked"] }
    set { __data["isBookmarked"] = newValue }
  }

  public var isDownloaded: GraphQLNullable<Bool> {
    get { __data["isDownloaded"] }
    set { __data["isDownloaded"] = newValue }
  }

  public var isRead: GraphQLNullable<Bool> {
    get { __data["isRead"] }
    set { __data["isRead"] = newValue }
  }

  public var lastPageRead: GraphQLNullable<Int32> {
    get { __data["lastPageRead"] }
    set { __data["lastPageRead"] = newValue }
  }

  public var lastReadAt: GraphQLNullable<LongString> {
    get { __data["lastReadAt"] }
    set { __data["lastReadAt"] = newValue }
  }

  public var mangaId: GraphQLNullable<Int32> {
    get { __data["mangaId"] }
    set { __data["mangaId"] = newValue }
  }

  public var name: GraphQLNullable<String> {
    get { __data["name"] }
    set { __data["name"] = newValue }
  }

  public var pageCount: GraphQLNullable<Int32> {
    get { __data["pageCount"] }
    set { __data["pageCount"] = newValue }
  }

  public var realUrl: GraphQLNullable<String> {
    get { __data["realUrl"] }
    set { __data["realUrl"] = newValue }
  }

  public var scanlator: GraphQLNullable<String> {
    get { __data["scanlator"] }
    set { __data["scanlator"] = newValue }
  }

  public var sourceOrder: GraphQLNullable<Int32> {
    get { __data["sourceOrder"] }
    set { __data["sourceOrder"] = newValue }
  }

  public var uploadDate: GraphQLNullable<LongString> {
    get { __data["uploadDate"] }
    set { __data["uploadDate"] = newValue }
  }

  public var url: GraphQLNullable<String> {
    get { __data["url"] }
    set { __data["url"] = newValue }
  }
}
