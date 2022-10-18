import Moya
import DataMappingModule
import ErrorModule

public enum HolidaysAPI: SimTongAPI {
    case fetchHolidays
}

public extension HolidaysAPI {
    var domain: SimTongDomain {
        .holidays
    }

    var urlPath: String {
        switch self {
        case .fetchHolidays:
            return ""
        }
    }

    var method: Moya.Method {
        switch self {
        case .fetchHolidays:
            return .get
        }
    }

    var task: Moya.Task {
        switch self {
        default:
            return .requestPlain
        }
    }

    var jwtTokenType: JwtTokenType {
        switch self {
        case .fetchHolidays:
            return .accessToken

        default:
            return .none
        }
    }

    var errorMap: [Int: STError] {
        switch self {
        case .fetchHolidays:
            return [
                400: .unknown()
            ]
        }
    }
}
