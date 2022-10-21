import DomainModule
import NeedleFoundation
import SwiftUI

public protocol SignupVerifyDependency: Dependency {
    var sendAuthCodeUseCase: any SendAuthCodeUseCase { get }
    var verifyAuthCodeUseCase: any VerifyAuthCodeUseCase { get }
    var signupPasswordComponent: SignupPasswordComponent { get }
}

public final class SignupVerifyComponent: Component<SignupVerifyDependency> {
    public func makeView(signupVerifySceneParam: SignupVerifySceneParam) -> some View {
        SignupVerifyView(
            viewModel: SignupVerifyViewModel(
                sendAuthCodeUseCase: dependency.sendAuthCodeUseCase,
                verifyAuthCodeUseCase: dependency.verifyAuthCodeUseCase,
                signupVerifySceneParam: signupVerifySceneParam
            ),
            signupPasswordComponent: dependency.signupPasswordComponent
        )
    }
}
