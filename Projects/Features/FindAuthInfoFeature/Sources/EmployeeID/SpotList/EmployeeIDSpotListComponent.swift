import NeedleFoundation
import SwiftUI

public protocol EmployeeIDSpotListDependency: Dependency {}

public final class EmployeeIDSpotListComponent: Component<EmployeeIDSpotListDependency> {
    public func makeView(completion: @escaping () -> String) -> some View {
        EmployeeIDSpotListView(
            viewModel: .init(),
            completion: completion
        )
    }
}
