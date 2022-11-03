import Foundation

public protocol FetchScheduleUseCase {
    func execute(date: Date) async throws -> [ScheduleEntity]
}
