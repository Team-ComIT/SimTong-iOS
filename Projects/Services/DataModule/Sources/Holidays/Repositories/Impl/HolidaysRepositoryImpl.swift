import DomainModule
import Foundation
import NetworkModule

public struct HolidaysRepositoryImpl: HolidaysRepository {
    private let remoteHolidaysDataSource: any RemoteHolidaysDataSource

    public init(remoteHolidaysDataSource: any RemoteHolidaysDataSource) {
        self.remoteHolidaysDataSource = remoteHolidaysDataSource
    }

    public func fetchHoliday(start: String, end: String, status: String) async throws -> [HolidayEntity] {
        try await remoteHolidaysDataSource.fetchHoliday(start: start, end: end, status: status)
    }

    public func setHoliday(date: String) async throws {
        try await remoteHolidaysDataSource.setHoliday(date: date)
    }

    public func setAnnual(date: String) async throws {
        try await remoteHolidaysDataSource.setAnnual(date: date)
    }

    public func setWork(date: String) async throws {
        try await remoteHolidaysDataSource.setWork(date: date)
    }

    public func fetchAnnualCount(year: Int) async throws -> Int {
        try await remoteHolidaysDataSource.fetchAnnualCount(year: year)
    }

    public func checkIsHolidayPeriod() async throws {
        try await remoteHolidaysDataSource.checkIsHolidayPeriod()
    }
}
