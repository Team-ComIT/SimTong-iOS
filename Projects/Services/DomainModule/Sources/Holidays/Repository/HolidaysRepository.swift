import Foundation

public protocol HolidaysRepository {
    func fetchHoliday(start: String, end: String) async throws -> [HolidayEntity]
    func setHoliday(date: String) async throws
    func setAnnual(date: String) async throws
    func setWork(date: String) async throws
}
