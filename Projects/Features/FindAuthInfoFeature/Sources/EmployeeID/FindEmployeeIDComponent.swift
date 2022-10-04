import NeedleFoundation
import SwiftUI

public protocol FindEmployeeDependency: Dependency {}

public final class FindEmployeeIDComponent: Component<FindEmployeeDependency> {
    public func makeView() -> some View {
        FindEmployeeIDView(
            viewModel: .init()
        )
    }
}
