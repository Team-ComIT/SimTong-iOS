import DomainModule
import NeedleFoundation
import SwiftUI

public protocol EmailVerifyDependency: Dependency {
    var verifyAuthCodeUseCase: any VerifyAuthCodeUseCase { get }
}

public final class EmailVerifyComponent: Component<EmailVerifyDependency> {
    public func makeView(email: String) -> some View {
        EmailVerifyView(viewModel: .init(
            email: email,
            verifyAuthCodeUseCase: dependency.verifyAuthCodeUseCase)
        )
    }
}
