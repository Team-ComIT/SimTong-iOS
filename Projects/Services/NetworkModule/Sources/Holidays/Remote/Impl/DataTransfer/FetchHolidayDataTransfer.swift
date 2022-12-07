import DataMappingModule
import DomainModule

public extension FetchHolidayResponseDTO {
    func toDomain() -> [HolidayEntity] {
        holidays.map { $0.toDomain() }
    }
}

public extension SingleHolidayResponseDTO {
    func toDomain() -> HolidayEntity {
        HolidayEntity(
            date: date,
            type: HolidayType(rawValue: type) ?? .work
        )
    }
}
