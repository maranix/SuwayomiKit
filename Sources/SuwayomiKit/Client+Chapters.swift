import API
import Foundation

extension SuwayomiClient {
    public func chapters(
        mangaId: Int,
        isRead: Bool? = nil,
        isBookmarked: Bool? = nil,
        order: [ChapterOrder]? = nil,
        first: Int? = nil,
        offset: Int? = nil
    ) async throws(SuwayomiError) -> PagedResult<Chapter> {
        let condition = ChapterConditionInput(
            isBookmarked: isBookmarked.map { .some($0) } ?? .none,
            isRead: isRead.map { .some($0) } ?? .none,
            mangaId: .some(try graphQLID(mangaId))
        )
        let orderInput: GraphQLNullable<[ChapterOrderInput]> = {
            guard let order, !order.isEmpty else { return .none }
            return .some(
                order.map {
                    ChapterOrderInput(
                        by: GraphQLEnum($0.by.toAPI()),
                        byType: .some(GraphQLEnum($0.direction.toAPI()))
                    )
                }
            )
        }()
        let data = try await query(
            GetChaptersQuery(
                condition: .some(condition),
                order: orderInput,
                first: try graphQLID(first),
                offset: try graphQLID(offset)
            )
        )
        let chapters = data.chapters.nodes.map { Chapter($0.fragments.chapterFields) }
        let pageInfo = PageInfo(data.chapters.pageInfo.fragments.pageInfoFields)
        return PagedResult(items: chapters, pageInfo: pageInfo, totalCount: data.chapters.totalCount)
    }

    public func chapter(id: Int) async throws(SuwayomiError) -> Chapter {
        let data = try await query(GetChapterQuery(id: try graphQLID(id)))
        return Chapter(data.chapter.fragments.chapterFields)
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
            lastPageRead: try graphQLID(lastPageRead)
        )
        let data = try await mutation(
            UpdateChapterMutation(input: .init(id: try graphQLID(id), patch: patch))
        )
        guard let payload = data.updateChapter else {
            throw SuwayomiError.missingData
        }
        return Chapter(payload.chapter.fragments.chapterFields)
    }

    public func fetchChapterPages(chapterId: Int) async throws(SuwayomiError) -> [String] {
        let data = try await mutation(
            FetchChapterPagesMutation(input: .init(chapterId: try graphQLID(chapterId)))
        )
        guard let payload = data.fetchChapterPages else {
            throw SuwayomiError.missingData
        }
        return payload.pages
    }
}
