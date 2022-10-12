import Moya
import ErrorModule
import DataMappingModule

public enum EmailsAPI: SimTongAPI {
    case verifyAuthCode(email: String, code: String)
    case sendAuthCode(email: String)
}

public extension EmailsAPI {
    var domain: SimTongDomain {
        .emails
    }

    var urlPath: String {
        switch self {
        case .sendAuthCode:
            return ""

        case .verifyAuthCode:
            return "/code"
        }
    }

    var method: Moya.Method {
        switch self {
        case .verifyAuthCode:
            return .get

        case .sendAuthCode:
            return .post
        }
    }

    var task: Moya.Task {
        switch self {
        case let .verifyAuthCode(email, code):
            return .requestParameters(parameters: [
                "email": email,
                "code": code
            ], encoding: URLEncoding.queryString)

        case let .sendAuthCode(email):
            return .requestParameters(parameters: [
                "email": email
            ], encoding: JSONEncoding.default)
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
        case .verifyAuthCode:
            return [
                400: .unknown(),
                401: .authCodeExpired
            ]

        case .sendAuthCode:
            return [
                400: .unknown(),
                409: .alreadyVerifiedEmail,
                429: .tooManyRequestVerifyEmail
            ]
        }
    }
}
