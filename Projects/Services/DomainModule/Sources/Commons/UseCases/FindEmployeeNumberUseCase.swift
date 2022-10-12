import DataMappingModule

public protocol FindEmployeeNumberUseCase {
    func execute(req: FindEmployeeNumberRequestDTO) async throws -> Int
}
