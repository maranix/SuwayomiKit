import API
import Foundation

public struct Extension: Sendable, Equatable, Identifiable, Codable {
    public var id: String { pkgName }
    public let pkgName: String
    public let name: String
    public let versionName: String
    public let versionCode: String
    public let lang: String
    public let isInstalled: Bool
    public let hasUpdate: Bool
    public let isObsolete: Bool
    public let iconUrl: String
    public let contentWarning: ContentWarning

    public init(
        pkgName: String,
        name: String,
        versionName: String,
        versionCode: String,
        lang: String,
        isInstalled: Bool,
        hasUpdate: Bool,
        isObsolete: Bool,
        iconUrl: String,
        contentWarning: ContentWarning
    ) {
        self.pkgName = pkgName
        self.name = name
        self.versionName = versionName
        self.versionCode = versionCode
        self.lang = lang
        self.isInstalled = isInstalled
        self.hasUpdate = hasUpdate
        self.isObsolete = isObsolete
        self.iconUrl = iconUrl
        self.contentWarning = contentWarning
    }
}

extension Extension {
    static func from(_ fragment: API.ExtensionFields) -> Extension {
        Extension(
            pkgName: fragment.pkgName,
            name: fragment.name,
            versionName: fragment.versionName,
            versionCode: fragment.versionCodeLong,
            lang: fragment.lang,
            isInstalled: fragment.isInstalled,
            hasUpdate: fragment.hasUpdate,
            isObsolete: fragment.isObsolete,
            iconUrl: fragment.iconUrl,
            contentWarning: ContentWarning.from(fragment.contentWarning)
        )
    }
}
