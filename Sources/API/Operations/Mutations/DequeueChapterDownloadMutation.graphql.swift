// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

nonisolated public struct DequeueChapterDownloadMutation: GraphQLMutation {
  public static let operationName: String = "DequeueChapterDownload"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation DequeueChapterDownload($input: DequeueChapterDownloadInput!) { dequeueChapterDownload(input: $input) { __typename downloadStatus { __typename state } } }"#
    ))

  public var input: DequeueChapterDownloadInput

  public init(input: DequeueChapterDownloadInput) {
    self.input = input
  }

  @_spi(Unsafe) public var __variables: Variables? { ["input": input] }

  nonisolated public struct Data: API.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.Mutation }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("dequeueChapterDownload", DequeueChapterDownload?.self, arguments: ["input": .variable("input")]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      DequeueChapterDownloadMutation.Data.self
    ] }

    public var dequeueChapterDownload: DequeueChapterDownload? { __data["dequeueChapterDownload"] }

    /// DequeueChapterDownload
    ///
    /// Parent Type: `DequeueChapterDownloadPayload`
    nonisolated public struct DequeueChapterDownload: API.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.DequeueChapterDownloadPayload }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("downloadStatus", DownloadStatus.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        DequeueChapterDownloadMutation.Data.DequeueChapterDownload.self
      ] }

      public var downloadStatus: DownloadStatus { __data["downloadStatus"] }

      /// DequeueChapterDownload.DownloadStatus
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
          DequeueChapterDownloadMutation.Data.DequeueChapterDownload.DownloadStatus.self
        ] }

        public var state: GraphQLEnum<API.DownloaderState> { __data["state"] }
      }
    }
  }
}
