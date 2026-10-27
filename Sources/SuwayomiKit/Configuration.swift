import Foundation

public struct SuwayomiClientConfig: Sendable {
    /// Server root URL with the configured GraphQL endpoint path removed.
    public var baseURL: URL
    /// Path to the GraphQL endpoint, relative to ``baseURL``.
    public var graphQLPath: String
    /// Bearer token used for same-origin requests. Prefer ``SuwayomiClient/authenticated(with:)``
    /// when updating credentials so the Apollo cache is preserved.
    public var token: String?
    /// Additional headers sent with same-origin requests. Values are never sent to external origins.
    public var headers: [String: String]
    /// Session used for GraphQL and media requests.
    public var urlSession: URLSession

    /// Fully resolved GraphQL endpoint URL.
    public var graphQLEndpoint: URL {
        guard var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true) else {
            return URL(string: baseURL.absoluteString + Self.normalizedGraphQLPath(graphQLPath)) ?? baseURL
        }

        var basePath = components.percentEncodedPath
        if basePath.count > 1, basePath.hasSuffix("/") {
            basePath.removeLast()
        }

        let endpointPath = Self.encodedPath(Self.normalizedGraphQLPath(graphQLPath))
        let joinedPath: String
        if endpointPath.isEmpty {
            joinedPath = basePath.isEmpty ? "/" : basePath
        } else if basePath.isEmpty || basePath == "/" {
            joinedPath = endpointPath
        } else {
            joinedPath = basePath + endpointPath
        }

