import API
import Apollo
import Foundation

public struct SuwayomiClient: Sendable {
    public let baseURL: URL
    public let token: String?
    public let customHeaders: [String: String]
    let apollo: ApolloClient
    let urlSession: URLSession

    public init(
        baseURL: URL,
        token: String? = nil,
        customHeaders: [String: String] = [:],
        urlSession: URLSession = .shared
    ) {
        self.baseURL = baseURL
        self.token = token
        self.customHeaders = customHeaders
        self.urlSession = urlSession

        let store = ApolloStore()
        var headers = customHeaders
        if let token, headers["Authorization"] == nil {
            headers["Authorization"] = "Bearer \(token)"
        }

        let endpointURL: URL
        let baseStr = baseURL.absoluteString
        if baseStr.hasSuffix("/api/graphql") {
            endpointURL = baseURL
        } else {
            let trimmedBase = baseStr.hasSuffix("/") ? String(baseStr.dropLast()) : baseStr
            endpointURL =
                URL(string: trimmedBase + "/api/graphql")
                ?? baseURL.appendingPathComponent("api").appendingPathComponent("graphql")
        }

        let transport = RequestChainNetworkTransport(
            urlSession: urlSession,
            interceptorProvider: DefaultInterceptorProvider.shared,
            store: store,
            endpointURL: endpointURL,
            additionalHeaders: headers
        )
        self.apollo = ApolloClient(networkTransport: transport, store: store)
    }

    public init(url: URL) {
        self.init(baseURL: url)
    }

    public func resolveURL(_ pathOrURL: String) -> URL {
        if pathOrURL.lowercased().hasPrefix("http://") || pathOrURL.lowercased().hasPrefix("https://") {
            if let url = URL(string: pathOrURL) {
                return url
            }
        }

        let baseStr =
            baseURL.absoluteString.hasSuffix("/")
            ? String(baseURL.absoluteString.dropLast())
            : baseURL.absoluteString
        let relStr = pathOrURL.hasPrefix("/") ? pathOrURL : "/" + pathOrURL
        return URL(string: baseStr + relStr) ?? baseURL
    }

    public func fetchData(from url: URL) async throws(SuwayomiError) -> Data {
        var request = URLRequest(url: url)
        for (key, value) in customHeaders {
            request.setValue(value, forHTTPHeaderField: key)
        }
        if let token, request.value(forHTTPHeaderField: "Authorization") == nil {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }

        do {
            let (data, response) = try await urlSession.data(for: request)
            if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode) {
                throw SuwayomiError.server(message: "HTTP error \(httpResponse.statusCode)")
            }
            return data
        } catch let error as SuwayomiError {
            throw error
        } catch let urlError as URLError {
            throw SuwayomiError.network(urlError)
        } catch {
            throw SuwayomiError.unexpected(error.localizedDescription)
        }
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

    func mutation<Mutation: GraphQLMutation>(_ mutation: Mutation) async throws(SuwayomiError) -> Mutation.Data
    where Mutation.ResponseFormat == SingleResponseFormat {
        let response: GraphQLResponse<Mutation>

        do {
            response = try await apollo.perform(mutation: mutation)
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
