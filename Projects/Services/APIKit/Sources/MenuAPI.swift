import Moya
import ErrorModule
import Foundation

public enum MenuAPI: SimTongAPI {
    case fetchMenuList(Date)
    case fetchPublicMenuList(Date)
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
        case let .fetchMenuList(date), let .fetchPublicMenuList(date):
            return .requestParameters(parameters: [
                "date": date
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

fileprivate extension Date {
    func toMenuDateString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.timeZone = .init(identifier: "UTC")
        return formatter.string(from: self)
    }
}
