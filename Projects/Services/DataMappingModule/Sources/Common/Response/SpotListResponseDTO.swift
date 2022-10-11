import Foundation

public struct SpotListResponseDTO: Decodable, Equatable {
    public init(spotList: [SingleSpotResponseDTO]) {
        self.spotList = spotList
    }

    public let spotList: [SingleSpotResponseDTO]

    enum CodingKeys: String, CodingKey {
        case spotList = "spot_list"
    }
}
