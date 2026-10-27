import Foundation

extension SuwayomiClient {
    public func resolveURL(_ pathOrURL: String) -> URL? {
        config.resolveURL(pathOrURL)
    }

    public func thumbnailURL(for manga: some MangaPreview) -> URL? {
        guard let path = manga.thumbnailPath, !path.isEmpty else { return nil }
        return resolveURL(path)
    }

    public func iconURL(for item: some IconPreview) -> URL? {
        guard !item.iconPath.isEmpty else { return nil }
        return resolveURL(item.iconPath)
    }

    public func pageURL(for pagePath: String) -> URL? {
        resolveURL(pagePath)
    }

    public func fetchMedia(from pathOrURL: String) async throws(SuwayomiError) -> Data {
        guard let url = resolveURL(pathOrURL) else {
            throw SuwayomiError.invalidURL(pathOrURL)
        }
        return try await fetchData(from: url)
    }

    public func fetchThumbnail(for manga: some MangaPreview) async throws(SuwayomiError) -> Data? {
        guard let url = thumbnailURL(for: manga) else { return nil }
        return try await fetchData(from: url)
    }

    public func fetchIcon(for item: some IconPreview) async throws(SuwayomiError) -> Data? {
        guard let url = iconURL(for: item) else { return nil }
        return try await fetchData(from: url)
    }

    public func fetchPage(at pagePathOrURL: String) async throws(SuwayomiError) -> Data {
        try await fetchMedia(from: pagePathOrURL)
    }
}
