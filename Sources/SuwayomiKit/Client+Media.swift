import Foundation

extension SuwayomiClient {
    public func thumbnailURL(for manga: Manga) -> URL? {
        guard let thumbnailURL = manga.thumbnailURL, !thumbnailURL.isEmpty else {
            return nil
        }
        return resolveURL(thumbnailURL)
    }

    public func thumbnailURL(for manga: MangaSummary) -> URL? {
        guard let thumbnailURL = manga.thumbnailURL, !thumbnailURL.isEmpty else {
            return nil
        }
        return resolveURL(thumbnailURL)
    }

    public func pageURL(for pagePathOrURL: String) -> URL {
        resolveURL(pagePathOrURL)
    }

    public func fetchMedia(from pathOrURL: String) async throws(SuwayomiError) -> Data {
        let url = resolveURL(pathOrURL)
        return try await fetchData(from: url)
    }

    public func fetchThumbnail(for manga: Manga) async throws(SuwayomiError) -> Data? {
        guard let url = thumbnailURL(for: manga) else {
            return nil
        }
        return try await fetchData(from: url)
    }

    public func fetchThumbnail(for manga: MangaSummary) async throws(SuwayomiError) -> Data? {
        guard let url = thumbnailURL(for: manga) else {
            return nil
        }
        return try await fetchData(from: url)
    }

    public func fetchThumbnail(thumbnailUrl: String) async throws(SuwayomiError) -> Data {
        try await fetchMedia(from: thumbnailUrl)
    }

    public func fetchPageImageData(pagePathOrURL: String) async throws(SuwayomiError) -> Data {
        try await fetchMedia(from: pagePathOrURL)
    }

    public func fetchPageImageData(pageURL: URL) async throws(SuwayomiError) -> Data {
        try await fetchData(from: pageURL)
    }

    public func fetchIcon(for source: Source) async throws(SuwayomiError) -> Data? {
        guard !source.iconURL.isEmpty else { return nil }
        return try await fetchMedia(from: source.iconURL)
    }

    public func fetchIcon(for source: SourceSummary) async throws(SuwayomiError) -> Data? {
        guard !source.iconURL.isEmpty else { return nil }
        return try await fetchMedia(from: source.iconURL)
    }

    public func fetchIcon(for ext: Extension) async throws(SuwayomiError) -> Data? {
        guard !ext.iconURL.isEmpty else { return nil }
        return try await fetchMedia(from: ext.iconURL)
    }
}
