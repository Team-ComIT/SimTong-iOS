public protocol CheckExistNameAndEmployeeIDUseCase {
    func execute(name: String, employeeNumber: String) async throws
}
