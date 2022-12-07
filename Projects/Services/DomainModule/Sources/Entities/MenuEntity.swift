import Foundation

public struct MenuEntity: Equatable {
    public init(date: String, meal: [String]) {
        self.date = date
        self.meal = meal
    }

    public let date: String
    public let meal: [String]
}
