import DataMappingModule
import APIKit
import DomainModule

public final class RemoteUsersDataSourceImpl: BaseRemoteDataSource<UsersAPI>, RemoteUsersDataSource {
    public func signin(req: SigninRequestDTO) async throws {
        try await request(.signin(req))
    }

    public func signup(req: SignupRequestDTO) async throws {
        try await request(.signup(req))
    }

    public func checkExistNameAndEmployeeID(name: String, employeeID: String) async throws {
        try await request(
            .existsByNameAndEmployeeNumber(
                name: name,
                employeeNumber: employeeID
            )
        )
    }

    public func fetchMyProfile() async throws -> UserInfoEntity {
        try await request(.fetchMyProfile, dto: FetchMyProfileResponseDTO.self)
            .toDomain()
    }

    public func checkDuplicateNickname(nickname: String) async throws {
        try await request(.checkDuplicateNickname(nickname: nickname))
    }

    public func changeNickname(nickname: String) async throws {
        try await request(.changeNickname(nickname: nickname))
    }

    public func changeEmail(email: String) async throws {
        try await request(.changeEmail(email: email))
    }

    public func changeProfileImage(imageURL: String) async throws {
        try await request(.changeProfileImage(imageURL: imageURL))
    }

    public func changeSpot(spotID: String) async throws {
        try await request(.changeSpot(spotID: spotID))
    }
}
