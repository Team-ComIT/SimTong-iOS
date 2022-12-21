import DomainModule
import Foundation
import APIKit
import DataMappingModule

public final class RemoteMenuDataSourceImpl: BaseRemoteDataSource<MenuAPI>, RemoteMenuDataSource {
    public func fetchMealList(start: Date, end: Date) async throws -> [MenuEntity] {
        try await request(.fetchMenuList(start: start, end: end), dto: FetchMenuListResponseDTO.self)
            .toDomain()
    }

    public func fetcPublichMealList(start: Date, end: Date) async throws -> [MenuEntity] {
        try await request(.fetchPublicMenuList(start: start, end: end), dto: FetchMenuListResponseDTO.self)
            .toDomain()
    }
}
