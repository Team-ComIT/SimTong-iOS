import NeedleFoundation
import SwiftUI
import HomeFeature

public protocol MainTabDependency: Dependency {
    var homeComponent: HomeComponent { get }
}

public final class MainTabComponent: Component<MainTabDependency> {
    public func makeView() -> some View {
        if #available(iOS 16.0, *) {
            return NavigationStack {
                MainTabView(
                    homeComponent: self.dependency.homeComponent
                )
            }
        } else {
            return NavigationView {
                MainTabView(
                    homeComponent: self.dependency.homeComponent
                )
            }
            .navigationViewStyle(.stack)
        }
    }
}
