import Foundation
import DataMappingModule
import DomainModule

// MARK: - Common

// MARK: FetchSpotList
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
