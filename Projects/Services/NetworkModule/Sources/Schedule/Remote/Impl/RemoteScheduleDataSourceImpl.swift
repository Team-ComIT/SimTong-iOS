import DomainModule
import Foundation
import APIKit
import DataMappingModule

public final class RemoteScheduleDataSourceImpl: BaseRemoteDataSource<ScheduleAPI>, RemoteScheduleDataSource {
    public func fetchSchedule(date: Date) async throws -> [ScheduleEntity] {
        try await request(.fetchSchedule(date: date), dto: FetchScheduleResponseDTO.self)
            .toDomain()
    }
}
