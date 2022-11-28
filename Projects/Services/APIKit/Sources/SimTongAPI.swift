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
        URL(string: "http://3.39.162.197:8888") ?? URL(string: "https://www.google.com")!
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

public struct AnyCodingKey : CodingKey {

    public var stringValue: String
    public var intValue: Int?

    public init(_ base: CodingKey) {
        self.init(stringValue: base.stringValue, intValue: base.intValue)
    }

    public init(stringValue: String) {
        self.stringValue = stringValue
    }

    public init(intValue: Int) {
        self.stringValue = "\(intValue)"
        self.intValue = intValue
    }

    public init(stringValue: String, intValue: Int?) {
        self.stringValue = stringValue
        self.intValue = intValue
    }
}
