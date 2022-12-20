import Foundation
import SwiftUI

public enum HolidayType: String, Codable {
    case dayoff = "HOLIDAY"
    case annual = "ANNUAL"
    case work = "WORK"
}

public extension HolidayType {
    var display: String {
        switch self {
        case .dayoff:
            return "휴무"

        case .annual:
            return "연차"

        case .work:
            return "근무"
        }
    }

    var shortDisplay: String {
        switch self {
        case .dayoff:
            return "휴"

        case .annual:
            return "연"

        case .work:
            return "근"
        }
    }
}
