public protocol FetchAnnualCountUseCase {
    func execute(year: Int) async throws -> Int
}
