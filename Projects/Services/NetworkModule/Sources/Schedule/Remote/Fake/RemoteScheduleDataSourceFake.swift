import DataMappingModule
import DomainModule
import Foundation
import Utility

#if DEBUG
public final class RemoteScheduleDataSourceFake: RemoteScheduleDataSource {
    public init() {}
    var store = [String: [ScheduleEntity]]()

    public func fetchSchedule(start: Date, end: Date) async throws -> [DomainModule.ScheduleEntity] {
        return store
            .reduce(into: [ScheduleEntity]()) { partialResult, dict in
                partialResult.append(contentsOf: dict.value)
            }
    }

    public func createNewSchedule(req: DataMappingModule.CreateNewScheduleRequestDTO) async throws {
        var start = req.startAt.toSmallSimtongDate()
        let end = req.endAt.toSmallSimtongDate().adding(by: .day, value: 1)
        let scheduleEntity = ScheduleEntity(
            id: UUID().uuidString,
            title: req.title,
            startAt: req.startAt,
            endAt: req.endAt
        )
        if store[req.startAt] == nil {
            store[req.startAt] = [scheduleEntity]
        }
        start = start.adding(by: .day, value: 1)
        while !start.isSameDay(end) {
            if store[start.toSmallSimtongDateString()] == nil {
                store[start.toSmallSimtongDateString()] = [scheduleEntity]
            } else {
                store[start.toSmallSimtongDateString()]?.append(scheduleEntity)
            }

            start = start.adding(by: .day, value: 1)
        }
    }

    public func updateSchedule(id: String, req: DataMappingModule.UpdateScheduleRequestDTO) async throws {}

    public func deleteSchedule(id: String) async throws {}
}
#endif
