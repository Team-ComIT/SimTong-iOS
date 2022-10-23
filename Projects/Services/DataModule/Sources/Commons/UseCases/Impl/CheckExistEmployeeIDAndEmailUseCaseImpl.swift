import DomainModule

public struct CheckExistEmployeeIDAndEmailUseCaseImpl: CheckExistEmployeeIDAndEmailUseCase {
    private let commonsRepository: any CommonsRepository

    public init(commonsRepository: any CommonsRepository) {
        self.commonsRepository = commonsRepository
    }

    public func execute(id: String, email: String) async throws {
        try await commonsRepository.checkExistEmployeeIDAndEmail(id: id, email: email)
    }
}
