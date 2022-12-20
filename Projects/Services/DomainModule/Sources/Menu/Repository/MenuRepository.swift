import Foundation

public protocol MenuRepository {
    func fetchMenuList(start: Date, end: Date) async throws -> [MenuEntity]
    func fetchPublicMenuList(start: Date, end: Date) async throws -> [MenuEntity]
}
