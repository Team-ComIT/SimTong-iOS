import DomainModule
import APIKit
import DataMappingModule

public final class RemoteHolidaysDataSourceImpl: BaseRemoteDataSource<HolidaysAPI>, RemoteHolidaysDataSource {
    public func fetchHoliday(date: String) async throws -> [HolidayEntity] {
        try await request(.fetchHolidays(date: date), dto: FetchHolidayResponseDTO.self)
            .toDomain()
    }

    public func setHoliday(date: String) async throws {
        try await request(.setHoliday(date: date))
    }

    public func setAnnual(date: String) async throws {
        try await request(.setAnnual(date: date))
    }

    public func setWork(date: String) async throws {
        try await request(.setWork(date: date))
    }
}