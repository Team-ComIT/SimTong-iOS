import Foundation

public struct SignupVerifySceneParam: Equatable {
    public let name: String
    public let employeeID: String
    public let email: String
    
    public init(name: String, employeeID: String, email: String) {
        self.name = name
        self.employeeID = employeeID
        self.email = email
    }
}
