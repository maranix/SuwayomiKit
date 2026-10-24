// @generated
// This file was automatically generated and should not be edited.

@_spi(Internal) @_spi(Unsafe) import ApolloAPI

nonisolated public struct ExtensionConditionInput: InputObject {
  @_spi(Unsafe) public private(set) var __data: InputDict

  @_spi(Unsafe) public init(_ data: InputDict) {
    __data = data
  }

  public init(
    apkName: GraphQLNullable<String> = nil,
    apkUrl: GraphQLNullable<String> = nil,
    contentWarning: GraphQLNullable<GraphQLEnum<ContentWarning>> = nil,
    extensionLib: GraphQLNullable<String> = nil,
    hasUpdate: GraphQLNullable<Bool> = nil,
    iconUrl: GraphQLNullable<String> = nil,
    isInstalled: GraphQLNullable<Bool> = nil,
    isObsolete: GraphQLNullable<Bool> = nil,
    jarUrl: GraphQLNullable<String> = nil,
    lang: GraphQLNullable<String> = nil,
    name: GraphQLNullable<String> = nil,
    pkgName: GraphQLNullable<String> = nil,
    storeIndexUrl: GraphQLNullable<String> = nil,
    versionCode: GraphQLNullable<Int32> = nil,
    versionCodeLong: GraphQLNullable<LongString> = nil,
    versionName: GraphQLNullable<String> = nil
  ) {
    __data = InputDict([
      "apkName": apkName,
      "apkUrl": apkUrl,
      "contentWarning": contentWarning,
      "extensionLib": extensionLib,
      "hasUpdate": hasUpdate,
      "iconUrl": iconUrl,
      "isInstalled": isInstalled,
      "isObsolete": isObsolete,
      "jarUrl": jarUrl,
      "lang": lang,
      "name": name,
      "pkgName": pkgName,
      "storeIndexUrl": storeIndexUrl,
      "versionCode": versionCode,
      "versionCodeLong": versionCodeLong,
      "versionName": versionName
    ])
  }

  public var apkName: GraphQLNullable<String> {
    get { __data["apkName"] }
    set { __data["apkName"] = newValue }
  }

  public var apkUrl: GraphQLNullable<String> {
    get { __data["apkUrl"] }
    set { __data["apkUrl"] = newValue }
  }

  public var contentWarning: GraphQLNullable<GraphQLEnum<ContentWarning>> {
    get { __data["contentWarning"] }
    set { __data["contentWarning"] = newValue }
  }

  public var extensionLib: GraphQLNullable<String> {
    get { __data["extensionLib"] }
    set { __data["extensionLib"] = newValue }
  }

  public var hasUpdate: GraphQLNullable<Bool> {
    get { __data["hasUpdate"] }
    set { __data["hasUpdate"] = newValue }
  }

  public var iconUrl: GraphQLNullable<String> {
    get { __data["iconUrl"] }
    set { __data["iconUrl"] = newValue }
  }

  public var isInstalled: GraphQLNullable<Bool> {
    get { __data["isInstalled"] }
    set { __data["isInstalled"] = newValue }
  }

  public var isObsolete: GraphQLNullable<Bool> {
    get { __data["isObsolete"] }
    set { __data["isObsolete"] = newValue }
  }

  public var jarUrl: GraphQLNullable<String> {
    get { __data["jarUrl"] }
    set { __data["jarUrl"] = newValue }
  }

  public var lang: GraphQLNullable<String> {
    get { __data["lang"] }
    set { __data["lang"] = newValue }
  }

  public var name: GraphQLNullable<String> {
    get { __data["name"] }
    set { __data["name"] = newValue }
  }

  public var pkgName: GraphQLNullable<String> {
    get { __data["pkgName"] }
    set { __data["pkgName"] = newValue }
  }

  public var storeIndexUrl: GraphQLNullable<String> {
    get { __data["storeIndexUrl"] }
    set { __data["storeIndexUrl"] = newValue }
  }

  public var versionCode: GraphQLNullable<Int32> {
    get { __data["versionCode"] }
    set { __data["versionCode"] = newValue }
  }

  public var versionCodeLong: GraphQLNullable<LongString> {
    get { __data["versionCodeLong"] }
    set { __data["versionCodeLong"] = newValue }
  }

  public var versionName: GraphQLNullable<String> {
    get { __data["versionName"] }
    set { __data["versionName"] = newValue }
  }
}
