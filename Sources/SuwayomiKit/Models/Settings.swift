import API
import Foundation

public enum AuthMode: String, Sendable, Hashable, CaseIterable {
    case none
    case basicAuth
    case simpleLogin
    case uiLogin

    init(_ apiValue: API.GraphQLEnum<API.AuthMode>?) {
        guard let value = apiValue?.value else {
            self = .none
            return
        }
        switch value {
        case .none: self = .none
        case .basicAuth: self = .basicAuth
        case .simpleLogin: self = .simpleLogin
        case .uiLogin: self = .uiLogin
        }
    }
}

public struct ServerSettings: Hashable, Sendable {
    public let ip: String
    public let port: Int
    public let authMode: AuthMode
    public let authUsername: String
    public let downloadsPath: String
    public let autoDownloadNewChapters: Bool
    public let maxSourcesInParallel: Int

    public init(
        ip: String,
        port: Int,
        authMode: AuthMode,
        authUsername: String,
        downloadsPath: String,
        autoDownloadNewChapters: Bool,
        maxSourcesInParallel: Int
    ) {
        self.ip = ip
        self.port = port
        self.authMode = authMode
        self.authUsername = authUsername
        self.downloadsPath = downloadsPath
        self.autoDownloadNewChapters = autoDownloadNewChapters
        self.maxSourcesInParallel = maxSourcesInParallel
    }

    init(_ settings: API.GetSettingsQuery.Data.Settings) {
        self.ip = settings.ip
        self.port = settings.port
        self.authMode = AuthMode(settings.authMode)
        self.authUsername = settings.authUsername
        self.downloadsPath = settings.downloadsPath
        self.autoDownloadNewChapters = settings.autoDownloadNewChapters
        self.maxSourcesInParallel = settings.maxSourcesInParallel
    }
}
