// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

nonisolated public struct UpdateLibraryMutation: GraphQLMutation {
  public static let operationName: String = "UpdateLibrary"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation UpdateLibrary($input: UpdateLibraryInput!) { updateLibrary(input: $input) { __typename updateStatus { __typename jobsInfo { __typename ...LibraryJobsInfoFields } } } }"#,
      fragments: [LibraryJobsInfoFields.self]
    ))

  public var input: UpdateLibraryInput

  public init(input: UpdateLibraryInput) {
    self.input = input
  }

  @_spi(Unsafe) public var __variables: Variables? { ["input": input] }

  nonisolated public struct Data: API.SelectionSet {
    @_spi(Unsafe) public let __data: DataDict
    @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

    @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.Mutation }
    @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
      .field("updateLibrary", UpdateLibrary?.self, arguments: ["input": .variable("input")]),
    ] }
    @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
      UpdateLibraryMutation.Data.self
    ] }

    public var updateLibrary: UpdateLibrary? { __data["updateLibrary"] }

    /// UpdateLibrary
    ///
    /// Parent Type: `UpdateLibraryPayload`
    nonisolated public struct UpdateLibrary: API.SelectionSet {
      @_spi(Unsafe) public let __data: DataDict
      @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

      @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.UpdateLibraryPayload }
      @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("updateStatus", UpdateStatus.self),
      ] }
      @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        UpdateLibraryMutation.Data.UpdateLibrary.self
      ] }

      public var updateStatus: UpdateStatus { __data["updateStatus"] }

      /// UpdateLibrary.UpdateStatus
      ///
      /// Parent Type: `LibraryUpdateStatus`
      nonisolated public struct UpdateStatus: API.SelectionSet {
        @_spi(Unsafe) public let __data: DataDict
        @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

        @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.LibraryUpdateStatus }
        @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("jobsInfo", JobsInfo.self),
        ] }
        @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          UpdateLibraryMutation.Data.UpdateLibrary.UpdateStatus.self
        ] }

        public var jobsInfo: JobsInfo { __data["jobsInfo"] }

        /// UpdateLibrary.UpdateStatus.JobsInfo
        ///
        /// Parent Type: `UpdaterJobsInfoType`
        nonisolated public struct JobsInfo: API.SelectionSet {
          @_spi(Unsafe) public let __data: DataDict
          @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

          @_spi(Execution) public static var __parentType: any ApolloAPI.ParentType { API.Objects.UpdaterJobsInfoType }
          @_spi(Execution) public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .fragment(LibraryJobsInfoFields.self),
          ] }
          @_spi(Execution) public static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            UpdateLibraryMutation.Data.UpdateLibrary.UpdateStatus.JobsInfo.self,
            LibraryJobsInfoFields.self
          ] }

          public var isRunning: Bool { __data["isRunning"] }
          public var totalJobs: Int { __data["totalJobs"] }
          public var finishedJobs: Int { __data["finishedJobs"] }
          public var skippedCategoriesCount: Int { __data["skippedCategoriesCount"] }
          public var skippedMangasCount: Int { __data["skippedMangasCount"] }

          public struct Fragments: FragmentContainer {
            @_spi(Unsafe) public let __data: DataDict
            @_spi(Unsafe) public init(_dataDict: DataDict) { __data = _dataDict }

            public var libraryJobsInfoFields: LibraryJobsInfoFields { _toFragment() }
          }
        }
      }
    }
  }
}
