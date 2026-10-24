// @generated
// This file was automatically generated and should not be edited.

@_spi(Internal) @_spi(Unsafe) import ApolloAPI

nonisolated public struct FilterChangeInput: InputObject {
  @_spi(Unsafe) public private(set) var __data: InputDict

  @_spi(Unsafe) public init(_ data: InputDict) {
    __data = data
  }

  public init(
    checkBoxState: GraphQLNullable<Bool> = nil,
    groupChange: GraphQLNullable<FilterChangeInput> = nil,
    position: Int32,
    selectState: GraphQLNullable<Int32> = nil,
    sortState: GraphQLNullable<SortSelectionInput> = nil,
    textState: GraphQLNullable<String> = nil,
    triState: GraphQLNullable<GraphQLEnum<TriState>> = nil
  ) {
    __data = InputDict([
      "checkBoxState": checkBoxState,
      "groupChange": groupChange,
      "position": position,
      "selectState": selectState,
      "sortState": sortState,
      "textState": textState,
      "triState": triState
    ])
  }

  public var checkBoxState: GraphQLNullable<Bool> {
    get { __data["checkBoxState"] }
    set { __data["checkBoxState"] = newValue }
  }

  public var groupChange: GraphQLNullable<FilterChangeInput> {
    get { __data["groupChange"] }
    set { __data["groupChange"] = newValue }
  }

  public var position: Int32 {
    get { __data["position"] }
    set { __data["position"] = newValue }
  }

  public var selectState: GraphQLNullable<Int32> {
    get { __data["selectState"] }
    set { __data["selectState"] = newValue }
  }

  public var sortState: GraphQLNullable<SortSelectionInput> {
    get { __data["sortState"] }
    set { __data["sortState"] = newValue }
  }

  public var textState: GraphQLNullable<String> {
    get { __data["textState"] }
    set { __data["textState"] = newValue }
  }

  public var triState: GraphQLNullable<GraphQLEnum<TriState>> {
    get { __data["triState"] }
    set { __data["triState"] = newValue }
  }
}
