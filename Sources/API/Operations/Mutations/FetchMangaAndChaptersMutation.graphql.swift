// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

nonisolated public struct FetchMangaAndChaptersMutation: GraphQLMutation {
  public static let operationName: String = "FetchMangaAndChapters"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation FetchMangaAndChapters($input: FetchMangaAndChaptersInput!) { fetchMangaAndChapters(input: $input) { __typename manga { __typename ...MangaFields } chapters { __typename ...ChapterFields } } }"#,
      fragments: [ChapterFields.self, MangaFields.self]
    ))

  public var input: FetchMangaAndChaptersInput

  public init(input: FetchMangaAndChaptersInput) {
    self.input = input
  }

  @_spi(Unsafe) public var __variables: Variables? { ["input": input] }

  nonisolated public struct Data: API.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.Mutation }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("fetchMangaAndChapters", FetchMangaAndChapters?.self, arguments: ["input": .variable("input")]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      FetchMangaAndChaptersMutation.Data.self
    ] }

    public var fetchMangaAndChapters: FetchMangaAndChapters? { __data["fetchMangaAndChapters"] }

    /// FetchMangaAndChapters
    ///
    /// Parent Type: `FetchMangaAndChaptersPayload`
    nonisolated public struct FetchMangaAndChapters: API.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.FetchMangaAndChaptersPayload }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("manga", Manga.self),
        .field("chapters", [Chapter].self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        FetchMangaAndChaptersMutation.Data.FetchMangaAndChapters.self
      ] }

      public var manga: Manga { __data["manga"] }
      public var chapters: [Chapter] { __data["chapters"] }

      /// FetchMangaAndChapters.Manga
      ///
      /// Parent Type: `MangaType`
      nonisolated public struct Manga: API.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.MangaType }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .fragment(MangaFields.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          FetchMangaAndChaptersMutation.Data.FetchMangaAndChapters.Manga.self,
          MangaFields.self
        ] }

        public var id: Int { __data["id"] }
        public var title: String { __data["title"] }
        public var artist: String? { __data["artist"] }
        public var author: String? { __data["author"] }
        public var description: String? { __data["description"] }
        public var genre: [String] { __data["genre"] }
        public var status: GraphQLEnum<API.MangaStatus> { __data["status"] }
        public var inLibrary: Bool { __data["inLibrary"] }
        public var inLibraryAt: API.LongString { __data["inLibraryAt"] }
        public var thumbnailUrl: String? { __data["thumbnailUrl"] }
        public var thumbnailUrlLastFetched: API.LongString? { __data["thumbnailUrlLastFetched"] }
        public var sourceId: API.LongString { __data["sourceId"] }
        public var url: String { __data["url"] }
        public var realUrl: String? { __data["realUrl"] }
        public var unreadCount: Int { __data["unreadCount"] }
        public var downloadCount: Int { __data["downloadCount"] }
        public var bookmarkCount: Int { __data["bookmarkCount"] }
        public var updateStrategy: GraphQLEnum<API.UpdateStrategy> { __data["updateStrategy"] }
        public var initialized: Bool { __data["initialized"] }
        public var lastFetchedAt: API.LongString? { __data["lastFetchedAt"] }
        public var chaptersLastFetchedAt: API.LongString? { __data["chaptersLastFetchedAt"] }

        public struct Fragments: FragmentContainer {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          public var mangaFields: MangaFields { _toFragment() }
        }
      }

      /// FetchMangaAndChapters.Chapter
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
          FetchMangaAndChaptersMutation.Data.FetchMangaAndChapters.Chapter.self,
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
