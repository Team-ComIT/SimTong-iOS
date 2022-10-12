import Foundation

public struct UploadFileResponseDTO: Decodable {
    public let filePath: String

    enum CodingKeys: String, CodingKey {
        case filePath = "file_path"
    }
}
