import DomainModule

public struct FetchHolidayUseCaseImpl: FetchHolidayUseCase {
    private let holidaysRepository: any HolidaysRepository

    public init(holidaysRepository: any HolidaysRepository) {
        self.holidaysRepository = holidaysRepository
    }

    public func execute(date: String) async throws -> [HolidayEntity] {
        try await holidaysRepository.fetchHoliday(date: date)
    }
}
