import Apollo
import Foundation

public struct OperationError: Error, Sendable, Hashable, Equatable, LocalizedError {
    public let message: String
    public let code: String?
    public let path: [String]?

    public var errorDescription: String? { message }

    public init(message: String, code: String? = nil, path: [String]? = nil) {
        self.message = message
        self.code = code
        self.path = path
    }

    static func from(_ graphql: GraphQLError) -> OperationError {
        OperationError(
            message: graphql.message ?? graphql.localizedDescription,
            code: graphql.extensions?["code"] as? String,
            path: graphql.path?.map {
                switch $0 {
                case .field(let name): return name
                case .index(let index): return String(index)
                }
            }
        )
    }
}

public enum SuwayomiError: Error, Sendable, LocalizedError, Equatable {
    case http(statusCode: Int, data: Data? = nil)
    case network(URLError)
    case cancelled
    case missingData
    case invalidURL(String)
    case invalidID(Int)
    case operation([OperationError])
    case unexpected(String)

    public var isUnauthorized: Bool {
        if case .http(let code, _) = self { return code == 401 }
        return false
    }

    public var errorDescription: String? {
        switch self {
        case .http(let code, _):
            return "HTTP error \(code)"
        case .network(let urlError):
            return urlError.localizedDescription
        case .cancelled:
            return "The operation was cancelled"
        case .missingData:
            return "The server returned an empty response"
        case .invalidURL(let string):
            return "Invalid URL: \(string)"
        case .invalidID(let id):
            return "Invalid identifier: \(id)"
        case .operation(let errors):
            let messages = errors.map(\.message).filter { !$0.isEmpty }
            return messages.isEmpty ? "GraphQL operation error" : messages.joined(separator: "; ")
        case .unexpected(let message):
            return message
        }
    }
}
