import Foundation

public struct LibraryJobsInfo: Hashable, Sendable {
    public let isRunning: Bool
    public let totalJobs: Int
    public let finishedJobs: Int
    public let skippedCategoriesCount: Int
    public let skippedMangasCount: Int

    public init(
        isRunning: Bool,
        totalJobs: Int,
        finishedJobs: Int,
        skippedCategoriesCount: Int,
        skippedMangasCount: Int
    ) {
        self.isRunning = isRunning
        self.totalJobs = totalJobs
        self.finishedJobs = finishedJobs
        self.skippedCategoriesCount = skippedCategoriesCount
        self.skippedMangasCount = skippedMangasCount
    }
}
