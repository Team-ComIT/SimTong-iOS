import DataMappingModule

public protocol CommonsRepository {
    func fetchSpotList() async throws -> [Spot]
    func findEmployeeNumber(req: FindEmployeeNumberRequestDTO) async throws -> Int
    func changePassword(req: ChangePasswordRequestDTO) async throws
    func resetPassword(req: ResetPasswordRequestDTO) async throws
    func checkDuplicateEmail(email: String) async throws
    func checkExistNameAndEmail(name: String, email: String) async throws
}
