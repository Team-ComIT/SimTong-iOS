import DataMappingModule
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

    public func createNewSchedule(req: CreateNewScheduleRequestDTO) async throws {
        try await remoteScheduleDataSource.createNewSchedule(req: req)
    }

    public func updateSchedule(id: String, req: UpdateScheduleRequestDTO) async throws {
        try await remoteScheduleDataSource.updateSchedule(id: id, req: req)
    }

    public func deleteSchedule(id: String) async throws {
        try await remoteScheduleDataSource.deleteSchedule(id: id)
    }
}
