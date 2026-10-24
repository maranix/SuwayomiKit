// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

nonisolated public struct UpdateExtensionMutation: GraphQLMutation {
  public static let operationName: String = "UpdateExtension"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation UpdateExtension($input: UpdateExtensionInput!) { updateExtension(input: $input) { __typename extension { __typename ...ExtensionFields } } }"#,
      fragments: [ExtensionFields.self]
    ))

  public var input: UpdateExtensionInput

  public init(input: UpdateExtensionInput) {
    self.input = input
  }

  @_spi(Unsafe) public var __variables: Variables? { ["input": input] }

  nonisolated public struct Data: API.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.Mutation }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("updateExtension", UpdateExtension?.self, arguments: ["input": .variable("input")]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      UpdateExtensionMutation.Data.self
    ] }

    public var updateExtension: UpdateExtension? { __data["updateExtension"] }

    /// UpdateExtension
    ///
    /// Parent Type: `UpdateExtensionPayload`
    nonisolated public struct UpdateExtension: API.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.UpdateExtensionPayload }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("extension", Extension?.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        UpdateExtensionMutation.Data.UpdateExtension.self
      ] }

      public var `extension`: Extension? { __data["extension"] }

      /// UpdateExtension.Extension
      ///
      /// Parent Type: `ExtensionType`
      nonisolated public struct Extension: API.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.ExtensionType }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .fragment(ExtensionFields.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          UpdateExtensionMutation.Data.UpdateExtension.Extension.self,
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

        public struct Fragments: FragmentContainer {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          public var extensionFields: ExtensionFields { _toFragment() }
        }
      }
    }
  }
}
