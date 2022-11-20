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
        if #available(iOS 16.0, *) {
            return NavigationStack {
                IntroView(
                    viewModel: .init(),
                    signinComponent: dependency.signinComponent,
                    signupEmployeeInfoComponent: dependency.signupEmployeeInfoComponent
                )
            }
        } else {
            return NavigationView {
                IntroView(
                    viewModel: .init(),
                    signinComponent: dependency.signinComponent,
                    signupEmployeeInfoComponent: dependency.signupEmployeeInfoComponent
                )
            }
        }
    }
}
