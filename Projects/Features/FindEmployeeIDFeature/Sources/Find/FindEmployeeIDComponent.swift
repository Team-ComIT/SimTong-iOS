import NeedleFoundation
import DomainModule
import SwiftUI

public protocol FindEmployeeDependency: Dependency {
    var employeeIDSpotListComponent: EmployeeIDSpotListComponent { get }
    var employeeIDResultComponent: EmployeeIDResultComponent { get }
    var findEmployeeNumberUseCase: any FindEmployeeNumberUseCase { get }
}

public final class FindEmployeeIDComponent: Component<FindEmployeeDependency> {
    public func makeView() -> some View {
        FindEmployeeIDView(
            viewModel: .init(findEmployeeNumberUseCase: dependency.findEmployeeNumberUseCase),
            employeeIDSpotListComponent: dependency.employeeIDSpotListComponent,
            employeeIDResultComponent: dependency.employeeIDResultComponent
        )
    }
}
