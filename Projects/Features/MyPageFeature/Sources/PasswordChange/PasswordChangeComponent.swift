import NeedleFoundation
import DomainModule
import SwiftUI
import FindPasswordFeature

public protocol PasswordChangeDependency: Dependency {
    var findPasswordInfoComponent: FindPasswordInfoComponent { get }
    var changePasswordUseCase: any ChangePasswordUseCase { get }
}

public final class PasswordChangeComponent: Component<PasswordChangeDependency> {
    public func makeView(password: String) -> some View {
        PasswordChangeView(
            viewModel: .init(
                changePasswordUseCase: dependency.changePasswordUseCase,
                password: password
            ),
            findPasswordInfoComponent: dependency.findPasswordInfoComponent
        )
    }
}
