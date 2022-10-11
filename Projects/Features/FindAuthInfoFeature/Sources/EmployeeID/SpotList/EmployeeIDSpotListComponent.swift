import NeedleFoundation
import SwiftUI
import DomainModule

public protocol EmployeeIDSpotListDependency: Dependency {
    var fetchSpotListUseCase: any FetchSpotListUseCase { get }
}

public final class EmployeeIDSpotListComponent: Component<EmployeeIDSpotListDependency> {
    public func makeView(selectedSpot: Spot?, completion: @escaping (Spot) -> Void) -> some View {
        EmployeeIDSpotListView(
            viewModel: .init(
                fetchSpotListUseCase: dependency.fetchSpotListUseCase,
                selectedSpot: selectedSpot
            ),
            completion: completion
        )
    }
}
