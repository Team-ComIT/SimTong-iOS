import Combine
import DataMappingModule
import DomainModule
import ErrorModule

public struct UpdateScheduleUseCaseImpl: UpdateScheduleUseCase {
    private let scheduleRepository: any ScheduleRepository

    public init(scheduleRepository: any ScheduleRepository) {
        self.scheduleRepository = scheduleRepository
    }

    public func execute(id: String, req: UpdateScheduleRequestDTO) async throws {
        try await scheduleRepository.updateSchedule(id: id, req: req)
    }
}
