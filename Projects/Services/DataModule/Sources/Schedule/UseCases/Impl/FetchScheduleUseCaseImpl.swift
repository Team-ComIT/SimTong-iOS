import DomainModule
import Foundation

public struct FetchScheduleUseCaseImpl: FetchScheduleUseCase {
    private let scheduleRepository: any ScheduleRepository

    public init(scheduleRepository: any ScheduleRepository) {
        self.scheduleRepository = scheduleRepository
    }

    public func execute(start: Date, end: Date) async throws -> [ScheduleEntity] {
        try await scheduleRepository.fetchSchedule(start: start, end: end)
    }
}
