import API
import Foundation

public struct LibraryJobsInfo: Sendable, Equatable, Codable {
    public let isRunning: Bool
    public let totalJobs: Int
    public let finishedJobs: Int
    public let skippedCategoriesCount: Int
    public let skippedMangasCount: Int

    public init(
        isRunning: Bool,
        totalJobs: Int,
        finishedJobs: Int,
        skippedCategoriesCount: Int = 0,
        skippedMangasCount: Int = 0
    ) {
        self.isRunning = isRunning
        self.totalJobs = totalJobs
        self.finishedJobs = finishedJobs
        self.skippedCategoriesCount = skippedCategoriesCount
        self.skippedMangasCount = skippedMangasCount
    }
}
