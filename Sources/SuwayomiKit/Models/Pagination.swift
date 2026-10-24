import Foundation

public struct PageInfo: Sendable, Equatable, Codable {
    public let hasNextPage: Bool
    public let hasPreviousPage: Bool
    public let startCursor: String?
    public let endCursor: String?

    public init(
        hasNextPage: Bool,
        hasPreviousPage: Bool,
        startCursor: String? = nil,
        endCursor: String? = nil
    ) {
        self.hasNextPage = hasNextPage
        self.hasPreviousPage = hasPreviousPage
        self.startCursor = startCursor
        self.endCursor = endCursor
    }
}

public struct PagedResult<T: Sendable & Equatable>: Sendable, Equatable {
    public let items: [T]
    public let pageInfo: PageInfo
    public let totalCount: Int

    public init(items: [T], pageInfo: PageInfo, totalCount: Int) {
        self.items = items
        self.pageInfo = pageInfo
        self.totalCount = totalCount
    }
}

extension PagedResult: Codable where T: Codable {}
