public protocol FetchSpotListUseCase {
    func execute() async throws -> [SpotEntity]
}
