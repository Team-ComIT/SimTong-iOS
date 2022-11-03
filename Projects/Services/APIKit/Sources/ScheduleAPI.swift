import Moya
import ErrorModule
import Foundation
import Utility

public enum ScheduleAPI: SimTongAPI {
    case fetchSchedule(date: Date)
}

public extension ScheduleAPI {
    var domain: SimTongDomain {
        .schedules
    }

    var urlPath: String {
        switch self {
        case .fetchSchedule:
            return ""
        }
    }

    var method: Moya.Method {
        switch self {
        case .fetchSchedule:
            return .get
        }
    }

    var task: Moya.Task {
        switch self {
        case let .fetchSchedule(date):
            return .requestParameters(parameters: [
                "date": date.toSmallSimtongDateString()
            ], encoding: URLEncoding.queryString)
        }
    }

    var jwtTokenType: JwtTokenType {
        switch self {
        case .fetchSchedule:
            return .accessToken

        default:
            return .none
        }
    }

    var errorMap: [Int: STError] {
        switch self {
        case .fetchSchedule:
            return [
                400: .unknown(),
                401: .accessTokenExpired
            ]
        }
    }
}
