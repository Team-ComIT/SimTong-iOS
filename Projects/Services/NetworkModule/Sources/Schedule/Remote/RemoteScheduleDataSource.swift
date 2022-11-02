import DomainModule
import DataMappingModule
import Foundation

public protocol RemoteScheduleDataSource {
    func fetchSchedule(date: Date) async throws -> [ScheduleEntity]
}
