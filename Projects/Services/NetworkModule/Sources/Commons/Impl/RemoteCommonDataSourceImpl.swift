import DomainModule
import APIKit
import DataMappingModule

public final class RemoteCommonDataSourceImpl: BaseRemoteDataSource<CommonsAPI>, RemoteCommonDataSource {
    public func fetchSpotList() async throws -> [Spot] {
        try await request(.spotList, dto: SpotListResponseDTO.self)
            .toDomain()
    }

    public func findEmployeeNumber(req: FindEmployeeNumberRequestDTO) async throws -> Int {
        try await request(.findEmployeeNumber(req), dto: FindEmployeeNumberResponseDTO.self)
            .employeeNumber
    }
}
