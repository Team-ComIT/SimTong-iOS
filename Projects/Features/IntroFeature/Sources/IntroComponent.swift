import NeedleFoundation
import SwiftUI
import SigninFeature
import SignupFeature

public protocol IntroDependency: Dependency {
    var signinComponent: SigninComponent { get }
    var signupVerifyComponent: SignupVerifyComponent { get }
}

public final class IntroComponent: Component<IntroDependency> {
    public func makeView() -> some View {
        IntroView(
            viewModel: .init(),
            signinComponent: dependency.signinComponent,
            signupVerifyComponent: dependency.signupVerifyComponent
        )
    }
}
