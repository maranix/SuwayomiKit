import Foundation

extension SuwayomiClient {
    public func thumbnailURL(for manga: some MangaPreview) -> URL? {
        guard let thumbnailPath = manga.thumbnailPath, !thumbnailPath.isEmpty else {
            return nil
        }
        return resolveURL(thumbnailPath)
    }

    public func pageURL(for pagePathOrURL: String) -> URL {
        resolveURL(pagePathOrURL)
    }

    public func fetchMedia(from pathOrURL: String) async throws(SuwayomiError) -> Data {
        let url = resolveURL(pathOrURL)
        return try await fetchData(from: url)
    }

    public func fetchThumbnail(for manga: some MangaPreview) async throws(SuwayomiError) -> Data? {
        guard let url = thumbnailURL(for: manga) else {
            return nil
        }
        return try await fetchData(from: url)
    }

    public func fetchThumbnail(from pathOrURL: String) async throws(SuwayomiError) -> Data {
        try await fetchMedia(from: pathOrURL)
    }

    public func fetchPageImageData(pagePathOrURL: String) async throws(SuwayomiError) -> Data {
        try await fetchMedia(from: pagePathOrURL)
    }

    public func fetchPageImageData(pageURL: URL) async throws(SuwayomiError) -> Data {
        try await fetchData(from: pageURL)
    }

    public func fetchIcon(for source: some SourcePreview) async throws(SuwayomiError) -> Data? {
        guard !source.iconPath.isEmpty else { return nil }
        return try await fetchMedia(from: source.iconPath)
    }

    public func fetchIcon(for ext: Extension) async throws(SuwayomiError) -> Data? {
        guard !ext.iconPath.isEmpty else { return nil }
        return try await fetchMedia(from: ext.iconPath)
    }
}
