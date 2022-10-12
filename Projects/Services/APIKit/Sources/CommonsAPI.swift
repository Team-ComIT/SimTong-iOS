import Moya
import ErrorModule
import DataMappingModule

public enum CommonsAPI: SimTongAPI {
    case reissueToken
    case findEmployeeNumber(FindEmployeeNumberRequestDTO)
    case spotList
}

public extension CommonsAPI {
    var domain: SimTongDomain {
        .commons
    }

    var urlPath: String {
        switch self {
        case .reissueToken:
            return "/token/reissue"

        case .findEmployeeNumber:
            return "/employee-number"

        case .spotList:
            return "/spot"
        }
    }

    var method: Method {
        switch self {
        case .spotList, .findEmployeeNumber:
            return .get

        case .reissueToken:
            return .put
        }
    }

    var task: Task {
        switch self {
        case .reissueToken, .spotList:
            return .requestPlain

        case let .findEmployeeNumber(req):
            return .requestParameters(parameters: [
                "name": req.name,
                "spotId": req.spotId,
                "email": req.email
            ], encoding: URLEncoding.queryString)
        }
    }

    var jwtTokenType: JwtTokenType {
        switch self {
        case .reissueToken:
            return .refreshToken

        default:
            return .none
        }
    }

    var errorMap: [Int: STError] {
        switch self {
        case .reissueToken:
            return [
                400: .unknown(),
                401: .unknown()
            ]

        case .findEmployeeNumber:
            return [
                400: .unknown(),
                404: .notFoundUserByFindEmployeeNumber
            ]

        case .spotList:
            return [
                500: .internalServerError
            ]
        }
    }
}