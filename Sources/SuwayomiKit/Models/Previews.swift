public protocol MangaPreview: Identifiable, Hashable, Sendable where ID == Int {
    var title: String { get }
    var thumbnailPath: String? { get }
}

public protocol SourcePreview: Identifiable, Hashable, Sendable where ID == String {
    var name: String { get }
    var displayName: String { get }
    var lang: String { get }
    var iconPath: String { get }
    var supportsLatest: Bool { get }
}
