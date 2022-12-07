import DataMappingModule
import ErrorModule
import Foundation
import Utility
import Moya

public enum ScheduleAPI: SimTongAPI {
    case fetchSchedule(date: Date)
    case createNewSchedule(CreateNewScheduleRequestDTO)
    case updateSchedule(id: String, req: UpdateScheduleRequestDTO)
    case deleteSchedule(id: String)
}

public extension ScheduleAPI {
    var domain: SimTongDomain {
        .schedules
    }

    var urlPath: String {
        switch self {
        case .fetchSchedule, .createNewSchedule:
            return ""

        case let .updateSchedule(id, _):
            return "/\(id)"

        case let .deleteSchedule(id):
            return "/\(id)"
        }
    }

    var method: Moya.Method {
        switch self {
        case .fetchSchedule:
            return .get

        case .createNewSchedule:
            return .post

        case .updateSchedule:
            return .put

        case .deleteSchedule:
            return .delete
        }
    }

    var task: Moya.Task {
        switch self {
        case let .fetchSchedule(date):
            return .requestParameters(parameters: [
                "date": date.toSmallSimtongDateString()
            ], encoding: URLEncoding.queryString)

        case let .createNewSchedule(req):
            return .requestJSONEncodable(req)

        case let .updateSchedule(_, req):
            return .requestJSONEncodable(req)

        default:
            return .requestPlain
        }
    }

    var jwtTokenType: JwtTokenType {
        switch self {
        case .fetchSchedule, .createNewSchedule, .updateSchedule, .deleteSchedule:
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
                401: .accessTokenExpired,
                500: .internalServerError
            ]

        case .createNewSchedule:
            return [
                400: .unknown(),
                401: .accessTokenExpired,
                500: .internalServerError
            ]

        case .updateSchedule:
            return [
                400: .unknown(),
                401: .accessTokenExpired,
                500: .internalServerError
            ]

        case .deleteSchedule:
            return [
                400: .unknown(),
                401: .accessTokenExpired,
                500: .internalServerError
            ]
        }
    }
}
