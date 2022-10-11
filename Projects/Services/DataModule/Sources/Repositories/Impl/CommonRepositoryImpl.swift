import NetworkModule
import DomainModule

public struct CommonRepositoryImpl: CommonRepository {
    private let commonRemoteDataSource: any RemoteCommonDataSource

    public init(commonRemoteDataSource: any RemoteCommonDataSource) {
        self.commonRemoteDataSource = commonRemoteDataSource
    }

    public func fetchSpotList() async throws -> [Spot] {
        try await commonRemoteDataSource.fetchSpotList()
    }
}
