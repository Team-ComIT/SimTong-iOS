import NeedleFoundation
import SwiftUI
import HomeFeature

public protocol MainTabDependency: Dependency {
    var homeComponent: HomeComponent { get }
}

public final class MainTabComponent: Component<MainTabDependency> {
    public func makeView() -> some View {
        NavigationView {
            MainTabView(
                homeComponent: self.dependency.homeComponent
            )
        }
        .navigationViewStyle(.stack)
    }
}
