import Foundation

public struct SigninRequestDTO: Encodable {
    public init(employeeID: Int, password: String) {
        self.employeeID = employeeID
        self.password = password
    }

    public let employeeID: Int
    public let password: String

    enum Codingkeys: String, CodingKey {
        case employeeID = "employee_number"
        case password = "password"
    }
}
