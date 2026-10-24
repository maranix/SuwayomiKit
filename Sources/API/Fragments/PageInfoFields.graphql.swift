// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

nonisolated public struct PageInfoFields: API.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    #"fragment PageInfoFields on PageInfo { __typename hasNextPage hasPreviousPage startCursor endCursor }"#
  }

  @_spi(Unsafe) public let __data: DataDict
  @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

  @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.PageInfo }
  @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("hasNextPage", Bool.self),
    .field("hasPreviousPage", Bool.self),
    .field("startCursor", API.Cursor?.self),
    .field("endCursor", API.Cursor?.self),
  ] }
  @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
    PageInfoFields.self
  ] }

  /// When paginating forwards, are there more items?
  public var hasNextPage: Bool { __data["hasNextPage"] }
  /// When paginating backwards, are there more items?
  public var hasPreviousPage: Bool { __data["hasPreviousPage"] }
  /// When paginating backwards, the cursor to continue.
  public var startCursor: API.Cursor? { __data["startCursor"] }
  /// When paginating forwards, the cursor to continue.
  public var endCursor: API.Cursor? { __data["endCursor"] }
}
