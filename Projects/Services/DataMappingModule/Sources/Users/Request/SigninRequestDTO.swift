import Foundation

public struct SigninRequestDTO: Encodable {
    public init(employeeID: Int, password: String, deviceToken: String) {
        self.employeeID = employeeID
        self.password = password
        self.deviceToken = deviceToken
    }

    public let employeeID: Int
    public let password: String
    public let deviceToken: String

    public enum Codingkeys: String, CodingKey {
        case employeeID = "employee_number"
        case password = "password"
        case deviceToken = "device_token"
    }
}
