import Combine
import DataMappingModule
import DomainModule
import ErrorModule

public struct CreateNewScheduleUseCaseImpl: CreateNewScheduleUseCase {
    private let scheduleRepository: any ScheduleRepository

    public init(scheduleRepository: any ScheduleRepository) {
        self.scheduleRepository = scheduleRepository
    }

    public func execute(req: CreateNewScheduleRequestDTO) async throws {
        try await scheduleRepository.createNewSchedule(req: req)
    }
}
