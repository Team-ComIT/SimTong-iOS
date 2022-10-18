import DomainModule
import DataMappingModule

public protocol RemoteCommonsDataSource {
    func fetchSpotList() async throws -> [Spot]
    func findEmployeeNumber(req: FindEmployeeNumberRequestDTO) async throws -> Int
    func resetPassword(req: ResetPasswordRequestDTO) async throws
}
