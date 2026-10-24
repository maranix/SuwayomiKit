import API
import Foundation

extension SuwayomiClient {
    public func downloadStatus() async throws(SuwayomiError) -> DownloadQueueStatus {
        let data = try await query(GetDownloadStatusQuery())
        let status = data.downloadStatus
        let queue = status.queue.map { item in
            DownloadItem(
                position: item.position,
                progress: item.progress,
                state: DownloadState.from(item.state),
                tries: item.tries,
                chapter: Chapter.from(item.chapter.fragments.chapterFields),
                manga: Manga.from(item.manga.fragments.mangaFields)
            )
        }
        return DownloadQueueStatus(
            state: DownloaderState.from(status.state),
            queue: queue
        )
    }

    public func startDownloader() async throws(SuwayomiError) -> DownloaderState {
        let data = try await mutation(StartDownloaderMutation(input: .init()))
        guard let payload = data.startDownloader else {
            throw SuwayomiError.missingData
        }
        return DownloaderState.from(payload.downloadStatus.state)
    }

    public func stopDownloader() async throws(SuwayomiError) -> DownloaderState {
        let data = try await mutation(StopDownloaderMutation(input: .init()))
        guard let payload = data.stopDownloader else {
            throw SuwayomiError.missingData
        }
        return DownloaderState.from(payload.downloadStatus.state)
    }

    public func clearDownloader() async throws(SuwayomiError) -> DownloaderState {
        let data = try await mutation(ClearDownloaderMutation(input: .init()))
        guard let payload = data.clearDownloader else {
            throw SuwayomiError.missingData
        }
        return DownloaderState.from(payload.downloadStatus.state)
    }

    public func enqueueDownload(chapterId: Int) async throws(SuwayomiError) -> DownloaderState {
        let data = try await mutation(EnqueueChapterDownloadMutation(input: .init(id: Int32(chapterId))))
        guard let payload = data.enqueueChapterDownload else {
            throw SuwayomiError.missingData
        }
        return DownloaderState.from(payload.downloadStatus.state)
    }

    public func dequeueDownload(chapterId: Int) async throws(SuwayomiError) -> DownloaderState {
        let data = try await mutation(DequeueChapterDownloadMutation(input: .init(id: Int32(chapterId))))
        guard let payload = data.dequeueChapterDownload else {
            throw SuwayomiError.missingData
        }
        return DownloaderState.from(payload.downloadStatus.state)
    }

    public func deleteDownloadedChapter(chapterId: Int) async throws(SuwayomiError) -> Chapter {
        let data = try await mutation(DeleteDownloadedChapterMutation(input: .init(id: Int32(chapterId))))
        guard let payload = data.deleteDownloadedChapter else {
            throw SuwayomiError.missingData
        }
        return Chapter.from(payload.chapters.fragments.chapterFields)
    }
}
