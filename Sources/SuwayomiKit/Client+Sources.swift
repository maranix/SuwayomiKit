import API
import Foundation

extension SuwayomiClient {
    public func sources(
        lang: String? = nil,
        name: String? = nil,
        contentWarning: ContentWarning? = nil,
        first: Int? = nil,
        offset: Int? = nil
    ) async throws(SuwayomiError) -> PagedResult<SourceSummary> {
        let condition = Self.sourceCondition(
            lang: lang,
            name: name,
            contentWarning: contentWarning
        )
        let data = try await query(
            GetSourcesQuery(
                condition: condition,
                first: try graphQLID(first),
                offset: try graphQLID(offset)
            )
        )
        let sources = data.sources.nodes.map { SourceSummary($0.fragments.sourceSummaryFields) }
        let pageInfo = PageInfo(data.sources.pageInfo.fragments.pageInfoFields)
        return PagedResult(items: sources, pageInfo: pageInfo, totalCount: data.sources.totalCount)
    }

    static func sourceCondition(
        lang: String?,
        name: String?,
        contentWarning: ContentWarning?
    ) -> GraphQLNullable<SourceConditionInput> {
        guard lang != nil || name != nil || contentWarning != nil else {
            return .none
        }
        return .some(
            SourceConditionInput(
                contentWarning: contentWarning.map { .some(GraphQLEnum($0.toAPI())) } ?? .none,
                lang: lang.map { .some($0) } ?? .none,
                name: name.map { .some($0) } ?? .none
            )
        )
    }

    public func source(id: String) async throws(SuwayomiError) -> Source {
        let data = try await query(GetSourceQuery(id: id))
        return Source(data.source.fragments.sourceFields)
    }

    public func fetchSourceManga(
        sourceId: String,
        type: SourceMangaType = .popular,
        page: Int = 1,
        query searchQuery: String? = nil
    ) async throws(SuwayomiError) -> SourceMangaPage {
        let input = FetchSourceMangaInput(
            page: try graphQLID(page),
            query: searchQuery.map { .some($0) } ?? .none,
            source: sourceId,
            type: GraphQLEnum(type.toAPI())
        )
        let data = try await mutation(
            FetchSourceMangaMutation(input: input)
        )
        guard let payload = data.fetchSourceManga else {
            throw SuwayomiError.missingData
        }
        let mangas = payload.mangas.map { MangaSummary($0.fragments.mangaSummaryFields) }
        return SourceMangaPage(mangas: mangas, hasNextPage: payload.hasNextPage)
    }
}
