public protocol SetAnnualUseCase {
    func execute(date: String) async throws
}
