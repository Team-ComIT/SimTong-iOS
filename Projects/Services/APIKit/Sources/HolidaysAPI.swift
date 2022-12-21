import DataMappingModule
import ErrorModule
import Moya

public enum HolidaysAPI {
    case fetchHolidays(start: String, end: String, status: String)
    case setHoliday(date: String)
    case setAnnual(date: String)
    case setWork(date: String)
    case fetchAnnualCount(year: Int)
    case checkIsHolidaySetupPeriod
}

extension HolidaysAPI: SimTongAPI {
    public var domain: SimTongDomain {
        .holidays
    }

    public var urlPath: String {
        switch self {
        case .fetchHolidays:
            return "/individual"

        case .setHoliday:
            return "/dayoff"

        case .setAnnual:
            return "/annual"

        case .setWork:
            return "/work"

        case .fetchAnnualCount:
            return "/annual/count"

        case .checkIsHolidaySetupPeriod:
            return "/period"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .fetchHolidays, .fetchAnnualCount, .checkIsHolidaySetupPeriod:
            return .get

        case .setHoliday, .setAnnual:
            return .post

        case .setWork:
            return .put
        }
    }

    public var task: Moya.Task {
        switch self {
        case let .fetchHolidays(start, end, status):
            return .requestParameters(parameters: [
                "start_at": start,
                "end_at": end,
                "status": status
            ], encoding: URLEncoding.queryString)

        case let .setHoliday(date), let .setAnnual(date):
            return .requestParameters(parameters: [
                "date": date
            ], encoding: JSONEncoding.default)

        case let .setWork(date):
            return .requestParameters(parameters: [
                "date": date
            ], encoding: URLEncoding.queryString)

        case let .fetchAnnualCount(year):
            return .requestParameters(parameters: [
                "year": year
            ], encoding: URLEncoding.queryString)

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

        case .fetchAnnualCount:
            return [
                400: .unknown(),
                401: .accessTokenExpired
            ]

        case .checkIsHolidaySetupPeriod:
            return [
                400: .unknown(),
                401: .accessTokenExpired
            ]
        }
    }
}
