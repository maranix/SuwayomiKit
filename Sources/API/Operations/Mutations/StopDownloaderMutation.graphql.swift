// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

nonisolated public struct StopDownloaderMutation: GraphQLMutation {
  public static let operationName: String = "StopDownloader"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation StopDownloader($input: StopDownloaderInput!) { stopDownloader(input: $input) { __typename downloadStatus { __typename state } } }"#
    ))

  public var input: StopDownloaderInput

  public init(input: StopDownloaderInput) {
    self.input = input
  }

  @_spi(Unsafe) public var __variables: Variables? { ["input": input] }

  nonisolated public struct Data: API.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.Mutation }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("stopDownloader", StopDownloader?.self, arguments: ["input": .variable("input")]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      StopDownloaderMutation.Data.self
    ] }

    public var stopDownloader: StopDownloader? { __data["stopDownloader"] }

    /// StopDownloader
    ///
    /// Parent Type: `StopDownloaderPayload`
    nonisolated public struct StopDownloader: API.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.StopDownloaderPayload }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("downloadStatus", DownloadStatus.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        StopDownloaderMutation.Data.StopDownloader.self
      ] }

      public var downloadStatus: DownloadStatus { __data["downloadStatus"] }

      /// StopDownloader.DownloadStatus
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
          StopDownloaderMutation.Data.StopDownloader.DownloadStatus.self
        ] }

        public var state: GraphQLEnum<API.DownloaderState> { __data["state"] }
      }
    }
  }
}
