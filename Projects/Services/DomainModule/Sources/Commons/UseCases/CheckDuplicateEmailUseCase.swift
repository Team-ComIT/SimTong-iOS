public protocol CheckDuplicateEmailUseCase {
    func execute(email: String) async throws
}
