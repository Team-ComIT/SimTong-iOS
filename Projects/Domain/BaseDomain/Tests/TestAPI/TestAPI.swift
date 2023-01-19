import Moya
import Foundation
import BaseDomain

public enum TestAPI: TargetType, JwtAuthorizable {
    case access
    case refresh
    case none

    public var baseURL: URL { URL(string: "localhost")! }

    public var path: String { "/" }

    public var method: Moya.Method { .get }

    public var sampleData: Data {
        switch self {
        default:
            return .init()
        }
    }

    public var task: Moya.Task { .requestPlain }

    public var headers: [String: String]? { nil }

    public var jwtTokenType: JwtTokenType {
        switch self {
        case .access:
            return .accessToken

        case .refresh:
            return .refreshToken

        default:
            return .none
        }
    }
}
