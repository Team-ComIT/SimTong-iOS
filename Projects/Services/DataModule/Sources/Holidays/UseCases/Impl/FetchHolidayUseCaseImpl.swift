import DomainModule

public struct FetchHolidayUseCaseImpl: FetchHolidayUseCase {
    private let holidaysRepository: any HolidaysRepository

    public init(holidaysRepository: any HolidaysRepository) {
        self.holidaysRepository = holidaysRepository
    }

    public func execute(start: String, end: String) async throws -> [HolidayEntity] {
        try await holidaysRepository.fetchHoliday(start: start, end: end)
    }
}
