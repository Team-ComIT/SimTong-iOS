import DomainModule

public protocol RemoteHolidaysDataSource {
    func fetchHoliday(start: String, end: String) async throws -> [HolidayEntity]
    func setHoliday(date: String) async throws
    func setAnnual(date: String) async throws
    func setWork(date: String) async throws
    func fetchAnnualCount(year: Int) async throws -> Int
}
