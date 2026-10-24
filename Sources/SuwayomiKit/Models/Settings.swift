import API
import Foundation

public enum AuthMode: String, Sendable, Equatable, Codable {
    case none
    case basicAuth
    case simpleLogin
    case uiLogin
}

public struct ServerSettings: Sendable, Equatable, Codable {
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
}

extension AuthMode {
    static func from(_ apiValue: API.GraphQLEnum<API.AuthMode>?) -> AuthMode {
        guard let value = apiValue?.value else { return .none }
        switch value {
        case .none: return .none
        case .basicAuth: return .basicAuth
        case .simpleLogin: return .simpleLogin
        case .uiLogin: return .uiLogin
        }
    }
}
