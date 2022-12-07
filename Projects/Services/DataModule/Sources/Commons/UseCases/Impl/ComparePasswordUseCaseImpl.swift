import DomainModule

public struct ComparePasswordUseCaseImpl: ComparePasswordUseCase {
    private let commonsRepository: any CommonsRepository

    public init(commonsRepository: any CommonsRepository) {
        self.commonsRepository = commonsRepository
    }

    public func execute(password: String) async throws {
        try await commonsRepository.comparePassword(password: password)
    }
}
