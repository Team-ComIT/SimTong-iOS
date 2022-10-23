import Foundation

public protocol RemoteFilesDataSource {
    func uploadFile(_ data: Data) async throws -> String
    func uploadFiles(_ datas: [Data]) async throws -> [String]
}
