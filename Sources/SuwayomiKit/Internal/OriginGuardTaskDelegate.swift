import Foundation

/// Strips managed credentials from redirect requests that leave the configured server origin/prefix.
///
/// Foundation removes `Authorization` on most cross-origin redirects, but custom headers are not
/// guaranteed to be stripped. Attaching this delegate to a media request keeps the same guarantee
/// for every header the client adds itself.
final class OriginGuardTaskDelegate: NSObject, URLSessionTaskDelegate, @unchecked Sendable {
    private let config: SuwayomiClientConfig

    init(config: SuwayomiClientConfig) {
        self.config = config
    }

    func urlSession(
        _ session: URLSession,
        task: URLSessionTask,
        willPerformHTTPRedirection response: HTTPURLResponse,
        newRequest request: URLRequest,
        completionHandler: @escaping @Sendable (URLRequest?) -> Void
    ) {
        guard let url = request.url else {
            completionHandler(nil)
            return
        }

        guard !config.isSameOriginAndPrefix(url) else {
            completionHandler(request)
            return
        }

        var guardedRequest = request
        for header in config.managedHeaderNames {
            guardedRequest.setValue(nil, forHTTPHeaderField: header)
        }
        completionHandler(guardedRequest)
    }
}
