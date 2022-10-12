import DomainModule

public struct ChangeProfileImageUseCaseImpl: ChangeProfileImageUseCase {
    private let usersRepository: any UsersRepository

    public init(usersRepository: any UsersRepository) {
        self.usersRepository = usersRepository
    }

    public func execute(imageURL: String) async throws {
        try await usersRepository.changeProfileImage(imageURL: imageURL)
    }
}
