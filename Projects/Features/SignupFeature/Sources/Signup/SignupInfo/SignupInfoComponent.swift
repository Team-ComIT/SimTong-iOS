import NeedleFoundation
import SwiftUI

public protocol SignupInfoDependency: Dependency {}

public final class SignupInfoComponent: Component<SignupInfoDependency> {
    public func makeView(signupInfoSceneParam: SignupInfoSceneParam) -> some View {
        SignupInfoView(
            viewModel: SignupInfoViewModel(
                signupInfoSceneParam: signupInfoSceneParam
            )
        )
    }
}
