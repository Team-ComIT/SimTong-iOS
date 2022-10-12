public protocol ExistsByNameAndEmployeeNumberUseCase {
    func execute(name: String, employeeNumber: Int) async throws
}
