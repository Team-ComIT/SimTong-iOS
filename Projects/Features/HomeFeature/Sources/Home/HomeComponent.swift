import NeedleFoundation
import SwiftUI

public protocol HomeDependency: Dependency {
    var writeHolidayComponent: WriteHolidayComponent { get }
}

public final class HomeComponent: Component<HomeDependency> {
    public func makeView() -> some View {
        HomeView(
            viewModel: .init(),
            writeHolidayComponent: dependency.writeHolidayComponent
        )
    }
}
