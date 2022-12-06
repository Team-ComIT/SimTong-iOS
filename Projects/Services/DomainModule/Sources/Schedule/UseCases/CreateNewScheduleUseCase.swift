import Combine
import DataMappingModule
import ErrorModule

public protocol CreateNewScheduleUseCase {
    func execute(req: CreateNewScheduleRequestDTO) async throws
}
