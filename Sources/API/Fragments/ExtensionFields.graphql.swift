// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

nonisolated public struct ExtensionFields: API.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    #"fragment ExtensionFields on ExtensionType { __typename pkgName name versionName versionCodeLong lang isInstalled hasUpdate isObsolete iconUrl contentWarning }"#
  }

  @_spi(Unsafe) public let __data: DataDict
  @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

  @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.ExtensionType }
  @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("pkgName", String.self),
    .field("name", String.self),
    .field("versionName", String.self),
    .field("versionCodeLong", API.LongString.self),
    .field("lang", String.self),
    .field("isInstalled", Bool.self),
    .field("hasUpdate", Bool.self),
    .field("isObsolete", Bool.self),
    .field("iconUrl", String.self),
    .field("contentWarning", GraphQLEnum<API.ContentWarning>.self),
  ] }
  @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
    ExtensionFields.self
  ] }

  public var pkgName: String { __data["pkgName"] }
  public var name: String { __data["name"] }
  public var versionName: String { __data["versionName"] }
  public var versionCodeLong: API.LongString { __data["versionCodeLong"] }
  public var lang: String { __data["lang"] }
  public var isInstalled: Bool { __data["isInstalled"] }
  public var hasUpdate: Bool { __data["hasUpdate"] }
  public var isObsolete: Bool { __data["isObsolete"] }
  public var iconUrl: String { __data["iconUrl"] }
  public var contentWarning: GraphQLEnum<API.ContentWarning> { __data["contentWarning"] }
}
