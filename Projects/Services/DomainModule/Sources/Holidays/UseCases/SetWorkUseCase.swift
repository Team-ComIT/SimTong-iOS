public protocol SetWorkUseCase {
    func execute(date: String) async throws
}
