public protocol FetchHolidayUseCase {
    func execute(date: String) async throws -> [HolidayEntity]
}
