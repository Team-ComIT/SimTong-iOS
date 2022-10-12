import DomainModule
import Foundation

public struct UploadSingleFileUseCaseImpl: UploadSingleFileUseCase {
    private let filesRepository: any FilesRepository

    public init(filesRepository: any FilesRepository) {
        self.filesRepository = filesRepository
    }

    public func execute(_ data: Data) async throws -> String {
        try await filesRepository.uploadFile(data)
    }
}
