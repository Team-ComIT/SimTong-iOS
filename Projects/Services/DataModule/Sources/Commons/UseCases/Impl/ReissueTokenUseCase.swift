import Combine
import DomainModule
import ErrorModule

public struct ReissueTokenUseCaseImpl: ReissueTokenUseCase {
    private let commonsRepository: any CommonsRepository

    public init(commonsRepository: any CommonsRepository) {
        self.commonsRepository = commonsRepository
    }

    public func execute() async throws {
        try await commonsRepository.reissueToken()
    }
}
