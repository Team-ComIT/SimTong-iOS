import Moya
import ErrorModule

public enum CommonAPI: SimTongAPI {
    case spotList
}

public extension CommonAPI {
    var domain: SimTongDomain {
        .commons
    }

    var urlPath: String {
        switch self {
        case .spotList:
            return "/spot"
        }
    }

    var method: Method {
        switch self {
        case .spotList:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .spotList:
            return .requestPlain
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
        case .spotList:
            return [
                500: .internalServerError
            ]
        }
    }
}
