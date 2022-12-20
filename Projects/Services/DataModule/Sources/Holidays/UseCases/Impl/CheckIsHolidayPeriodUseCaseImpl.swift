import DomainModule

public struct CheckIsHolidayPeriodUseCaseImpl: CheckIsHolidayPeriodUseCase {
    private let holidaysRepository: any HolidaysRepository

    public init(holidaysRepository: any HolidaysRepository) {
        self.holidaysRepository = holidaysRepository
    }

    public func execute() async throws {
        try await holidaysRepository.checkIsHolidayPeriod()
    }
}
