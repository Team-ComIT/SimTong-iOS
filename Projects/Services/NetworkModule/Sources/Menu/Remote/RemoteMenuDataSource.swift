import Foundation
import DomainModule

public protocol RemoteMenuDataSource {
    func fetchMealList(start: Date, end: Date) async throws -> [MenuEntity]
    func fetcPublichMealList(start: Date, end: Date) async throws -> [MenuEntity]
}
