import DomainModule

public struct ChangeNicknameUseCaseImpl: ChangeNicknameUseCase {
    private let usersRepository: any UsersRepository

    public init(usersRepository: any UsersRepository) {
        self.usersRepository = usersRepository
    }

    public func execute(nickname: String) async throws {
        try await usersRepository.changeNickname(nickname: nickname)
    }
}
