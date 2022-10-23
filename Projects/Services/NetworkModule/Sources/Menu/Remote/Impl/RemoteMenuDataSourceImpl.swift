import DomainModule
import Foundation
import APIKit
import DataMappingModule

public final class RemoteMenuDataSourceImpl: BaseRemoteDataSource<MenuAPI>, RemoteMenuDataSource {
    public func fetchMealList(date: Date) async throws -> [MenuEntity] {
        try await request(.fetchMenuList(date), dto: FetchMenuListResponseDTO.self)
            .toDomain()
    }

    public func fetcPublichMealList(date: Date) async throws -> [MenuEntity] {
        try await request(.fetchPublicMenuList(date), dto: FetchMenuListResponseDTO.self)
            .toDomain()
    }
}
