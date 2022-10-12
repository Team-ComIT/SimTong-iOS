import DomainModule
import DataMappingModule
import NetworkModule

public struct UsersRepositoryImpl: UsersRepository {
    private let remoteUsersDataSource: any RemoteUsersDataSource

    public init(remoteUsersDataSource: any RemoteUsersDataSource) {
        self.remoteUsersDataSource = remoteUsersDataSource
    }

    public func signin(req: SigninRequestDTO) async throws {
        try await remoteUsersDataSource.signin(req: req)
    }
    
    public func signup(req: SignupRequestDTO) async throws {
        try await remoteUsersDataSource.signup(req: req)
    }
    
    public func existsByNameAndEmployeeNumber(name: String, employeeNumber: Int) async throws {
        try await remoteUsersDataSource.existsByNameAndEmployeeNumber(name: name, employeeNumber: employeeNumber)
    }
    
    public func fetchMyProfile() async throws -> UserInfo {
        try await remoteUsersDataSource.fetchMyProfile()
    }
    
    public func changePassword(req: ChangePasswordRequestDTO) async throws {
        try await remoteUsersDataSource.changePassword(req: req)
    }
    
    public func changeNickname(nickname: String) async throws {
        try await remoteUsersDataSource.changeNickname(nickname: nickname)
    }
    
    public func changeEmail(email: String) async throws {
        try await remoteUsersDataSource.changeEmail(email: email)
    }
    
    public func changeProfileImage(imageURL: String) async throws {
        try await remoteUsersDataSource.changeProfileImage(imageURL: imageURL)
    }
    
    public func changeSpot(spotID: String) async throws {
        try await remoteUsersDataSource.changeSpot(spotID: spotID)
    }
}
