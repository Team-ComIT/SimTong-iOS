import DomainModule

public struct CheckExistNameAndEmailUseCaseImpl: CheckExistNameAndEmailUseCase {
    private let commonsRepository: any CommonsRepository

    public init(commonsRepository: any CommonsRepository) {
        self.commonsRepository = commonsRepository
    }

    public func execute(name: String, email: String) async throws {
        try await commonsRepository.checkExistNameAndEmail(name: name, email: email)
    }
}
