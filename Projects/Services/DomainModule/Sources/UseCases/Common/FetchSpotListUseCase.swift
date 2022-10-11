public protocol FetchSpotListUseCase {
    func execute() async throws -> [Spot]
}
