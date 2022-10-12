import DomainModule

public struct ChangeEmailUseCaseImpl: ChangeEmailUseCase {
    private let usersRepository: any UsersRepository

    public init(usersRepository: any UsersRepository) {
        self.usersRepository = usersRepository
    }

    public func execute(email: String) async throws {
        try await usersRepository.changeEmail(email: email)
    }
}
