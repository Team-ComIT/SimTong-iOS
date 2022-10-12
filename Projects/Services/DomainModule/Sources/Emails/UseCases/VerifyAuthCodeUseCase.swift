public protocol VerifyAuthCodeUseCase {
    func execute(email: String, code: String) async throws
}
