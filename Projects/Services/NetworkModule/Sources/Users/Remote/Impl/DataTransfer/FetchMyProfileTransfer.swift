import Foundation
import DataMappingModule
import DomainModule

// MARK: FetchMyProfile
public extension FetchMyProfileResponseDTO {
    func toDomain() -> UserInfoEntity {
        UserInfoEntity(
            name: name,
            email: email,
            nickname: nickname,
            spot: spot,
            profileImagePath: profileImagePath
        )
    }
}
