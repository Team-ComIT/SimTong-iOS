import DataMappingModule

public protocol ResetPasswordUseCase {
    func execute(req: ResetPasswordRequestDTO) async throws
}
