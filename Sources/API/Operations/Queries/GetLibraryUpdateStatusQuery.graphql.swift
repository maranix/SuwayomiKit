// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

nonisolated public struct GetLibraryUpdateStatusQuery: GraphQLQuery {
  public static let operationName: String = "GetLibraryUpdateStatus"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetLibraryUpdateStatus { libraryUpdateStatus { __typename jobsInfo { __typename isRunning totalJobs finishedJobs skippedCategoriesCount skippedMangasCount } } }"#
    ))

  public init() {}

  nonisolated public struct Data: API.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.Query }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("libraryUpdateStatus", LibraryUpdateStatus.self),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      GetLibraryUpdateStatusQuery.Data.self
    ] }

    public var libraryUpdateStatus: LibraryUpdateStatus { __data["libraryUpdateStatus"] }

    /// LibraryUpdateStatus
    ///
    /// Parent Type: `LibraryUpdateStatus`
    nonisolated public struct LibraryUpdateStatus: API.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.LibraryUpdateStatus }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("jobsInfo", JobsInfo.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        GetLibraryUpdateStatusQuery.Data.LibraryUpdateStatus.self
      ] }

      public var jobsInfo: JobsInfo { __data["jobsInfo"] }

      /// LibraryUpdateStatus.JobsInfo
      ///
      /// Parent Type: `UpdaterJobsInfoType`
      nonisolated public struct JobsInfo: API.SelectionSet {
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
          GetLibraryUpdateStatusQuery.Data.LibraryUpdateStatus.JobsInfo.self
        ] }

        public var isRunning: Bool { __data["isRunning"] }
        public var totalJobs: Int { __data["totalJobs"] }
        public var finishedJobs: Int { __data["finishedJobs"] }
        public var skippedCategoriesCount: Int { __data["skippedCategoriesCount"] }
        public var skippedMangasCount: Int { __data["skippedMangasCount"] }
      }
    }
  }
}
