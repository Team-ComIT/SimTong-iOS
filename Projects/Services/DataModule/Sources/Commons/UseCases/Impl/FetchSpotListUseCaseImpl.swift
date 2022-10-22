import DomainModule

public struct FetchSpotListUseCaseImpl: FetchSpotListUseCase {
    private let commonRepository: any CommonsRepository

    public init(commonRepository: any CommonsRepository) {
        self.commonRepository = commonRepository
    }

    public func execute() async throws -> [SpotEntity] {
        try await commonRepository.fetchSpotList()
    }
}
