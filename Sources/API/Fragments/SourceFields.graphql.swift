// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

nonisolated public struct SourceFields: API.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    #"fragment SourceFields on SourceType { __typename id name displayName lang iconUrl homeUrl supportsLatest isConfigurable contentWarning }"#
  }

  @_spi(Unsafe) public let __data: DataDict
  @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

  @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.SourceType }
  @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("id", API.LongString.self),
    .field("name", String.self),
    .field("displayName", String.self),
    .field("lang", String.self),
    .field("iconUrl", String.self),
    .field("homeUrl", String?.self),
    .field("supportsLatest", Bool.self),
    .field("isConfigurable", Bool.self),
    .field("contentWarning", GraphQLEnum<API.ContentWarning>.self),
  ] }
  @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
    SourceFields.self
  ] }

  public var id: API.LongString { __data["id"] }
  public var name: String { __data["name"] }
  public var displayName: String { __data["displayName"] }
  public var lang: String { __data["lang"] }
  public var iconUrl: String { __data["iconUrl"] }
  public var homeUrl: String? { __data["homeUrl"] }
  public var supportsLatest: Bool { __data["supportsLatest"] }
  public var isConfigurable: Bool { __data["isConfigurable"] }
  public var contentWarning: GraphQLEnum<API.ContentWarning> { __data["contentWarning"] }
}
