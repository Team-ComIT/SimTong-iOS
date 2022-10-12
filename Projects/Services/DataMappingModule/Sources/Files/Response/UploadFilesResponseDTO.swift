import Foundation

public struct UploadFilesResponseDTO: Decodable {
    public let filePathList: [String]

    enum CodingKeys: String, CodingKey {
        case filePathList = "file_path_list"
    }
}
