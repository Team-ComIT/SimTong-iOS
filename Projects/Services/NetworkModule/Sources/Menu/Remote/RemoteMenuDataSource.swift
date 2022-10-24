import Foundation
import DomainModule

public protocol RemoteMenuDataSource {
    func fetchMealList(date: Date) async throws -> [MenuEntity]
    func fetcPublichMealList(date: Date) async throws -> [MenuEntity]
}
