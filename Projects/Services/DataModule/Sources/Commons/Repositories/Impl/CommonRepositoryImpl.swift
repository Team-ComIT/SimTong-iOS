import NetworkModule
import DomainModule
import DataMappingModule

public struct CommonsRepositoryImpl: CommonsRepository {
    private let remoteCommonsDataSource: any RemoteCommonsDataSource

    public init(remoteCommonsDataSource: any RemoteCommonsDataSource) {
        self.remoteCommonsDataSource = remoteCommonsDataSource
    }

    public func fetchSpotList() async throws -> [Spot] {
        try await remoteCommonsDataSource.fetchSpotList()
    }

    public func findEmployeeNumber(req: FindEmployeeNumberRequestDTO) async throws -> Int {
        try await remoteCommonsDataSource.findEmployeeNumber(req: req)
    }
}
