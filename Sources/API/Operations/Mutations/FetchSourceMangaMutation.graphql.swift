// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

nonisolated public struct FetchSourceMangaMutation: GraphQLMutation {
  public static let operationName: String = "FetchSourceManga"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation FetchSourceManga($input: FetchSourceMangaInput!) { fetchSourceManga(input: $input) { __typename hasNextPage mangas { __typename ...MangaSummaryFields } } }"#,
      fragments: [MangaSummaryFields.self]
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
          .fragment(MangaSummaryFields.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          FetchSourceMangaMutation.Data.FetchSourceManga.Manga.self,
          MangaSummaryFields.self
        ] }

        public var id: Int { __data["id"] }
        public var title: String { __data["title"] }
        public var thumbnailUrl: String? { __data["thumbnailUrl"] }
        public var inLibrary: Bool { __data["inLibrary"] }
        public var unreadCount: Int { __data["unreadCount"] }
        public var downloadCount: Int { __data["downloadCount"] }
        public var sourceId: API.LongString { __data["sourceId"] }

        public struct Fragments: FragmentContainer {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          public var mangaSummaryFields: MangaSummaryFields { _toFragment() }
        }
      }
    }
  }
}
