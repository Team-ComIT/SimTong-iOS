import NeedleFoundation
import DomainModule
import SwiftUI

public protocol EmailModifyDependency: Dependency {
    var emailVerifyComponent: EmailVerifyComponent { get }
}

public final class EmailModifyComponent: Component<EmailModifyDependency> {
    public func makeView() -> some View {
        EmailModifyView(
            viewModel: .init(),
            emailVerifyComponent: dependency.emailVerifyComponent
        )
    }
}
