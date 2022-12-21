import Foundation

public protocol FetchScheduleUseCase {
    func execute(start: Date, end: Date) async throws -> [ScheduleEntity]
}
