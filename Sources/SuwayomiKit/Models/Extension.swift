import API
import Foundation

public struct Extension: Identifiable, Hashable, Sendable {
    public var id: String { pkgName }
    public let pkgName: String
    public let name: String
    public let versionName: String
    public let versionCode: String
    public let lang: String
    public let isInstalled: Bool
    public let hasUpdate: Bool
    public let isObsolete: Bool
    public let iconPath: String
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
        iconPath: String,
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
        self.iconPath = iconPath
        self.contentWarning = contentWarning
    }

    init(_ fragment: API.ExtensionFields) {
        self.pkgName = fragment.pkgName
        self.name = fragment.name
        self.versionName = fragment.versionName
        self.versionCode = fragment.versionCodeLong
        self.lang = fragment.lang
        self.isInstalled = fragment.isInstalled
        self.hasUpdate = fragment.hasUpdate
        self.isObsolete = fragment.isObsolete
        self.iconPath = fragment.iconUrl
        self.contentWarning = ContentWarning(fragment.contentWarning)
    }
}
