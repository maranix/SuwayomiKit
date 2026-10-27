import API
import Foundation

extension SuwayomiClient {
    public func manga(id: Int) async throws(SuwayomiError) -> Manga {
        let data = try await query(GetMangaQuery(id: try graphQLID(id)))
        let cats = data.manga.categories.nodes.map { Category($0.fragments.categoryFields) }
        return Manga(data.manga.fragments.mangaFields, categories: cats)
    }

    public func fetchMangaAndChapters(
        id: Int,
        fetchManga: Bool = true,
        fetchChapters: Bool = true
    ) async throws(SuwayomiError) -> MangaWithChapters {
        let data = try await mutation(
            FetchMangaAndChaptersMutation(
                input: .init(fetchChapters: fetchChapters, fetchManga: fetchManga, id: try graphQLID(id))
            )
        )
        guard let payload = data.fetchMangaAndChapters else {
            throw SuwayomiError.missingData
        }
        let manga = Manga(payload.manga.fragments.mangaFields)
        let chapters = payload.chapters.map { Chapter($0.fragments.chapterFields) }
        return MangaWithChapters(manga: manga, chapters: chapters)
    }

    public func setMangaInLibrary(id: Int, inLibrary: Bool) async throws(SuwayomiError) -> Manga {
        let data = try await mutation(
            UpdateMangaMutation(
                input: .init(id: try graphQLID(id), patch: .init(inLibrary: .some(inLibrary)))
            )
        )
        guard let payload = data.updateManga else {
            throw SuwayomiError.missingData
        }
        return Manga(payload.manga.fragments.mangaFields)
    }

    public func updateMangaCategories(
        id: Int,
        addTo: [Int]? = nil,
        removeFrom: [Int]? = nil,
        clearCategories: Bool? = nil
    ) async throws(SuwayomiError) -> Manga {
        let addIDs = try graphQLIDs(addTo)
        let removeIDs = try graphQLIDs(removeFrom)
        let patch = UpdateMangaCategoriesPatchInput(
            addToCategories: addIDs.map { .some($0) } ?? .none,
            clearCategories: clearCategories.map { .some($0) } ?? .none,
            removeFromCategories: removeIDs.map { .some($0) } ?? .none
        )
        let data = try await mutation(
            UpdateMangaCategoriesMutation(
                input: .init(id: try graphQLID(id), patch: patch)
            )
        )
        guard let payload = data.updateMangaCategories else {
            throw SuwayomiError.missingData
        }
        return Manga(payload.manga.fragments.mangaFields)
    }
}
