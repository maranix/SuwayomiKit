// @generated
// This file was automatically generated and should not be edited.

@_spi(Internal) @_spi(Unsafe) import ApolloAPI

nonisolated public struct UpdateChapterPatchInput: InputObject {
  @_spi(Unsafe) public private(set) var __data: InputDict

  @_spi(Unsafe) public init(_ data: InputDict) {
    __data = data
  }

  public init(
    isBookmarked: GraphQLNullable<Bool> = nil,
    isRead: GraphQLNullable<Bool> = nil,
    lastPageRead: GraphQLNullable<Int32> = nil
  ) {
    __data = InputDict([
      "isBookmarked": isBookmarked,
      "isRead": isRead,
      "lastPageRead": lastPageRead
    ])
  }

  public var isBookmarked: GraphQLNullable<Bool> {
    get { __data["isBookmarked"] }
    set { __data["isBookmarked"] = newValue }
  }

  public var isRead: GraphQLNullable<Bool> {
    get { __data["isRead"] }
    set { __data["isRead"] = newValue }
  }

  public var lastPageRead: GraphQLNullable<Int32> {
    get { __data["lastPageRead"] }
    set { __data["lastPageRead"] = newValue }
  }
}
