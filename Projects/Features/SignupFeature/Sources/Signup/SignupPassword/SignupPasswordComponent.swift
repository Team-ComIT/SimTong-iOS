import NeedleFoundation
import SwiftUI

public protocol SignupPasswordDependency: Dependency {
    var signupInfoComponent: SignupInfoComponent { get }
}

public final class SignupPasswordComponent: Component<SignupPasswordDependency> {
    public func makeView() -> some View {
        SignupPasswordView(
            viewModel: SignupPasswordViewModel(),
            signupInfoComponent: dependency.signupInfoComponent
        )
    }
}
