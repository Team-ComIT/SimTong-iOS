public protocol ChangeNicknameUseCase {
    func execute(nickname: String) async throws
}
