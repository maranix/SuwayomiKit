// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

nonisolated public struct GetSettingsQuery: GraphQLQuery {
  public static let operationName: String = "GetSettings"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetSettings { settings { __typename ip port authMode authUsername downloadsPath autoDownloadNewChapters maxSourcesInParallel } }"#
    ))

  public init() {}

  nonisolated public struct Data: API.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.Query }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("settings", Settings.self),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      GetSettingsQuery.Data.self
    ] }

    public var settings: Settings { __data["settings"] }

    /// Settings
    ///
    /// Parent Type: `SettingsType`
    nonisolated public struct Settings: API.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.SettingsType }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("ip", String.self),
        .field("port", Int.self),
        .field("authMode", GraphQLEnum<API.AuthMode>.self),
        .field("authUsername", String.self),
        .field("downloadsPath", String.self),
        .field("autoDownloadNewChapters", Bool.self),
        .field("maxSourcesInParallel", Int.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        GetSettingsQuery.Data.Settings.self
      ] }

      public var ip: String { __data["ip"] }
      public var port: Int { __data["port"] }
      public var authMode: GraphQLEnum<API.AuthMode> { __data["authMode"] }
      public var authUsername: String { __data["authUsername"] }
      public var downloadsPath: String { __data["downloadsPath"] }
      public var autoDownloadNewChapters: Bool { __data["autoDownloadNewChapters"] }
      public var maxSourcesInParallel: Int { __data["maxSourcesInParallel"] }
    }
  }
}
