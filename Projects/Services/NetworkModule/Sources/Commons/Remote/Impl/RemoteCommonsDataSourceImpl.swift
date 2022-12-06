import DomainModule
import APIKit
import DataMappingModule

public final class RemoteCommonsDataSourceImpl: BaseRemoteDataSource<CommonsAPI>, RemoteCommonsDataSource {
    public func fetchSpotList() async throws -> [SpotEntity] {
        try await request(.spotList, dto: SpotListResponseDTO.self)
            .toDomain()
    }

    public func findEmployeeNumber(req: FindEmployeeNumberRequestDTO) async throws -> Int {
        try await request(.findEmployeeNumber(req), dto: FindEmployeeNumberResponseDTO.self)
            .employeeNumber
    }

    public func comparePassword(password: String) async throws {
        print("1231312312312312312312312312312312313")
        try await request(.comparePassword(password: password), dto: NoResponse.self)
        print("1111111111111112222222222222223333333333")
    }

    public func reissueToken() async throws {
        try await request(.reissueToken, dto: NoResponse.self)
    }

    public func resetPassword(req: ResetPasswordRequestDTO) async throws {
        try await request(.resetPassword(req), dto: NoResponse.self)
    }

    public func changePassword(req: ChangePasswordRequestDTO) async throws {
        try await request(.changePassword(req), dto: NoResponse.self)
    }

    public func checkDuplicateEmail(email: String) async throws {
        try await request(.checkDuplicateEmail(email: email), dto: NoResponse.self)
    }

    public func checkExistEmployeeIDAndEmail(id: Int, email: String) async throws {
        try await request(.checkExistEmployeeIDAndEmail(id: id, email: email), dto: NoResponse.self)
    }
}
