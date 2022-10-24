import DomainModule
import DataMappingModule

public struct ChangePasswordUseCaseImpl: ChangePasswordUseCase {
    private let commonsRepository: any CommonsRepository

    public init(commonsRepository: any CommonsRepository) {
        self.commonsRepository = commonsRepository
    }

    public func execute(req: ChangePasswordRequestDTO) async throws {
        try await commonsRepository.changePassword(req: req)
    }
}
