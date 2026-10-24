// @generated
// This file was automatically generated and should not be edited.

@_spi(Internal) @_spi(Unsafe) import ApolloAPI

nonisolated public struct ChapterOrderInput: InputObject {
  @_spi(Unsafe) public private(set) var __data: InputDict

  @_spi(Unsafe) public init(_ data: InputDict) {
    __data = data
  }

  public init(
    by: GraphQLEnum<ChapterOrderBy>,
    byType: GraphQLNullable<GraphQLEnum<SortOrder>> = nil
  ) {
    __data = InputDict([
      "by": by,
      "byType": byType
    ])
  }

  public var by: GraphQLEnum<ChapterOrderBy> {
    get { __data["by"] }
    set { __data["by"] = newValue }
  }

  public var byType: GraphQLNullable<GraphQLEnum<SortOrder>> {
    get { __data["byType"] }
    set { __data["byType"] = newValue }
  }
}
