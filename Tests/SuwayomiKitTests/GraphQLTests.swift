import API
import Apollo
import Foundation
import Testing

@testable import SuwayomiKit

final class MockNetworkTransport: NetworkTransport, @unchecked Sendable {
    var queryHandler: ((any GraphQLQuery) throws -> Any)?
    var mutationHandler: ((any GraphQLMutation) throws -> Any)?

    func send<Query: GraphQLQuery>(
        query: Query,
        fetchBehavior: FetchBehavior,
        requestConfiguration: RequestConfiguration
    ) throws -> AsyncThrowingStream<GraphQLResponse<Query>, any Error> {
        AsyncThrowingStream { continuation in
            if let handler = self.queryHandler {
                do {
                    let result = try handler(query)
                    if let response = result as? GraphQLResponse<Query> {
                        continuation.yield(response)
                        continuation.finish()
                    } else {
                        continuation.finish(throwing: SuwayomiError.unexpected("Invalid mock query response"))
                    }
                } catch {
                    continuation.finish(throwing: error)
                }
            } else {
                continuation.finish(throwing: SuwayomiError.unexpected("No query handler configured"))
            }
        }
    }

    func send<Mutation: GraphQLMutation>(
        mutation: Mutation,
        requestConfiguration: RequestConfiguration
    ) throws -> AsyncThrowingStream<GraphQLResponse<Mutation>, any Error> {
        AsyncThrowingStream { continuation in
            if let handler = self.mutationHandler {
                do {
                    let result = try handler(mutation)
                    if let response = result as? GraphQLResponse<Mutation> {
                        continuation.yield(response)
                        continuation.finish()
                    } else {
                        continuation.finish(throwing: SuwayomiError.unexpected("Invalid mock mutation response"))
                    }
                } catch {
                    continuation.finish(throwing: error)
                }
            } else {
                continuation.finish(throwing: SuwayomiError.unexpected("No mutation handler configured"))
            }
        }
    }
}

final class GraphQLMockURLProtocol: URLProtocol, @unchecked Sendable {
    private static let lock = NSLock()
    nonisolated(unsafe) private static var _requestHandler: ((URLRequest) throws -> (HTTPURLResponse, Data))?

    static var requestHandler: ((URLRequest) throws -> (HTTPURLResponse, Data))? {
        get {
            lock.lock()
            defer { lock.unlock() }
            return _requestHandler
        }
        set {
            lock.lock()
            defer { lock.unlock() }
            _requestHandler = newValue
        }
    }

    override static func canInit(with request: URLRequest) -> Bool {
        true
    }

    override static func canInit(with task: URLSessionTask) -> Bool {
        true
    }

    override static func canonicalRequest(for request: URLRequest) -> URLRequest {
        request
    }

    override func startLoading() {
        guard let handler = GraphQLMockURLProtocol.requestHandler else {
            client?.urlProtocol(self, didFailWithError: URLError(.unknown))
            return
        }

        do {
            let (response, data) = try handler(request)
            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            client?.urlProtocol(self, didLoad: data)
            client?.urlProtocolDidFinishLoading(self)
        } catch {
            client?.urlProtocol(self, didFailWithError: error)
        }
    }

    override func stopLoading() {}
}

private func graphQLHTTPResponse(for request: URLRequest, statusCode: Int) throws -> HTTPURLResponse {
    guard let url = request.url,
        let response = HTTPURLResponse(
            url: url,
            statusCode: statusCode,
            httpVersion: nil,
            headerFields: nil
        )
    else {
        throw URLError(.badServerResponse)
    }
    return response
}

@Suite("GraphQL Operation & Error Mapping Tests", .serialized)
struct GraphQLTests {
    private func makeClient(transport: MockNetworkTransport) -> SuwayomiClient {
        guard let baseURL = URL(string: "http://localhost:4567") else {
            fatalError("Invalid test base URL")
        }
        let config = SuwayomiClientConfig(baseURL: baseURL)
        return SuwayomiClient(config: config, transport: transport)
    }

    private func makeMockSession() -> URLSession {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [GraphQLMockURLProtocol.self]
        return URLSession(configuration: configuration)
    }

    @Test("HTTP 401 error is mapped to SuwayomiError.http and isUnauthorized is true")
    func testHTTP401Mapping() async throws {
        GraphQLMockURLProtocol.requestHandler = { request in
            (try graphQLHTTPResponse(for: request, statusCode: 401), Data("Unauthorized".utf8))
        }
        defer { GraphQLMockURLProtocol.requestHandler = nil }

        let session = makeMockSession()
        let baseURL = try #require(URL(string: "http://localhost:4567"))
        let client = SuwayomiClient(baseURL: baseURL, urlSession: session)

        do {
            _ = try await client.library()
            Issue.record("Expected 401 error to be thrown")
        } catch {
            #expect(error == .http(statusCode: 401, data: Data("Unauthorized".utf8)))
            #expect(error.isUnauthorized)
        }
    }

