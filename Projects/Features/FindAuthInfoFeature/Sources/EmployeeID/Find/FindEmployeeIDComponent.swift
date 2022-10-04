import NeedleFoundation
import SwiftUI

public protocol FindEmployeeDependency: Dependency {
    var employeeIDSpotListComponent: EmployeeIDSpotListComponent { get }
}

public final class FindEmployeeIDComponent: Component<FindEmployeeDependency> {
    public func makeView() -> some View {
        FindEmployeeIDView(
            viewModel: .init(),
            employeeIDSpotListComponent: dependency.employeeIDSpotListComponent
        )
    }
}
