import NeedleFoundation
import SwiftUI

public protocol SignupPasswordDependency: Dependency {}

public final class SignupPasswordComponent: Component<SignupPasswordDependency> {
    public func makeView() -> some View {
        SignupPasswordView(viewModel: SignupPasswordViewmodel())
    }
}
