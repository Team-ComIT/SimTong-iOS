import NeedleFoundation
import SwiftUI

public protocol FindPasswordDependency: Dependency {}

public final class FindPasswordComponent: Component<FindPasswordDependency> {
    public func makeView() -> some View {
        FindPasswordView(
            viewModel: .init()
        )
    }
}
