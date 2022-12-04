import NeedleFoundation
import DomainModule
import SwiftUI

public protocol SpotChangeDependency: Dependency {
    var fetchSpotListUseCase: any FetchSpotListUseCase { get }
}

public final class SpotChangeComponent: Component<SpotChangeDependency> {
    public func makeView(selectedSpot: String, completion: @escaping (SpotEntity) -> Void) -> some View {
        SpotChangeView(
            viewModel: .init(
                fetchSpotListUseCase: dependency.fetchSpotListUseCase,
                selectedSpot: selectedSpot,
                completion: completion
            )
        )
    }
}
