import DataMappingModule

public protocol ChangePasswordUseCase {
    func execute(req: ChangePasswordRequestDTO) async throws
}
