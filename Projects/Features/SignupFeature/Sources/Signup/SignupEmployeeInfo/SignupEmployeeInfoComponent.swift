import NeedleFoundation
import SwiftUI

public protocol SignupEmployeeInfoDependency: Dependency {
    var signupVerifyComponent: SignupVerifyComponent { get }
}

public final class SignupEmployeeInfoComponent: Component<SignupEmployeeInfoDependency> {
    public func makeView() -> some View {
        SignupEmployeeInfoView(
            viewModel: .init(),
            signupVerifyComponent: dependency.signupVerifyComponent
        )
    }
}
