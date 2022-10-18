import DomainModule

public struct VerifyAuthCodeUseCaseImpl: VerifyAuthCodeUseCase {
    private let emailsRepository: any EmailsRepository

    public init(emailsRepository: any EmailsRepository) {
        self.emailsRepository = emailsRepository
    }

    public func execute(email: String, code: String) async throws {
        try await emailsRepository.verifyAuthCode(email: email, code: code)
    }
}
