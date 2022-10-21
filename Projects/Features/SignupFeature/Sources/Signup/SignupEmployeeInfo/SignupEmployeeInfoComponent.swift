import DomainModule
import NeedleFoundation
import SwiftUI

public protocol SignupEmployeeInfoDependency: Dependency {
    var checkExistNameAndEmployeeIDUseCase: any CheckExistNameAndEmployeeIDUseCase { get }
    var signupVerifyComponent: SignupVerifyComponent { get }
}

public final class SignupEmployeeInfoComponent: Component<SignupEmployeeInfoDependency> {
    public func makeView() -> some View {
        SignupEmployeeInfoView(
            viewModel: .init(
                checkExistNameAndEmployeeIDUseCase: dependency.checkExistNameAndEmployeeIDUseCase
            ),
            signupVerifyComponent: dependency.signupVerifyComponent
        )
    }
}
