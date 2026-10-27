// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

nonisolated public struct LibraryJobsInfoFields: API.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    #"fragment LibraryJobsInfoFields on UpdaterJobsInfoType { __typename isRunning totalJobs finishedJobs skippedCategoriesCount skippedMangasCount }"#
  }

  @_spi(Unsafe) public let __data: DataDict
  @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

  @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.UpdaterJobsInfoType }
  @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("isRunning", Bool.self),
    .field("totalJobs", Int.self),
    .field("finishedJobs", Int.self),
    .field("skippedCategoriesCount", Int.self),
    .field("skippedMangasCount", Int.self),
  ] }
  @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
    LibraryJobsInfoFields.self
  ] }

  public var isRunning: Bool { __data["isRunning"] }
  public var totalJobs: Int { __data["totalJobs"] }
  public var finishedJobs: Int { __data["finishedJobs"] }
  public var skippedCategoriesCount: Int { __data["skippedCategoriesCount"] }
  public var skippedMangasCount: Int { __data["skippedMangasCount"] }
}
