import API
import Apollo
import Foundation

public struct SuwayomiClient: Sendable {
    private let apollo: ApolloClient

    public init(url: URL) {
        self.apollo = ApolloClient(url: url)
    }

    public func aboutServer() async throws -> ServerInfo {
        let response = try await apollo.fetch(query: AboutServerQuery())
        
        if let errors = response.errors, !errors.isEmpty {
            throw ClientError.error
        }
        
        guard let data = response.data else {
            throw ClientError.missingData
        }
        
        return ServerInfo.from(data.aboutServer)
    }
}
