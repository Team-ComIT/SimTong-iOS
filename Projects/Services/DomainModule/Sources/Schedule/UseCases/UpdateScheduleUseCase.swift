import Combine
import DataMappingModule
import ErrorModule

public protocol UpdateScheduleUseCase {
    func execute(id: String, req: UpdateScheduleRequestDTO) async throws
}
