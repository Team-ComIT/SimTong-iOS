import Foundation
import DataMappingModule
import DomainModule

// MARK: FetchMyProfile
public extension FetchMyProfileResponseDTO {
    func toDomain() -> UserInfo {
        UserInfo(
            name: name,
            email: email,
            nickname: nickname,
            spot: spot,
            profileImagePath: profileImagePath
        )
    }
}
