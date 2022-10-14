import NeedleFoundation
import SwiftUI
import DomainModule

public protocol FindPasswordDependency: Dependency {
    var sendAuthCodeUseCase: any SendAuthCodeUseCase { get }
    var verifyAuthCodeUseCase: any VerifyAuthCodeUseCase { get }
    var renewalPasswordComponent: RenewalPasswordComponent { get }
}

public final class FindPasswordComponent: Component<FindPasswordDependency> {
    public func makeView() -> some View {
        FindPasswordView(
            viewModel: .init(
                sendAuthCodeUseCase: dependency.sendAuthCodeUseCase,
                verifyAuthCodeUseCase: dependency.verifyAuthCodeUseCase
            ),
            renewalPasswordComponent: dependency.renewalPasswordComponent
        )
    }
}
