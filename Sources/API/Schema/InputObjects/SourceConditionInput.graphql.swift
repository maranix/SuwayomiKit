// @generated
// This file was automatically generated and should not be edited.

@_spi(Internal) @_spi(Unsafe) import ApolloAPI

nonisolated public struct SourceConditionInput: InputObject {
  @_spi(Unsafe) public private(set) var __data: InputDict

  @_spi(Unsafe) public init(_ data: InputDict) {
    __data = data
  }

  public init(
    contentWarning: GraphQLNullable<GraphQLEnum<ContentWarning>> = nil,
    id: GraphQLNullable<LongString> = nil,
    lang: GraphQLNullable<String> = nil,
    name: GraphQLNullable<String> = nil
  ) {
    __data = InputDict([
      "contentWarning": contentWarning,
      "id": id,
      "lang": lang,
      "name": name
    ])
  }

  public var contentWarning: GraphQLNullable<GraphQLEnum<ContentWarning>> {
    get { __data["contentWarning"] }
    set { __data["contentWarning"] = newValue }
  }

  public var id: GraphQLNullable<LongString> {
    get { __data["id"] }
    set { __data["id"] = newValue }
  }

  public var lang: GraphQLNullable<String> {
    get { __data["lang"] }
    set { __data["lang"] = newValue }
  }

  public var name: GraphQLNullable<String> {
    get { __data["name"] }
    set { __data["name"] = newValue }
  }
}
