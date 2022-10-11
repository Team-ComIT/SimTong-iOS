import DomainModule
import DataMappingModule

public struct FindEmployeeNumberUseCaseImpl: FindEmployeeNumberUseCase {
    private let commonRepository: any CommonsRepository

    public init(commonRepository: any CommonsRepository) {
        self.commonRepository = commonRepository
    }

    public func execute(req: FindEmployeeNumberRequestDTO) async throws -> Int {
        try await commonRepository.findEmployeeNumber(req: req)
    }
}
