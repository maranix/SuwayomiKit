// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

nonisolated public struct FetchChapterPagesMutation: GraphQLMutation {
  public static let operationName: String = "FetchChapterPages"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation FetchChapterPages($input: FetchChapterPagesInput!) { fetchChapterPages(input: $input) { __typename pages chapter { __typename ...ChapterFields } } }"#,
      fragments: [ChapterFields.self]
    ))

  public var input: FetchChapterPagesInput

  public init(input: FetchChapterPagesInput) {
    self.input = input
  }

  @_spi(Unsafe) public var __variables: Variables? { ["input": input] }

  nonisolated public struct Data: API.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.Mutation }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("fetchChapterPages", FetchChapterPages?.self, arguments: ["input": .variable("input")]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      FetchChapterPagesMutation.Data.self
    ] }

    public var fetchChapterPages: FetchChapterPages? { __data["fetchChapterPages"] }

    /// FetchChapterPages
    ///
    /// Parent Type: `FetchChapterPagesPayload`
    nonisolated public struct FetchChapterPages: API.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.FetchChapterPagesPayload }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("pages", [String].self),
        .field("chapter", Chapter.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        FetchChapterPagesMutation.Data.FetchChapterPages.self
      ] }

      public var pages: [String] { __data["pages"] }
      public var chapter: Chapter { __data["chapter"] }

      /// FetchChapterPages.Chapter
      ///
      /// Parent Type: `ChapterType`
      nonisolated public struct Chapter: API.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.ChapterType }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .fragment(ChapterFields.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          FetchChapterPagesMutation.Data.FetchChapterPages.Chapter.self,
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
