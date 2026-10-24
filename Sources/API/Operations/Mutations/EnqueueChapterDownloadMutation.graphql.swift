// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

nonisolated public struct EnqueueChapterDownloadMutation: GraphQLMutation {
  public static let operationName: String = "EnqueueChapterDownload"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation EnqueueChapterDownload($input: EnqueueChapterDownloadInput!) { enqueueChapterDownload(input: $input) { __typename downloadStatus { __typename state } } }"#
    ))

  public var input: EnqueueChapterDownloadInput

  public init(input: EnqueueChapterDownloadInput) {
    self.input = input
  }

  @_spi(Unsafe) public var __variables: Variables? { ["input": input] }

  nonisolated public struct Data: API.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.Mutation }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("enqueueChapterDownload", EnqueueChapterDownload?.self, arguments: ["input": .variable("input")]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      EnqueueChapterDownloadMutation.Data.self
    ] }

    public var enqueueChapterDownload: EnqueueChapterDownload? { __data["enqueueChapterDownload"] }

    /// EnqueueChapterDownload
    ///
    /// Parent Type: `EnqueueChapterDownloadPayload`
    nonisolated public struct EnqueueChapterDownload: API.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.EnqueueChapterDownloadPayload }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("downloadStatus", DownloadStatus.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        EnqueueChapterDownloadMutation.Data.EnqueueChapterDownload.self
      ] }

      public var downloadStatus: DownloadStatus { __data["downloadStatus"] }

      /// EnqueueChapterDownload.DownloadStatus
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
          EnqueueChapterDownloadMutation.Data.EnqueueChapterDownload.DownloadStatus.self
        ] }

        public var state: GraphQLEnum<API.DownloaderState> { __data["state"] }
      }
    }
  }
}
