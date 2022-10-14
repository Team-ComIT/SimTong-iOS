import DomainModule
import Foundation

public struct SendAuthCodeUseCaseDummy: SendAuthCodeUseCase {
    public init() {}
    public func execute(email: String) async throws {
        return
    }
}
