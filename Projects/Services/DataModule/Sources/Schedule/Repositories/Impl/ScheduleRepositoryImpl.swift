import DomainModule
import Foundation
import NetworkModule

public struct ScheduleRepositoryImpl: ScheduleRepository {
    private let remoteScheduleDataSource: any RemoteScheduleDataSource

    public init(remoteScheduleDataSource: any RemoteScheduleDataSource) {
        self.remoteScheduleDataSource = remoteScheduleDataSource
    }

    public func fetchSchedule(date: Date) async throws -> [ScheduleEntity] {
        try await remoteScheduleDataSource.fetchSchedule(date: date)
    }
}
