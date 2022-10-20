import DataMappingModule
import DomainModule
import ErrorModule

public struct RemoteCommonsDataSourceMock: RemoteCommonsDataSource {
    public init() {}

    public func fetchSpotList() async throws -> [Spot] {
        [
            .init(
                id: "ADMLWLQ",
                name: "A의 집",
                location: "광주광역시 북구"
            ),
            .init(
                id: "BDMLWLQ",
                name: "B의 집",
                location: "인천광역시 미추홀구"
            ),
            .init(
                id: "CDMLWLQ",
                name: "C의 집",
                location: "양산시 평산회야로"
            ),
            .init(
                id: "DDMLWLQ",
                name: "D의 집",
                location: "대구광역시 수성구"
            )
        ]
    }

    public func findEmployeeNumber(req: FindEmployeeNumberRequestDTO) async throws -> Int {
        return 1234567890
    }

    public func resetPassword(req: ResetPasswordRequestDTO) async throws {
        return
    }

    public func changePassword(req: ChangePasswordRequestDTO) async throws {
        return
    }

    public func checkDuplicateEmail(email: String) async throws {
        if email == "test@gmail.com" {
            throw STError.alreadyExistsByEmailOverlap
        }
    }

    public func checkExistNameAndEmail(name: String, email: String) async throws {
        if name == "실험용" && email == "test@gmail.com" {
            throw STError.notFoundUserByCheckNameAndEmail
        }
    }
}
