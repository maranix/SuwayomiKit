// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

nonisolated public struct ClearDownloaderMutation: GraphQLMutation {
  public static let operationName: String = "ClearDownloader"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation ClearDownloader($input: ClearDownloaderInput!) { clearDownloader(input: $input) { __typename downloadStatus { __typename state } } }"#
    ))

  public var input: ClearDownloaderInput

  public init(input: ClearDownloaderInput) {
    self.input = input
  }

  @_spi(Unsafe) public var __variables: Variables? { ["input": input] }

  nonisolated public struct Data: API.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.Mutation }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("clearDownloader", ClearDownloader?.self, arguments: ["input": .variable("input")]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      ClearDownloaderMutation.Data.self
    ] }

    public var clearDownloader: ClearDownloader? { __data["clearDownloader"] }

    /// ClearDownloader
    ///
    /// Parent Type: `ClearDownloaderPayload`
    nonisolated public struct ClearDownloader: API.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.ClearDownloaderPayload }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("downloadStatus", DownloadStatus.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        ClearDownloaderMutation.Data.ClearDownloader.self
      ] }

      public var downloadStatus: DownloadStatus { __data["downloadStatus"] }

      /// ClearDownloader.DownloadStatus
      ///
      /// Parent Type: `DownloadStatus`
      nonisolated public struct DownloadStatus: API.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.DownloadStatus }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("state", GraphQLEnum<API.DownloaderState>.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          ClearDownloaderMutation.Data.ClearDownloader.DownloadStatus.self
        ] }

        public var state: GraphQLEnum<API.DownloaderState> { __data["state"] }
      }
    }
  }
}
