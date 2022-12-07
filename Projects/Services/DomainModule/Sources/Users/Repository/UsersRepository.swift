import DataMappingModule

public protocol UsersRepository {
    func signin(req: SigninRequestDTO) async throws
    func signup(req: SignupRequestDTO) async throws
    func checkExistNameAndEmployeeID(name: String, employeeID: String) async throws
    func fetchMyProfile() async throws -> UserInfoEntity
    func checkDuplicateNickname(nickname: String) async throws
    func changeNickname(nickname: String) async throws
    func changeEmail(email: String) async throws
    func changeProfileImage(imageURL: String) async throws
    func changeSpot(spotID: String) async throws
    func logout()
}
