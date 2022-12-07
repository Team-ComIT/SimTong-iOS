import Foundation

public protocol HolidaysRepository {
    func fetchHoliday(date: String) async throws -> [HolidayEntity]
    func setHoliday(date: String) async throws
    func setAnnual(date: String) async throws
    func setWork(date: String) async throws
}
