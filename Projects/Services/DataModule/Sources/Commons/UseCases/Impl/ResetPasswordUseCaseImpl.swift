import DataMappingModule
import DomainModule

public struct ResetPasswordUseCaseImpl: ResetPasswordUseCase {
    private let commonsRepository: any CommonsRepository

    public init(commonsRepository: any CommonsRepository) {
        self.commonsRepository = commonsRepository
    }

    public func execute(req: ResetPasswordRequestDTO) async throws {
        try await commonsRepository.resetPassword(req: req)
    }
}
