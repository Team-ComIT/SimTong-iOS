import DomainModule

public struct ExistsByEmailUseCaseImpl: ExistsByEmailUseCase {
    private let usersRepository: any UsersRepository

    public init(usersRepository: any UsersRepository) {
        self.usersRepository = usersRepository
    }

    public func execute(email: String) async throws {
        try await usersRepository.existsByEmail(email: email)
    }
}
