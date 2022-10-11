import DomainModule

public struct FetchSpotListUseCaseImpl: FetchSpotListUseCase {
    private let commonRepository: any CommonRepository

    public init(commonRepository: any CommonRepository) {
        self.commonRepository = commonRepository
    }

    public func execute() async throws -> [Spot] {
        try await commonRepository.fetchSpotList()
    }
}
