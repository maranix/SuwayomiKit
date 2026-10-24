//
//  SuwayomiError.swift
//  SuwayomiKit
//
//  Created by Raman Verma on 24/10/26.
//

import Apollo
import Foundation

public struct OperationError: Error, Sendable, LocalizedError {
    public let description: String
    public let localizedDescription: String
    public let message: String?
    public let errorDescription: String?

    static func from(_ graphql: GraphQLError) -> Self {
        OperationError(
            description: graphql.description,
            localizedDescription: graphql.localizedDescription,
            message: graphql.message,
            errorDescription: graphql.errorDescription
        )
    }
}

public enum SuwayomiError: Error, Sendable, LocalizedError {
    case server(message: String)

    case network(URLError)

    case missingData

    case unexpected(String)

    case operation([OperationError])

    public var errorDescription: String? {
        switch self {
        case .missingData:
            return "The server returned an empty response"
        case .server(let message):
            return message
        case .unexpected(let message):
            return message
        case .network(let urlError):
            return urlError.localizedDescription
        case .operation(let errors):
            let messages = errors.compactMap { $0.message ?? $0.errorDescription }
            if !messages.isEmpty {
                return messages.joined(separator: "; ")
            }
            let descriptions = errors.map { $0.localizedDescription }.filter { !$0.isEmpty }
            return descriptions.isEmpty ? "GraphQL operation error" : descriptions.joined(separator: "; ")
        }
    }
}
