import DomainModule
import Foundation

public struct VerifyAuthCodeUseCaseDummy: VerifyAuthCodeUseCase {
    public init() {}
    public func execute(email: String, code: String) async throws {
        try await Task.sleep(nanoseconds: 3_000_000_000)
    }
}
