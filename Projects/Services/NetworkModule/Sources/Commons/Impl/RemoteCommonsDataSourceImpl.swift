import DomainModule
import APIKit
import DataMappingModule

public final class RemoteCommonsDataSourceImpl: BaseRemoteDataSource<CommonsAPI>, RemoteCommonsDataSource {
    public func fetchSpotList() async throws -> [Spot] {
        try await request(.spotList, dto: SpotListResponseDTO.self)
            .toDomain()
    }

    public func findEmployeeNumber(req: FindEmployeeNumberRequestDTO) async throws -> Int {
        try await request(.findEmployeeNumber(req), dto: FindEmployeeNumberResponseDTO.self)
            .employeeNumber
    }

    public func resetPassword(req: ResetPasswordRequestDTO) async throws {
        try await request(.resetPassword(req), dto: NoResponse.self)
    }
}
