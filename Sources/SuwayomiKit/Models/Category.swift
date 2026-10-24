import API
import Foundation

public enum CategoryIncludeOrExclude: String, Sendable, Equatable, Codable {
    case exclude
    case include
    case unset
}

public struct Category: Sendable, Equatable, Identifiable, Codable {
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
}

extension CategoryIncludeOrExclude {
    static func from(_ apiValue: API.GraphQLEnum<API.IncludeOrExclude>?) -> CategoryIncludeOrExclude {
        switch apiValue?.value {
        case .exclude: return .exclude
        case .include: return .include
        case .unset, .none: return .unset
        }
    }

    public func toAPI() -> API.IncludeOrExclude {
        switch self {
        case .exclude: return .exclude
        case .include: return .include
        case .unset: return .unset
        }
    }
}

extension Category {
    static func from(_ fragment: API.CategoryFields) -> Category {
        Category(
            id: fragment.id,
            name: fragment.name,
            order: fragment.order,
            isDefault: fragment.default,
            isDefaultCategory: fragment.isDefaultCategory,
            includeInDownload: CategoryIncludeOrExclude.from(fragment.includeInDownload),
            includeInUpdate: CategoryIncludeOrExclude.from(fragment.includeInUpdate)
        )
    }
}
