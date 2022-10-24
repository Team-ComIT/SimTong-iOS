public protocol CheckExistNameAndEmailUseCase {
    func execute(name: String, email: String) async throws
}
