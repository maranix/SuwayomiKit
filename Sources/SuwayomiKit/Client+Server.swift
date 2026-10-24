import API
import Foundation

extension SuwayomiClient {
    public func aboutServer() async throws(SuwayomiError) -> ServerInfo {
        let data = try await query(AboutServerQuery())
        return ServerInfo.from(data.aboutServer)
    }

    public func settings() async throws(SuwayomiError) -> ServerSettings {
        let data = try await query(GetSettingsQuery())
        let s = data.settings
        return ServerSettings(
            ip: s.ip,
            port: s.port,
            authMode: AuthMode.from(s.authMode),
            authUsername: s.authUsername,
            downloadsPath: s.downloadsPath,
            autoDownloadNewChapters: s.autoDownloadNewChapters,
            maxSourcesInParallel: s.maxSourcesInParallel
        )
    }

    public func clearCachedImages(
        pages: Bool = false,
        thumbnails: Bool = false,
        downloadedThumbnails: Bool = false
    ) async throws(SuwayomiError) -> (cachedPages: Bool, cachedThumbnails: Bool, downloadedThumbnails: Bool) {
        let data = try await mutation(
            ClearCachedImagesMutation(
                input: .init(
                    cachedPages: .some(pages),
                    cachedThumbnails: .some(thumbnails),
                    downloadedThumbnails: .some(downloadedThumbnails)
                )
            )
        )
        let payload = data.clearCachedImages
        return (
            cachedPages: payload.cachedPages ?? false,
            cachedThumbnails: payload.cachedThumbnails ?? false,
            downloadedThumbnails: payload.downloadedThumbnails ?? false
        )
    }

    public func login(username: String, password: String) async throws(SuwayomiError) -> AuthTokens {
        let data = try await mutation(
            LoginMutation(
                input: .init(password: password, username: username)
            )
        )
        let login = data.login
        return AuthTokens(
            accessToken: login.accessToken,
            refreshToken: login.refreshToken
        )
    }

    public func refreshToken(refreshToken: String) async throws(SuwayomiError) -> AuthTokens {
        let data = try await mutation(
            RefreshTokenMutation(
                input: .init(refreshToken: refreshToken)
            )
        )
        let tokenPayload = data.refreshToken
        return AuthTokens(
            accessToken: tokenPayload.accessToken,
            refreshToken: nil
        )
    }
}
