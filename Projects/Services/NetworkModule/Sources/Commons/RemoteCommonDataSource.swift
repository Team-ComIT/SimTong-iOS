import DomainModule
import DataMappingModule

public protocol RemoteCommonDataSource {
    func fetchSpotList() async throws -> [Spot]
    func findEmployeeNumber(req: FindEmployeeNumberRequestDTO) async throws -> Int
}
