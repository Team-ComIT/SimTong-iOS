import DomainModule
import Foundation

public struct UploadMultipleFileUseCaseImpl: UploadMultipleFileUseCase {
    private let filesRepository: any FilesRepository

    public init(filesRepository: any FilesRepository) {
        self.filesRepository = filesRepository
    }

    public func execute(_ datas: [Data]) async throws -> [String] {
        try await filesRepository.uploadFiles(datas)
    }
}
