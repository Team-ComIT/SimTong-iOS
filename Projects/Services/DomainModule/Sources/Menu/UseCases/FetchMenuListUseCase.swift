import Foundation

public protocol FetchMenuListUseCase {
    func execute(date: Date) async throws -> [MenuEntity]
}
