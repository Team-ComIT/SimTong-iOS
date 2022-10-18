public protocol ChangeEmailUseCase {
    func execute(email: String) async throws
}
