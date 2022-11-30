import DomainModule
import NeedleFoundation
import SwiftUI
import MyPageFeature

public protocol HomeDependency: Dependency {
    var fetchMenuListUseCase: any FetchMenuListUseCase { get }
    var fetchScheduleUseCase: any FetchScheduleUseCase { get }
    var writeHolidayComponent: WriteHolidayComponent { get }
    var myPageComponent: MyPageComponent { get }
}

public final class HomeComponent: Component<HomeDependency> {
    public func makeView() -> some View {
        HomeView(
            viewModel: .init(
                fetchMenuListUseCase: dependency.fetchMenuListUseCase,
                fetchScheduleUseCase: dependency.fetchScheduleUseCase,
                myPageComponent: dependency.myPageComponent
            ),
            writeHolidayComponent: dependency.writeHolidayComponent
        )
    }
}
