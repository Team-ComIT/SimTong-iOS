import NetworkModule
import DomainModule
import DataMappingModule

public struct CommonRepositoryImpl: CommonRepository {
    private let commonRemoteDataSource: any RemoteCommonDataSource

    public init(commonRemoteDataSource: any RemoteCommonDataSource) {
        self.commonRemoteDataSource = commonRemoteDataSource
    }

    public func fetchSpotList() async throws -> [Spot] {
        try await commonRemoteDataSource.fetchSpotList()
    }

    public func findEmployeeNumber(req: FindEmployeeNumberRequestDTO) async throws -> Int {
        try await commonRemoteDataSource.findEmployeeNumber(req: req)
    }
}
