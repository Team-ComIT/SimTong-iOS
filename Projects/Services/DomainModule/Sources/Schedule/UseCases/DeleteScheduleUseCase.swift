import Combine
import DataMappingModule
import ErrorModule

public protocol DeleteScheduleUseCase {
    func execute(id: String) async throws
}
