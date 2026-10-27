import API
import Foundation

extension SuwayomiClient {
    public func serverInfo() async throws(SuwayomiError) -> ServerInfo {
        let data = try await query(AboutServerQuery())
        return ServerInfo(data.aboutServer)
    }

    public func serverSettings() async throws(SuwayomiError) -> ServerSettings {
        let data = try await query(GetSettingsQuery())
        return ServerSettings(data.settings)
    }

    public func clearCachedImages(
        pages: Bool = false,
        thumbnails: Bool = false,
        downloadedThumbnails: Bool = false
    ) async throws(SuwayomiError) -> CacheClearResult {
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
        return CacheClearResult(
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

    public func refreshAccessToken(using refreshToken: String) async throws(SuwayomiError) -> AuthTokens {
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
