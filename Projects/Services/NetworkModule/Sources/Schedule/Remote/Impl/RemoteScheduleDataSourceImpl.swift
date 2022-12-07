import DomainModule
import Foundation
import APIKit
import DataMappingModule

public final class RemoteScheduleDataSourceImpl: BaseRemoteDataSource<ScheduleAPI>, RemoteScheduleDataSource {
    public func fetchSchedule(date: Date) async throws -> [ScheduleEntity] {
        try await request(.fetchSchedule(date: date), dto: FetchScheduleResponseDTO.self)
            .toDomain()
    }

    public func createNewSchedule(req: CreateNewScheduleRequestDTO) async throws {
        try await request(.createNewSchedule(req))
    }

    public func updateSchedule(id: String, req: UpdateScheduleRequestDTO) async throws {
        try await request(.updateSchedule(id: id, req: req))
    }

    public func deleteSchedule(id: String) async throws {
        try await request(.deleteSchedule(id: id))
    }
}
