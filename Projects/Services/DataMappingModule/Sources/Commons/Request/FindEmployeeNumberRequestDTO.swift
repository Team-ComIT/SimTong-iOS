import Foundation

public struct FindEmployeeNumberRequestDTO {
    public init(name: String, spotId: String, email: String) {
        self.name = name
        self.spotId = spotId
        self.email = email
    }

    public let name: String
    public let spotId: String
    public let email: String
}
