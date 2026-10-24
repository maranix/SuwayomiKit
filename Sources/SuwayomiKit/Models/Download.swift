import API
import Foundation

public enum DownloaderState: String, Sendable, Equatable, Codable {
    case started
    case stopped
}

public enum DownloadState: String, Sendable, Equatable, Codable {
    case queued
    case downloading
    case finished
    case error
}

public struct DownloadItem: Sendable, Equatable, Identifiable, Codable {
    public var id: Int { chapter.id }
    public let position: Int
    public let progress: Double
    public let state: DownloadState
    public let tries: Int
    public let chapter: Chapter
    public let manga: Manga

    public init(
        position: Int,
        progress: Double,
        state: DownloadState,
        tries: Int,
        chapter: Chapter,
        manga: Manga
    ) {
        self.position = position
        self.progress = progress
        self.state = state
        self.tries = tries
        self.chapter = chapter
        self.manga = manga
    }
}

public struct DownloadQueueStatus: Sendable, Equatable, Codable {
    public let state: DownloaderState
    public let queue: [DownloadItem]

    public init(state: DownloaderState, queue: [DownloadItem]) {
        self.state = state
        self.queue = queue
    }
}

extension DownloaderState {
    static func from(_ apiValue: API.GraphQLEnum<API.DownloaderState>?) -> DownloaderState {
        switch apiValue?.value {
        case .started: return .started
        case .stopped, .none: return .stopped
        }
    }
}

extension DownloadState {
    static func from(_ apiValue: API.GraphQLEnum<API.DownloadState>?) -> DownloadState {
        switch apiValue?.value {
        case .queued: return .queued
        case .downloading: return .downloading
        case .finished: return .finished
        case .error, .none: return .error
        }
    }
}
