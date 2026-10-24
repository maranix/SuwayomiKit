// @generated
// This file was automatically generated and should not be edited.

@_spi(Internal) @_spi(Unsafe) import ApolloAPI

nonisolated public struct UpdateMangaPatchInput: InputObject {
  @_spi(Unsafe) public private(set) var __data: InputDict

  @_spi(Unsafe) public init(_ data: InputDict) {
    __data = data
  }

  public init(
    inLibrary: GraphQLNullable<Bool> = nil
  ) {
    __data = InputDict([
      "inLibrary": inLibrary
    ])
  }

  public var inLibrary: GraphQLNullable<Bool> {
    get { __data["inLibrary"] }
    set { __data["inLibrary"] = newValue }
  }
}
