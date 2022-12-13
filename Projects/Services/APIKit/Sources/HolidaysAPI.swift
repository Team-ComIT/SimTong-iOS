import DataMappingModule
import ErrorModule
import Moya

public enum HolidaysAPI {
    case fetchHolidays(date: String)
    case setHoliday(date: String)
    case setAnnual(date: String)
    case setWork(date: String)
}

extension HolidaysAPI: SimTongAPI {
    public var domain: SimTongDomain {
        .holidays
    }

    public var urlPath: String {
        switch self {
        case .fetchHolidays:
            return ""

        case .setHoliday:
            return "/dayoff"

        case .setAnnual:
            return "/annual"

        case .setWork:
            return "/work"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .fetchHolidays:
            return .get

        case .setHoliday, .setAnnual:
            return .post

        case .setWork:
            return .delete
        }
    }

    public var task: Moya.Task {
        switch self {
        case let .fetchHolidays(date), let .setWork(date):
            return .requestParameters(parameters: [
                "date": date
            ], encoding: URLEncoding.queryString)

        case let .setHoliday(date), let .setAnnual(date):
            return .requestParameters(parameters: [
                "date": date
            ], encoding: JSONEncoding.default)

        default:
            return .requestPlain
        }
    }

    public var jwtTokenType: JwtTokenType {
        .accessToken
    }

    public var errorMap: [Int: STError] {
        switch self {
        case .fetchHolidays:
            return [
                400: .unknown(),
                401: .accessTokenExpired
            ]

        case .setHoliday:
            return [
                400: .unknown(),
                401: .accessTokenExpired,
                409: .alreadyHolidaysOrLimited
            ]

        case .setAnnual:
            return [
                400: .unknown(),
                401: .accessTokenExpired,
                409: .alreadyAnnualOrLacked
            ]

        case .setWork:
            return [
                400: .unknown(),
                401: .accessTokenExpired,
                404: .dateIsNotHolidayOrAnnual
            ]
        }
    }
}