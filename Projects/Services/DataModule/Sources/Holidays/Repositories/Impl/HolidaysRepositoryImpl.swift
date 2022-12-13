import DomainModule
import Foundation
import NetworkModule

public struct HolidaysRepositoryImpl: HolidaysRepository {
    private let remoteHolidaysDataSource: any RemoteHolidaysDataSource

    public init(remoteHolidaysDataSource: any RemoteHolidaysDataSource) {
        self.remoteHolidaysDataSource = remoteHolidaysDataSource
    }

    public func fetchHoliday(date: String) async throws -> [HolidayEntity] {
        try await remoteHolidaysDataSource.fetchHoliday(date: date)
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
}