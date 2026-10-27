import API
import Apollo
import Foundation

public struct SuwayomiClient: Sendable {
    public let config: SuwayomiClientConfig
    let apollo: ApolloClient
    let store: ApolloStore
    private let transport: (any NetworkTransport)?

    public var baseURL: URL { config.baseURL }
    public var token: String? { config.token }
    public var headers: [String: String] { config.headers }
    public var isAuthenticated: Bool { config.token != nil }

    public init(
        config: SuwayomiClientConfig,
        transport: (any NetworkTransport)? = nil
    ) {
        self.init(config: config, transport: transport, store: ApolloStore())
    }

    init(
        config: SuwayomiClientConfig,
        transport: (any NetworkTransport)?,
        store: ApolloStore
    ) {
        self.config = config
        self.transport = transport
        self.store = store

        let clientTransport: any NetworkTransport =
            transport
            ?? RequestChainNetworkTransport(
                urlSession: config.urlSession,
                interceptorProvider: DefaultInterceptorProvider.shared,
                store: store,
                endpointURL: config.graphQLEndpoint,
                additionalHeaders: config.resolvedHeaders(for: config.graphQLEndpoint)
            )
        self.apollo = ApolloClient(networkTransport: clientTransport, store: store)
    }

    public init(
        baseURL: URL,
        graphQLPath: String = "/api/graphql",
        token: String? = nil,
        headers: [String: String] = [:],
        urlSession: URLSession = .shared
    ) {
        self.init(
            config: SuwayomiClientConfig(
                baseURL: baseURL,
                graphQLPath: graphQLPath,
                token: token,
                headers: headers,
                urlSession: urlSession
            )
        )
    }

    public init(url: URL) {
        self.init(baseURL: url)
    }

    /// Returns a copy of this client with a new token.
    ///
    /// The underlying `ApolloStore` is shared with the receiver, so cached data survives
    /// re-authentication. When this client was created with a custom `NetworkTransport`,
    /// that transport is reused as-is; it is responsible for applying credentials.
    public func authenticated(with token: String) -> SuwayomiClient {
        var newConfig = config
        newConfig.token = token
        return SuwayomiClient(config: newConfig, transport: transport, store: store)
    }

    func graphQLID(_ value: Int) throws(SuwayomiError) -> Int32 {
        guard let id = Int32(exactly: value) else {
            throw .invalidID(value)
        }
        return id
    }

    func graphQLID(_ value: Int?) throws(SuwayomiError) -> GraphQLNullable<Int32> {
        guard let value else { return .none }
        guard let id = Int32(exactly: value) else {
            throw .invalidID(value)
        }
        return .some(id)
    }

    func graphQLIDs(_ values: [Int]?) throws(SuwayomiError) -> [Int32]? {
        guard let values else { return nil }
        var result: [Int32] = []
        result.reserveCapacity(values.count)
        for v in values {
            result.append(try graphQLID(v))
        }
        return result
    }

    static func mapError(_ error: any Error) -> SuwayomiError {
        switch error {
        case let suwayomiError as SuwayomiError:
            return suwayomiError
        case is CancellationError:
            return .cancelled
        case let urlError as URLError where urlError.code == .cancelled:
            return .cancelled
        case let urlError as URLError:
            return .network(urlError)
        case let responseError as ResponseCodeInterceptor.ResponseCodeError:
            return .http(statusCode: responseError.response.statusCode, data: responseError.chunk)
        case ApolloClient.Error.noResults:
            return .missingData
        default:
            return .unexpected(String(reflecting: error))
        }
    }

    public func fetchData(from url: URL) async throws(SuwayomiError) -> Data {
        var request = URLRequest(url: url)
        for (key, value) in config.resolvedHeaders(for: url) {
            request.setValue(value, forHTTPHeaderField: key)
        }

        do {
            let (data, response) = try await config.urlSession.data(for: request)
            if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode) {
                throw SuwayomiError.http(statusCode: httpResponse.statusCode, data: data)
            }
            return data
        } catch {
            throw Self.mapError(error)
        }
    }

    func query<Query: GraphQLQuery>(_ query: Query) async throws(SuwayomiError) -> Query.Data
    where Query.ResponseFormat == SingleResponseFormat {
        let response: GraphQLResponse<Query>
        do {
            response = try await apollo.fetch(query: query, cachePolicy: .networkOnly)
        } catch {
            throw Self.mapError(error)
        }

        if let errors = response.errors, !errors.isEmpty {
            throw .operation(errors.map(OperationError.from))
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
        } catch {
            throw Self.mapError(error)
        }

        if let errors = response.errors, !errors.isEmpty {
            throw .operation(errors.map(OperationError.from))
        }

        guard let data = response.data else {
            throw .missingData
        }

        return data
    }

    public func clearCache() async throws(SuwayomiError) {
        do {
            try await store.clearCache()
        } catch {
            throw Self.mapError(error)
        }
    }
}

extension SuwayomiClient: CustomStringConvertible, CustomDebugStringConvertible {
    public var description: String {
        let tokenDescription = token == nil ? "nil" : "<redacted>"
        return
            "SuwayomiClient(baseURL: \(config.redactedBaseURLString), token: \(tokenDescription), headers: \(headers.keys.sorted()))"
    }

    public var debugDescription: String { description }
}
