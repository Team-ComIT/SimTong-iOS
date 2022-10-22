import NeedleFoundation
import SwiftUI

public protocol SignupPasswordDependency: Dependency {
    var signupInfoComponent: SignupInfoComponent { get }
}

public final class SignupPasswordComponent: Component<SignupPasswordDependency> {
    public func makeView(signupPasswordSceneParam: SignupPasswordSceneParam) -> some View {
        SignupPasswordView(
            viewModel: SignupPasswordViewModel(
                signupPasswordSceneParam: signupPasswordSceneParam
            ),
            signupInfoComponent: dependency.signupInfoComponent
        )
    }
}
