import DomainModule
import DataMappingModule

public struct SigninUseCaseImpl: SigninUseCase {
    private let usersRepository: any UsersRepository

    public init(usersRepository: any UsersRepository) {
        self.usersRepository = usersRepository
    }

    public func execute(req: SigninRequestDTO) async throws {
        try await usersRepository.signin(req: req)
    }
}
