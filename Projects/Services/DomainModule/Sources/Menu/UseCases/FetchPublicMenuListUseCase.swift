import Foundation

public protocol FetchPublicMenuListUseCase {
    func execute(start: Date, end: Date) async throws -> [MenuEntity]
}
