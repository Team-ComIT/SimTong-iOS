import DomainModule

public struct LogoutUseCaseImpl: LogoutUseCase {
    private let usersRepository: any UsersRepository

    public init(usersRepository: any UsersRepository) {
        self.usersRepository = usersRepository
    }

    public func execute() {
    }
}
