import Foundation
import DataMappingModule
import DomainModule

// MARK: FetchMyProfile
public extension SingleSpotResponseDTO {
    func toDomain() -> Spot {
        Spot(
            id: id,
            name: name,
            location: location
        )
    }
}

public extension SpotListResponseDTO {
    func toDomain() -> [Spot] {
        spotList.map { $0.toDomain() }
    }
}
