import DomainModule
import Foundation

public struct FetchPublicMenuListUseCaseImpl: FetchPublicMenuListUseCase {
    private let menuRepository: any MenuRepository

    public init(menuRepository: any MenuRepository) {
        self.menuRepository = menuRepository
    }

    public func execute(start: Date, end: Date) async throws -> [MenuEntity] {
        try await menuRepository.fetchPublicMenuList(start: start, end: end)
    }
}
