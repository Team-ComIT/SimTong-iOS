import Foundation

public struct HolidayEntity: Equatable {
    public init(date: String, type: HolidayType) {
        self.date = date
        self.type = type
    }

    public let date: String
    public let type: HolidayType
}
