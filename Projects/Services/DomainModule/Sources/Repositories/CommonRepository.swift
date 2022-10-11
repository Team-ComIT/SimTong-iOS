import DataMappingModule

public protocol CommonRepository {
    func fetchSpotList() async throws -> [Spot]
    func findEmployeeNumber(req: FindEmployeeNumberRequestDTO) async throws -> Int
}
