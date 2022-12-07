public protocol ComparePasswordUseCase {
    func execute(password: String) async throws
}
