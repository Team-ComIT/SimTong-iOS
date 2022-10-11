import DomainModule
import DataMappingModule

public struct FindEmployeeNumberUseCaseImpl: FindEmployeeNumberUseCase {
    private let commonRepository: any CommonRepository

    public init(commonRepository: any CommonRepository) {
        self.commonRepository = commonRepository
    }

    public func execute(req: FindEmployeeNumberRequestDTO) async throws -> Int {
        try await commonRepository.findEmployeeNumber(req: req)
    }
}
