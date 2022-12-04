import NeedleFoundation
import DomainModule
import SwiftUI
import FindPasswordFeature

public protocol PasswordChangeDependency: Dependency {
    var findPasswordInfoComponent: FindPasswordInfoComponent { get }
}

public final class PasswordChangeComponent: Component<PasswordChangeDependency> {
    public func makeView() -> some View {
        PasswordChangeView(
            viewModel: .init(),
            findPasswordInfoComponent: dependency.findPasswordInfoComponent
        )
    }
}
