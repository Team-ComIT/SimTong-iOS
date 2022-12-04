import NeedleFoundation
import DomainModule
import SwiftUI
import FindPasswordFeature

public protocol PasswordCheckDependency: Dependency {
    var findPasswordInfoComponent: FindPasswordInfoComponent { get }
    var passwordChangeComponent: PasswordChangeComponent { get }
}

public final class PasswordCheckComponent: Component<PasswordCheckDependency> {
    public func makeView() -> some View {
        PasswordCheckView(
            viewModel: .init(),
            findPasswordInfoComponent: dependency.findPasswordInfoComponent,
            passwordChangeComponent: dependency.passwordChangeComponent
        )
    }
}
