import DomainModule

public protocol RemoteCommonDataSource {
    func fetchSpotList() async throws -> [Spot]
}
