public protocol SetHolidayUseCase {
    func execute(date: String) async throws
}
