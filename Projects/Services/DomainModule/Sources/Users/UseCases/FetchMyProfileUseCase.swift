public protocol FetchMyProfileUseCase {
    func execute() async throws -> UserInfo
}
