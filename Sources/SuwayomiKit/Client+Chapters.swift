import API
import Foundation

extension SuwayomiClient {
    public func chapters(
        mangaId: Int,
        isRead: Bool? = nil,
        isBookmarked: Bool? = nil,
        first: Int? = nil,
        offset: Int? = nil
    ) async throws(SuwayomiError) -> PagedResult<Chapter> {
        let condition = ChapterConditionInput(
            isBookmarked: isBookmarked.map { .some($0) } ?? .none,
            isRead: isRead.map { .some($0) } ?? .none,
            mangaId: .some(Int32(mangaId))
        )
        let data = try await query(
            GetChaptersQuery(
                condition: .some(condition),
                order: .none,
                first: first.map { .some(Int32($0)) } ?? .none,
                offset: offset.map { .some(Int32($0)) } ?? .none
            )
        )
        let chapters = data.chapters.nodes.map { Chapter.from($0.fragments.chapterFields) }
        let pageInfo = PageInfo(
            hasNextPage: data.chapters.pageInfo.fragments.pageInfoFields.hasNextPage,
            hasPreviousPage: data.chapters.pageInfo.fragments.pageInfoFields.hasPreviousPage,
            startCursor: data.chapters.pageInfo.fragments.pageInfoFields.startCursor,
            endCursor: data.chapters.pageInfo.fragments.pageInfoFields.endCursor
        )
        return PagedResult(items: chapters, pageInfo: pageInfo, totalCount: data.chapters.totalCount)
    }

    public func chapter(id: Int) async throws(SuwayomiError) -> Chapter {
        let data = try await query(GetChapterQuery(id: Int32(id)))
        return Chapter.from(data.chapter.fragments.chapterFields)
    }

    public func updateChapter(
        id: Int,
        isRead: Bool? = nil,
        isBookmarked: Bool? = nil,
        lastPageRead: Int? = nil
    ) async throws(SuwayomiError) -> Chapter {
        let patch = UpdateChapterPatchInput(
            isBookmarked: isBookmarked.map { .some($0) } ?? .none,
            isRead: isRead.map { .some($0) } ?? .none,
            lastPageRead: lastPageRead.map { .some(Int32($0)) } ?? .none
        )
        let data = try await mutation(
            UpdateChapterMutation(input: .init(id: Int32(id), patch: patch))
        )
        guard let payload = data.updateChapter else {
            throw SuwayomiError.missingData
        }
        return Chapter.from(payload.chapter.fragments.chapterFields)
    }

    public func fetchChapterPages(chapterId: Int) async throws(SuwayomiError) -> [String] {
        let data = try await mutation(
            FetchChapterPagesMutation(input: .init(chapterId: Int32(chapterId)))
        )
        guard let payload = data.fetchChapterPages else {
            throw SuwayomiError.missingData
        }
        return payload.pages
    }
}
