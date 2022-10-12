import Foundation

public protocol UploadMultipleFileUseCase {
    func execute(_ datas: [Data]) async throws -> [String]
}
