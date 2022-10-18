import DomainModule
import Foundation
import NetworkModule

public struct MenuRepositoryImpl: MenuRepository {
    private let remoteMenuDataSource: any RemoteMenuDataSource

    public init(remoteMenuDataSource: any RemoteMenuDataSource) {
        self.remoteMenuDataSource = remoteMenuDataSource
    }

    public func fetchMenuList(date: Date) async throws -> [MenuEntity] {
        try await remoteMenuDataSource.fetchMealList(date: date)
    }

    public func fetchPublicMenuList(date: Date) async throws -> [MenuEntity] {
        try await remoteMenuDataSource.fetcPublichMealList(date: date)
    }
}
