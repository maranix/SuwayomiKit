// @generated
// This file was automatically generated and should not be edited.

@_spi(Internal) @_spi(Unsafe) import ApolloAPI

nonisolated public struct UpdateCategoryPatchInput: InputObject {
  @_spi(Unsafe) public private(set) var __data: InputDict

  @_spi(Unsafe) public init(_ data: InputDict) {
    __data = data
  }

  public init(
    `default`: GraphQLNullable<Bool> = nil,
    includeInDownload: GraphQLNullable<GraphQLEnum<IncludeOrExclude>> = nil,
    includeInUpdate: GraphQLNullable<GraphQLEnum<IncludeOrExclude>> = nil,
    name: GraphQLNullable<String> = nil
  ) {
    __data = InputDict([
      "default": `default`,
      "includeInDownload": includeInDownload,
      "includeInUpdate": includeInUpdate,
      "name": name
    ])
  }

  public var `default`: GraphQLNullable<Bool> {
    get { __data["default"] }
    set { __data["default"] = newValue }
  }

  public var includeInDownload: GraphQLNullable<GraphQLEnum<IncludeOrExclude>> {
    get { __data["includeInDownload"] }
    set { __data["includeInDownload"] = newValue }
  }

  public var includeInUpdate: GraphQLNullable<GraphQLEnum<IncludeOrExclude>> {
    get { __data["includeInUpdate"] }
    set { __data["includeInUpdate"] = newValue }
  }

  public var name: GraphQLNullable<String> {
    get { __data["name"] }
    set { __data["name"] = newValue }
  }
}
