import DomainModule
import DataMappingModule
import Foundation

public protocol RemoteScheduleDataSource {
    func fetchSchedule(date: Date) async throws -> [ScheduleEntity]
    func createNewSchedule(req: CreateNewScheduleRequestDTO) async throws
    func updateSchedule(id: String, req: UpdateScheduleRequestDTO) async throws
    func deleteSchedule(id: String) async throws
}
