import Foundation

public struct FindEmployeeNumberResponseDTO: Decodable {
    public let employeeNumber: Int

    enum CodingKeys: String, CodingKey {
        case employeeNumber = "employee_number"
    }
}
