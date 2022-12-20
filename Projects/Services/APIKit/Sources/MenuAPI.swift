import ErrorModule
import Foundation
import Utility
import Moya

public enum MenuAPI: SimTongAPI {
    case fetchMenuList(start: Date, end: Date)
    case fetchPublicMenuList(start: Date, end: Date)
}

public extension MenuAPI {
    var domain: SimTongDomain {
        .menu
    }

    var urlPath: String {
        switch self {
        case .fetchMenuList:
            return ""

        case .fetchPublicMenuList:
            return "/public"
        }
    }

    var method: Moya.Method {
        switch self {
        case .fetchMenuList, .fetchPublicMenuList:
            return .get
        }
    }

    var task: Moya.Task {
        switch self {
        case let .fetchMenuList(start, end), let .fetchPublicMenuList(start, end):
            return .requestParameters(parameters: [
                "start_at": start.toSmallSimtongDateString(),
                "end_at": end.toSmallSimtongDateString()
            ], encoding: URLEncoding.queryString)
        }
    }

    var jwtTokenType: JwtTokenType {
        switch self {
        case .fetchMenuList:
            return .accessToken

        default:
            return .none
        }
    }

    var errorMap: [Int: STError] {
        switch self {
        case .fetchMenuList:
            return [
                400: .unknown(),
                401: .accessTokenExpired
            ]

        case .fetchPublicMenuList:
            return [
                400: .unknown()
            ]
        }
    }
}
