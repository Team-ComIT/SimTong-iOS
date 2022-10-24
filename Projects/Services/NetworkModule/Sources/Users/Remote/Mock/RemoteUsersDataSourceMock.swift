import DataMappingModule
import DomainModule
import ErrorModule

public struct RemoteUsersDataSourceMock: RemoteUsersDataSource {
    public init() {}

    public func signin(req: SigninRequestDTO) async throws {
        if req.password != "최형우바보" || req.employeeID != 12345678 {
            throw STError.notFoundUserBySignin
        }
    }

    public func signup(req: SignupRequestDTO) async throws {}

    public func checkExistNameAndEmployeeID(name: String, employeeID: String) async throws {
        if name != "실험용" || employeeID != "1234567890" {
            throw STError.notExistsUserByVerifyEmployee
        }
    }

    public func fetchMyProfile() async throws -> UserInfoEntity {
        UserInfoEntity(
            name: "실험자",
            email: "test@gmail.com",
            nickname: "실험용",
            spot: "이걸 보는 당신의 뒤",
            profileImagePath: "https://avatars.githubusercontent.com/u/57276315?v=4"
        )
    }

    public func checkDuplicateNickname(nickname: String) async throws {
        if nickname == "실험용" {
            throw STError.alreadyExistNickname
        }
    }

    public func changeNickname(nickname: String) async throws {
        if nickname == "실험용" {
            throw STError.alreadyExistNickname
        }
    }

    public func changeEmail(email: String) async throws {
        if email == "test@gmail.com" {
            throw STError.alreadyExistEmailByChangeEmail
        }
    }

    public func changeProfileImage(imageURL: String) async throws {}

    public func changeSpot(spotID: String) async throws {}
}
