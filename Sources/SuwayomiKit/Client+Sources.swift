import API
import Foundation

public enum SourceMangaType: String, Sendable, Equatable, Codable {
    case popular
    case latest
    case search

    func toAPI() -> API.FetchSourceMangaType {
        switch self {
        case .popular: return .popular
        case .latest: return .latest
        case .search: return .search
        }
    }
}

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
                first: first.map { .some(Int32($0)) } ?? .none,
                offset: offset.map { .some(Int32($0)) } ?? .none
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
    ) async throws(SuwayomiError) -> (mangas: [MangaSummary], hasNextPage: Bool) {
        let input = FetchSourceMangaInput(
            page: Int32(page),
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
        return (mangas: mangas, hasNextPage: payload.hasNextPage)
    }
}
