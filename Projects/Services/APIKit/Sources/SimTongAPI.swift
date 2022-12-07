import Moya
import ErrorModule
import Foundation

public protocol SimTongAPI: TargetType, JwtAuthorizable {
    var domain: SimTongDomain { get }
    var urlPath: String { get }
    var errorMap: [Int: STError] { get }
}

public extension SimTongAPI {
    var baseURL: URL {
        URL(
            string: Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String ?? ""
        ) ?? URL(string: "https://www.google.com")!
    }

    var path: String {
        domain.asURLString + urlPath
    }

    var validationType: ValidationType {
        .successCodes
    }

    var headers: [String: String]? {
        ["Content-Type": "application/json"]
    }
}

public enum SimTongDomain: String {
    case users
    case commons
    case files
    case emails
    case menu
    case schedules
    case holidays
}

extension SimTongDomain {
    var asURLString: String {
        "/\(self.rawValue)"
    }
}
