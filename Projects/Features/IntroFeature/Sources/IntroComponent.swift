import NeedleFoundation
import SwiftUI
import SigninFeature
import SignupFeature

public protocol IntroDependency: Dependency {
    var signinComponent: SigninComponent { get }
    var signupEmployeeInfoComponent: SignupEmployeeInfoComponent { get }
}

public final class IntroComponent: Component<IntroDependency> {
    public func makeView() -> some View {
        NavigationView {
            IntroView(
                viewModel: .init(),
                signinComponent: dependency.signinComponent,
                signupEmployeeInfoComponent: dependency.signupEmployeeInfoComponent
            )
        }
    }
}
