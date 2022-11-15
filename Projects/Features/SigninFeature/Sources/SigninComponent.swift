import NeedleFoundation
import SwiftUI
import FindAuthInfoTabFeature
import SignupFeature
import DomainModule

public protocol SigninDependency: Dependency {
    var findAuthInfoTabComponent: FindAuthInfoTabComponent { get }
    var signupEmployeeInfoComponent: SignupEmployeeInfoComponent { get }
    var signinUseCase: any SigninUseCase { get }
}

public final class SigninComponent: Component<SigninDependency> {
    public func makeView() -> some View {
        SigninView(
            viewModel: .init(signinUseCase: dependency.signinUseCase),
            findAuthInfoTabComponent: dependency.findAuthInfoTabComponent,
            signupEmployeeInfoComponent: dependency.signupEmployeeInfoComponent
        )
    }
}
