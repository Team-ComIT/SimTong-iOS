public protocol FetchHolidayUseCase {
    func execute(start: String, end: String, status: HolidayStatus) async throws -> [HolidayEntity]
}
