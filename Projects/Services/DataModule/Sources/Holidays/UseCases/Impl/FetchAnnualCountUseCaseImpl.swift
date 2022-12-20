import DomainModule

public struct FetchAnnualCountUseCaseImpl: FetchAnnualCountUseCase {
    private let holidaysRepository: any HolidaysRepository

    public init(holidaysRepository: any HolidaysRepository) {
        self.holidaysRepository = holidaysRepository
    }

    public func execute(year: Int) async throws -> Int {
        try await holidaysRepository.fetchAnnualCount(year: year)
    }
}
