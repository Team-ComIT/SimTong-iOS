import DomainModule
import Foundation
import NetworkModule

public struct FilesRepositoryImpl: FilesRepository {
    private let remoteFilesDataSource: any RemoteFilesDataSource

    public init(remoteFilesDataSource: any RemoteFilesDataSource) {
        self.remoteFilesDataSource = remoteFilesDataSource
    }

    public func uploadFile(_ data: Data) async throws -> String {
        try await remoteFilesDataSource.uploadFile(data)
    }

    public func uploadFiles(_ datas: [Data]) async throws -> [String] {
        try await remoteFilesDataSource.uploadFiles(datas)
    }
}
