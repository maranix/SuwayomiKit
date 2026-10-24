import API
import Foundation

extension SuwayomiClient {
    public func manga(id: Int) async throws(SuwayomiError) -> Manga {
        let data = try await query(GetMangaQuery(id: Int32(id)))
        let cats = data.manga.categories.nodes.map { Category.from($0.fragments.categoryFields) }
        return Manga.from(data.manga.fragments.mangaFields, categories: cats)
    }

    public func fetchMangaAndChapters(
        id: Int,
        fetchManga: Bool = true,
        fetchChapters: Bool = true
    ) async throws(SuwayomiError) -> (manga: Manga, chapters: [Chapter]) {
        let data = try await mutation(
            FetchMangaAndChaptersMutation(
                input: .init(fetchChapters: fetchChapters, fetchManga: fetchManga, id: Int32(id))
            )
        )
        guard let payload = data.fetchMangaAndChapters else {
            throw SuwayomiError.missingData
        }
        let manga = Manga.from(payload.manga.fragments.mangaFields)
        let chapters = payload.chapters.map { Chapter.from($0.fragments.chapterFields) }
        return (manga: manga, chapters: chapters)
    }

    public func setMangaInLibrary(id: Int, inLibrary: Bool) async throws(SuwayomiError) -> Manga {
        let data = try await mutation(
            UpdateMangaMutation(
                input: .init(id: Int32(id), patch: .init(inLibrary: .some(inLibrary)))
            )
        )
        guard let payload = data.updateManga else {
            throw SuwayomiError.missingData
        }
        return Manga.from(payload.manga.fragments.mangaFields)
    }

    public func updateMangaCategories(
        id: Int,
        addTo: [Int]? = nil,
        removeFrom: [Int]? = nil,
        clearCategories: Bool? = nil
    ) async throws(SuwayomiError) -> Manga {
        let patch = UpdateMangaCategoriesPatchInput(
            addToCategories: addTo.map { .some($0.map { Int32($0) }) } ?? .none,
            clearCategories: clearCategories.map { .some($0) } ?? .none,
            removeFromCategories: removeFrom.map { .some($0.map { Int32($0) }) } ?? .none
        )
        let data = try await mutation(
            UpdateMangaCategoriesMutation(
                input: .init(id: Int32(id), patch: patch)
            )
        )
        guard let payload = data.updateMangaCategories else {
            throw SuwayomiError.missingData
        }
        return Manga.from(payload.manga.fragments.mangaFields)
    }
}
