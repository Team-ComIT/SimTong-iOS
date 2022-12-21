import Foundation

public protocol FetchMenuListUseCase {
    func execute(start: Date, end: Date) async throws -> [MenuEntity]
}
