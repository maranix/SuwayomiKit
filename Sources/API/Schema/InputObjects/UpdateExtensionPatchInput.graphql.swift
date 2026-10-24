// @generated
// This file was automatically generated and should not be edited.

@_spi(Internal) @_spi(Unsafe) import ApolloAPI

nonisolated public struct UpdateExtensionPatchInput: InputObject {
  @_spi(Unsafe) public private(set) var __data: InputDict

  @_spi(Unsafe) public init(_ data: InputDict) {
    __data = data
  }

  public init(
    install: GraphQLNullable<Bool> = nil,
    uninstall: GraphQLNullable<Bool> = nil,
    update: GraphQLNullable<Bool> = nil
  ) {
    __data = InputDict([
      "install": install,
      "uninstall": uninstall,
      "update": update
    ])
  }

  public var install: GraphQLNullable<Bool> {
    get { __data["install"] }
    set { __data["install"] = newValue }
  }

  public var uninstall: GraphQLNullable<Bool> {
    get { __data["uninstall"] }
    set { __data["uninstall"] = newValue }
  }

  public var update: GraphQLNullable<Bool> {
    get { __data["update"] }
    set { __data["update"] = newValue }
  }
}
