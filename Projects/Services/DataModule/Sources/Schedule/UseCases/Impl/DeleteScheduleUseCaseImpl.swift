import Combine
import DataMappingModule
import DomainModule
import ErrorModule

public struct DeleteScheduleUseCaseImpl: DeleteScheduleUseCase {
    private let scheduleRepository: any ScheduleRepository

    public init(scheduleRepository: any ScheduleRepository) {
        self.scheduleRepository = scheduleRepository
    }

    public func execute(id: String) async throws {
        try await scheduleRepository.deleteSchedule(id: id)
    }
}
