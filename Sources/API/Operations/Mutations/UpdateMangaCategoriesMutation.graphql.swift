// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

nonisolated public struct UpdateMangaCategoriesMutation: GraphQLMutation {
  public static let operationName: String = "UpdateMangaCategories"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation UpdateMangaCategories($input: UpdateMangaCategoriesInput!) { updateMangaCategories(input: $input) { __typename manga { __typename ...MangaFields } } }"#,
      fragments: [MangaFields.self]
    ))

  public var input: UpdateMangaCategoriesInput

  public init(input: UpdateMangaCategoriesInput) {
    self.input = input
  }

  @_spi(Unsafe) public var __variables: Variables? { ["input": input] }

  nonisolated public struct Data: API.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.Mutation }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("updateMangaCategories", UpdateMangaCategories?.self, arguments: ["input": .variable("input")]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      UpdateMangaCategoriesMutation.Data.self
    ] }

    public var updateMangaCategories: UpdateMangaCategories? { __data["updateMangaCategories"] }

    /// UpdateMangaCategories
    ///
    /// Parent Type: `UpdateMangaCategoriesPayload`
    nonisolated public struct UpdateMangaCategories: API.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.UpdateMangaCategoriesPayload }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("manga", Manga.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        UpdateMangaCategoriesMutation.Data.UpdateMangaCategories.self
      ] }

      public var manga: Manga { __data["manga"] }

      /// UpdateMangaCategories.Manga
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
          UpdateMangaCategoriesMutation.Data.UpdateMangaCategories.Manga.self,
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
