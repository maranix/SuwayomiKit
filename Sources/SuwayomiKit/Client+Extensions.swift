import API
import Foundation

extension SuwayomiClient {
    public func extensions(
        isInstalled: Bool? = nil,
        hasUpdate: Bool? = nil,
        lang: String? = nil
    ) async throws(SuwayomiError) -> [Extension] {
        let condition: GraphQLNullable<ExtensionConditionInput> =
            (isInstalled != nil || hasUpdate != nil || lang != nil)
            ? .some(
                ExtensionConditionInput(
                    hasUpdate: hasUpdate.map { .some($0) } ?? .none,
                    isInstalled: isInstalled.map { .some($0) } ?? .none,
                    lang: lang.map { .some($0) } ?? .none
                ))
            : .none
        let data = try await query(GetExtensionsQuery(condition: condition))
        return data.extensions.nodes.map { Extension($0.fragments.extensionFields) }
    }

    public func `extension`(pkgName: String) async throws(SuwayomiError) -> Extension {
        let data = try await query(GetExtensionQuery(pkgName: pkgName))
        return Extension(data.extension.fragments.extensionFields)
    }

    public func installExtension(pkgName: String) async throws(SuwayomiError) -> Extension? {
        let patch = UpdateExtensionPatchInput(install: .some(true))
        let data = try await mutation(UpdateExtensionMutation(input: .init(id: pkgName, patch: patch)))
        return data.updateExtension?.extension.map { Extension($0.fragments.extensionFields) }
    }

    public func updateExtension(pkgName: String) async throws(SuwayomiError) -> Extension? {
        let patch = UpdateExtensionPatchInput(update: .some(true))
        let data = try await mutation(UpdateExtensionMutation(input: .init(id: pkgName, patch: patch)))
        return data.updateExtension?.extension.map { Extension($0.fragments.extensionFields) }
    }

    public func uninstallExtension(pkgName: String) async throws(SuwayomiError) {
        let patch = UpdateExtensionPatchInput(uninstall: .some(true))
        _ = try await mutation(UpdateExtensionMutation(input: .init(id: pkgName, patch: patch)))
    }
}
