import Foundation

public struct SingleMenuResponseDTO: Decodable {
    public init(date: String, meal: String) {
        self.date = date
        self.meal = meal
    }

    public let date: String
    public let meal: String
}
