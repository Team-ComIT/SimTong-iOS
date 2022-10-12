import Foundation

public struct SigninRequestDTO: Encodable {
    public init(employeeNumber: Int, password: String) {
        self.employeeNumber = employeeNumber
        self.password = password
    }

    public let employeeNumber: Int
    public let password: String

    enum Codingkeys: String, CodingKey {
        case employeeNumber = "employee_number"
        case password = "password"
    }
}