        components.percentEncodedPath = joinedPath
        components.percentEncodedQuery = nil
        components.percentEncodedFragment = nil
        return components.url ?? baseURL
    }

    public init(
        baseURL: URL,
        graphQLPath: String = "/api/graphql",
        token: String? = nil,
        headers: [String: String] = [:],
        urlSession: URLSession = .shared
    ) {
        self.graphQLPath = graphQLPath
        self.baseURL = Self.normalize(baseURL: baseURL, graphQLPath: graphQLPath)
        self.token = token
        self.headers = headers
        self.urlSession = urlSession
    }

    /// Returns `true` when `url` uses the same scheme, host, port, and path prefix as ``baseURL``.
    public func isSameOriginAndPrefix(_ url: URL) -> Bool {
        guard let scheme = url.scheme?.lowercased(),
            let baseScheme = baseURL.scheme?.lowercased(),
            scheme == baseScheme,
            let host = url.host?.lowercased(),
            let baseHost = baseURL.host?.lowercased(),
            host == baseHost
        else {
            return false
        }
        let defaultPort = (scheme == "https") ? 443 : 80
        let urlPort = url.port ?? defaultPort
        let basePort = baseURL.port ?? defaultPort
        guard urlPort == basePort else { return false }

        let basePrefix = baseURL.path.trimmingCharacters(in: CharacterSet(charactersIn: "/"))
        if basePrefix.isEmpty { return true }
        let urlPath = url.path.trimmingCharacters(in: CharacterSet(charactersIn: "/"))
        return urlPath == basePrefix || urlPath.hasPrefix(basePrefix + "/")
    }

    public func resolvedHeaders(for destinationURL: URL? = nil) -> [String: String] {
        if let destinationURL, !isSameOriginAndPrefix(destinationURL) {
            return [:]
        }
        var result = headers
        if let token, !result.keys.contains(where: { $0.caseInsensitiveCompare("Authorization") == .orderedSame }) {
            let authValue = (token.hasPrefix("Bearer ") || token.hasPrefix("Basic ")) ? token : "Bearer \(token)"
            result["Authorization"] = authValue
        }
        return result
    }

    /// Resolves a server-relative path or an absolute `http`/`https` URL against ``baseURL``.
    ///
    /// Leading `/` paths are always treated as relative to the configured server prefix so
    /// reverse-proxy deployments keep their subpath. Empty strings, protocol-relative URLs
    /// (`//host/path`), and non-HTTP(S) schemes return `nil`.
    public func resolveURL(_ pathOrURL: String) -> URL? {
        let trimmed = pathOrURL.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty, !trimmed.hasPrefix("//") else { return nil }

        if let components = URLComponents(string: trimmed), let scheme = components.scheme?.lowercased() {
            guard scheme == "http" || scheme == "https", components.host != nil else { return nil }
            return Self.sanitized(components, scheme: scheme)
        }

        let (path, query, fragment) = Self.splitPathQueryFragment(
            trimmed.hasPrefix("/") ? trimmed : "/" + trimmed
        )
        guard var baseComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true) else {
            return nil
        }

        var basePath = baseComponents.percentEncodedPath
        if basePath.count > 1, basePath.hasSuffix("/") {
            basePath.removeLast()
        }

        let relativePath = Self.encodedPath(path)
            .trimmingCharacters(in: CharacterSet(charactersIn: "/"))
        var finalPath = basePath
        if !relativePath.isEmpty {
            if finalPath.isEmpty || finalPath == "/" {
                finalPath = "/" + relativePath
            } else {
                finalPath += "/" + relativePath
            }
        }
        if finalPath.isEmpty { finalPath = "/" }

        baseComponents.percentEncodedPath = finalPath
        baseComponents.percentEncodedQuery = query.map {
            Self.percentEncoded($0, allowed: .urlQueryAllowed)
        }
        baseComponents.percentEncodedFragment = fragment.map {
            Self.percentEncoded($0, allowed: .urlFragmentAllowed)
        }
        return baseComponents.url
    }

    /// Header names whose values must never follow a redirect outside the server origin/prefix.
    var managedHeaderNames: Set<String> {
        var names = Set(headers.keys.map { $0.lowercased() })
        if token != nil {
            names.insert("authorization")
        }
        return names
    }

    var redactedBaseURLString: String {
        guard var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true) else {
            return baseURL.absoluteString
        }
        if components.user != nil { components.user = "redacted" }
        if components.password != nil { components.password = "redacted" }
        return components.url?.absoluteString ?? baseURL.absoluteString
    }

    private static func sanitized(_ components: URLComponents, scheme: String) -> URL? {
        var result = components
        result.scheme = scheme
        result.percentEncodedPath = encodedPath(components.percentEncodedPath)
        if let query = components.percentEncodedQuery {
            result.percentEncodedQuery = percentEncoded(query, allowed: .urlQueryAllowed)
        }
        if let fragment = components.percentEncodedFragment {
            result.percentEncodedFragment = percentEncoded(fragment, allowed: .urlFragmentAllowed)
        }
        return result.url
    }

    private static func normalize(baseURL: URL, graphQLPath: String) -> URL {
        guard var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true) else {
            return baseURL
        }

        var path = components.percentEncodedPath
        while path.count > 1, path.hasSuffix("/") {
            path.removeLast()
        }

        let endpointPath = encodedPath(normalizedGraphQLPath(graphQLPath))
        if !endpointPath.isEmpty, path.hasSuffix(endpointPath) {
            path.removeLast(endpointPath.count)
        }
        while path.count > 1, path.hasSuffix("/") {
            path.removeLast()
        }
        if path == "/" { path = "" }

        components.percentEncodedPath = path
        components.percentEncodedQuery = nil
        components.percentEncodedFragment = nil
        return components.url ?? baseURL
    }

    private static func normalizedGraphQLPath(_ path: String) -> String {
        var normalized = path.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !normalized.isEmpty else { return "" }
        if !normalized.hasPrefix("/") {
            normalized = "/" + normalized
        }
        while normalized.count > 1, normalized.hasSuffix("/") {
            normalized.removeLast()
        }
        return normalized
    }

    private static func splitPathQueryFragment(_ input: String) -> (path: String, query: String?, fragment: String?) {
        var remainder = input
        var fragment: String? = nil
        if let hashIdx = remainder.firstIndex(of: "#") {
            fragment = String(remainder[remainder.index(after: hashIdx)...])
            remainder = String(remainder[..<hashIdx])
        }
        var query: String? = nil
        if let qIdx = remainder.firstIndex(of: "?") {
            query = String(remainder[remainder.index(after: qIdx)...])
            remainder = String(remainder[..<qIdx])
        }
        return (remainder, query, fragment)
    }

    private static func encodedPath(_ path: String) -> String {
        path.split(separator: "/", omittingEmptySubsequences: false)
            .map { percentEncoded(String($0), allowed: .urlPathAllowed) }
            .joined(separator: "/")
    }

    /// Percent-encodes characters that are invalid in a URL component while preserving
    /// already-valid `%XX` sequences so inputs are not double-encoded.
    private static func percentEncoded(_ value: String, allowed: CharacterSet) -> String {
        let bytes = Array(value.utf8)
        var output: [UInt8] = []
        output.reserveCapacity(bytes.count)
        var index = 0

        while index < bytes.count {
            let byte = bytes[index]
            if byte == 0x25,
                index + 2 < bytes.count,
                isHexDigit(bytes[index + 1]),
                isHexDigit(bytes[index + 2])
            {
                output.append(byte)
                output.append(bytes[index + 1])
                output.append(bytes[index + 2])
                index += 3
                continue
            }

            if byte < 0x80, allowed.contains(Unicode.Scalar(byte)) {
                output.append(byte)
            } else {
                output.append(contentsOf: String(format: "%%%02X", Int(byte)).utf8)
            }
            index += 1
        }

        return String(decoding: output, as: UTF8.self)
    }

    private static func isHexDigit(_ byte: UInt8) -> Bool {
        (0x30...0x39).contains(byte)
            || (0x41...0x46).contains(byte)
            || (0x61...0x66).contains(byte)
    }
}

extension SuwayomiClientConfig: CustomStringConvertible, CustomDebugStringConvertible {
    public var description: String {
        let tokenDescription = token == nil ? "nil" : "<redacted>"
        return
            "SuwayomiClientConfig(baseURL: \(redactedBaseURLString), graphQLPath: \(graphQLPath), token: \(tokenDescription), headers: \(headers.keys.sorted()))"
    }

    public var debugDescription: String { description }
}
