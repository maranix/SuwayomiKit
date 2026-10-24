// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

nonisolated public struct DeleteDownloadedChapterMutation: GraphQLMutation {
  public static let operationName: String = "DeleteDownloadedChapter"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation DeleteDownloadedChapter($input: DeleteDownloadedChapterInput!) { deleteDownloadedChapter(input: $input) { __typename chapters { __typename ...ChapterFields } } }"#,
      fragments: [ChapterFields.self]
    ))

  public var input: DeleteDownloadedChapterInput

  public init(input: DeleteDownloadedChapterInput) {
    self.input = input
  }

  @_spi(Unsafe) public var __variables: Variables? { ["input": input] }

  nonisolated public struct Data: API.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.Mutation }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("deleteDownloadedChapter", DeleteDownloadedChapter?.self, arguments: ["input": .variable("input")]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      DeleteDownloadedChapterMutation.Data.self
    ] }

    public var deleteDownloadedChapter: DeleteDownloadedChapter? { __data["deleteDownloadedChapter"] }

    /// DeleteDownloadedChapter
    ///
    /// Parent Type: `DeleteDownloadedChapterPayload`
    nonisolated public struct DeleteDownloadedChapter: API.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.DeleteDownloadedChapterPayload }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("chapters", Chapters.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        DeleteDownloadedChapterMutation.Data.DeleteDownloadedChapter.self
      ] }

      public var chapters: Chapters { __data["chapters"] }

      /// DeleteDownloadedChapter.Chapters
      ///
      /// Parent Type: `ChapterType`
      nonisolated public struct Chapters: API.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.ChapterType }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .fragment(ChapterFields.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          DeleteDownloadedChapterMutation.Data.DeleteDownloadedChapter.Chapters.self,
          ChapterFields.self
        ] }

        public var id: Int { __data["id"] }
        public var mangaId: Int { __data["mangaId"] }
        public var name: String { __data["name"] }
        public var chapterNumber: Double { __data["chapterNumber"] }
        public var pageCount: Int { __data["pageCount"] }
        public var isBookmarked: Bool { __data["isBookmarked"] }
        public var isDownloaded: Bool { __data["isDownloaded"] }
        public var isRead: Bool { __data["isRead"] }
        public var lastPageRead: Int { __data["lastPageRead"] }
        public var lastReadAt: API.LongString { __data["lastReadAt"] }
        public var uploadDate: API.LongString { __data["uploadDate"] }
        public var fetchedAt: API.LongString { __data["fetchedAt"] }
        public var scanlator: String? { __data["scanlator"] }
        public var sourceOrder: Int { __data["sourceOrder"] }
        public var url: String { __data["url"] }
        public var realUrl: String? { __data["realUrl"] }

        public struct Fragments: FragmentContainer {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          public var chapterFields: ChapterFields { _toFragment() }
        }
      }
    }
  }
}
