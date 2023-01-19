import Foundation

public enum SimtongDomain: String {
    case users
    case commons
    case files
    case emails
    case menu
    case schedules
    case holidays
}

public extension SimtongDomain {
    var asDomainPath: String {
        "/\(self.rawValue)"
    }
}
