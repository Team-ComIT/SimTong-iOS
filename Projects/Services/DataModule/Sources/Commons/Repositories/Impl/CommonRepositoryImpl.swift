import NetworkModule
import DomainModule
import DataMappingModule

public struct CommonsRepositoryImpl: CommonsRepository {
    private let remoteCommonsDataSource: any RemoteCommonsDataSource

    public init(remoteCommonsDataSource: any RemoteCommonsDataSource) {
        self.remoteCommonsDataSource = remoteCommonsDataSource
    }

    public func fetchSpotList() async throws -> [Spot] {
        try await remoteCommonsDataSource.fetchSpotList()
    }

    public func findEmployeeNumber(req: FindEmployeeNumberRequestDTO) async throws -> Int {
        try await remoteCommonsDataSource.findEmployeeNumber(req: req)
    }

    public func resetPassword(req: ResetPasswordRequestDTO) async throws {
        try await remoteCommonsDataSource.resetPassword(req: req)
    }

    public func changePassword(req: ChangePasswordRequestDTO) async throws {
        try await remoteCommonsDataSource.changePassword(req: req)
    }

    public func checkDuplicateEmail(email: String) async throws {
        try await remoteCommonsDataSource.checkDuplicateEmail(email: email)
    }

    public func checkExistNameAndEmail(name: String, email: String) async throws {
        try await remoteCommonsDataSource.checkExistNameAndEmail(name: name, email: email)
    }
}
