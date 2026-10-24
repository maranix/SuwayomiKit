// @generated
// This file was automatically generated and should not be edited.

@_spi(Internal) @_spi(Unsafe) import ApolloAPI

nonisolated public struct CreateCategoryInput: InputObject {
  @_spi(Unsafe) public private(set) var __data: InputDict

  @_spi(Unsafe) public init(_ data: InputDict) {
    __data = data
  }

  public init(
    clientMutationId: GraphQLNullable<String> = nil,
    `default`: GraphQLNullable<Bool> = nil,
    includeInDownload: GraphQLNullable<GraphQLEnum<IncludeOrExclude>> = nil,
    includeInUpdate: GraphQLNullable<GraphQLEnum<IncludeOrExclude>> = nil,
    name: String,
    order: GraphQLNullable<Int32> = nil
  ) {
    __data = InputDict([
      "clientMutationId": clientMutationId,
      "default": `default`,
      "includeInDownload": includeInDownload,
      "includeInUpdate": includeInUpdate,
      "name": name,
      "order": order
    ])
  }

  public var clientMutationId: GraphQLNullable<String> {
    get { __data["clientMutationId"] }
    set { __data["clientMutationId"] = newValue }
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

  public var name: String {
    get { __data["name"] }
    set { __data["name"] = newValue }
  }

  public var order: GraphQLNullable<Int32> {
    get { __data["order"] }
    set { __data["order"] = newValue }
  }
}
