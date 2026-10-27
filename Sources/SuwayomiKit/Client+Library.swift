import API
import Foundation

extension SuwayomiClient {
    public func library(
        categoryIDs: [Int]? = nil,
        sourceID: String? = nil,
        first: Int? = nil,
        offset: Int? = nil,
        inLibrary: Bool = true
    ) async throws(SuwayomiError) -> PagedResult<MangaSummary> {
        let catIDs = try graphQLIDs(categoryIDs)
        let condition = MangaConditionInput(
            categoryIds: catIDs.map { .some($0) } ?? .none,
            inLibrary: .some(inLibrary),
            sourceId: sourceID.map { .some($0) } ?? .none
        )
        let data = try await query(
            GetLibraryMangasQuery(
                condition: .some(condition),
                first: try graphQLID(first),
                offset: try graphQLID(offset)
            )
        )
        let mangas = data.mangas.nodes.map { MangaSummary($0.fragments.mangaSummaryFields) }
        let pageInfo = PageInfo(data.mangas.pageInfo.fragments.pageInfoFields)
        return PagedResult(items: mangas, pageInfo: pageInfo, totalCount: data.mangas.totalCount)
    }

    public func categories() async throws(SuwayomiError) -> [Category] {
        let data = try await query(GetCategoriesQuery())
        return data.categories.nodes.map { Category($0.fragments.categoryFields) }
    }

    public func category(id: Int) async throws(SuwayomiError) -> Category {
        let data = try await query(GetCategoryQuery(id: try graphQLID(id)))
        return Category(data.category.fragments.categoryFields)
    }

    public func createCategory(
        name: String,
        default isDefault: Bool? = nil,
        includeInDownload: CategoryIncludeOrExclude? = nil,
        includeInUpdate: CategoryIncludeOrExclude? = nil,
        order: Int? = nil
    ) async throws(SuwayomiError) -> Category {
        let input = CreateCategoryInput(
            default: isDefault.map { .some($0) } ?? .none,
            includeInDownload: includeInDownload.map { .some(GraphQLEnum($0.toAPI())) } ?? .none,
            includeInUpdate: includeInUpdate.map { .some(GraphQLEnum($0.toAPI())) } ?? .none,
            name: name,
            order: try graphQLID(order)
        )
        let data = try await mutation(
            CreateCategoryMutation(input: input)
        )
        guard let payload = data.createCategory else {
            throw SuwayomiError.missingData
        }
        return Category(payload.category.fragments.categoryFields)
    }

    public func updateCategory(
        id: Int,
        name: String? = nil,
        default isDefault: Bool? = nil,
        includeInDownload: CategoryIncludeOrExclude? = nil,
        includeInUpdate: CategoryIncludeOrExclude? = nil
    ) async throws(SuwayomiError) -> Category {
        let patch = UpdateCategoryPatchInput(
            default: isDefault.map { .some($0) } ?? .none,
            includeInDownload: includeInDownload.map { .some(GraphQLEnum($0.toAPI())) } ?? .none,
            includeInUpdate: includeInUpdate.map { .some(GraphQLEnum($0.toAPI())) } ?? .none,
            name: name.map { .some($0) } ?? .none
        )
        let data = try await mutation(
            UpdateCategoryMutation(input: .init(id: try graphQLID(id), patch: patch))
        )
        guard let payload = data.updateCategory else {
            throw SuwayomiError.missingData
        }
        return Category(payload.category.fragments.categoryFields)
    }

    public func deleteCategory(id: Int) async throws(SuwayomiError) {
        _ = try await mutation(DeleteCategoryMutation(input: .init(categoryId: try graphQLID(id))))
    }

    public func updateCategoryOrder(id: Int, position: Int) async throws(SuwayomiError) -> [Category] {
        let data = try await mutation(
            UpdateCategoryOrderMutation(input: .init(id: try graphQLID(id), position: try graphQLID(position)))
        )
        guard let payload = data.updateCategoryOrder else {
            throw SuwayomiError.missingData
        }
        return payload.categories.map { Category($0.fragments.categoryFields) }
    }

    public func updateLibrary(categories: [Int]? = nil) async throws(SuwayomiError) -> LibraryJobsInfo {
        let catIDs = try graphQLIDs(categories)
        let data = try await mutation(
            UpdateLibraryMutation(
                input: .init(categories: catIDs.map { .some($0) } ?? .none)
            )
        )
        guard let payload = data.updateLibrary else {
            throw SuwayomiError.missingData
        }
        let jobs = payload.updateStatus.jobsInfo
        return LibraryJobsInfo(jobs.fragments.libraryJobsInfoFields)
    }

    public func libraryUpdateStatus() async throws(SuwayomiError) -> LibraryJobsInfo {
        let data = try await query(GetLibraryUpdateStatusQuery())
        let jobs = data.libraryUpdateStatus.jobsInfo
        return LibraryJobsInfo(jobs.fragments.libraryJobsInfoFields)
    }

    public func stopLibraryUpdate() async throws(SuwayomiError) {
        _ = try await mutation(UpdateStopMutation(input: .init()))
    }
}
