import DomainModule
import DataMappingModule

public protocol RemoteCommonsDataSource {
    func fetchSpotList() async throws -> [SpotEntity]
    func findEmployeeNumber(req: FindEmployeeNumberRequestDTO) async throws -> Int
    func resetPassword(req: ResetPasswordRequestDTO) async throws
    func changePassword(req: ChangePasswordRequestDTO) async throws
    func checkDuplicateEmail(email: String) async throws
    func checkExistEmployeeIDAndEmail(id: String, email: String) async throws
}
