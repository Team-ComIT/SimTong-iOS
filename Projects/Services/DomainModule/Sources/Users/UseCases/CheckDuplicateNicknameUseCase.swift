public protocol CheckDuplicateNicknameUseCase {
    func execute(nickname: String) async throws
}
