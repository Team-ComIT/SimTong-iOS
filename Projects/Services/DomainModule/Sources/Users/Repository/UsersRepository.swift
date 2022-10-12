import DataMappingModule

public protocol UsersRepository {
    func signin(req: SigninRequestDTO) async throws
    func signup(req: SignupRequestDTO) async throws
    func existsByNameAndEmployeeNumber(name: String, employeeNumber: Int) async throws
    func fetchMyProfile() async throws -> UserInfo
    func changePassword(req: ChangePasswordRequestDTO) async throws
    func changeNickname(nickname: String) async throws
    func changeEmail(email: String) async throws
    func changeProfileImage(imageURL: String) async throws
    func changeSpot(spotID: String) async throws
}
