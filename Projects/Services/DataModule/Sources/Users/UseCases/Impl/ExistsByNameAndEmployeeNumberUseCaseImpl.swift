import DomainModule

public struct ExistsByNameAndEmployeeNumberUseCaseImpl: ExistsByNameAndEmployeeNumberUseCase {
    private let usersRepository: any UsersRepository

    public init(usersRepository: any UsersRepository) {
        self.usersRepository = usersRepository
    }

    public func execute(name: String, employeeNumber: Int) async throws {
        try await usersRepository.existsByNameAndEmployeeNumber(name: name, employeeNumber: employeeNumber)
    }
}
