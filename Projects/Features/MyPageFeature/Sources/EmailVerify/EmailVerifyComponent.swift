import DomainModule
import NeedleFoundation
import SwiftUI

public protocol EmailVerifyDependency: Dependency {}

public final class EmailVerifyComponent: Component<EmailVerifyDependency> {
    public func makeView() -> some View {
        EmailVerifyView(viewModel: .init())
    }
}
