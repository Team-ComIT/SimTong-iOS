import DomainModule

public struct CheckExistNameAndEmployeeIDUseCaseImpl: CheckExistNameAndEmployeeIDUseCase {
    private let usersRepository: any UsersRepository

    public init(usersRepository: any UsersRepository) {
        self.usersRepository = usersRepository
    }

    public func execute(name: String, employeeNumber: String) async throws {
        try await usersRepository.checkExistNameAndEmployeeID(name: name, employeeID: employeeNumber)
    }
}
