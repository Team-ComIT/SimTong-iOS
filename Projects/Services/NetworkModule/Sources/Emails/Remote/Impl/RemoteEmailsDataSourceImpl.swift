import APIKit
import DomainModule
import DataMappingModule

public final class RemoteEmailsDataSourceImpl: BaseRemoteDataSource<EmailsAPI>, RemoteEmailsDataSource {
    public func verifyAuthCode(email: String, code: String) async throws {
        try await request(.verifyAuthCode(email: email, code: code))
    }

    public func sendAuthCode(email: String) async throws {
        try await request(.sendAuthCode(email: email), dto: NoResponse.self)
    }
}
