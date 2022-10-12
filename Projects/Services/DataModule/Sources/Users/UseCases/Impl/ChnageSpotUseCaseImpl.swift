import DomainModule

public struct ChangeSpotUseCaseImpl: ChangeSpotUseCase {
    private let usersRepository: any UsersRepository

    public init(usersRepository: any UsersRepository) {
        self.usersRepository = usersRepository
    }

    public func execute(spotID: String) async throws {
        try await usersRepository.changeSpot(spotID: spotID)
    }
}
