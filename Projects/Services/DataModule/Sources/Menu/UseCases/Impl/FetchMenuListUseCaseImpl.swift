import DomainModule

public struct FetchMenuListUseCaseImpl: FetchMenuListUseCase {
    private let menuRepository: any MenuRepository

    public init(menuRepository: any MenuRepository) {
        self.menuRepository = menuRepository
    }

    public func execute(date: Date) async throws -> [MenuEntity] {
        try await menuRepository.fetchMenuList(date: date)
    }
}
