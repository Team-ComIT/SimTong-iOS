import Foundation

public struct ResetPasswordRequestDTO: Encodable {
    public init(
        email: String,
        employeeNumber: Int,
        newPassword: String
    ) {
        self.email = email
        self.employeeNumber = employeeNumber
        self.newPassword = newPassword
    }

    public let email: String
    public let employeeNumber: Int
    public let newPassword: String
}
