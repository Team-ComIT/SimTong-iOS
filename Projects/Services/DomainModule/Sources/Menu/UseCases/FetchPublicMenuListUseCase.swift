import Foundation

public protocol FetchPublicMenuListUseCase {
    func execute(date: Date) async throws -> [MenuEntity]
}
