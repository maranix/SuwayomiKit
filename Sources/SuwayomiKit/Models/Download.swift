import API
import Foundation

public enum DownloaderState: String, Sendable, Hashable, CaseIterable {
    case started
    case stopped

    init(_ apiValue: API.GraphQLEnum<API.DownloaderState>?) {
        switch apiValue?.value {
        case .started: self = .started
        case .stopped, .none: self = .stopped
        }
    }
}

public enum DownloadState: String, Sendable, Hashable, CaseIterable {
    case queued
    case downloading
    case finished
    case error

    init(_ apiValue: API.GraphQLEnum<API.DownloadState>?) {
        switch apiValue?.value {
        case .queued: self = .queued
        case .downloading: self = .downloading
        case .finished: self = .finished
        case .error, .none: self = .error
        }
    }
}

public struct DownloadItem: Identifiable, Hashable, Sendable {
    public var id: Int { chapter.id }
    public let position: Int
    public let progress: Double
    public let state: DownloadState
    public let tries: Int
    public let chapter: Chapter
    public let manga: MangaSummary

    public init(
        position: Int,
        progress: Double,
        state: DownloadState,
        tries: Int,
        chapter: Chapter,
        manga: MangaSummary
    ) {
        self.position = position
        self.progress = progress
        self.state = state
        self.tries = tries
        self.chapter = chapter
        self.manga = manga
    }
}

public struct DownloadQueueStatus: Hashable, Sendable {
    public let state: DownloaderState
    public let queue: [DownloadItem]

    public init(state: DownloaderState, queue: [DownloadItem]) {
        self.state = state
        self.queue = queue
    }
}
