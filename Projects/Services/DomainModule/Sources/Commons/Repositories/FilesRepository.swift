import Foundation

public protocol FilesRepository {
    func uploadFile(_ data: Data) async throws -> String
    func uploadFiles(_ datas: [Data]) async throws -> [String]
}
