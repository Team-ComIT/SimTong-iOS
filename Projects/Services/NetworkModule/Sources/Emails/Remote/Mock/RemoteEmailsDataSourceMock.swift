import DataMappingModule
import DomainModule
import ErrorModule

public struct RemoteEmailsDataSourceMock: RemoteEmailsDataSource {
    public init() {}

    public func verifyAuthCode(email: String, code: String) async throws {
        if email != "test@gmail.com" || code != "123456" {
            throw STError.authCodeExpired
        }
    }

    public func sendAuthCode(email: String) async throws {}
}
