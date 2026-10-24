// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

nonisolated public struct CategoryFields: API.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    #"fragment CategoryFields on CategoryType { __typename id name order default isDefaultCategory includeInDownload includeInUpdate }"#
  }

  @_spi(Unsafe) public let __data: DataDict
  @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

  @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.CategoryType }
  @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("id", Int.self),
    .field("name", String.self),
    .field("order", Int.self),
    .field("default", Bool.self),
    .field("isDefaultCategory", Bool.self),
    .field("includeInDownload", GraphQLEnum<API.IncludeOrExclude>.self),
    .field("includeInUpdate", GraphQLEnum<API.IncludeOrExclude>.self),
  ] }
  @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
    CategoryFields.self
  ] }

  public var id: Int { __data["id"] }
  public var name: String { __data["name"] }
  public var order: Int { __data["order"] }
  public var `default`: Bool { __data["default"] }
  public var isDefaultCategory: Bool { __data["isDefaultCategory"] }
  public var includeInDownload: GraphQLEnum<API.IncludeOrExclude> { __data["includeInDownload"] }
  public var includeInUpdate: GraphQLEnum<API.IncludeOrExclude> { __data["includeInUpdate"] }
}
