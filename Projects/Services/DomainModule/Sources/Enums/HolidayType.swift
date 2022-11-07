import Foundation
import SwiftUI
import DesignSystem

public enum HolidayType {
    case dayoff
    case annual
    case work
}

public extension HolidayType {
    var display: String {
        switch self {
        case .dayoff:
            return "연차"

        case .annual:
            return "휴무"

        case .work:
            return "근무"
        }
    }

    var shortDisplay: String {
        switch self {
        case .dayoff:
            return "연"

        case .annual:
            return "휴"

        case .work:
            return "근"
        }
    }

    var primaryColor: Color {
        switch self {
        case .dayoff:
            return .extraPrimary

        case .annual:
            return .main

        case .work:
            return .gray04
        }
    }
}
