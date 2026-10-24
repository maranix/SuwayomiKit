// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

nonisolated public struct ClearCachedImagesMutation: GraphQLMutation {
  public static let operationName: String = "ClearCachedImages"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation ClearCachedImages($input: ClearCachedImagesInput!) { clearCachedImages(input: $input) { __typename cachedPages cachedThumbnails } }"#
    ))

  public var input: ClearCachedImagesInput

  public init(input: ClearCachedImagesInput) {
    self.input = input
  }

  @_spi(Unsafe) public var __variables: Variables? { ["input": input] }

  nonisolated public struct Data: API.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.Mutation }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("clearCachedImages", ClearCachedImages.self, arguments: ["input": .variable("input")]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      ClearCachedImagesMutation.Data.self
    ] }

    public var clearCachedImages: ClearCachedImages { __data["clearCachedImages"] }

    /// ClearCachedImages
    ///
    /// Parent Type: `ClearCachedImagesPayload`
    nonisolated public struct ClearCachedImages: API.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.ClearCachedImagesPayload }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("cachedPages", Bool?.self),
        .field("cachedThumbnails", Bool?.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        ClearCachedImagesMutation.Data.ClearCachedImages.self
      ] }

      public var cachedPages: Bool? { __data["cachedPages"] }
      public var cachedThumbnails: Bool? { __data["cachedThumbnails"] }
    }
  }
}
