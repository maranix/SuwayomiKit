// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

nonisolated public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == API.SchemaMetadata {}

nonisolated public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == API.SchemaMetadata {}

nonisolated public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == API.SchemaMetadata {}

nonisolated public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == API.SchemaMetadata {}

nonisolated public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: any ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  private static let objectTypeMap: [String: ApolloAPI.Object] = [
    "AboutServerPayload": API.Objects.AboutServerPayload,
    "CategoryNodeList": API.Objects.CategoryNodeList,
    "CategoryType": API.Objects.CategoryType,
    "ChapterNodeList": API.Objects.ChapterNodeList,
    "ChapterType": API.Objects.ChapterType,
    "ClearCachedImagesPayload": API.Objects.ClearCachedImagesPayload,
    "ClearDownloaderPayload": API.Objects.ClearDownloaderPayload,
    "CreateCategoryPayload": API.Objects.CreateCategoryPayload,
    "DeleteCategoryPayload": API.Objects.DeleteCategoryPayload,
    "DeleteDownloadedChapterPayload": API.Objects.DeleteDownloadedChapterPayload,
    "DequeueChapterDownloadPayload": API.Objects.DequeueChapterDownloadPayload,
    "DownloadNodeList": API.Objects.DownloadNodeList,
    "DownloadStatus": API.Objects.DownloadStatus,
    "DownloadType": API.Objects.DownloadType,
    "EnqueueChapterDownloadPayload": API.Objects.EnqueueChapterDownloadPayload,
    "ExtensionNodeList": API.Objects.ExtensionNodeList,
    "ExtensionStoreNodeList": API.Objects.ExtensionStoreNodeList,
    "ExtensionType": API.Objects.ExtensionType,
    "FetchChapterPagesPayload": API.Objects.FetchChapterPagesPayload,
    "FetchMangaAndChaptersPayload": API.Objects.FetchMangaAndChaptersPayload,
    "FetchSourceMangaPayload": API.Objects.FetchSourceMangaPayload,
    "GlobalMetaNodeList": API.Objects.GlobalMetaNodeList,
    "JvmInfo": API.Objects.JvmInfo,
    "LibraryUpdateStatus": API.Objects.LibraryUpdateStatus,
    "LoginPayload": API.Objects.LoginPayload,
    "MangaNodeList": API.Objects.MangaNodeList,
    "MangaType": API.Objects.MangaType,
    "Mutation": API.Objects.Mutation,
    "OSInfo": API.Objects.OSInfo,
    "PageInfo": API.Objects.PageInfo,
    "PartialSettingsType": API.Objects.PartialSettingsType,
    "PlatformInfo": API.Objects.PlatformInfo,
    "Query": API.Objects.Query,
    "RefreshTokenPayload": API.Objects.RefreshTokenPayload,
    "SettingsType": API.Objects.SettingsType,
    "SourceNodeList": API.Objects.SourceNodeList,
    "SourceType": API.Objects.SourceType,
    "StartDownloaderPayload": API.Objects.StartDownloaderPayload,
    "StopDownloaderPayload": API.Objects.StopDownloaderPayload,
    "TrackRecordNodeList": API.Objects.TrackRecordNodeList,
    "TrackerNodeList": API.Objects.TrackerNodeList,
    "UpdateCategoryOrderPayload": API.Objects.UpdateCategoryOrderPayload,
    "UpdateCategoryPayload": API.Objects.UpdateCategoryPayload,
    "UpdateChapterPayload": API.Objects.UpdateChapterPayload,
    "UpdateExtensionPayload": API.Objects.UpdateExtensionPayload,
    "UpdateLibraryPayload": API.Objects.UpdateLibraryPayload,
    "UpdateMangaCategoriesPayload": API.Objects.UpdateMangaCategoriesPayload,
    "UpdateMangaPayload": API.Objects.UpdateMangaPayload,
    "UpdateStopPayload": API.Objects.UpdateStopPayload,
    "UpdaterJobsInfoType": API.Objects.UpdaterJobsInfoType
  ]

  @_spi(Execution) public static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
    objectTypeMap[typename]
  }
}

nonisolated public enum Objects {}
nonisolated public enum Interfaces {}
nonisolated public enum Unions {}
