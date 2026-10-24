import Foundation

extension SuwayomiClient {
    public func fetchThumbnail(for manga: Manga) async throws(SuwayomiError) -> Data? {
        guard let thumbnailUrl = manga.thumbnailUrl, !thumbnailUrl.isEmpty else {
            return nil
        }
        let url = resolveURL(thumbnailUrl)
        return try await fetchData(from: url)
    }

    public func fetchPageImageData(pagePathOrURL: String) async throws(SuwayomiError) -> Data {
        let url = resolveURL(pagePathOrURL)
        return try await fetchData(from: url)
    }

    public func fetchPageImageData(pageURL: URL) async throws(SuwayomiError) -> Data {
        return try await fetchData(from: pageURL)
    }
}