    @Test("HTTP 500 error is mapped to SuwayomiError.http")
    func testHTTP500Mapping() async throws {
        GraphQLMockURLProtocol.requestHandler = { request in
            (try graphQLHTTPResponse(for: request, statusCode: 500), Data("Internal Server Error".utf8))
        }
        defer { GraphQLMockURLProtocol.requestHandler = nil }

        let session = makeMockSession()
        let baseURL = try #require(URL(string: "http://localhost:4567"))
        let client = SuwayomiClient(baseURL: baseURL, urlSession: session)

        do {
            _ = try await client.library()
            Issue.record("Expected 500 error to be thrown")
        } catch {
            #expect(error == .http(statusCode: 500, data: Data("Internal Server Error".utf8)))
            #expect(!error.isUnauthorized)
        }
    }

    @Test("CancellationError is mapped to SuwayomiError.cancelled")
    func testCancellationMapping() async {
        let transport = MockNetworkTransport()
        let client = makeClient(transport: transport)

        transport.queryHandler = { _ in
            throw CancellationError()
        }

        do {
            _ = try await client.library()
            Issue.record("Expected cancellation error")
        } catch {
            #expect(error == .cancelled)
        }
    }

    @Test("URLError cancelled is mapped to SuwayomiError.cancelled")
    func testURLErrorCancellationMapping() async {
        let transport = MockNetworkTransport()
        let client = makeClient(transport: transport)

        transport.queryHandler = { _ in
            throw URLError(.cancelled)
        }

        do {
            _ = try await client.library()
            Issue.record("Expected cancellation error")
        } catch {
            #expect(error == .cancelled)
        }
    }

    @Test("Missing data response throws SuwayomiError.missingData")
    func testMissingDataMapping() async {
        let transport = MockNetworkTransport()
        let client = makeClient(transport: transport)

        transport.queryHandler = { _ in
            GraphQLResponse<GetLibraryMangasQuery>(
                data: nil,
                extensions: nil,
                errors: nil,
                source: .server,
                dependentKeys: nil
            )
        }

        do {
            _ = try await client.library()
            Issue.record("Expected missingData")
        } catch {
            #expect(error == .missingData)
        }
    }

    @Test("GraphQL errors are mapped to SuwayomiError.operation")
    func testGraphQLErrorMapping() async {
        let transport = MockNetworkTransport()
        let client = makeClient(transport: transport)

        transport.queryHandler = { _ in
            let graphqlError = GraphQLError([
                "message": "Field 'mangas' failed validation",
                "extensions": ["code": "GRAPHQL_VALIDATION_FAILED"],
            ])
            return GraphQLResponse<GetLibraryMangasQuery>(
                data: nil,
                extensions: nil,
                errors: [graphqlError],
                source: .server,
                dependentKeys: nil
            )
        }

        do {
            _ = try await client.library()
            Issue.record("Expected operation error")
        } catch {
            switch error {
            case .operation(let errors):
                #expect(errors.count == 1)
                #expect(errors.first?.message.contains("Field 'mangas'") == true)
                #expect(errors.first?.code == "GRAPHQL_VALIDATION_FAILED")
            default:
                Issue.record("Expected .operation, got \(error)")
            }
        }
    }

    @Test("Integer overflow throws SuwayomiError.invalidID without sending request")
    func testIntegerOverflowValidation() async {
        let transport = MockNetworkTransport()
        let client = makeClient(transport: transport)

        do {
            _ = try await client.chapter(id: Int.max)
            Issue.record("Expected invalidID error")
        } catch {
            #expect(error == .invalidID(Int.max))
        }

        do {
            _ = try await client.manga(id: Int.max)
            Issue.record("Expected invalidID error")
        } catch {
            #expect(error == .invalidID(Int.max))
        }

        do {
            _ = try await client.library(categoryIDs: [Int.max])
            Issue.record("Expected invalidID error")
        } catch {
            #expect(error == .invalidID(Int.max))
        }
    }

    @Test("authenticated(with:) preserves an injected transport")
    func testAuthenticatedPreservesTransport() async {
        let transport = MockNetworkTransport()
        let client = makeClient(transport: transport)

        nonisolated(unsafe) var queryCount = 0
        transport.queryHandler = { _ in
            queryCount += 1
            return GraphQLResponse<GetLibraryMangasQuery>(
                data: nil,
                extensions: nil,
                errors: nil,
                source: .server,
                dependentKeys: nil
            )
        }

        let authenticated = client.authenticated(with: "new-token")
        #expect(authenticated.token == "new-token")

        do {
            _ = try await authenticated.library()
            Issue.record("Expected missingData from the mock transport")
        } catch {
            #expect(error == .missingData)
        }
        #expect(queryCount == 1)
    }

