import DomainModule
import NeedleFoundation
import SwiftUI

public protocol HomeDependency: Dependency {
    var fetchMenuListUseCase: any FetchMenuListUseCase { get }
    var fetchScheduleUseCase: any FetchScheduleUseCase { get }
    var writeHolidayComponent: WriteHolidayComponent { get }
    var writeScheduleComponent: WriteScheduleComponent { get }
}

public final class HomeComponent: Component<HomeDependency> {
    public func makeView() -> some View {
        HomeView(
            viewModel: .init(
                fetchMenuListUseCase: dependency.fetchMenuListUseCase,
                fetchScheduleUseCase: dependency.fetchScheduleUseCase
            ),
            writeHolidayComponent: dependency.writeHolidayComponent,
            writeScheduleComponent: dependency.writeScheduleComponent
        )
    }
}
