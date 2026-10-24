// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

nonisolated public struct GetSourceQuery: GraphQLQuery {
  public static let operationName: String = "GetSource"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetSource($id: LongString!) { source(id: $id) { __typename ...SourceFields } }"#,
      fragments: [SourceFields.self]
    ))

  public var id: LongString

  public init(id: LongString) {
    self.id = id
  }

  @_spi(Unsafe) public var __variables: Variables? { ["id": id] }

  nonisolated public struct Data: API.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.Query }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("source", Source.self, arguments: ["id": .variable("id")]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      GetSourceQuery.Data.self
    ] }

    public var source: Source { __data["source"] }

    /// Source
    ///
    /// Parent Type: `SourceType`
    nonisolated public struct Source: API.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.SourceType }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .fragment(SourceFields.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        GetSourceQuery.Data.Source.self,
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

      public struct Fragments: FragmentContainer {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        public var sourceFields: SourceFields { _toFragment() }
      }
    }
  }
}
