import DomainModule
import Foundation

public struct FetchScheduleUseCaseImpl: FetchScheduleUseCase {
    private let scheduleRepository: any ScheduleRepository

    public init(scheduleRepository: any ScheduleRepository) {
        self.scheduleRepository = scheduleRepository
    }

    public func execute(date: Date) async throws -> [ScheduleEntity] {
        try await scheduleRepository.fetchSchedule(date: date)
    }
}
