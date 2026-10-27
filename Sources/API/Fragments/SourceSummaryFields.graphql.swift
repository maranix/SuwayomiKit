// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

nonisolated public struct SourceSummaryFields: API.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    #"fragment SourceSummaryFields on SourceType { __typename id name displayName lang iconUrl supportsLatest }"#
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
    .field("supportsLatest", Bool.self),
  ] }
  @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
    SourceSummaryFields.self
  ] }

  public var id: API.LongString { __data["id"] }
  public var name: String { __data["name"] }
  public var displayName: String { __data["displayName"] }
  public var lang: String { __data["lang"] }
  public var iconUrl: String { __data["iconUrl"] }
  public var supportsLatest: Bool { __data["supportsLatest"] }
}
