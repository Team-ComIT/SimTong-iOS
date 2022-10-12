import DomainModule

public struct SendAuthCodeUseCaseImpl: SendAuthCodeUseCase {
    private let emailsRepository: any EmailsRepository

    public init(emailsRepository: any EmailsRepository) {
        self.emailsRepository = emailsRepository
    }

    public func execute(email: String) async throws {
        try await emailsRepository.sendAuthCode(email: email)
    }
}
