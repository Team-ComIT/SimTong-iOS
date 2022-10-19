import DataMappingModule
import APIKit
import DomainModule

public final class RemoteUsersDataSourceImpl: BaseRemoteDataSource<UsersAPI>, RemoteUsersDataSource {
    public func signin(req: SigninRequestDTO) async throws {
        try await request(.signin(req), dto: NoResponse.self)
    }

    public func signup(req: SignupRequestDTO) async throws {
        try await request(.signup(req), dto: NoResponse.self)
    }

    public func existsByNameAndEmployeeNumber(name: String, employeeNumber: Int) async throws {
        try await request(
            .existsByNameAndEmployeeNumber(
                name: name,
                employeeNumber: employeeNumber
            ),
            dto: NoResponse.self
        )
    }

    public func fetchMyProfile() async throws -> UserInfo {
        try await request(.fetchMyProfile, dto: FetchMyProfileResponseDTO.self)
            .toDomain()
    }

    public func checkDuplicateNickname(nickname: String) async throws {
        try await request(.checkDuplicateNickname(nickname: nickname), dto: NoResponse.self)
    }

    public func changeNickname(nickname: String) async throws {
        try await request(.changeNickname(nickname: nickname), dto: NoResponse.self)
    }

    public func changeEmail(email: String) async throws {
        try await request(.changeEmail(email: email), dto: NoResponse.self)
    }

    public func changeProfileImage(imageURL: String) async throws {
        try await request(.changeProfileImage(imageURL: imageURL), dto: NoResponse.self)
    }

    public func changeSpot(spotID: String) async throws {
        try await request(.changeSpot(spotID: spotID), dto: NoResponse.self)
    }
}
