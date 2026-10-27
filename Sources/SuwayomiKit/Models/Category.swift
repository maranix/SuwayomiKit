import API
import Foundation

public enum CategoryIncludeOrExclude: String, Sendable, Hashable, CaseIterable {
    case exclude
    case include
    case unset

    init(_ apiValue: API.GraphQLEnum<API.IncludeOrExclude>?) {
        switch apiValue?.value {
        case .exclude: self = .exclude
        case .include: self = .include
        case .unset, .none: self = .unset
        }
    }

    func toAPI() -> API.IncludeOrExclude {
        switch self {
        case .exclude: return .exclude
        case .include: return .include
        case .unset: return .unset
        }
    }
}

public struct Category: Identifiable, Hashable, Sendable {
    public let id: Int
    public let name: String
    public let order: Int
    public let isDefault: Bool
    public let isDefaultCategory: Bool
    public let includeInDownload: CategoryIncludeOrExclude
    public let includeInUpdate: CategoryIncludeOrExclude

    public init(
        id: Int,
        name: String,
        order: Int,
        isDefault: Bool,
        isDefaultCategory: Bool,
        includeInDownload: CategoryIncludeOrExclude,
        includeInUpdate: CategoryIncludeOrExclude
    ) {
        self.id = id
        self.name = name
        self.order = order
        self.isDefault = isDefault
        self.isDefaultCategory = isDefaultCategory
        self.includeInDownload = includeInDownload
        self.includeInUpdate = includeInUpdate
    }

    init(_ fragment: API.CategoryFields) {
        self.id = fragment.id
        self.name = fragment.name
        self.order = fragment.order
        self.isDefault = fragment.default
        self.isDefaultCategory = fragment.isDefaultCategory
        self.includeInDownload = CategoryIncludeOrExclude(fragment.includeInDownload)
        self.includeInUpdate = CategoryIncludeOrExclude(fragment.includeInUpdate)
    }
}
