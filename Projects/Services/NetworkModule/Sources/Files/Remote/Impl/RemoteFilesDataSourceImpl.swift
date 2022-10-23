import APIKit
import DataMappingModule
import Foundation

public final class RemoteFilesDataSourceImpl: BaseRemoteDataSource<FilsAPI>, RemoteFilesDataSource {
    public func uploadFile(_ data: Data) async throws -> String {
        try await request(.uploadImage(data), dto: UploadFileResponseDTO.self)
            .filePath
    }

    public func uploadFiles(_ datas: [Data]) async throws -> [String] {
        try await request(.uploadImages(datas), dto: UploadFilesResponseDTO.self)
            .filePathList
    }
}
