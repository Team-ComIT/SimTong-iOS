public protocol CommonRepository {
    func fetchSpotList() async throws -> [Spot]
}
