import API
import Foundation

public struct PageInfo: Hashable, Sendable {
    public let hasNextPage: Bool
    public let hasPreviousPage: Bool
    public let startCursor: String?
    public let endCursor: String?

    public init(
        hasNextPage: Bool,
        hasPreviousPage: Bool,
        startCursor: String?,
        endCursor: String?
    ) {
        self.hasNextPage = hasNextPage
        self.hasPreviousPage = hasPreviousPage
        self.startCursor = startCursor
        self.endCursor = endCursor
    }

    init(_ fragment: API.PageInfoFields) {
        self.hasNextPage = fragment.hasNextPage
        self.hasPreviousPage = fragment.hasPreviousPage
        self.startCursor = fragment.startCursor
        self.endCursor = fragment.endCursor
    }
}

public struct PagedResult<T: Sendable>: Sendable {
    public let items: [T]
    public let pageInfo: PageInfo
    public let totalCount: Int

    public init(items: [T], pageInfo: PageInfo, totalCount: Int) {
        self.items = items
        self.pageInfo = pageInfo
        self.totalCount = totalCount
    }
}

extension PagedResult: Equatable where T: Equatable {}
extension PagedResult: Hashable where T: Hashable {}

extension PagedResult: RandomAccessCollection {
    public typealias Element = T
    public typealias Index = Int

    public var startIndex: Int { items.startIndex }
    public var endIndex: Int { items.endIndex }

    public subscript(position: Int) -> T {
        items[position]
    }
}
