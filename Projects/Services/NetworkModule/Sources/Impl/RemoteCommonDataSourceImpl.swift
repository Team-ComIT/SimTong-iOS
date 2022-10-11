import DomainModule
import APIKit
import DataMappingModule

public final class RemoteCommonDataSourceImpl: BaseRemoteDataSource<CommonAPI>, RemoteCommonDataSource {
    public func fetchSpotList() async throws -> [Spot] {
        try await request(.spotList, dto: SpotListResponseDTO.self)
            .toDomain()
    }
}
