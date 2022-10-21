import DomainModule

public struct CheckDuplicateNicknameUseCaseImpl: CheckDuplicateNicknameUseCase {
    private let usersRepository: any UsersRepository

    public init(usersRepository: any UsersRepository) {
        self.usersRepository = usersRepository
    }

    public func execute(nickname: String) async throws {
        try await usersRepository.checkDuplicateNickname(nickname: nickname)
    }
}
