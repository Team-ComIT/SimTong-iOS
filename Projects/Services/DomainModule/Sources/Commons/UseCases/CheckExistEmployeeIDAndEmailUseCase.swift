public protocol CheckExistEmployeeIDAndEmailUseCase {
    func execute(id: String, email: String) async throws
}
