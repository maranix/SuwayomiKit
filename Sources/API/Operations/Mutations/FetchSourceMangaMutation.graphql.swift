// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

nonisolated public struct FetchSourceMangaMutation: GraphQLMutation {
  public static let operationName: String = "FetchSourceManga"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation FetchSourceManga($input: FetchSourceMangaInput!) { fetchSourceManga(input: $input) { __typename hasNextPage mangas { __typename ...MangaFields } } }"#,
      fragments: [MangaFields.self]
    ))

  public var input: FetchSourceMangaInput

  public init(input: FetchSourceMangaInput) {
    self.input = input
  }

  @_spi(Unsafe) public var __variables: Variables? { ["input": input] }

  nonisolated public struct Data: API.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.Mutation }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("fetchSourceManga", FetchSourceManga?.self, arguments: ["input": .variable("input")]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      FetchSourceMangaMutation.Data.self
    ] }

    public var fetchSourceManga: FetchSourceManga? { __data["fetchSourceManga"] }

    /// FetchSourceManga
    ///
    /// Parent Type: `FetchSourceMangaPayload`
    nonisolated public struct FetchSourceManga: API.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.FetchSourceMangaPayload }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("hasNextPage", Bool.self),
        .field("mangas", [Manga].self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        FetchSourceMangaMutation.Data.FetchSourceManga.self
      ] }

      public var hasNextPage: Bool { __data["hasNextPage"] }
      public var mangas: [Manga] { __data["mangas"] }

      /// FetchSourceManga.Manga
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
          FetchSourceMangaMutation.Data.FetchSourceManga.Manga.self,
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
