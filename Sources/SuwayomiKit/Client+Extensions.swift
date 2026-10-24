import API

// Queries
extension SuwayomiClient {
    public func aboutServer() async throws(SuwayomiError) -> ServerInfo {
        let data = try await query(AboutServerQuery())
        return ServerInfo.from(data.aboutServer)
    }
}
