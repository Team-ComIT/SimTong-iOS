import Foundation

public protocol MenuRepository {
    func fetchMenuList(date: Date) async throws -> [MenuEntity]
    func fetchPublicMenuList(date: Date) async throws -> [MenuEntity]
}
