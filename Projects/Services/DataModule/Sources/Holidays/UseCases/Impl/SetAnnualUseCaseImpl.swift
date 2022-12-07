import DomainModule

public struct SetAnnualUseCaseImpl: SetAnnualUseCase {
    private let holidaysRepository: any HolidaysRepository

    public init(holidaysRepository: any HolidaysRepository) {
        self.holidaysRepository = holidaysRepository
    }

    public func execute(date: String) async throws {
        try await holidaysRepository.setAnnual(date: date)
    }
}
