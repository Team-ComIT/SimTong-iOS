public protocol ExistsByEmailUseCase {
    func execute(email: String) async throws
}
