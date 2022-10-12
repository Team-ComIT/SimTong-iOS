import Foundation

public struct UserInfo: Equatable {
    public init(
        name: String,
        email: String,
        nickname: String,
        spot: String,
        profileImagePath: String
    ) {
        self.name = name
        self.email = email
        self.nickname = nickname
        self.spot = spot
        self.profileImagePath = profileImagePath
    }

    public let name: String
    public let email: String
    public let nickname: String
    public let spot: String
    public let profileImagePath: String
}
