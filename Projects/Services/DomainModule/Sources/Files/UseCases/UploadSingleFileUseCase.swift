import Foundation

public protocol UploadSingleFileUseCase {
    func execute(_ data: Data) async throws -> String
}
