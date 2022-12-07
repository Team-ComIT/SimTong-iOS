public protocol FetchMyProfileUseCase {
    func execute() async throws -> UserInfoEntity
}
