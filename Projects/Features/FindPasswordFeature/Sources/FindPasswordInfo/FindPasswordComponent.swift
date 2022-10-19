import NeedleFoundation
import SwiftUI
import DomainModule

public protocol FindPasswordInfoDependency: Dependency {
    var renewalPasswordComponent: RenewalPasswordComponent { get }
}

public final class FindPasswordInfoComponent: Component<FindPasswordInfoDependency> {
    public func makeView() -> some View {
        FindPasswordInfoView(
            viewModel: .init(),
            renewalPasswordComponent: dependency.renewalPasswordComponent
        )
    }
}
