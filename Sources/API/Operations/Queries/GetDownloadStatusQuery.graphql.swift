// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

nonisolated public struct GetDownloadStatusQuery: GraphQLQuery {
  public static let operationName: String = "GetDownloadStatus"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetDownloadStatus { downloadStatus { __typename state queue { __typename position progress state tries chapter { __typename ...ChapterFields } manga { __typename ...MangaFields } } } }"#,
      fragments: [ChapterFields.self, MangaFields.self]
    ))

  public init() {}

  nonisolated public struct Data: API.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.Query }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("downloadStatus", DownloadStatus.self),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      GetDownloadStatusQuery.Data.self
    ] }

    public var downloadStatus: DownloadStatus { __data["downloadStatus"] }

    /// DownloadStatus
    ///
    /// Parent Type: `DownloadStatus`
    nonisolated public struct DownloadStatus: API.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.DownloadStatus }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("state", GraphQLEnum<API.DownloaderState>.self),
        .field("queue", [Queue].self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        GetDownloadStatusQuery.Data.DownloadStatus.self
      ] }

      public var state: GraphQLEnum<API.DownloaderState> { __data["state"] }
      public var queue: [Queue] { __data["queue"] }

      /// DownloadStatus.Queue
      ///
      /// Parent Type: `DownloadType`
      nonisolated public struct Queue: API.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.DownloadType }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("position", Int.self),
          .field("progress", Double.self),
          .field("state", GraphQLEnum<API.DownloadState>.self),
          .field("tries", Int.self),
          .field("chapter", Chapter.self),
          .field("manga", Manga.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          GetDownloadStatusQuery.Data.DownloadStatus.Queue.self
        ] }

        public var position: Int { __data["position"] }
        public var progress: Double { __data["progress"] }
        public var state: GraphQLEnum<API.DownloadState> { __data["state"] }
        public var tries: Int { __data["tries"] }
        public var chapter: Chapter { __data["chapter"] }
        public var manga: Manga { __data["manga"] }

        /// DownloadStatus.Queue.Chapter
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
            GetDownloadStatusQuery.Data.DownloadStatus.Queue.Chapter.self,
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

        /// DownloadStatus.Queue.Manga
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
            GetDownloadStatusQuery.Data.DownloadStatus.Queue.Manga.self,
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
      }
    }
  }
}
