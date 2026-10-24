// @generated
// This file was automatically generated and should not be edited.

@_spi(Internal) @_spi(Unsafe) import ApolloAPI

nonisolated public struct SortSelectionInput: InputObject {
  @_spi(Unsafe) public private(set) var __data: InputDict

  @_spi(Unsafe) public init(_ data: InputDict) {
    __data = data
  }

  public init(
    ascending: Bool,
    index: Int32
  ) {
    __data = InputDict([
      "ascending": ascending,
      "index": index
    ])
  }

  public var ascending: Bool {
    get { __data["ascending"] }
    set { __data["ascending"] = newValue }
  }

  public var index: Int32 {
    get { __data["index"] }
    set { __data["index"] = newValue }
  }
}
