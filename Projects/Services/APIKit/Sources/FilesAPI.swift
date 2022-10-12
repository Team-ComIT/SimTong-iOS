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
                    name: "file_path"
                )
            ])

        case let .uploadImages(datas):
            return .uploadMultipart(datas.map { data in
                MultipartFormData(
                    provider: .data(data),
                    name: "file_path_list"
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
