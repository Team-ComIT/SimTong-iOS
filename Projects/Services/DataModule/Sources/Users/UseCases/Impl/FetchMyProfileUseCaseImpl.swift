import DomainModule

public struct FetchMyProfileUseCaseImpl: FetchMyProfileUseCase {
    private let usersRepository: any UsersRepository

    public init(usersRepository: any UsersRepository) {
        self.usersRepository = usersRepository
    }

    public func execute() async throws -> UserInfoEntity {
        try await usersRepository.fetchMyProfile()
    }
}
