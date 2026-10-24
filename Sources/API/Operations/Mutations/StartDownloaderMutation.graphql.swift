// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

nonisolated public struct StartDownloaderMutation: GraphQLMutation {
  public static let operationName: String = "StartDownloader"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation StartDownloader($input: StartDownloaderInput!) { startDownloader(input: $input) { __typename downloadStatus { __typename state } } }"#
    ))

  public var input: StartDownloaderInput

  public init(input: StartDownloaderInput) {
    self.input = input
  }

  @_spi(Unsafe) public var __variables: Variables? { ["input": input] }

  nonisolated public struct Data: API.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.Mutation }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("startDownloader", StartDownloader?.self, arguments: ["input": .variable("input")]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      StartDownloaderMutation.Data.self
    ] }

    public var startDownloader: StartDownloader? { __data["startDownloader"] }

    /// StartDownloader
    ///
    /// Parent Type: `StartDownloaderPayload`
    nonisolated public struct StartDownloader: API.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.StartDownloaderPayload }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("downloadStatus", DownloadStatus.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        StartDownloaderMutation.Data.StartDownloader.self
      ] }

      public var downloadStatus: DownloadStatus { __data["downloadStatus"] }

      /// StartDownloader.DownloadStatus
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
          StartDownloaderMutation.Data.StartDownloader.DownloadStatus.self
        ] }

        public var state: GraphQLEnum<API.DownloaderState> { __data["state"] }
      }
    }
  }
}