    @Test("authenticated(with:) reuses the Apollo store")
    func testAuthenticatedReusesStore() {
        let transport = MockNetworkTransport()
        let client = makeClient(transport: transport)

        let authenticated = client.authenticated(with: "new-token")

        #expect(client.store === authenticated.store)
    }

    @Test("ApolloClient.Error.noResults is mapped to missingData")
    func testNoResultsMapping() async {
        let transport = MockNetworkTransport()
        let client = makeClient(transport: transport)

        transport.queryHandler = { _ in
            throw ApolloClient.Error.noResults
        }

        do {
            _ = try await client.library()
            Issue.record("Expected missingData")
        } catch {
            #expect(error == .missingData)
        }
    }

    @Test("Mutation operation errors are mapped to SuwayomiError.operation")
    func testMutationErrorMapping() async {
        let transport = MockNetworkTransport()
        let client = makeClient(transport: transport)

        transport.mutationHandler = { _ in
            GraphQLResponse<UpdateChapterMutation>(
                data: nil,
                extensions: nil,
                errors: [GraphQLError(["message": "Could not update chapter"])],
                source: .server,
                dependentKeys: nil
            )
        }

        do {
            _ = try await client.updateChapter(id: 1, isRead: true)
            Issue.record("Expected operation error")
        } catch {
            switch error {
            case .operation(let errors):
                #expect(errors.first?.message == "Could not update chapter")
            default:
                Issue.record("Expected .operation, got \(error)")
            }
        }
    }

    @Test("Missing mutation payload is mapped to missingData")
    func testMutationMissingDataMapping() async {
        let transport = MockNetworkTransport()
        let client = makeClient(transport: transport)

        transport.mutationHandler = { _ in
            GraphQLResponse<UpdateChapterMutation>(
                data: nil,
                extensions: nil,
                errors: nil,
                source: .server,
                dependentKeys: nil
            )
        }

        do {
            _ = try await client.updateChapter(id: 1, isRead: true)
            Issue.record("Expected missingData")
        } catch {
            #expect(error == .missingData)
        }
    }

    @Test("OperationError maps GraphQL path components")
    func testOperationErrorPathMapping() async {
        let transport = MockNetworkTransport()
        let client = makeClient(transport: transport)

        transport.queryHandler = { _ in
            GraphQLResponse<GetLibraryMangasQuery>(
                data: nil,
                extensions: nil,
                errors: [
                    GraphQLError([
                        "message": "Invalid field",
                        "path": ["mangas", "title"],
                    ]),
                    GraphQLError([
                        "message": "Invalid index",
                        "path": [0, 1],
                    ]),
                ],
                source: .server,
                dependentKeys: nil
            )
        }

        do {
            _ = try await client.library()
            Issue.record("Expected operation error")
        } catch {
            switch error {
            case .operation(let errors):
                #expect(errors.count == 2)
                #expect(errors[0].path == ["mangas", "title"])
                #expect(errors[1].path == ["0", "1"])
            default:
                Issue.record("Expected .operation, got \(error)")
            }
        }
    }

    @Test("Chapter orders are sent with their sort direction")
    func testChapterOrderMapping() async {
        let transport = MockNetworkTransport()
        let client = makeClient(transport: transport)

        nonisolated(unsafe) var capturedOrder: [ChapterOrderInput]?
        transport.queryHandler = { query in
            if let query = query as? GetChaptersQuery, case .some(let order) = query.order {
                capturedOrder = order
            }
            return GraphQLResponse<GetChaptersQuery>(
                data: nil,
                extensions: nil,
                errors: nil,
                source: .server,
                dependentKeys: nil
            )
        }

        do {
            _ = try await client.chapters(
                mangaId: 1,
                order: [
                    ChapterOrder(by: .uploadDate, direction: .descending),
                    ChapterOrder(by: .chapterNumber),
                ]
            )
            Issue.record("Expected missingData")
        } catch {
            #expect(error == .missingData)
        }

        #expect(capturedOrder?.count == 2)
        #expect(capturedOrder?[0].by == GraphQLEnum(API.ChapterOrderBy.uploadDate))
        #expect(capturedOrder?[0].byType == .some(GraphQLEnum(API.SortOrder.desc)))
        #expect(capturedOrder?[1].by == GraphQLEnum(API.ChapterOrderBy.chapterNumber))
        #expect(capturedOrder?[1].byType == .some(GraphQLEnum(API.SortOrder.asc)))
    }

    @Test("clearCache succeeds for an empty store")
    func testClearCache() async throws {
        let transport = MockNetworkTransport()
        let client = makeClient(transport: transport)
        try await client.clearCache()
    }
}
