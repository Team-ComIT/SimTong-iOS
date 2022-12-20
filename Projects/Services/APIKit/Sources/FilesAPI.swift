import Moya
import ErrorModule
import Foundation

public enum FilsAPI: SimTongAPI {
    case uploadImage(Data)
    case uploadImages([Data])
}

public extension FilsAPI {
    var domain: SimTongDomain {
        .files
    }

    var urlPath: String {
        switch self {
        case .uploadImage:
            return ""

        case .uploadImages:
            return "/list"
        }
    }

    var method: Moya.Method {
        switch self {
        case .uploadImage, .uploadImages:
            return .post
        }
    }

    var task: Moya.Task {
        switch self {
        case let .uploadImage(data):
            return .uploadMultipart([
                MultipartFormData(
                    provider: .data(data),
                    name: "file",
                    fileName: "\(UUID().uuidString).png"
                )
            ])

        case let .uploadImages(datas):
            return .uploadMultipart(datas.map { data in
                MultipartFormData(
                    provider: .data(data),
                    name: "files",
                    fileName: "\(UUID().uuidString).png"
                )
            })
        }
    }

    var jwtTokenType: JwtTokenType {
        switch self {
        default:
            return .none
        }
    }

    var headers: [String: String]? {
        ["Content-Type": "multipart/form-data"]
    }

    var errorMap: [Int: STError] {
        switch self {
        case .uploadImage:
            return [
                400: .unknown(),
                500: .internalServerError
            ]

        case .uploadImages:
            return [
                400: .unknown(),
                500: .internalServerError
            ]
        }
    }
}
