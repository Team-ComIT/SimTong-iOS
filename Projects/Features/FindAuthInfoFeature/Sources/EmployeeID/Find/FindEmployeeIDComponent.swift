import NeedleFoundation
import SwiftUI

public protocol FindEmployeeDependency: Dependency {
    var employeeIDSpotListComponent: EmployeeIDSpotListComponent { get }
    var employeeIDResultComponent: EmployeeIDResultComponent { get }
}

public final class FindEmployeeIDComponent: Component<FindEmployeeDependency> {
    public func makeView() -> some View {
        FindEmployeeIDView(
            viewModel: .init(),
            employeeIDSpotListComponent: dependency.employeeIDSpotListComponent,
            employeeIDResultComponent: dependency.employeeIDResultComponent
        )
    }
}
