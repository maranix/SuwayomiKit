// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

nonisolated public struct MangaSummaryFields: API.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    #"fragment MangaSummaryFields on MangaType { __typename id title thumbnailUrl inLibrary unreadCount downloadCount sourceId }"#
  }

  @_spi(Unsafe) public let __data: DataDict
  @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

  @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.MangaType }
  @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("id", Int.self),
    .field("title", String.self),
    .field("thumbnailUrl", String?.self),
    .field("inLibrary", Bool.self),
    .field("unreadCount", Int.self),
    .field("downloadCount", Int.self),
    .field("sourceId", API.LongString.self),
  ] }
  @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
    MangaSummaryFields.self
  ] }

  public var id: Int { __data["id"] }
  public var title: String { __data["title"] }
  public var thumbnailUrl: String? { __data["thumbnailUrl"] }
  public var inLibrary: Bool { __data["inLibrary"] }
  public var unreadCount: Int { __data["unreadCount"] }
  public var downloadCount: Int { __data["downloadCount"] }
  public var sourceId: API.LongString { __data["sourceId"] }
}
