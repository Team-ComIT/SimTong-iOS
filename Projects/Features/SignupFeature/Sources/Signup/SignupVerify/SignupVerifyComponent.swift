import NeedleFoundation
import SwiftUI

public protocol SignupVerifyDependency: Dependency {
    var signupPasswordComponent: SignupPasswordComponent { get }
}

public final class SignupVerifyComponent: Component<SignupVerifyDependency> {
    public func makeView() -> some View {
        SignupVerifyView(
            viewModel: SignupVerifyViewModel(),
            signupPasswordComponent: dependency.signupPasswordComponent
        )
    }
}
