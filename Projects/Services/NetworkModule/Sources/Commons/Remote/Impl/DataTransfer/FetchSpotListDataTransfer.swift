import Foundation
import DataMappingModule
import DomainModule

// MARK: FetchMyProfile
public extension SingleSpotResponseDTO {
    func toDomain() -> SpotEntity {
        SpotEntity(
            id: id,
            name: name,
            location: location
        )
    }
}

public extension SpotListResponseDTO {
    func toDomain() -> [SpotEntity] {
        spotList.map { $0.toDomain() }
    }
}
