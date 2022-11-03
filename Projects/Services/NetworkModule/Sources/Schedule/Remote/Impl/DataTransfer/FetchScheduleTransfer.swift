import DataMappingModule
import DomainModule

public extension FetchScheduleResponseDTO {
    func toDomain() -> [ScheduleEntity] {
        schedules.map { $0.toDomain() }
    }
}

public extension SingleScheduleResponseDTO {
    func toDomain() -> ScheduleEntity {
        ScheduleEntity(
            id: id,
            title: title,
            startAt: startAt,
            endAt: endAt
        )
    }
}
