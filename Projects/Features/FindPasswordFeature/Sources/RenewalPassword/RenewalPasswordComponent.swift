import DomainModule
import NeedleFoundation
import SwiftUI

public protocol RenewalPasswordDependency: Dependency {
    var resetPasswordUseCase: any ResetPasswordUseCase { get }
}

public final class RenewalPasswordComponent: Component<RenewalPasswordDependency> {
    public func makeView(renewalPasswordSceneParam: RenewalPasswordSceneParam) -> some View {
        RenewalPasswordView(
            viewModel: .init(
                resetPasswordUseCase: dependency.resetPasswordUseCase,
                renewalPasswordSceneParam: renewalPasswordSceneParam
            )
        )
    }
}
