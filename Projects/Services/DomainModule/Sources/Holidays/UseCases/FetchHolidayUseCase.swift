public protocol FetchHolidayUseCase {
    func execute(start: String, end: String) async throws -> [HolidayEntity]
}
