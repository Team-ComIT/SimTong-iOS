import DomainModule

public struct CheckDuplicateEmailUseCaseImpl: CheckDuplicateEmailUseCase {
    private let commonsRepository: any CommonsRepository

    public init(commonsRepository: any CommonsRepository) {
        self.commonsRepository = commonsRepository
    }

    public func execute(email: String) async throws {
        try await commonsRepository.checkDuplicateEmail(email: email)
    }
}
