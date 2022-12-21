import DomainModule
import Foundation
import NetworkModule

public struct MenuRepositoryImpl: MenuRepository {
    private let remoteMenuDataSource: any RemoteMenuDataSource

    public init(remoteMenuDataSource: any RemoteMenuDataSource) {
        self.remoteMenuDataSource = remoteMenuDataSource
    }

    public func fetchMenuList(start: Date, end: Date) async throws -> [MenuEntity] {
        try await remoteMenuDataSource.fetchMealList(start: start, end: end)
    }

    public func fetchPublicMenuList(start: Date, end: Date) async throws -> [MenuEntity] {
        try await remoteMenuDataSource.fetcPublichMealList(start: start, end: end)
    }
}
