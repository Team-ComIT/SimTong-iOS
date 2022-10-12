import DomainModule
import DataMappingModule

public struct SignupUseCaseImpl: SignupUseCase {
    private let usersRepository: any UsersRepository

    public init(usersRepository: any UsersRepository) {
        self.usersRepository = usersRepository
    }

    public func execute(req: SignupRequestDTO) async throws {
        try await usersRepository.signup(req: req)
    }
}
