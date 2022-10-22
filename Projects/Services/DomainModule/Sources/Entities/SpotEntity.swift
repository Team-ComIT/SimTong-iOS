import Foundation

public struct SpotEntity: Equatable {
    public init(
        id: String,
        name: String,
        location: String
    ) {
        self.id = id
        self.name = name
        self.location = location
    }

    public let id: String
    public let name: String
    public let location: String
}
