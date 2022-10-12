public protocol EmailsRepository {
    func verifyAuthCode(email: String, code: String) async throws
    func sendAuthCode(email: String) async throws
}
