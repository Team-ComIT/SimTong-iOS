import DataMappingModule
import DomainModule

// MARK: - FetchMenuListDataTransfer
public extension FetchMenuListResponseDTO {
    func toDomain() -> [MenuEntity] {
        menu.map { $0.toDomain() }
    }
}

public extension SingleMenuResponseDTO {
    func toDomain() -> MenuEntity {
        MenuEntity(
            date: date,
            meal: meal
        )
    }
}
