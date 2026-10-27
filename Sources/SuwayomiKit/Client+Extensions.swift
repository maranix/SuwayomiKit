import API
import Foundation

extension SuwayomiClient {
    public func extensions(
        isInstalled: Bool? = nil,
        hasUpdate: Bool? = nil,
        lang: String? = nil,
        first: Int? = nil,
        offset: Int? = nil
    ) async throws(SuwayomiError) -> PagedResult<Extension> {
        let condition: GraphQLNullable<ExtensionConditionInput> =
            (isInstalled != nil || hasUpdate != nil || lang != nil)
            ? .some(
                ExtensionConditionInput(
                    hasUpdate: hasUpdate.map { .some($0) } ?? .none,
                    isInstalled: isInstalled.map { .some($0) } ?? .none,
                    lang: lang.map { .some($0) } ?? .none
                ))
            : .none
        let data = try await query(
            GetExtensionsQuery(
                condition: condition,
                first: try graphQLID(first),
                offset: try graphQLID(offset)
            )
        )
        let extensions = data.extensions.nodes.map { Extension($0.fragments.extensionFields) }
        let pageInfo = PageInfo(data.extensions.pageInfo.fragments.pageInfoFields)
        return PagedResult(items: extensions, pageInfo: pageInfo, totalCount: data.extensions.totalCount)
    }

    public func extensionDetails(packageName: String) async throws(SuwayomiError) -> Extension {
        let data = try await query(GetExtensionQuery(pkgName: packageName))
        return Extension(data.extension.fragments.extensionFields)
    }

    public func installExtension(packageName: String) async throws(SuwayomiError) -> Extension {
        let patch = UpdateExtensionPatchInput(install: .some(true))
        let data = try await mutation(UpdateExtensionMutation(input: .init(id: packageName, patch: patch)))
        guard let updated = data.updateExtension?.extension else {
            throw SuwayomiError.missingData
        }
        return Extension(updated.fragments.extensionFields)
    }

    public func updateExtension(packageName: String) async throws(SuwayomiError) -> Extension {
        let patch = UpdateExtensionPatchInput(update: .some(true))
        let data = try await mutation(UpdateExtensionMutation(input: .init(id: packageName, patch: patch)))
        guard let updated = data.updateExtension?.extension else {
            throw SuwayomiError.missingData
        }
        return Extension(updated.fragments.extensionFields)
    }

    public func uninstallExtension(packageName: String) async throws(SuwayomiError) {
        let patch = UpdateExtensionPatchInput(uninstall: .some(true))
        _ = try await mutation(UpdateExtensionMutation(input: .init(id: packageName, patch: patch)))
    }
}
