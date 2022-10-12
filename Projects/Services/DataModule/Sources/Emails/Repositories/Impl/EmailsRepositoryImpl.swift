import DomainModule
import NetworkModule

public struct EmailsRepositoryImpl: EmailsRepository {
    private let remoteEmailsDataSource: any RemoteEmailsDataSource

    public init(remoteEmailsDataSource: any RemoteEmailsDataSource) {
        self.remoteEmailsDataSource = remoteEmailsDataSource
    }

    public func verifyAuthCode(email: String, code: String) async throws {
        try await remoteEmailsDataSource.verifyAuthCode(email: email, code: code)
    }

    public func sendAuthCode(email: String) async throws {
        try await remoteEmailsDataSource.sendAuthCode(email: email)
    }
}
