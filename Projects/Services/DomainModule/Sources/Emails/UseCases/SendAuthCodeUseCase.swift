public protocol SendAuthCodeUseCase {
    func execute(email: String) async throws
}
