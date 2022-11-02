import DataMappingModule
import Foundation

public protocol ScheduleRepository {
    func fetchSchedule(date: Date) async throws -> [ScheduleEntity]
}
