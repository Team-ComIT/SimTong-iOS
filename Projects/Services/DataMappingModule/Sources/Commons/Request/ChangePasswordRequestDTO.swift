import Foundation

public struct ChangePasswordRequestDTO: Encodable {
    public init(password: String, newPassword: String) {
        self.password = password
        self.newPassword = newPassword
    }

    public let password: String
    public let newPassword: String

    public enum CodingKeys: String, CodingKey {
        case password
        case newPassword = "new_password"
    }
}
