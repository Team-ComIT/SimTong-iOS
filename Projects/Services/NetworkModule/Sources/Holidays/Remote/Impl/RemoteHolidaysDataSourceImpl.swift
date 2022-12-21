import DomainModule
import APIKit
import DataMappingModule

public final class RemoteHolidaysDataSourceImpl: BaseRemoteDataSource<HolidaysAPI>, RemoteHolidaysDataSource {
    public func fetchHoliday(start: String, end: String, status: String) async throws -> [HolidayEntity] {
        try await request(.fetchHolidays(start: start, end: end, status: status), dto: FetchHolidayResponseDTO.self)
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

    public func fetchAnnualCount(year: Int) async throws -> Int {
        try await request(.fetchAnnualCount(year: year), dto: FetchAnnualCountResponseDTO.self)
            .result
    }

    public func checkIsHolidayPeriod() async throws {
        try await request(.checkIsHolidaySetupPeriod)
    }
}
