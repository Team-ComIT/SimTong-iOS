public protocol CheckExistEmployeeIDAndEmailUseCase {
    func execute(id: Int, email: String) async throws
}
