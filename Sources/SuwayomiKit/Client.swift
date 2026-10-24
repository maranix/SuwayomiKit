import API
import Apollo
import Foundation

public struct SuwayomiClient: Sendable {
    let apollo: ApolloClient

    public init(url: URL) {
        self.apollo = ApolloClient(url: url)
    }

    func query<Query: GraphQLQuery>(_ query: Query) async throws(SuwayomiError) -> Query.Data
    where Query.ResponseFormat == SingleResponseFormat {
        let response: GraphQLResponse<Query>

        do {
            response = try await apollo.fetch(query: query)
        } catch let urlError as URLError {
            throw .network(urlError)
        } catch {
            throw .unexpected(error.localizedDescription)
        }

        if let errors = response.errors, !errors.isEmpty {
            throw .operation(errors.compactMap(OperationError.from))
        }

        guard let data = response.data else {
            throw .missingData
        }

        return data
    }
}
